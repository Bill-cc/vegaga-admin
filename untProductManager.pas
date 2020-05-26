unit untProductManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ActnList, ExtCtrls, RzPanel, DBGridEhGrouping,
  GridsEh, DBGridEh, RzButton, StdCtrls, DBCtrls, RzDBEdit, RzDBBnEd,
  RzCmboBx, RzDBCmbo, Mask, RzEdit, RzLabel, DB, RzCommon, RzDBLook,
  ComCtrls, RzTreeVw;

type
  TfrmProductManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    actlst1: TActionList;
    il1: TImageList;
    pm1: TPopupMenu;
    dgeProductList: TDBGridEh;
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
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit13: TRzDBEdit;
    RzDBComboBox1: TRzDBComboBox;
    RzDBButtonEdit1: TRzDBButtonEdit;
    RzDBButtonEdit2: TRzDBButtonEdit;
    RzDBMemo1: TRzDBMemo;
    RzDBMemo2: TRzDBMemo;
    btnuploadimage: TRzButton;
    rlddatalist: TRzDBLookupDialog;
    RzLabel19: TRzLabel;
    cbbbrand: TRzDBLookupComboBox;
    RzLabel21: TRzLabel;
    RzDBEdit14: TRzDBEdit;
    RzLabel22: TRzLabel;
    RzDBEdit15: TRzDBEdit;
    pnlLeft: TPanel;
    pnlBottom: TPanel;
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
    procedure RzDBButtonEdit2ButtonClick(Sender: TObject);
  private
    procedure SetButtonEnable;
  public
    { Public declarations }
  end;

//var
//  frmProductManager: TfrmProductManager;

implementation

uses untStockCenterDM, untCommonUtil;

{$R *.dfm}

{ TfrmProductManager }

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
  btnuploadimage.Enabled := not btnuploadimage.Enabled;

  //qry
  dmStockCenter.qryProductList.ReadOnly := not dmStockCenter.qryProductList.ReadOnly;

  //eh
  dgeProductList.Enabled := not dgeProductList.Enabled;
end;

//增加
procedure TfrmProductManager.actCreateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmStockCenter.qryProductList.State <> dsBrowse then
  begin
    dmStockCenter.qryProductList.Cancel;
  end;
  dmStockCenter.qryProductList.Append;
  dmStockCenter.qryProductList.FieldByName('sn').AsString := getProductEncode;
  dmStockCenter.qryProductList.FieldByName('sku').AsString := getSKUEncode;
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

//创建窗口
procedure TfrmProductManager.FormCreate(Sender: TObject);
begin
  dmStockCenter.qryProductList.Open;
  dmStockCenter.qrySaleUtilList.Open;
  dmStockCenter.qryFactoryList.Open;
  dmStockCenter.qryCatalogList.Open;
  dmStockCenter.qryBrandList.Open;
end;

//关闭窗口
procedure TfrmProductManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qryFactoryList.Close;
  dmStockCenter.qrySaleUtilList.Close;
  dmStockCenter.qryBrandList.Close;
  dmStockCenter.qryCatalogList.Close;
  dmStockCenter.qryProductList.Close;
end;

//确定
procedure TfrmProductManager.btnOkClick(Sender: TObject);
begin
  if dmStockCenter.qryProductList.State <> dsBrowse then
  begin
    dmStockCenter.qryProductList.Post;
  end;
  SetButtonEnable;
end;

//取消
procedure TfrmProductManager.btnCancelClick(Sender: TObject);
begin
  if dmStockCenter.qryProductList.State <> dsBrowse then
  begin
    dmStockCenter.qryProductList.Cancel;
  end;
  SetButtonEnable;
end;

//生产厂家
procedure TfrmProductManager.RzDBButtonEdit1ButtonClick(Sender: TObject);
begin
  rlddatalist.Dataset := dmStockCenter.qryFactoryList;
  rlddatalist.KeyField := 'fname';
  rlddatalist.SearchField := 'fname';
  rlddatalist.SearchEdit := RzDBButtonEdit1;
  rlddatalist.Caption := '生产厂家';
  rlddatalist.Execute;
end;

//销售单位
procedure TfrmProductManager.RzDBButtonEdit2ButtonClick(Sender: TObject);
begin
  rlddatalist.Dataset := dmStockCenter.qrySaleUtilList;
  rlddatalist.KeyField := 'sname';
  rlddatalist.SearchField := 'sname';
  rlddatalist.SearchEdit := RzDBButtonEdit2;
  rlddatalist.Caption := '销售单位';
  rlddatalist.Execute;
end;

end.
