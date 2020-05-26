unit untUserManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, GridsEh, DBGridEh, StdCtrls, DB,
  Mask, RzEdit, RzDBEdit, RzButton, RzLabel, ImgList,
  RzPanel, ActnList, Menus, DBGridEhGrouping;

type
  TfrmUserManager = class(TForm)
    pnlTop: TPanel;
    pnlCenter: TPanel;
    dbgrdhUserInfo: TDBGridEh;
    edtUserName: TRzDBEdit;
    edtRealName: TRzDBEdit;
    edtEmail: TRzDBEdit;
    RzToolbar1: TRzToolbar;
    btnCreate: TRzToolButton;
    ilUserManager: TImageList;
    btnDelete: TRzToolButton;
    lblusername: TRzLabel;
    lblrealname: TRzLabel;
    lblemail: TRzLabel;
    lblpassword: TRzLabel;
    edtPassword: TRzDBEdit;
    btnUpdate: TRzToolButton;
    btnOK: TRzToolButton;
    btnCancel: TRzToolButton;
    actlstUserManager: TActionList;
    actCreate: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    actSetRole: TAction;
    pmUserManager: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    btnExit: TRzToolButton;
    btnRefresh: TRzToolButton;
    actRefresh: TAction;
    procedure FormCreate(Sender: TObject);
    procedure actCreateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actSetRoleExecute(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    procedure SetButtonEnable;
  public
    { Public declarations }
  end;

//var
//  frmUserManager: TfrmUserManager;

implementation

uses untSysManagerDM, untCommonUtil, untSetRole;

{$R *.dfm}

procedure TfrmUserManager.FormCreate(Sender: TObject);
begin
  frmSysManagerDM.qryUserInfo.Open;
end;

//设置按钮互斥状态
procedure TfrmUserManager.SetButtonEnable;
begin
  //按钮
  btnCreate.Enabled := not btnCreate.Enabled;
  btnDelete.Enabled := not btnDelete.Enabled;
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOK.Enabled := not btnOK.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;
  //编辑框
  edtUserName.ReadOnly := not edtUserName.ReadOnly;
  edtRealName.ReadOnly := not edtRealName.ReadOnly;
  edtEmail.ReadOnly := not edtEmail.ReadOnly;
  edtPassword.ReadOnly := not edtPassword.ReadOnly;
  //表格
  dbgrdhUserInfo.Enabled := not dbgrdhUserInfo.Enabled;
end;

//创建
procedure TfrmUserManager.actCreateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if frmSysManagerDM.qryUserInfo.State <> dsBrowse then
    frmSysManagerDM.qryUserInfo.Cancel;
  frmSysManagerDM.qryUserInfo.Append;
  frmSysManagerDM.qryUserInfo.FieldByName('create_date').AsDateTime := Date+Time;
end;

//删除
procedure TfrmUserManager.actDeleteExecute(Sender: TObject);
begin
  if Application.MessageBox('确定删除记录？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    if frmSysManagerDM.qryUserInfo.State = dsBrowse then
    begin
      frmSysManagerDM.qryUserInfo.Delete;
    end else
    begin
      frmSysManagerDM.qryUserInfo.Cancel;
      frmSysManagerDM.qryUserInfo.Delete;
    end;
  end;
end;

//修改
procedure TfrmUserManager.actUpdateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if frmSysManagerDM.qryUserInfo.State = dsBrowse then
  begin
    frmSysManagerDM.qryUserInfo.Edit;
  end else
  begin
    frmSysManagerDM.qryUserInfo.Cancel;
    frmSysManagerDM.qryUserInfo.Edit;
  end;
end;

//设置用户角色
procedure TfrmUserManager.actSetRoleExecute(Sender: TObject);
begin
  if frmSysManagerDM.qryUserInfo.RecordCount > 0 then
    ShowModalForm(TfrmSetRole)
  else
    ShowMessage('请选择用户!');
end;

//确定
procedure TfrmUserManager.btnOKClick(Sender: TObject);
begin
  if frmSysManagerDM.qryUserInfo.State in [dsInsert,dsEdit] then
  begin
    frmSysManagerDM.qryUserInfo.Post;
  end;
  SetButtonEnable;
end;

//取消
procedure TfrmUserManager.btnCancelClick(Sender: TObject);
begin
  if frmSysManagerDM.qryUserInfo.State in [dsInsert,dsEdit] then
  begin
    frmSysManagerDM.qryUserInfo.Cancel;
  end;
  SetButtonEnable;
end;

//窗口关闭
procedure TfrmUserManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmSysManagerDM.qryUserInfo.Close;
end;

//退出窗口
procedure TfrmUserManager.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

//刷新
procedure TfrmUserManager.actRefreshExecute(Sender: TObject);
begin
  frmSysManagerDM.qryUserInfo.Refresh;
end;

end.
