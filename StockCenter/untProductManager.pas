unit untProductManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ActnList, ExtCtrls, RzPanel, DBGridEhGrouping,
  GridsEh, DBGridEh, RzButton, StdCtrls, DBCtrls, RzDBEdit, RzDBBnEd,
  RzCmboBx, RzDBCmbo, Mask, RzEdit, RzLabel, DB, RzCommon, RzDBLook,
  ComCtrls, RzTreeVw, Uni;

type
  TfrmProductManager = class(TForm)
    RzToolbar1: TRzToolbar;
    actlst1: TActionList;
    il1: TImageList;
    pmOpt: TPopupMenu;
    btnCreate: TRzToolButton;
    actCreate: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    actRefresh: TAction;
    btnDelete: TRzToolButton;
    btnUpdate: TRzToolButton;
    btnOk: TRzToolButton;
    btnCancel: TRzToolButton;
    btnRefresh: TRzToolButton;
    btnExit: TRzToolButton;
    rlddatalist: TRzDBLookupDialog;
    pnlLeft: TPanel;
    pnlBottom: TPanel;
    pnlTop: TPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel21: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBMemo1: TRzDBMemo;
    cbbbrand: TRzDBLookupComboBox;
    RzDBEdit14: TRzDBEdit;
    pnlCenter: TPanel;
    dgeProductList: TDBGridEh;
    ltvPCatList: TRzTreeView;
    RzLabel20: TRzLabel;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    RzDBButtonEdit1: TRzDBButtonEdit;
    RzLabel3: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    RzDBComboBox1: TRzDBComboBox;
    RzDBComboBox2: TRzDBComboBox;
    procedure actCreateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure RzDBButtonEdit1ButtonClick(Sender: TObject);
    //procedure RzDBButtonEdit2ButtonClick(Sender: TObject);
    procedure ltvPCatListClick(Sender: TObject);
    procedure dgeProductListCellClick(Column: TColumnEh);
    procedure RzDBLookupComboBox1CloseUp(Sender: TObject);
    procedure dgeProductListTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    CodeDataCount : Integer;
    CodeData : array of string;
    function getCurrCatEncode: string;
    procedure InitCodeDataLen;
    procedure InitCatalogTree;
    procedure CreateCatalogTree(parNode: TTreeNode;level: Integer);
    procedure FindChildNode(query:TUniQuery;Level: Integer);
    procedure SetButtonEnable;
    procedure ProductCatFilter(code: string);
    function SkuIsExist(psku: string): Boolean;
    procedure SetProductBCat(bcat: string);
  public
    { Public declarations }
  end;

//var
//  frmProductManager: TfrmProductManager;

implementation

uses untStockCenterDM, untCommonUtil, untCommonDm, untSelectProduct;

{$R *.dfm}

{ TfrmProductManager }

//创建窗口
procedure TfrmProductManager.FormCreate(Sender: TObject);
begin
  dmStockCenter.qryProductList.Open;
  dmStockCenter.qrySaleUtilList.Open;
  dmStockCenter.qryFactoryList.Open;
  dmStockCenter.qryCatalogList.Open;
  dmStockCenter.qryBrandInfo.Open;
  dmStockCenter.qrySupplierInfo.Open;
  InitCatalogTree;
end;

//关闭窗口
procedure TfrmProductManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qryProductList.ReadOnly := True;
  dmStockCenter.qryFactoryList.Close;
  dmStockCenter.qrySaleUtilList.Close;
  dmStockCenter.qryBrandInfo.Close;
  dmStockCenter.qrySupplierInfo.Close;
  dmStockCenter.qryCatalogList.Close;
  dmStockCenter.qryProductList.Close;
end;

//设置互斥
procedure TfrmProductManager.SetButtonEnable;
begin
  //按钮互斥
  btnCreate.Enabled := not btnCreate.Enabled;
  btnDelete.Enabled := not btnDelete.Enabled;
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOk.Enabled := not btnOk.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;
  btnRefresh.Enabled := not btnRefresh.Enabled;

  //qry
  dmStockCenter.qryProductList.ReadOnly := not dmStockCenter.qryProductList.ReadOnly;

  //eh
  dgeProductList.Enabled := not dgeProductList.Enabled;
end;

//增加
procedure TfrmProductManager.actCreateExecute(Sender: TObject);
var
  psku : string;
begin
  SetButtonEnable;
  if dmStockCenter.qryProductList.State <> dsBrowse then
  begin
    dmStockCenter.qryProductList.Cancel;
  end;
  psku := getSKUEncode;
  while SkuIsExist(psku) do
  begin
    psku := getSKUEncode;
  end;
  dmStockCenter.qryProductList.Append;
  dmStockCenter.qryProductList.FieldByName('status').AsInteger := StrToInt(PS_RELEASE);
  dmStockCenter.qryProductList.FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
  dmStockCenter.qryProductList.FieldByName('sku').AsString := psku;
end;

//判断SKU存在
function TfrmProductManager.SkuIsExist(psku: string): Boolean;
begin
  Result := False;
  with dmStockCenter.qryProductList do
  begin
    if Locate('sku',psku,[loCaseInsensitive]) then
    begin
      Result := True;
    end;
  end;
end;

//删除
procedure TfrmProductManager.actDeleteExecute(Sender: TObject);
begin
  if Application.MessageBox('确定删除记录？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    SetButtonEnable;
    if dmStockCenter.qryProductList.State <> dsBrowse then
    begin
      dmStockCenter.qryProductList.Cancel;
    end;
    dmStockCenter.qryProductList.Delete;
    SetButtonEnable;
  end;
end;

//修改
procedure TfrmProductManager.actUpdateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmStockCenter.qryProductList.State <> dsBrowse then
  begin
    dmStockCenter.qryProductList.Cancel;
  end;
  dmStockCenter.qryProductList.Edit;
end;

//刷新
procedure TfrmProductManager.actRefreshExecute(Sender: TObject);
begin
  if dmStockCenter.qryProductList.State = dsBrowse then
    dmStockCenter.qryProductList.Refresh
  else
    ShowMessage('请保存修改！');
end;

procedure TfrmProductManager.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

//确定
procedure TfrmProductManager.btnOkClick(Sender: TObject);
var
  bcode : string;
begin
  bcode := getCurrCatEncode;
  if bcode <> '' then
  begin
    if dmStockCenter.qryProductList.State <> dsBrowse then
    begin
      if dmStockCenter.qryProductList.State = dsInsert then
        dmStockCenter.qryProductList.FieldByName('title').AsString :=
                      dmStockCenter.qryProductList.FieldByName('name').AsString;
      dmStockCenter.qryProductList.FieldByName('bcat_id').AsString := bcode;
      dmStockCenter.qryProductList.FieldByName('brand_name').AsString := cbbbrand.Text;
      dmStockCenter.qryProductList.Post;
    end;
    dmStockCenter.qryBrandInfo.Filter := '';
    dmStockCenter.qryBrandInfo.Filtered := False;
    SetButtonEnable;
  end else
    ShowMessage('请选择商品所属目录！');
end;

//取消
procedure TfrmProductManager.btnCancelClick(Sender: TObject);
begin
  if dmStockCenter.qryProductList.State <> dsBrowse then
  begin
    dmStockCenter.qryProductList.Cancel;
  end;
  dmStockCenter.qryBrandInfo.Filter := '';
  dmStockCenter.qryBrandInfo.Filtered := False;
  SetButtonEnable;
end;

//销售代码
procedure TfrmProductManager.RzDBButtonEdit1ButtonClick(Sender: TObject);
var
  resVal : Integer;
begin
  if dmStockCenter.qryProductList.State = dsInsert then
  begin
    Application.CreateForm(TfrmSelectProduct,frmSelectProduct);
    try
      resVal := frmSelectProduct.ShowModal;
    finally
      FreeAndNil(frmSelectProduct);

      if resVal = 1 then
      begin
        with dmStockCenter.qryProductList do
        begin
          FieldByName('sn').AsString := SelPdt.psn;
          FieldByName('name').AsString := SelPdt.pname;
          FieldByName('supplier_no').AsString := SelPdt.supplierno;
          FieldByName('brand_id').AsInteger := SelPdt.brandid;
          FieldByName('ean').AsString := SelPdt.pean;
          FieldByName('p_size').AsString := SelPdt.psize;
          FieldByName('color').AsString := SelPdt.pcolor;
          FieldByName('brief').AsString := SelPdt.pbrief;
          FieldByName('score').AsInteger := SelPdt.pscore;
          FieldByName('spec').AsString := SelPdt.pspec;
          FieldByName('origin').AsString := SelPdt.porigin;
          FieldByName('execute_std').AsString := SelPdt.pexe;
        end;
      end;
    end;
  end else
    ShowMessage('未处于新增状态！');
end;

//销售单位
//procedure TfrmProductManager.RzDBButtonEdit2ButtonClick(Sender: TObject);
//begin
//  rlddatalist.Dataset := dmStockCenter.qrySaleUtilList;
//  rlddatalist.KeyField := 'sname';
//  rlddatalist.SearchField := 'sname';
//  rlddatalist.SearchEdit := RzDBButtonEdit2;
//  rlddatalist.Caption := '销售单位';
//  rlddatalist.Execute;
//end;

//创建目录树
procedure TfrmProductManager.CreateCatalogTree(parNode: TTreeNode;
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
        node := ltvPCatList.Items.AddChildFirst(
          parNode,parQuery.FieldByName('name').AsString);
      end else
      begin
        node := ltvPCatList.Items.AddChild(
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
end;

//查找子节点
procedure TfrmProductManager.FindChildNode(query: TUniQuery;
  Level: Integer);
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select name,bcat_id,code from t_p_bcat_vegaga');
  query.AddWhere('p_bcat_id = :parent');
  query.ParamByName('parent').AsInteger := Level;
  query.Open;
end;

//初始化目录树
procedure TfrmProductManager.InitCatalogTree;
var
  parNode : TTreeNode;
begin
  InitCodeDataLen;
  CodeDataCount := 0;
  ltvPCatList.Items.Clear;
  parNode := ltvPCatList.Items.AddFirst(nil,'商品目录');
  parNode.SelectedIndex := 0;
  CreateCatalogTree(parNode,0);
  ltvPCatList.AutoExpand := True;
end;

//初始化节点编码数组
procedure TfrmProductManager.InitCodeDataLen;
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

//获取当前编码
function TfrmProductManager.getCurrCatEncode: string;
var
  pStr : ^string;
begin
  Result := '';
  if ltvPCatList.Selected.AbsoluteIndex <> 0 then
  begin
    pStr := ltvPCatList.Selected.Data;
    Result := pStr^;
  end;
end;

//单击目录树
procedure TfrmProductManager.ltvPCatListClick(Sender: TObject);
begin
  with dmStockCenter.qryProductList do
  begin
    if State in [dsEdit,dsInsert] then
      FieldByName('bcat_id').AsString := getCurrCatEncode
    else
      ProductCatFilter(getCurrCatEncode);
  end;
end;

//过滤
procedure TfrmProductManager.ProductCatFilter(code: string);
begin
  dmStockCenter.qryProductList.Filtered := False;
  dmStockCenter.qryProductList.Filter := 'bcat_id like '+QuotedStr(code+'%');
  dmStockCenter.qryProductList.Filtered := True;
end;

//设置商品目录
procedure TfrmProductManager.SetProductBCat(bcat: string);
var
  i : Integer;
  pStr : ^string;
begin
  for i := 1 to ltvPCatList.Items.Count - 1 do
  begin
    pStr := ltvPCatList.Items.Item[i].Data;
    if pStr^ = bcat then
      ltvPCatList.Items.Item[i].Selected := True;
  end;
end;

//选择单元
procedure TfrmProductManager.dgeProductListCellClick(Column: TColumnEh);
var
  bcat : string;
begin
  if dmStockCenter.qryProductList.State = dsBrowse then
  begin
    bcat := dmStockCenter.qryProductList.FieldByName('bcat_id').AsString;
    SetProductBCat(bcat);
  end;
end;

//品牌过滤
procedure TfrmProductManager.RzDBLookupComboBox1CloseUp(Sender: TObject);
var
  sid : Integer;
begin
  sid := dmStockCenter.qrySupplierInfo.FieldByName('s_id').AsInteger;
  dmStockCenter.qryBrandInfo.Filter := 'supplies_id='+IntToStr(sid);
  dmStockCenter.qryBrandInfo.Filtered := True;
end;

procedure TfrmProductManager.dgeProductListTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  FieldSort(dmStockCenter.qryProductList,Column);
end;

end.
