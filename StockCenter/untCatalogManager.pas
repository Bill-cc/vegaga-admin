unit untCatalogManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, MemTableDataEh, Db,
  DBGridEh, ActnList, Menus, ImgList, RzButton,
  DBAccess, Uni, DBCtrls, RzDBCmbo, StdCtrls, RzLabel,
  Mask, RzEdit, RzDBEdit, ComCtrls, RzTreeVw, MemDS;

type
  TfrmCatalogManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    btnCreate: TRzToolButton;
    btnDelete: TRzToolButton;
    btnUpdate: TRzToolButton;
    btnOK: TRzToolButton;
    btnCancel: TRzToolButton;
    btnExit: TRzToolButton;
    ilCatalogManager: TImageList;
    actlstCatalogManager: TActionList;
    pmCatalogList: TPopupMenu;
    actCreate: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    ltvCatalog: TRzTreeView;
    lbl1: TRzLabel;
    lbl2: TRzLabel;
    lbl3: TRzLabel;
    cbbParent: TRzDBLookupComboBox;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    qryCatalogTree: TUniQuery;
    dsCatalogTree: TUniDataSource;
    btnRefresh: TRzToolButton;
    actRefresh: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCreateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    CodeDataCount : Integer;
    CodeData : array of string;
    procedure InitCodeDataLen;
    procedure SetButtonEnable;
    procedure InitCatalogTree;
    procedure CreateCatalogTree(parNode: TTreeNode;level: Integer);
    procedure FindChildNode(query:TUniQuery;Level: Integer);
    function getCurrCatEncode: string;
  public
    { Public declarations }
  end;

//var
//  frmCatalogManager: TfrmCatalogManager;

implementation

uses untCommonDm,untStockCenterDM, untCommonUtil;

{$R *.dfm}

//创建窗口
procedure TfrmCatalogManager.FormCreate(Sender: TObject);
begin
  qryCatalogTree.Open;
  dmStockCenter.qryCatalogList.Close;
  InitCatalogTree;
end;

//关闭窗口
procedure TfrmCatalogManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qryCatalogList.ReadOnly := True;
  qryCatalogTree.Close;
  dmStockCenter.qryCatalogList.Close;
end;

//获取当前目录编码
function TfrmCatalogManager.getCurrCatEncode: string;
var
  currCode : string;
  pStr : ^string;
begin
  if ltvCatalog.Selected.AbsoluteIndex = 0 then
  begin
    currCode := '';
  end else
  begin
    pStr := ltvCatalog.Selected.Data;
    currCode := pStr^;
  end;
  currCode := currCode + getCatalogEncode;
  Result := currCode;
end;

//创建
procedure TfrmCatalogManager.actCreateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmStockCenter.qryCatalogList.State <> dsBrowse then
  begin
    dmStockCenter.qryCatalogList.Cancel;
  end;
  dmStockCenter.qryCatalogList.Append;
  dmStockCenter.qryCatalogList.FieldByName('code').AsString := getCurrCatEncode;
  dmStockCenter.qryCatalogList.FieldByName('p_bcat_id').AsInteger := ltvCatalog.Selected.SelectedIndex;
end;

//删除
procedure TfrmCatalogManager.actDeleteExecute(Sender: TObject);
begin
  if ltvCatalog.Selected.SelectedIndex <> 0 then
    if Application.MessageBox('确定删除记录？', '提示', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      SetButtonEnable;
      if dmStockCenter.qryCatalogList.State <> dsBrowse then
      begin
        dmStockCenter.qryCatalogList.Cancel;
      end;
      with dmStockCenter.qryCatalogList do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from t_p_bcat_vegaga where bcat_id=:pid');
        ParamByName('pid').AsInteger := ltvCatalog.Selected.SelectedIndex;
        Open;
        Delete;
      end;
      SetButtonEnable;
      qryCatalogTree.Refresh;
      InitCatalogTree;
    end
  else
    ShowMessage('请选择节点！');
end;

//修改
procedure TfrmCatalogManager.actUpdateExecute(Sender: TObject);
begin
  if ltvCatalog.Selected.AbsoluteIndex > 0 then
  begin
    SetButtonEnable;
    if dmStockCenter.qryCatalogList.State <> dsBrowse then
    begin
      dmStockCenter.qryCatalogList.Cancel;
    end;
    with dmStockCenter.qryCatalogList do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from t_p_bcat_vegaga where bcat_id=:pid');
      ParamByName('pid').AsInteger := ltvCatalog.Selected.SelectedIndex;
      Open;
      Edit;
    end;
  end else
    ShowMessage('请选择要修改节点！');
end;

//设置互斥
procedure TfrmCatalogManager.SetButtonEnable;
begin
  //按钮互斥
  btnCreate.Enabled := not btnCreate.Enabled;
  btnDelete.Enabled := not btnDelete.Enabled;
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOK.Enabled := not btnOK.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;

  //qry
  dmStockCenter.qryCatalogList.Active := not dmStockCenter.qryCatalogList.Active;
  dmStockCenter.qryCatalogList.ReadOnly := not dmStockCenter.qryCatalogList.ReadOnly;
end;

procedure TfrmCatalogManager.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

//确定
procedure TfrmCatalogManager.btnOKClick(Sender: TObject);
begin
  if RzDBEdit2.Text <> '' then
  begin
    if dmStockCenter.qryCatalogList.State <> dsBrowse then
    begin
      dmStockCenter.qryCatalogList.Post;
    end;
    SetButtonEnable;
    qryCatalogTree.Refresh;
    InitCatalogTree;
  end else
    ShowMessage('目录名称不能为空！');
end;

//取消
procedure TfrmCatalogManager.btnCancelClick(Sender: TObject);
begin
  if dmStockCenter.qryCatalogList.State <> dsBrowse then
  begin
    dmStockCenter.qryCatalogList.Cancel;
  end;
  SetButtonEnable;
end;

//初始化目录树
procedure TfrmCatalogManager.InitCatalogTree;
var
  parNode : TTreeNode;
begin
  InitCodeDataLen;
  CodeDataCount := 0;
  ltvCatalog.Items.Clear;
  parNode := ltvCatalog.Items.AddFirst(nil,'商品目录');
  parNode.SelectedIndex := 0;
  CreateCatalogTree(parNode,0);
  ltvCatalog.AutoExpand := True;
end;

//初始化目录代码数组
procedure TfrmCatalogManager.InitCodeDataLen;
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

//创建目录
procedure TfrmCatalogManager.CreateCatalogTree(parNode: TTreeNode;level: Integer);
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
        node := ltvCatalog.Items.AddChildFirst(
          parNode,parQuery.FieldByName('name').AsString);
      end else
      begin
        node := ltvCatalog.Items.AddChild(
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
procedure TfrmCatalogManager.FindChildNode(query: TUniQuery;Level: Integer);
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from t_p_bcat_vegaga');
  query.AddWhere('p_bcat_id = :parent');
  query.ParamByName('parent').AsInteger := Level;
  query.Open;
end;

//刷新
procedure TfrmCatalogManager.actRefreshExecute(Sender: TObject);
begin
  qryCatalogTree.Refresh;
end;

end.
