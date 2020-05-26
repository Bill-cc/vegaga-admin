unit untProductEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ComCtrls, RzTreeVw, Uni, DB,
  ExtCtrls, Menus, RzButton, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TfrmProductEdit = class(TForm)
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
    pnl5: TPanel;
    pnl6: TPanel;
    btnOk: TRzBitBtn;
    N1: TMenuItem;
    N2: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    IdHTTP: TIdHTTP;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure ltvSCatTreeClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dgeProductListTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
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
    function getCatalogEncodeSM(code: string): string;
  public
    { Public declarations }
  end;

//var
//  frmProductEdit: TfrmProductEdit;

implementation

uses untPCenterDM, untCommonUtil, untCommonDm, untSCatInput, untAddOrderProduct,
     untSetPicture, untSetPDetail, untSetShelfPrice;

{$R *.dfm}

//创建窗口
procedure TfrmProductEdit.FormCreate(Sender: TObject);
begin
  dmPCenter.qrySCatList.Open;
  dmPCenter.qryShelfPList.Open;
  ShelfPListFilter('');
  InitCatalogTree;
end;

//关闭窗口
procedure TfrmProductEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPCenter.qrySCatList.Close;
  dmPCenter.qryShelfPList.Close;
end;

//获取当前目录编码
function TfrmProductEdit.getCatEncode: string;
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
  currCode := currCode + getCatalogEncodeSM(currCode);;
  Result := currCode;
end;

function TfrmProductEdit.getCatalogEncodeSM(code: string): string;
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
    selSql.SQL.Add('select code from t_p_scat_vegaga where code like '+QuotedStr(code+'%')+' and code != '+QuotedStr(code)+' order by code asc')
  else
    selSql.SQL.Add('select code from t_p_scat_vegaga where is_parent = 1 order by code asc');
  selSql.Open;

  if selSql.RecordCount > 0 then
  begin
    selSql.Last;
    codeStr := Copy(selSql.FieldByName('code').AsString,Length(selSql.FieldByName('code').AsString)-1,2);
    if (StrToInt(codeStr) + 1) > 9 then
      codeStr := IntToStr(StrToInt(codeStr) + 1)
    else
      codeStr := '0'+IntToStr(StrToInt(codeStr) + 1);
  end else
    codeStr := '01';
  Result := codeStr;
end;

//添加目录
procedure TfrmProductEdit.N3Click(Sender: TObject);
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

//删除目录
procedure TfrmProductEdit.N4Click(Sender: TObject);
begin
  if ltvSCatTree.Selected.AbsoluteIndex > 0 then
  begin
    if Application.MessageBox('确定删除该目录？', '提示', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      findAndUpdate(ltvSCatTree.Selected.SelectedIndex,2);
      InitCatalogTree;
    end;
  end else
    ShowMessage('请选择目录！');
end;

//修改目录
procedure TfrmProductEdit.N5Click(Sender: TObject);
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
    ShowMessage('请选择目录！');
end;

//初始化目录树
procedure TfrmProductEdit.InitCatalogTree;
var
  parNode : TTreeNode;
begin
  InitSCatList;
  SetLength(CodeData,dmPCenter.qrySCatList.RecordCount);
  CodeDataCount := 0;
  ltvSCatTree.Items.Clear;
  parNode := ltvSCatTree.Items.AddFirst(nil,'销售目录');
  parNode.SelectedIndex := 0;
  CreateCatalogTree(parNode,0);
  ltvSCatTree.AutoExpand := True;
end;

//创建目录树
procedure TfrmProductEdit.CreateCatalogTree(parNode: TTreeNode;
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

//查找子节点
procedure TfrmProductEdit.FindChildNode(query: TUniQuery; Level: Integer);
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from t_p_scat_vegaga');
  query.AddWhere('p_scat_id = :parent');
  query.ParamByName('parent').AsInteger := Level;
  query.Open;
end;

//初始化lsit
procedure TfrmProductEdit.InitSCatList;
begin
  with dmPCenter.qrySCatList do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from t_p_scat_vegaga');
    Open;
  end;
end;

//查找并更新节点
procedure TfrmProductEdit.findAndUpdate(cid, flag: Integer);
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
      if flag = 1 then  //修改
      begin
        Edit;
      end else
      if flag = 2 then  //删除
      begin
        Delete;
      end;
    end else
    begin
      ShowMessage('未找到记录！');
    end;
  end;
end;

//目录树单击
procedure TfrmProductEdit.ltvSCatTreeClick(Sender: TObject);
begin
  ShelfPListFilter(getCurrCatEncode);
end;

procedure TfrmProductEdit.ShelfPListFilter(code: string);
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

//获取当前节点编码
function TfrmProductEdit.getCurrCatEncode: string;
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

//确定
procedure TfrmProductEdit.btnOkClick(Sender: TObject);
begin
  Close;
end;

//设置商品图片按钮
procedure TfrmProductEdit.N1Click(Sender: TObject);
begin
  if dmPCenter.qryShelfPList.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmSetPicture,frmSetPicture);
    try
      frmSetPicture.ShowModal;
    finally
      FreeAndNil(frmSetPicture);
    end;
  end else
    ShowMessage('无可设置商品！');
end;

//设置商品详情
procedure TfrmProductEdit.N2Click(Sender: TObject);
begin
  if dmPCenter.qryShelfPList.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmSetPDetail,frmSetPDetail);
    try
      frmSetPDetail.ShowModal;
    finally
      FreeAndNil(frmSetPDetail);
    end;
  end else
    ShowMessage('无可设置商品！');
end;

//排序
procedure TfrmProductEdit.dgeProductListTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  FieldSort(dmPCenter.qryShelfPList,Column);
end;

//添加商品
procedure TfrmProductEdit.N7Click(Sender: TObject);
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
    ShowMessage('根目录不能添加商品！');
end;

//添加商品
procedure TfrmProductEdit.AddSCatProduct;
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
        ShowMessage('已添加SKU号为 '+addOPList[i].psku+' 的商品！');
        Continue;
      end;

      if addOPList[i].pscat <> '' then
      begin
        hint := PChar('该商品已在 '+addOPList[i].pscat+' 销售目录下，确认添加该商品到当前目录？');
        if Application.MessageBox(hint, '提示', MB_OKCANCEL +
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

//删除商品
procedure TfrmProductEdit.N8Click(Sender: TObject);
begin
  if Application.MessageBox('确定删除该销售商品？', '提示', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    DelSCatProduct(GetSelectProductID);
    dmPCenter.qryShelfPList.Refresh;
  end;
end;

//删除商品
procedure TfrmProductEdit.DelSCatProduct(ids: string);
var
  query : TUniSQL;
begin
  query := TUniSQL.Create(nil);
  query.Connection := frmCommonDm.Connection;
  query.SQL.Add('update t_p_product_vegaga set scat_id=null where p_id in ('+ids+')');
  if ids <> '' then
  begin
    query.Execute;

    FreeAndNil(query);
  end else
    ShowMessage('无可删除商品！');
end;

//获取选择商品
function TfrmProductEdit.GetSelectProductID: string;
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

//价格设置
procedure TfrmProductEdit.N9Click(Sender: TObject);
begin
  Application.CreateForm(TfrmSetShelfPrice,frmSetShelfPrice);
  try
    frmSetShelfPrice.ShowModal;
  finally
    FreeAndNil(frmSetShelfPrice);
  end;  
end;

//同步首页目录
procedure TfrmProductEdit.N6Click(Sender: TObject);
var
  inStream : TMemoryStream;
  GetStream : TStringStream;
begin
  if Application.MessageBox('确定生成目录？', '提示', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    inStream := TMemoryStream.Create;
    GetStream := TStringStream.Create('');
    idHTTP.Post('http://www.vegaga.com/servlet/createScat.do',inStream,GetStream);
    if GetStream.DataString = 'ok' then
      ShowMessage('生成成功！')
    else
      ShowMessage('生成失败！');
    FreeAndNil(GetStream);
    FreeAndNil(inStream);
  end;
end;

end.
