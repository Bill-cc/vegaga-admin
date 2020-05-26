unit untShelfManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ComCtrls, RzTreeVw, Uni, DB,
  ExtCtrls, Menus, RzButton, StdCtrls, RzCmboBx, RzLabel, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmShelfManager = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    ltvSCatTree: TRzTreeView;
    dgeProductList: TDBGridEh;
    pmTreeOpt: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    pmProductOpt: TPopupMenu;
    N6: TMenuItem;
    N7: TMenuItem;
    pnl5: TPanel;
    pnl6: TPanel;
    btnOk: TRzBitBtn;
    N1: TMenuItem;
    N2: TMenuItem;
    N8: TMenuItem;
    btnSetIndexPrd: TRzBitBtn;
    N9: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ltvSCatTreeClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure btnSetIndexPrdClick(Sender: TObject);
    procedure dgeProductListTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    CodeDataCount : Integer;
    CodeData : array of string;
    procedure InitSCatList;
    procedure InitCatalogTree;
    procedure CreateCatalogTree(parNode: TTreeNode;level: Integer);
    procedure FindChildNode(query:TUniQuery;Level: Integer);
    function getCatEncode: string;
    function getCurrCatEncode: string;
    procedure findAndUpdate(cid,flag: Integer);
    procedure ShelfPListFilter(code: string);
    procedure AddSCatProduct;
    procedure DelSCatProduct(ids: string);
    function GetSelectProductID: string;
    procedure ProductUpDown(ids: string;udState: Integer);
    function getCatalogEncodeSM(code: string): string;
  public
    { Public declarations }
  end;

//var
//  frmShelfManager: TfrmShelfManager;

implementation

uses untPCenterDM, untCommonUtil, untCommonDm, untSCatInput, untAddOrderProduct,
     untSetShelfPrice, untSetIndexPrd;

{$R *.dfm}

//��������
procedure TfrmShelfManager.FormCreate(Sender: TObject);
begin
  dmPCenter.qrySCatList.Open;
  dmPCenter.qryShelfPList.Open;
  ShelfPListFilter('');
  InitCatalogTree;
end;

//�رմ���
procedure TfrmShelfManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPCenter.qrySCatList.Close;
  dmPCenter.qryShelfPList.Close;
end;

//��ȡ��ǰĿ¼����
function TfrmShelfManager.getCatEncode: string;
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
  currCode := currCode + getCatalogEncodeSM(currCode);//getCatalogEncode;
  Result := currCode;
end;

//��ȡĿ¼����
function TfrmShelfManager.getCatalogEncodeSM(code: string): string;
var
  selSql : TUniQuery;
  codeStr : string;
begin
  codeStr := '';
  selSql := TUniQuery.Create(nil);
  selSql.Connection := frmCommonDm.Connection;

  selSql.Close;
  selSql.SQL.Clear;
  if code <> '' then
    selSql.SQL.Add('select code from t_p_scat_vegaga where code like '+QuotedStr(code+'%')+' order by code asc')
  else
    selSql.SQL.Add('select code from t_p_scat_vegaga where is_parent = 1 order by code asc');
  selSql.Open;

  if selSql.RecordCount > 0 then
  begin
    selSql.Last;
    codeStr := StringReplace(selSql.FieldByName('code').AsString,'code','',[]);
  end;

  if codeStr <> '' then
  begin
    if (StrToInt(codeStr) + 1) > 9 then
      codeStr := IntToStr(StrToInt(codeStr) + 1)
    else
      codeStr := '0'+IntToStr(StrToInt(codeStr) + 1);
  end;
end;

//���Ŀ¼
procedure TfrmShelfManager.N3Click(Sender: TObject);
begin
  with dmPCenter.qrySCatList do
  begin
    Append;
    if ltvSCatTree.Selected.AbsoluteIndex = 0 then
      FieldByName('is_parent').AsInteger := 1
    else
      FieldByName('is_parent').AsInteger := 0;
    FieldByName('p_scat_id').AsInteger := ltvSCatTree.Selected.SelectedIndex;
    FieldByName('code').AsString := getCatEncode;
    FieldByName('status').AsInteger := 1;
    FieldByName('sort_rank').AsInteger := 1;
    FieldByName('sys_status').AsInteger := 1;
    Application.CreateForm(TfrmSCatInput,frmSCatInput);
    try
      frmSCatInput.edtPName.Text := ltvSCatTree.Selected.Text;
      frmSCatInput.ShowModal;
    finally
      FreeAndNil(frmSCatInput);

      if okFlag then
      begin
        FieldByName('name').AsString := scatName;
        Post;
      end else Cancel;
      InitCatalogTree;
    end;
  end;
end;

//ɾ��Ŀ¼
procedure TfrmShelfManager.N4Click(Sender: TObject);
begin
  if ltvSCatTree.Selected.AbsoluteIndex > 0 then
  begin
    if Application.MessageBox('ȷ��ɾ����Ŀ¼��', '��ʾ', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      findAndUpdate(ltvSCatTree.Selected.SelectedIndex,2);
      InitCatalogTree;
    end;
  end else
    ShowMessage('��ѡ��Ŀ¼��');
end;

//�޸�Ŀ¼
procedure TfrmShelfManager.N5Click(Sender: TObject);
begin
  if ltvSCatTree.Selected.AbsoluteIndex > 0 then
  begin
    with dmPCenter.qrySCatList do
    begin
      findAndUpdate(ltvSCatTree.Selected.SelectedIndex,1);
      Application.CreateForm(TfrmSCatInput,frmSCatInput);
      try
        frmSCatInput.edtPName.Text := ltvSCatTree.Selected.Parent.Text;
        frmSCatInput.ShowModal;
      finally
        FreeAndNil(frmSCatInput);

        if okFlag then
        begin
          FieldByName('name').AsString := scatName;
          Post;
        end else Cancel;
        InitCatalogTree;
      end;
    end;
  end else
    ShowMessage('��ѡ��Ŀ¼��');
end;

//��ʼ��Ŀ¼��
procedure TfrmShelfManager.InitCatalogTree;
var
  parNode : TTreeNode;
begin
  InitSCatList;
  SetLength(CodeData,dmPCenter.qrySCatList.RecordCount);
  CodeDataCount := 0;
  ltvSCatTree.Items.Clear;
  parNode := ltvSCatTree.Items.AddFirst(nil,'����Ŀ¼');
  parNode.SelectedIndex := 0;
  CreateCatalogTree(parNode,0);
  ltvSCatTree.AutoExpand := True;
end;

//����Ŀ¼��
procedure TfrmShelfManager.CreateCatalogTree(parNode: TTreeNode;
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
procedure TfrmShelfManager.FindChildNode(query: TUniQuery; Level: Integer);
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from t_p_scat_vegaga');
  query.AddWhere('p_scat_id = :parent');
  query.ParamByName('parent').AsInteger := Level;
  query.Open;
end;

//��ʼ��lsit
procedure TfrmShelfManager.InitSCatList;
begin
  with dmPCenter.qrySCatList do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from t_p_scat_vegaga');
    Open;
  end;
end;

//���Ҳ����½ڵ�
procedure TfrmShelfManager.findAndUpdate(cid, flag: Integer);
begin
  with dmPCenter.qrySCatList do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from t_p_scat_vegaga where scat_id=:id');
    ParamByName('id').AsInteger := cid;
    Open;

    if RecordCount > 0 then
    begin
      if flag = 1 then  //�޸�
      begin
        Edit;
      end else
      if flag = 2 then  //ɾ��
      begin
        Delete;
      end;
    end else
    begin
      ShowMessage('δ�ҵ���¼��');
    end;
  end;
end;

//Ŀ¼������
procedure TfrmShelfManager.ltvSCatTreeClick(Sender: TObject);
begin
  ShelfPListFilter(getCurrCatEncode);
end;

procedure TfrmShelfManager.ShelfPListFilter(code: string);
begin
  with dmPCenter.qryShelfPList do
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

//��ȡ��ǰ�ڵ����
function TfrmShelfManager.getCurrCatEncode: string;
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

//�����Ʒ��ť
procedure TfrmShelfManager.N6Click(Sender: TObject);
var
  resVal : Integer;
begin
  resVal := 0;
  if ltvSCatTree.Selected.AbsoluteIndex > 0 then
  begin
    Application.CreateForm(TfrmAddOrderProduct,frmAddOrderProduct);
    try
      resVal := frmAddOrderProduct.ShowModal;
    finally
      FreeAndNil(frmAddOrderProduct);

      if resVal = 1 then AddSCatProduct;
    end;   
  end else
    ShowMessage('��Ŀ¼���������Ʒ��');
end;

//�����Ʒ
procedure TfrmShelfManager.AddSCatProduct;
var
  query : TUniSQL;
  i : Integer;
  hint : PChar;
begin
  query := TUniSQL.Create(nil);
  query.Connection := frmCommonDm.Connection;
  query.SQL.Add('update t_p_product_vegaga set scat_id=:scatCode,status=:state where p_id=:pid');
  with dmPCenter.qryShelfPList do
  begin
    DisableControls;
    for i := Low(addOPList) to High(addOPList) do
    begin
      if Locate('p_id',addOPList[i].pid,[loCaseInsensitive]) then
      begin
        ShowMessage('�����SKU��Ϊ '+addOPList[i].psku+' ����Ʒ��');
        Continue;
      end;

      if addOPList[i].pscat <> '' then
      begin
        hint := PChar('����Ʒ���� '+addOPList[i].pscat+' ����Ŀ¼�£�ȷ����Ӹ���Ʒ����ǰĿ¼��');
        if Application.MessageBox(hint, '��ʾ', MB_OKCANCEL +
          MB_DEFBUTTON2) <> IDOK then
        begin
          Continue;
        end;
      end;

      query.ParamByName('state').AsInteger := StrToInt(PS_RELEASE);
      query.ParamByName('scatCode').AsString := getCurrCatEncode;
      query.ParamByName('pid').AsInteger := addOPList[i].pid;
      query.Execute;
    end;
    Refresh;
    EnableControls;
  end;
  FreeAndNil(query);
end;

//��ȡѡ�����ƷID
function TfrmShelfManager.GetSelectProductID: string;
var
  ids : string;
  i : Integer;
begin
  ids := '';
  if dgeProductList.SelectedRows.Count > 0 then
  begin
    dmPCenter.qryShelfPList.DisableControls;
    for i := 0 to dgeProductList.SelectedRows.Count - 1 do
    begin
      dmPCenter.qryShelfPList.GotoBookmark(Pointer(dgeProductList.SelectedRows.Items[i]));
      ids := ids + IntToStr(dmPCenter.qryShelfPList.FieldByName('p_id').AsInteger) + ',';
    end;
    dmPCenter.qryShelfPList.EnableControls;
    ids := Copy(ids,1,Length(ids)-1);
  end;
  Result := ids;
end;

//ɾ����Ʒ
procedure TfrmShelfManager.N7Click(Sender: TObject);
begin
  if Application.MessageBox('ȷ��ɾ����������Ʒ��', '��ʾ', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    DelSCatProduct(GetSelectProductID);
    dmPCenter.qryShelfPList.Refresh;
  end;
end;

//ɾ����Ʒ
procedure TfrmShelfManager.DelSCatProduct(ids: string);
var
  query : TUniSQL;
begin
  query := TUniSQL.Create(nil);
  query.Connection := frmCommonDm.Connection;
  query.SQL.Add('update t_p_product_vegaga set scat_id=null where p_id in ('+ids+')');
  if ids <> '' then
  begin
    //query.ParamByName('ids').AsString := ids;
    query.Execute;

    FreeAndNil(query);
  end else
    ShowMessage('�޿�ɾ����Ʒ��');
end;

//������Ʒ���¼�
procedure TfrmShelfManager.ProductUpDown(ids: string;udState: Integer);
var
  query : TUniSQL;
begin
  query := TUniSQL.Create(nil);
  query.Connection := frmCommonDm.Connection;
  query.SQL.Add('update t_p_product_vegaga set status=:state where p_id in ('+ids+')');
  if ids <> '' then
  begin
    query.ParamByName('state').AsInteger := udState;
    //query.ParamByName('ids').AsString := ids;
    query.Execute;

    FreeAndNil(query);
  end else
    ShowMessage('�޿����¼���Ʒ��');
end;

//ȷ��
procedure TfrmShelfManager.btnOkClick(Sender: TObject);
begin
  Close;
end;

//�۸�����
procedure TfrmShelfManager.N1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmSetShelfPrice,frmSetShelfPrice);
  try
    frmSetShelfPrice.ShowModal;
  finally
    FreeAndNil(frmSetShelfPrice);
  end;  
end;

//�ϼ�
procedure TfrmShelfManager.N2Click(Sender: TObject);
begin
  ProductUpDown(GetSelectProductID,StrToInt(PS_SHELFUP));
  dmPCenter.qryShelfPList.Refresh;
end;

//�¼�
procedure TfrmShelfManager.N8Click(Sender: TObject);
begin
  ProductUpDown(GetSelectProductID,StrToInt(PS_SHELFDOWN));
  dmPCenter.qryShelfPList.Refresh;
end;

//��ҳ��Ʒ����
procedure TfrmShelfManager.btnSetIndexPrdClick(Sender: TObject);
begin
  Application.CreateForm(TfrmSetIndexPrd,frmSetIndexPrd);
  try
    frmSetIndexPrd.ShowModal;
  finally
    FreeAndNil(frmSetIndexPrd);
  end;  
end;

//����
procedure TfrmShelfManager.dgeProductListTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  FieldSort(dmPCenter.qryShelfPList,Column);
end;

end.
