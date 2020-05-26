unit untLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RzLabel, Mask, RzEdit, RzButton, DB, MemDS,
  DBAccess, Uni, RzStatus;

type
  TfrmLogin = class(TForm)
    imgLogin: TImage;
    edtUserName: TRzEdit;
    lblUserName: TRzLabel;
    edtUserPassword: TRzEdit;
    lblUserPassword: TRzLabel;
    btnOK: TRzBitBtn;
    btnExit: TRzBitBtn;
    qryLogin: TUniQuery;
    qryRoleList: TUniQuery;
    qryLoginuser_id: TIntegerField;
    qryLoginusername: TStringField;
    qryLoginpassword: TStringField;
    qryLoginrealname: TStringField;
    qryLoginemail: TStringField;
    qryLoginstatus: TFloatField;
    qryLogincreate_date: TDateTimeField;
    qryLogincreate_by: TFloatField;
    qryLoginlast_login_date: TDateTimeField;
    qryLoginsys_status: TFloatField;
    RzLabel1: TRzLabel;
    vrinfinfo: TRzVersionInfo;
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure edtUserNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    saddr,sname,uname,upassword : string;
    sport : Integer;
    procedure getConf;
    procedure CreateCommonDm;
    procedure ServerConnect;
    procedure UserLogin;
    procedure SetLastLoginDate;
    procedure SetCurrentUser;
    procedure SetUserPrivileges;
    function ValidateUser(Name,Password : string) : Boolean;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses MAIN, untCommonDm, untCommonUtil, untIniIO, untSetConfig;

{$R *.dfm}

procedure TfrmLogin.CreateCommonDm;
begin
  if not Assigned(frmCommonDm) then
    frmCommonDm := TfrmCommonDm.Create(Application);
  frmCommonDm.Connection.Server := saddr;
  frmCommonDm.Connection.Port := sport;
  frmCommonDm.Connection.Database := sname;
  frmCommonDm.Connection.Username := uname;
  frmCommonDm.Connection.Password := upassword;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  getConf;
  CreateCommonDm;
  RzLabel1.Caption := '版本：'+vrinfinfo.FileVersion;
end;

//获取配置文件
procedure TfrmLogin.getConf;
var
  conf : TIniOptions;
begin
  conf := TIniOptions.Create;
  conf.LoadFromFile('./confing.ini');
  saddr := Decipher(conf.DataConfigserverAddr);
  sname := Decipher(conf.DataConfigserverName);
  sport := StrToInt(Decipher(conf.DataConfigserverPort));
  uname := Decipher(conf.DataConfiguserName);
  upassword := Decipher(conf.DataConfigpassword);
  FreeAndNil(conf);
end;

procedure TfrmLogin.UserLogin;
var
  name,password : string;
begin
  name := Trim(edtUserName.Text);
  password := Trim(edtUserPassword.Text);
  if (name <> '') and (password <> '') then
  begin
    if ValidateUser(name,password) then 
    begin
      frmLogin.Hide;
      Application.CreateForm(TMainForm,MainForm);
      MainForm.Show;
      edtUserName.Clear;
      edtUserPassword.Clear;
    end else
    begin
      ShowMessage('用户名密码错误，请重新登陆！');
      edtUserName.Clear;
      edtUserPassword.Clear;
    end;
  end else
  begin
    ShowMessage('请输入用户名和密码！');
  end;
end;

function TfrmLogin.ValidateUser(Name, Password: string): Boolean;
begin                               
  Result := False;
  
  qryLogin.Close;
  qryLogin.SQL.Clear;
  qryLogin.SQL.Add('select * from t_boss_user_vegaga');
  qryLogin.AddWhere('username = :username');
  qryLogin.ParamByName('username').AsString := Name;
  qryLogin.Open;

  if qryLogin.RecordCount > 0 then
  begin
    if Password = qryLogin.FieldByName('password').AsString then
    begin
      Result := True;
      SetCurrentUser;
      SetUserPrivileges;
      SetLastLoginDate;
    end;
  end;

  qryLogin.Close;
end;

//设置最后登录时间
procedure TfrmLogin.SetLastLoginDate;
begin
  if qryLogin.Active then
  begin
    qryLogin.Edit;
    qryLogin.FieldByName('last_login_date').AsDateTime := Date+Time;
    qryLogin.Post;
  end;
end;

//设置当前登陆用户
procedure TfrmLogin.SetCurrentUser;
begin
  if qryLogin.Active then
  begin
    CurrentUser.Id := qryLogin.FieldByName('user_id').AsInteger;
    CurrentUser.Name := qryLogin.FieldByName('username').AsString;
    CurrentUser.RealName := qryLogin.FieldByName('realname').AsString;
    CurrentUser.Email := qryLogin.FieldByName('email').AsString;
    CurrentUser.Status := qryLogin.FieldByName('status').AsInteger;
    CurrentUser.CreateDate := DateTimeToStr(qryLogin.FieldByName('create_date').AsDateTime);
    CurrentUser.CreateBy := IntToStr(qryLogin.FieldByName('create_by').AsInteger);
    CurrentUser.LastLoginDate := DateTimeToStr(qryLogin.FieldByName('last_login_date').AsDateTime);
    CurrentUser.SysStatus := qryLogin.FieldByName('sys_status').AsInteger;
    CurrentUser.server := saddr+'@'+sname;
  end;
end;

//设置权限
procedure TfrmLogin.SetUserPrivileges;
var
  selectSql : string;
  i : Integer;
begin
  if qryLogin.Active then
  begin
    selectSql := 'select tbrpv.pri_id as privilegeId from t_boss_user_role_vegaga tburv '
               + 'left join t_boss_role_privilege_vegaga tbrpv on tburv.role_id = tbrpv.role_id '
               + 'where tburv.user_id = :userid ';
    qryRoleList.Close;
    qryRoleList.SQL.Clear;
    qryRoleList.SQL.Add(selectSql);
    qryRoleList.ParamByName('userid').AsInteger := CurrentUser.Id;
    qryRoleList.Open;

    CurrentUser.RoleList := TStringList.Create;
    for i := 0 to qryRoleList.RecordCount -1 do
    begin
      CurrentUser.RoleList.Add(IntToStr(qryRoleList.FieldByName('privilegeId').AsInteger));
      qryRoleList.Next;
    end;

    CurrentUser.RoleList.Sort;
  end;
end;

//------------------------------------------------------------------------------
// 事件
//------------------------------------------------------------------------------

//关闭
procedure TfrmLogin.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

//登陆
procedure TfrmLogin.btnOKClick(Sender: TObject);
begin
  ServerConnect;
  if frmCommonDm.Connection.Connected then
  begin
    UserLogin;
  end else
    frmCommonDm.Connection.ConnectDialog.Execute;
end;

//连接服务器
procedure TfrmLogin.ServerConnect;
begin
  try
    frmCommonDm.Connection.Connect;
  except
    ShowMessage('连接错误！');
    //frmCommonDm.Connection.ConnectDialog.Execute;
  end;
end;

//设置数据库
procedure TfrmLogin.edtUserNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = 83) and (ssShift in Shift) and (ssCtrl in Shift) then
  begin
    Application.CreateForm(TfrmSetConfig,frmSetConfig);
    try
      frmSetConfig.ShowModal;
    finally
      FreeAndNil(frmSetConfig);

      getConf;
      CreateCommonDm;
    end;
  end;
end;

end.
