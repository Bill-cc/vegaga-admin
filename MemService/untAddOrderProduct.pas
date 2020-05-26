unit untAddOrderProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Uni,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, EhlibCDS, EhLibAdo, EhLibMTE,
  RzButton, Menus, ImgList, RzPanel, ComCtrls, RzTreeVw;

type
  TfrmAddOrderProduct = class(TForm)
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btnOk: TRzBitBtn;
    btnExit: TRzBitBtn;
    pm1: TPopupMenu;
    N1: TMenuItem;
    il1: TImageList;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl1: TPanel;
    dgeProductList: TDBGridEh;
    ltvBCatList: TRzTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgeProductListTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btnExitClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ltvBCatListClick(Sender: TObject);
  private
    CodeDataCount : Integer;
    CodeData : array of string;
    function getCurrCatEncode: string;
    procedure InitCatalogTree;
    procedure InitCodeDataLen;
    procedure CreateCatalogTree(parNode: TTreeNode;level: Integer);
    procedure FindChildNode(query:TUniQuery;Level: Integer);
    procedure ProductCatFilter(code: string);
    procedure AddProcduct;
  public
    { Public declarations }
  end;

type
  TAddOPList = record
    pid : Integer;
    psku : string;
    pname : string;
    pprice : Real;
    pscat : string;
    pstate : Integer;
    pcnum : Integer;
  end;

var
  frmAddOrderProduct: TfrmAddOrderProduct;
  addOPList : array of TAddOPList;

implementation

uses untStockCenterDM, untCommonDm;

{$R *.dfm}

//窗口创建
procedure TfrmAddOrderProduct.FormCreate(Sender: TObject);
begin
  dmStockCenter.qryPSku.Open;
  dmStockCenter.qrySCatInfo.Open;
  dmStockCenter.qryStOAddPudt.Open;
  InitCatalogTree;
end;

//关闭窗口
procedure TfrmAddOrderProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qryStOAddPudt.Close;
  dmStockCenter.qrySCatInfo.Close;
  dmStockCenter.qryPSku.Close;
end;

//排序
procedure TfrmAddOrderProduct.dgeProductListTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
var
  sortstring : string;
begin
  with Column do
  begin
   if FieldName = '' then Exit;
   case Title.SortMarker of
     smNoneEh: sortstring := Column.FieldName + ' ASC';
     smDownEh: sortstring := Column.FieldName + ' ASC';
     smUpEh: sortstring := Column.FieldName + ' DESC';
   end;
  end;
  dmStockCenter.qryStOAddPudt.IndexFieldNames := sortstring;
end;

//退出
procedure TfrmAddOrderProduct.btnExitClick(Sender: TObject);
begin
  Close;
  Self.ModalResult := 2;
end;

//确定
procedure TfrmAddOrderProduct.btnOkClick(Sender: TObject);
begin
  AddProcduct;
  Self.ModalResult := 1;
end;

//清楚所选
procedure TfrmAddOrderProduct.N1Click(Sender: TObject);
begin
  dgeProductList.Selection.Clear;
end;

//添加商品
procedure TfrmAddOrderProduct.AddProcduct;
var
  i : Integer;
begin
  if dgeProductList.SelectedRows.Count > 0 then
  begin
    SetLength(addOPList,dgeProductList.SelectedRows.Count);
    for i := 0 to dgeProductList.SelectedRows.Count - 1 do
    begin
      dgeProductList.DataSource.DataSet.GotoBookmark(Pointer(dgeProductList.SelectedRows.Items[i]));
      addOPList[i].pid := dmStockCenter.qryStOAddPudt.FieldByName('p_id').AsInteger;
      addOPList[i].psku := dmStockCenter.qryStOAddPudt.FieldByName('sku').AsString;
      addOPList[i].pname := dmStockCenter.qryStOAddPudt.FieldByName('name').AsString;
      addOPList[i].pprice := dmStockCenter.qryStOAddPudt.FieldByName('p_sale_price').AsCurrency;
      addOPList[i].pscat := dmStockCenter.qryStOAddPudt.FieldByName('scatName').AsString;
      addOPList[i].pstate := dmStockCenter.qryStOAddPudt.FieldByName('status').AsInteger;
      addOPList[i].pcnum := dmStockCenter.qryStOAddPudt.FieldByName('skuNum').AsInteger;
    end;
    Close;
  end else
    ShowMessage('无选中商品！');
end;

//初始化编码数组
procedure TfrmAddOrderProduct.InitCodeDataLen;
var
  query : TUniQuery;
begin
  query := TUniQuery.Create(nil);
  query.Connection := frmCommonDm.Connection;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select COUNT(bcat_id) as cnum from t_p_bcat_vegaga');
  query.Open;

  SetLength(CodeData,query.FieldByName('cnum').AsInteger);
end;

//初始化目录树
procedure TfrmAddOrderProduct.InitCatalogTree;
var
  parNode : TTreeNode;
begin
  InitCodeDataLen;
  CodeDataCount := 0;
  ltvBCatList.Items.Clear;
  parNode := ltvBCatList.Items.AddFirst(nil,'商品目录');
  parNode.SelectedIndex := 0;
  CreateCatalogTree(parNode,0);
  ltvBCatList.AutoExpand := True;
end;

//创建目录树
procedure TfrmAddOrderProduct.CreateCatalogTree(parNode: TTreeNode;
  level: Integer);
var
  node : TTreeNode;
  parQuery: TUniQuery;
  i : Integer;
  pStr : ^string;
begin
  parQuery := TUniQuery.Create(nil);
  parQuery.Connection := frmCommonDm.Connection;
  FindChildNode(parQuery,level);
  if parQuery.RecordCount > 0 then
  begin
    for i := 1 to parQuery.RecordCount do
    begin
      if i = 1 then
      begin
        node := ltvBCatList.Items.AddChildFirst(
          parNode,parQuery.FieldByName('name').AsString);
      end else
      begin
        node := ltvBCatList.Items.AddChild(
          parNode,parQuery.FieldByName('name').AsString);
      end;
      node.SelectedIndex := parQuery.FieldByName('bcat_id').AsInteger;
      CodeData[CodeDataCount] := parQuery.FieldByName('code').AsString;
      pStr := @CodeData[CodeDataCount];
      node.Data := pStr;
      Inc(CodeDataCount);
      CreateCatalogTree(node,node.SelectedIndex);
      parQuery.Next;
    end;
    parNode.Expanded := True;
  end;
  parQuery.Close;
  FreeAndNil(parQuery);
end;

//查找子节点
procedure TfrmAddOrderProduct.FindChildNode(query: TUniQuery;
  Level: Integer);
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select name,bcat_id,code from t_p_bcat_vegaga');
  query.AddWhere('p_bcat_id = :parent');
  query.ParamByName('parent').AsInteger := Level;
  query.Open;
end;

//得到当前节点编码
function TfrmAddOrderProduct.getCurrCatEncode: string;
var
  pStr : ^string;
begin
  Result := '';
  if ltvBCatList.Selected.AbsoluteIndex <> 0 then
  begin
    pStr := ltvBCatList.Selected.Data;
    Result := pStr^;
  end;
end;

//商品过滤
procedure TfrmAddOrderProduct.ProductCatFilter(code: string);
begin
  dmStockCenter.qryStOAddPudt.Filtered := False;
  dmStockCenter.qryStOAddPudt.Filter := 'bcat_id like '+QuotedStr(code+'%');
  dmStockCenter.qryStOAddPudt.Filtered := True;
end;

//目录树单击
procedure TfrmAddOrderProduct.ltvBCatListClick(Sender: TObject);
begin
  ProductCatFilter(getCurrCatEncode);
end;

initialization
  DBGridEhCenter.FilterEditCloseUpApplyFilter := True;

end.
