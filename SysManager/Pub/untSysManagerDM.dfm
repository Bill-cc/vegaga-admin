object frmSysManagerDM: TfrmSysManagerDM
  OldCreateOrder = False
  Left = 404
  Top = 244
  Height = 321
  Width = 374
  object qryUserInfo: TUniQuery
    Connection = frmCommonDm.Connection
    Transaction = frmCommonDm.Transaction
    SQL.Strings = (
      'select * from t_boss_user_vegaga')
    FetchRows = 1000
    Left = 40
    Top = 24
    object qryUserInfouser_id: TIntegerField
      DisplayLabel = #24207#21495
      DisplayWidth = 50
      FieldName = 'user_id'
    end
    object qryUserInfousername: TStringField
      DisplayLabel = #30331#24405#21517
      DisplayWidth = 80
      FieldName = 'username'
      Size = 90
    end
    object qryUserInfopassword: TStringField
      DisplayLabel = #23494#30721
      DisplayWidth = 80
      FieldName = 'password'
      Size = 96
    end
    object qryUserInforealname: TStringField
      DisplayLabel = #22995#21517
      DisplayWidth = 80
      FieldName = 'realname'
      Size = 60
    end
    object qryUserInfoemail: TStringField
      DisplayLabel = #30005#23376#37038#20214
      DisplayWidth = 100
      FieldName = 'email'
      Size = 300
    end
    object qryUserInfostatus: TFloatField
      DisplayLabel = #29366#24577
      DisplayWidth = 50
      FieldName = 'status'
    end
    object qryUserInfocreate_date: TDateTimeField
      DisplayLabel = #21019#24314#26102#38388
      FieldName = 'create_date'
    end
    object qryUserInfolast_login_date: TDateTimeField
      DisplayLabel = #26368#21518#30331#24405#26102#38388
      FieldName = 'last_login_date'
    end
    object qryUserInfocreate_by: TFloatField
      DisplayLabel = #21019#24314#20154'ID'
      DisplayWidth = 50
      FieldName = 'create_by'
    end
    object qryUserInfosys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      DisplayWidth = 60
      FieldName = 'sys_status'
    end
  end
  object dsUserInfo: TUniDataSource
    DataSet = qryUserInfo
    Left = 104
    Top = 24
  end
  object qryRoleList: TUniQuery
    Connection = frmCommonDm.Connection
    Transaction = frmCommonDm.Transaction
    SQL.Strings = (
      'select * from t_boss_role_vegaga')
    FetchRows = 1000
    Left = 40
    Top = 96
    object qryRoleListrole_id: TIntegerField
      DisplayLabel = #35282#33394#24207#21495
      FieldName = 'role_id'
    end
    object qryRoleListname: TStringField
      DisplayLabel = #35282#33394#21517#31216
      FieldName = 'name'
      Required = True
      Size = 40
    end
    object qryRoleListcreate_date: TDateTimeField
      DisplayLabel = #21019#24314#26102#38388
      FieldName = 'create_date'
    end
    object qryRoleListcreate_by: TFloatField
      DisplayLabel = #21019#24314#20154'ID'
      FieldName = 'create_by'
    end
    object qryRoleListcreate_ip: TStringField
      DisplayLabel = #21019#24314#20154'IP'
      FieldName = 'create_ip'
      Size = 30
    end
    object qryRoleListremark: TStringField
      DisplayLabel = #27880#37322
      FieldName = 'remark'
      Size = 400
    end
    object qryRoleListsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
  end
  object dsRoleList: TUniDataSource
    DataSet = qryRoleList
    Left = 104
    Top = 96
  end
  object qrySetPrivilege: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_boss_role_privilege_vegaga')
    MasterSource = dsRoleList
    MasterFields = 'role_id'
    DetailFields = 'role_id'
    FetchRows = 1000
    CachedUpdates = True
    Left = 40
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'role_id'
      end>
    object qrySetPrivilegeid: TIntegerField
      FieldName = 'id'
    end
    object qrySetPrivilegerole_id: TFloatField
      FieldName = 'role_id'
      Required = True
    end
    object qrySetPrivilegepri_id: TFloatField
      FieldName = 'pri_id'
      Required = True
    end
    object qrySetPrivilegesys_status: TFloatField
      FieldName = 'sys_status'
    end
  end
  object qrySetRole: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_boss_user_role_vegaga')
    MasterSource = dsUserInfo
    MasterFields = 'user_id'
    DetailFields = 'user_id'
    CachedUpdates = True
    Left = 120
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'user_id'
      end>
    object qrySetRoleid: TIntegerField
      FieldName = 'id'
    end
    object qrySetRoleuser_id: TIntegerField
      FieldName = 'user_id'
      Required = True
    end
    object qrySetRolerole_id: TIntegerField
      FieldName = 'role_id'
      Required = True
    end
    object qrySetRolecreate_date: TDateTimeField
      FieldName = 'create_date'
    end
    object qrySetRolecreate_by: TFloatField
      FieldName = 'create_by'
    end
    object qrySetRolecreate_ip: TStringField
      FieldName = 'create_ip'
      Size = 30
    end
    object qrySetRolesys_status: TFloatField
      FieldName = 'sys_status'
    end
  end
  object qryRoleTree: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_boss_role_vegaga')
    FetchRows = 1000
    Left = 80
    Top = 160
    object qryRoleTreerole_id: TIntegerField
      FieldName = 'role_id'
    end
    object qryRoleTreename: TStringField
      FieldName = 'name'
      Required = True
      Size = 40
    end
    object qryRoleTreecreate_date: TDateTimeField
      FieldName = 'create_date'
    end
    object qryRoleTreecreate_by: TFloatField
      FieldName = 'create_by'
    end
    object qryRoleTreecreate_ip: TStringField
      FieldName = 'create_ip'
      Size = 30
    end
    object qryRoleTreeremark: TStringField
      FieldName = 'remark'
      Size = 400
    end
    object qryRoleTreesys_status: TFloatField
      FieldName = 'sys_status'
    end
  end
end
