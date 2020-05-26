unit untScatProductList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzSplit, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh,
  ComCtrls, RzTreeVw, RzButton, Uni;

type
  TfrmScatProductList = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    RzSplitter1: TRzSplitter;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    ltvSCatTree: TRzTreeView;
    btn1: TRzBitBtn;
    btn2: TRzBitBtn;
    dgeProductList: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ltvSCatTreeClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    CodeDataCount : Integer;
    CodeData : array of string;
    function getCurrCatEncode: string;
    procedure InitCatalogTree;
    procedure CreateCatalogTree(parNode: TTreeNode;level: Integer);
    procedure FindChildNode(query:TUniQuery;Level: Integer);
    procedure ProductCatFilter(code: string);
    procedure AddProcduct;
  public
    { Public declarations }
  end;

type
  TAddScatPList = record
    pid : Integer;
    psku : string;
    pname : string;
    pprice : Real;
    pscat : string;
    pstate : Integer;
    pcnum : Integer;
  end;

var
  frmScatProductList: TfrmScatProductList;
  addScatPList : array of TAddScatPList;

implementation

uses untPCenterDM, untCommonDm;

{$R *.dfm}

//��������
procedure TfrmScatProductList.FormCreate(Sender: TObject);
begin
  dmPCenter.qrySelScatList.Open;
  //dmPCenter.qryScatPList.Open;
  dmPCenter.qryPSku.Open;
  dmPCenter.qrySCatInfo.Open;
  dmPCenter.qryBrandInfo.Open;
  dmPCenter.qryBcatInfo.Open;
  dmPCenter.qryStOAddPudt.Open;
  ProductCatFilter('');
  InitCatalogTree;
end;

//�رմ���
procedure TfrmScatProductList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPCenter.qryStOAddPudt.Close;
  dmPCenter.qryBrandInfo.Close;
  dmPCenter.qryBcatInfo.Close;
  dmPCenter.qrySCatInfo.Close;
  dmPCenter.qryPSku.Close;
end;

//��ʼ��Ŀ¼��
procedure TfrmScatProductList.InitCatalogTree;
var
  parNode : TTreeNode;
begin
  SetLength(CodeData,dmPCenter.qrySelScatList.RecordCount);
  CodeDataCount := 0;
  ltvSCatTree.Items.Clear;
  parNode := ltvSCatTree.Items.AddFirst(nil,'����Ŀ¼');
  parNode.SelectedIndex := 0;
  CreateCatalogTree(parNode,0);
  ltvSCatTree.AutoExpand := True;
end;

//����Ŀ¼
procedure TfrmScatProductList.CreateCatalogTree(parNode: TTreeNode;
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
        node := ltvSCatTree.Items.AddChildFirst(
          parNode,parQuery.FieldByName('name').AsString);
      end else
      begin
        node := ltvSCatTree.Items.AddChild(
          parNode,parQuery.FieldByName('name').AsString);
      end;
      node.SelectedIndex := parQuery.FieldByName('scat_id').AsInteger;
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

//�����ӽڵ�
procedure TfrmScatProductList.FindChildNode(query: TUniQuery;
  Level: Integer);
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from t_p_scat_vegaga');
  query.AddWhere('p_scat_id = :parent');
  query.ParamByName('parent').AsInteger := Level;
  query.Open;
end;

//�õ�Ŀ¼����
function TfrmScatProductList.getCurrCatEncode: string;
var
  currCode : string;
  pStr : ^string;
begin
  if ltvSCatTree.Selected.AbsoluteIndex = 0 then
  begin
    currCode := '';
  end else
  begin
    pStr := ltvSCatTree.Selected.Data;
    currCode := pStr^;
  end;
  Result := currCode;
end;

//�����Ʒ
procedure TfrmScatProductList.AddProcduct;
var
  i : Integer;
begin
  if dgeProductList.SelectedRows.Count > 0 then
  begin
    SetLength(addScatPList,dgeProductList.SelectedRows.Count);
    for i := 0 to dgeProductList.SelectedRows.Count - 1 do
    begin
      dmPCenter.qryStOAddPudt.GotoBookmark(Pointer(dgeProductList.SelectedRows.Items[i]));
      addScatPList[i].pid := dmPCenter.qryStOAddPudt.FieldByName('p_id').AsInteger;
      addScatPList[i].psku := dmPCenter.qryStOAddPudt.FieldByName('sku').AsString;
      addScatPList[i].pname := dmPCenter.qryStOAddPudt.FieldByName('name').AsString;
      addScatPList[i].pprice := dmPCenter.qryStOAddPudt.FieldByName('p_sale_price').AsCurrency;
      addScatPList[i].pscat := dmPCenter.qryStOAddPudt.FieldByName('scatName').AsString;
      addScatPList[i].pstate := dmPCenter.qryStOAddPudt.FieldByName('status').AsInteger;
      addScatPList[i].pcnum := dmPCenter.qryStOAddPudt.FieldByName('skuNum').AsInteger;
    end;
    Close;
  end else
    ShowMessage('��ѡ����Ʒ��');
end;

//��Ʒ����
procedure TfrmScatProductList.ProductCatFilter(code: string);
begin
  with dmPCenter.qryStOAddPudt do
  begin
    Filtered := False;
    if code = '' then
    begin
      Filter := 'scat_id = '+ QuotedStr('hasldfhasfdjlkasjdflkajslkdfjalk');
    end else
    begin
      Filter := 'scat_id like '+ QuotedStr(code+'%');
    end;
    Filtered := True;
  end;
end;

//Ŀ¼������
procedure TfrmScatProductList.ltvSCatTreeClick(Sender: TObject);
begin
  ProductCatFilter(getCurrCatEncode);
end;

//ȷ��
procedure TfrmScatProductList.btn1Click(Sender: TObject);
begin
  AddProcduct;
  ModalResult := 1;
end;

//�˳�
procedure TfrmScatProductList.btn2Click(Sender: TObject);
begin
  Close;
  ModalResult := 2;
end;

end.
