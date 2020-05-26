unit untSysManagerDM;

interface

uses
  SysUtils, Classes, DB, DBAccess, Uni, MemDS;

type
  TfrmSysManagerDM = class(TDataModule)
    qryUserInfo: TUniQuery;
    dsUserInfo: TUniDataSource;
    qryUserInfouser_id: TIntegerField;
    qryUserInfousername: TStringField;
    qryUserInfopassword: TStringField;
    qryUserInforealname: TStringField;
    qryUserInfoemail: TStringField;
    qryUserInfostatus: TFloatField;
    qryUserInfocreate_by: TFloatField;
    qryUserInfosys_status: TFloatField;
    qryRoleList: TUniQuery;
    dsRoleList: TUniDataSource;
    qryRoleListrole_id: TIntegerField;
    qryRoleListname: TStringField;
    qryRoleListcreate_by: TFloatField;
    qryRoleListcreate_ip: TStringField;
    qryRoleListremark: TStringField;
    qryRoleListsys_status: TFloatField;
    qrySetPrivilege: TUniQuery;
    qrySetPrivilegeid: TIntegerField;
    qrySetPrivilegerole_id: TFloatField;
    qrySetPrivilegepri_id: TFloatField;
    qrySetPrivilegesys_status: TFloatField;
    qrySetRole: TUniQuery;
    qrySetRoleid: TIntegerField;
    qrySetRoleuser_id: TIntegerField;
    qrySetRolerole_id: TIntegerField;
    qrySetRolecreate_by: TFloatField;
    qrySetRolecreate_ip: TStringField;
    qrySetRolesys_status: TFloatField;
    qryRoleTree: TUniQuery;
    qryRoleTreerole_id: TIntegerField;
    qryRoleTreename: TStringField;
    qryRoleTreecreate_by: TFloatField;
    qryRoleTreecreate_ip: TStringField;
    qryRoleTreeremark: TStringField;
    qryRoleTreesys_status: TFloatField;
    qryRoleListcreate_date: TDateTimeField;
    qryUserInfocreate_date: TDateTimeField;
    qryUserInfolast_login_date: TDateTimeField;
    qryRoleTreecreate_date: TDateTimeField;
    qrySetRolecreate_date: TDateTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSysManagerDM: TfrmSysManagerDM;

implementation

uses untCommonDm;

{$R *.dfm}

end.
