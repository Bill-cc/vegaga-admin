object dmExpressManager: TdmExpressManager
  OldCreateOrder = False
  Left = 404
  Top = 227
  Height = 246
  Width = 342
  object qryTdmExpressList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_e_express_vegaga')
    FetchRows = 1000
    ReadOnly = True
    Left = 48
    Top = 24
    object qryTdmExpressListid: TLargeintField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryTdmExpressListexpress_no: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'express_no'
      Required = True
      Size = 40
    end
    object qryTdmExpressListexpress_name: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'express_name'
      Size = 60
    end
    object qryTdmExpressListexpress_tel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'express_tel'
      Size = 40
    end
    object qryTdmExpressListexpress_mobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'express_mobile'
      Size = 40
    end
    object qryTdmExpressListexpress_fax: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'express_fax'
      Size = 40
    end
    object qryTdmExpressListexpressex_mail: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'expressex_mail'
      Size = 100
    end
    object qryTdmExpressListexpress_addr: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'express_addr'
      Size = 400
    end
    object qryTdmExpressListexpress_post: TFloatField
      DisplayLabel = #37038#32534
      FieldName = 'express_post'
    end
    object qryTdmExpressListexpress_website: TStringField
      DisplayLabel = #32593#22336
      FieldName = 'express_website'
      Size = 100
    end
    object qryTdmExpressListexpress_msn: TStringField
      DisplayLabel = 'MSN'
      FieldName = 'express_msn'
      Size = 40
    end
    object qryTdmExpressListexpress_qq: TStringField
      DisplayLabel = 'QQ'
      FieldName = 'express_qq'
      Size = 40
    end
    object qryTdmExpressListexpress_create: TDateField
      DisplayLabel = #25104#31435#26085#26399
      FieldName = 'express_create'
    end
    object qryTdmExpressListexpress_info: TMemoField
      DisplayLabel = #31616#20171
      FieldName = 'express_info'
      BlobType = ftMemo
    end
    object qryTdmExpressListexpress_interface: TStringField
      DisplayLabel = #26159#21542#25903#25345#25509#21475
      FieldName = 'express_interface'
      FixedChar = True
      Size = 2
    end
    object qryTdmExpressListexpress_model: TStringField
      DisplayLabel = #38754#21333#27169#26495
      FieldName = 'express_model'
      Size = 100
    end
    object qryTdmExpressListcontract_linkmen: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154
      FieldName = 'contract_linkmen'
      Size = 60
    end
    object qryTdmExpressListcontract_tel: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154#30005#35805
      FieldName = 'contract_tel'
      Size = 40
    end
    object qryTdmExpressListcontract_mobile: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154#31227#21160#30005#35805
      FieldName = 'contract_mobile'
      Size = 40
    end
    object qryTdmExpressListcontract_email: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154#30005#23376#37038#20214
      FieldName = 'contract_email'
      Size = 100
    end
    object qryTdmExpressListcontract_fax: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154#20256#30495
      FieldName = 'contract_fax'
      Size = 40
    end
    object qryTdmExpressListcontract_msn: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154'MSN'
      FieldName = 'contract_msn'
      Size = 40
    end
    object qryTdmExpressListcontract_qq: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154'QQ'
      FieldName = 'contract_qq'
      Size = 40
    end
    object qryTdmExpressListbusiness_linkmen: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154
      FieldName = 'business_linkmen'
      Size = 60
    end
    object qryTdmExpressListbusiness_tel: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154#30005#35805
      FieldName = 'business_tel'
      Size = 40
    end
    object qryTdmExpressListbusiness_mobile: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154#31227#21160#30005#35805
      FieldName = 'business_mobile'
      Size = 40
    end
    object qryTdmExpressListbusiness_fax: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154#20256#30495
      FieldName = 'business_fax'
      Size = 100
    end
    object qryTdmExpressListbusiness_email: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154#30005#23376#37038#20214
      FieldName = 'business_email'
      Size = 100
    end
    object qryTdmExpressListbusiness_msn: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154'MSN'
      FieldName = 'business_msn'
      Size = 40
    end
    object qryTdmExpressListbusiness_qq: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154'QQ'
      FieldName = 'business_qq'
      Size = 40
    end
    object qryTdmExpressListaccounts_linkmen: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154
      FieldName = 'accounts_linkmen'
      Size = 60
    end
    object qryTdmExpressListaccounts_tel: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154#30005#35805
      FieldName = 'accounts_tel'
      Size = 40
    end
    object qryTdmExpressListaccounts_mobile: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154#31227#21160#30005#35805
      FieldName = 'accounts_mobile'
      Size = 40
    end
    object qryTdmExpressListaccounts_email: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154#30005#23376#37038#20214
      FieldName = 'accounts_email'
      Size = 100
    end
    object qryTdmExpressListaccounts_fax: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154#20256#30495
      FieldName = 'accounts_fax'
      Size = 40
    end
    object qryTdmExpressListaccounts_msn: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154'MSN'
      FieldName = 'accounts_msn'
      Size = 40
    end
    object qryTdmExpressListaccounts_qq: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154'QQ'
      FieldName = 'accounts_qq'
      Size = 40
    end
  end
  object dsTdmExpressList: TUniDataSource
    DataSet = qryTdmExpressList
    Left = 104
    Top = 24
  end
end
