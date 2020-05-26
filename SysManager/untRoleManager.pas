unit untRoleManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, GridsEh, DBGridEh, ExtCtrls, DB,
  Menus, ActnList, StdCtrls, Mask, RzEdit, RzDBEdit, RzLabel, RzButton,
  ImgList, DBGridEhGrouping;

type
  TfrmRoleManager = class(TForm)
    pnlTop: TPanel;
    pnlCenter: TPanel;
    dgeRoleList: TDBGridEh;
    RzToolbar1: TRzToolbar;
    btnCreate: TRzToolButton;
    btnDelete: TRzToolButton;
    btnUpdate: TRzToolButton;
    btnOK: TRzToolButton;
    btnCancel: TRzToolButton;
    ilRoleManager: TImageList;
    lblRoleName: TRzLabel;
    lblRemark: TRzLabel;
    edtRoleName: TRzDBEdit;
    edtRoleRemark: TRzDBEdit;
    actlstRoleManager: TActionList;
    actCreateRole: TAction;
    actDeleteRole: TAction;
    actUpdateRole: TAction;
    actSetPermission: TAction;
    pmRoleManager: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    btnExit: TRzToolButton;
    btnRefresh: TRzToolButton;
    actRefresh: TAction;
    procedure actCreateRoleExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDeleteRoleExecute(Sender: TObject);
    procedure actUpdateRoleExecute(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure actSetPermissionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    procedure SetButtonEnable;
  public
    { Public declarations }
  end;

//var
//  frmRoleManager: TfrmRoleManager;

implementation

uses untSysManagerDM, untSetPrivilege, untCommonUtil;

{$R *.dfm}

procedure TfrmRoleManager.FormCreate(Sender: TObject);
begin
  frmSysManagerDM.qryRoleList.Open;
end;

procedure TfrmRoleManager.SetButtonEnable;
begin
  //按钮
  btnCreate.Enabled := not btnCreate.Enabled;
  btnDelete.Enabled := not btnDelete.Enabled;
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOK.Enabled := not btnOK.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;
  //编辑框
  edtRoleName.ReadOnly := not edtRoleName.ReadOnly;
  edtRoleRemark.ReadOnly := not edtRoleRemark.ReadOnly;
  //表格
  dgeRoleList.Enabled := not dgeRoleList.Enabled;
end;

//增加角色
procedure TfrmRoleManager.actCreateRoleExecute(Sender: TObject);
begin
  SetButtonEnable;
  if frmSysManagerDM.qryRoleList.State <> dsBrowse then
  begin
    frmSysManagerDM.qryRoleList.Cancel;
  end;
  frmSysManagerDM.qryRoleList.Append;
  frmSysManagerDM.qryRoleList.FieldByName('create_date').AsDateTime := Date;
end;

//删除角色
procedure TfrmRoleManager.actDeleteRoleExecute(Sender: TObject);
begin
  if Application.MessageBox('确定删除记录？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    SetButtonEnable;
    if frmSysManagerDM.qryRoleList.State <> dsBrowse then
    begin
      frmSysManagerDM.qryRoleList.Cancel;
    end;
    frmSysManagerDM.qryRoleList.Delete;
    SetButtonEnable;
  end;
end;

//修改角色
procedure TfrmRoleManager.actUpdateRoleExecute(Sender: TObject);
begin
  SetButtonEnable;
  if frmSysManagerDM.qryRoleList.State <> dsBrowse then
  begin
    frmSysManagerDM.qryRoleList.Cancel;
  end;
  frmSysManagerDM.qryRoleList.Edit;
end;

//确定
procedure TfrmRoleManager.btnOKClick(Sender: TObject);
begin
  if frmSysManagerDM.qryRoleList.State <> dsBrowse then
  begin
    frmSysManagerDM.qryRoleList.Post;
  end;
  SetButtonEnable;
end;

//取消
procedure TfrmRoleManager.btnCancelClick(Sender: TObject);
begin
  if frmSysManagerDM.qryRoleList.State <> dsBrowse then
  begin
    frmSysManagerDM.qryRoleList.Cancel;
  end;
  SetButtonEnable;
end;

//设置权限
procedure TfrmRoleManager.actSetPermissionExecute(Sender: TObject);
begin
  if frmSysManagerDM.qryRoleList.RecordCount > 0 then
    ShowModalForm(TfrmSetPrivilege)
  else
    ShowMessage('请选择角色!');
end;

procedure TfrmRoleManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmSysManagerDM.qryRoleList.Close;
end;

//退出窗口
procedure TfrmRoleManager.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmRoleManager.actRefreshExecute(Sender: TObject);
begin
  frmSysManagerDM.qryRoleList.Refresh;
end;

end.
