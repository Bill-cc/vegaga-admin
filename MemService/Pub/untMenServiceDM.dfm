object dmMenService: TdmMenService
  OldCreateOrder = False
  Left = 358
  Top = 205
  Height = 372
  Width = 440
  object qryMenList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_m_member_vegaga')
    FetchRows = 1000
    Left = 40
    Top = 8
    object qryMenListm_id: TIntegerField
      DisplayLabel = #20250#21592#24207#21495
      FieldName = 'm_id'
    end
    object qryMenListemail: TStringField
      DisplayLabel = #30331#38470#21517
      FieldName = 'email'
      Required = True
      Size = 100
    end
    object qryMenListpassword: TStringField
      DisplayLabel = #23494#30721
      FieldName = 'password'
      Required = True
      Size = 100
    end
    object qryMenListnickname: TStringField
      DisplayLabel = #26165#31216
      FieldName = 'nickname'
      Required = True
      Size = 40
    end
    object qryMenListkeyString: TStringField
      DisplayLabel = #23494#38053
      FieldName = 'keyString'
      Required = True
      Size = 24
    end
    object qryMenListstatus: TFloatField
      DisplayLabel = #20250#21592#29366#24577
      FieldName = 'status'
      Required = True
    end
    object qryMenListlevel: TFloatField
      DisplayLabel = #20250#21592#31561#32423
      FieldName = 'level'
      Required = True
    end
    object qryMenListis_activated: TStringField
      DisplayLabel = #26159#21542#28608#27963
      FieldName = 'is_activated'
      Required = True
      FixedChar = True
      Size = 2
    end
    object qryMenListactivate_date: TDateField
      DisplayLabel = #28608#27963#26102#38388
      FieldName = 'activate_date'
    end
    object qryMenListpassword_q: TStringField
      DisplayLabel = #23494#30721#38382#39064
      FieldName = 'password_q'
      Size = 200
    end
    object qryMenListpassword_a: TStringField
      DisplayLabel = #23494#30721#31572#26696
      FieldName = 'password_a'
      Size = 200
    end
    object qryMenListreg_date: TDateField
      DisplayLabel = #27880#20876#26085#26399
      FieldName = 'reg_date'
    end
    object qryMenListreg_ip: TStringField
      DisplayLabel = #27880#20876'IP'
      FieldName = 'reg_ip'
      Size = 30
    end
    object qryMenListreg_from: TStringField
      DisplayLabel = #27880#20876#26469#28304
      FieldName = 'reg_from'
      Size = 200
    end
    object qryMenListrec_by: TFloatField
      DisplayLabel = #25512#33616#20154
      FieldName = 'rec_by'
    end
    object qryMenListfreeze_date: TDateField
      DisplayLabel = #20923#32467#26085#26399
      FieldName = 'freeze_date'
    end
    object qryMenListfreeze_by: TStringField
      DisplayLabel = #20923#32467#20154
      FieldName = 'freeze_by'
      Size = 40
    end
    object qryMenListunfreeze_date: TDateField
      DisplayLabel = #35299#20923#26085#26399
      FieldName = 'unfreeze_date'
    end
    object qryMenListunfreeze_by: TStringField
      DisplayLabel = #35299#20923#20154
      FieldName = 'unfreeze_by'
      Size = 40
    end
    object qryMenListlogin_amount: TFloatField
      DisplayLabel = #30331#38470#27425#25968
      FieldName = 'login_amount'
    end
    object qryMenListlogin_date: TDateField
      DisplayLabel = #30331#24405#26102#38388
      FieldName = 'login_date'
    end
    object qryMenListsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
  end
  object dsMenList: TUniDataSource
    DataSet = qryMenList
    Left = 80
    Top = 8
  end
  object qryOrderInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_sorder_vegaga order by so_id desc')
    ReadOnly = True
    Left = 40
    Top = 64
    object qryOrderInfoso_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #24207#21495
      FieldName = 'so_id'
    end
    object qryOrderInfoso_sn: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_sn'
      Required = True
      Size = 40
    end
    object qryOrderInfoso_source: TStringField
      DisplayLabel = #35746#21333#26469#28304
      FieldName = 'so_source'
      Size = 200
    end
    object qryOrderInfosource_no: TStringField
      DisplayLabel = #26469#28304#21333#21495
      FieldName = 'source_no'
      Size = 100
    end
    object qryOrderInfom_id: TFloatField
      DisplayLabel = #20250#21592'ID'
      FieldName = 'm_id'
    end
    object qryOrderInfotype: TFloatField
      DisplayLabel = #31867#22411
      FieldName = 'type'
    end
    object qryOrderInfostatus: TFloatField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object qryOrderInfopayment_id: TFloatField
      DisplayLabel = #25903#20184'ID'
      FieldName = 'payment_id'
    end
    object qryOrderInfosend_type: TStringField
      DisplayLabel = #36865#36135#26041#24335
      FieldName = 'send_type'
      Size = 200
    end
    object qryOrderInfopayment_type: TFloatField
      DisplayLabel = #25903#20184#31867#22411
      FieldName = 'payment_type'
    end
    object qryOrderInfopayment_status: TFloatField
      DisplayLabel = #25903#20184#29366#24577
      FieldName = 'payment_status'
    end
    object qryOrderInfosub_date: TDateField
      DisplayLabel = #25552#20132#26102#38388
      FieldName = 'sub_date'
    end
    object qryOrderInfoconfirm_date: TDateField
      DisplayLabel = #30830#35748#26102#38388
      FieldName = 'confirm_date'
    end
    object qryOrderInfoconfirm_by: TFloatField
      DisplayLabel = #30830#35748#32773
      FieldName = 'confirm_by'
    end
    object qryOrderInfoinvoice_id: TFloatField
      DisplayLabel = #21457#31080'ID'
      FieldName = 'invoice_id'
    end
    object qryOrderInfosub_ip: TStringField
      DisplayLabel = #35746#21333#25552#20132'IP'
      FieldName = 'sub_ip'
      Size = 30
    end
    object qryOrderInfoprovince: TFloatField
      DisplayLabel = #30465
      FieldName = 'province'
    end
    object qryOrderInfocity: TFloatField
      DisplayLabel = #24066
      FieldName = 'city'
    end
    object qryOrderInfodistrict: TFloatField
      DisplayLabel = #21306
      FieldName = 'district'
    end
    object qryOrderInfoaddr: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'addr'
      Size = 200
    end
    object qryOrderInfoso_remark: TStringField
      DisplayLabel = #35746#21333#22791#27880
      FieldName = 'so_remark'
      Size = 400
    end
    object qryOrderInfopost_code: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'post_code'
    end
    object qryOrderInforeceiver: TStringField
      DisplayLabel = #25910#20214#20154
      FieldName = 'receiver'
    end
    object qryOrderInfotel: TStringField
      DisplayLabel = #22266#23450#30005#35805
      FieldName = 'tel'
      Size = 30
    end
    object qryOrderInfomobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'mobile'
      Size = 30
    end
    object qryOrderInfoRECEIVE_EMAIL: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'RECEIVE_EMAIL'
      Size = 100
    end
    object qryOrderInfocost_price: TFloatField
      DisplayLabel = #25104#26412#24635#20215
      FieldName = 'cost_price'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInfotax: TFloatField
      DisplayLabel = #31246#24635#20215
      FieldName = 'tax'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInfop_amount: TFloatField
      DisplayLabel = #38144#21806#24635#20215
      FieldName = 'p_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInfop_settle_amount: TFloatField
      DisplayLabel = #32467#31639#24635#39069
      FieldName = 'p_settle_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInfoship_amount: TFloatField
      DisplayLabel = #36816#36153
      FieldName = 'ship_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInfoship_settle_amount: TFloatField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'ship_settle_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInfoamount: TFloatField
      DisplayLabel = #35746#21333#37329#39069
      FieldName = 'amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInfopreferential_price: TFloatField
      DisplayLabel = #20248#24800#37329#39069
      FieldName = 'preferential_price'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInfosettle_amount: TFloatField
      DisplayLabel = #32467#31639#37329#39069
      FieldName = 'settle_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInforeturn_amount: TFloatField
      DisplayLabel = #36864#36135#37329#39069
      FieldName = 'return_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInfofinal_amount: TFloatField
      DisplayLabel = #26368#32456#37329#39069
      FieldName = 'final_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOrderInfoship_order_number: TStringField
      DisplayLabel = #21457#36135#21333#21495
      FieldName = 'ship_order_number'
      Size = 100
    end
    object qryOrderInfoscan_status: TFloatField
      DisplayLabel = #25195#25551#29366#24577
      FieldName = 'scan_status'
    end
    object qryOrderInfoship_remark: TStringField
      DisplayLabel = #21457#36135#21333#22791#27880
      FieldName = 'ship_remark'
      Size = 2000
    end
    object qryOrderInfosys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryOrderInfosend_date: TStringField
      FieldName = 'send_date'
      Size = 200
    end
    object qryOrderInfoexpress_id: TIntegerField
      FieldName = 'express_id'
    end
    object qryOrderInfoInv_Tiitle: TStringField
      FieldKind = fkLookup
      FieldName = 'Inv_Tiitle'
      LookupDataSet = qryInvoiceInfo
      LookupKeyFields = 'invoice_id'
      LookupResultField = 'title'
      KeyFields = 'invoice_id'
      Size = 50
      Lookup = True
    end
    object qryOrderInfom_email: TStringField
      DisplayLabel = #20250#21592#30331#24405#21517
      FieldKind = fkLookup
      FieldName = 'm_email'
      LookupDataSet = qryMemInfo
      LookupKeyFields = 'm_id'
      LookupResultField = 'email'
      KeyFields = 'm_id'
      Size = 50
      Lookup = True
    end
    object qryOrderInfom_name: TStringField
      DisplayLabel = #20250#21592#22995#21517
      FieldKind = fkLookup
      FieldName = 'm_name'
      LookupDataSet = qryMemInfo
      LookupKeyFields = 'm_id'
      LookupResultField = 'name'
      KeyFields = 'm_id'
      Size = 50
      Lookup = True
    end
    object qryOrderInfom_mobile: TStringField
      DisplayLabel = #20250#21592#30005#35805
      FieldKind = fkLookup
      FieldName = 'm_mobile'
      LookupDataSet = qryMemInfo
      LookupKeyFields = 'm_id'
      LookupResultField = 'mobile'
      KeyFields = 'm_id'
      Size = 30
      Lookup = True
    end
    object qryOrderInfocoupon_price: TFloatField
      DisplayLabel = #31036#21697#21345#37329#39069
      FieldName = 'coupon_price'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
  end
  object dsOrderInfo: TUniDataSource
    DataSet = qryOrderInfo
    Left = 80
    Top = 64
  end
  object qryOPList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_sorder_item_vegaga')
    MasterSource = dsOrderInfo
    MasterFields = 'so_sn'
    DetailFields = 'so_no'
    ReadOnly = True
    CachedUpdates = True
    Options.DetailDelay = 1
    OnUpdateRecord = qryOPListUpdateRecord
    UpdateObject = udsOPList
    BeforePost = qryOPListBeforePost
    Left = 40
    Top = 104
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'so_sn'
      end>
    object qryOPListso_item_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #35746#21333#39033'ID'
      FieldName = 'so_item_id'
    end
    object qryOPListso_id: TFloatField
      DisplayLabel = #35746#21333'ID'
      FieldName = 'so_id'
    end
    object qryOPListso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qryOPListsku_id: TFloatField
      DisplayLabel = 'SKUID'
      FieldName = 'sku_id'
    end
    object qryOPListp_id: TFloatField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qryOPListp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qryOPListp_sn: TStringField
      DisplayLabel = #21830#21697#32534#21495
      FieldName = 'p_sn'
      Size = 40
    end
    object qryOPListp_ean: TStringField
      DisplayLabel = #21830#21697#26465#24418#30721
      FieldName = 'p_ean'
      Size = 40
    end
    object qryOPListp_number: TFloatField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'p_number'
    end
    object qryOPListp_cost_price: TFloatField
      DisplayLabel = #21830#21697#25104#26412#20215
      FieldName = 'p_cost_price'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOPListtax: TFloatField
      DisplayLabel = #21830#21697#31246
      FieldName = 'tax'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOPListsale_price: TFloatField
      DisplayLabel = #38144#21806#21333#20215
      FieldName = 'sale_price'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOPListsale_amount: TFloatField
      DisplayLabel = #38144#21806#24635#20215
      FieldName = 'sale_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryOPListp_weight: TFloatField
      DisplayLabel = #24635#37325#37327
      FieldName = 'p_weight'
    end
    object qryOPListsource: TStringField
      DisplayLabel = #35746#36141#26469#28304
      FieldName = 'source'
      Size = 40
    end
    object qryOPListreal_out_number: TFloatField
      DisplayLabel = #23454#38469#20986#24211#25968#37327
      FieldName = 'real_out_number'
    end
    object qryOPListsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryOPListpdt_name: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'pdt_name'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'name'
      KeyFields = 'p_id'
      ProviderFlags = [pfInWhere]
      Size = 100
      Lookup = True
    end
  end
  object dsOPList: TUniDataSource
    DataSet = qryOPList
    Left = 80
    Top = 104
  end
  object qryProvince: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from Sys_Area where ADDRESSLEVEL=:level')
    ReadOnly = True
    Left = 200
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'level'
        ParamType = ptInput
        Value = '1'
      end>
    object qryProvinceID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qryProvincePOSTCODE: TStringField
      FieldName = 'POSTCODE'
      Required = True
      Size = 40
    end
    object qryProvinceSTATESID: TStringField
      FieldName = 'STATESID'
      Required = True
      Size = 40
    end
    object qryProvinceCITYID: TStringField
      FieldName = 'CITYID'
      Required = True
      Size = 40
    end
    object qryProvinceADDRESSNAME: TStringField
      FieldName = 'ADDRESSNAME'
      Size = 100
    end
    object qryProvinceADDRESSLEVEL: TStringField
      FieldName = 'ADDRESSLEVEL'
      Size = 100
    end
  end
  object dsProvince: TUniDataSource
    DataSet = qryProvince
    Left = 240
    Top = 8
  end
  object qryCity: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from Sys_Area where ADDRESSLEVEL=:level')
    MasterSource = dsProvince
    MasterFields = 'STATESID'
    DetailFields = 'STATESID'
    ReadOnly = True
    Left = 200
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'level'
        ParamType = ptInput
        Value = '2'
      end
      item
        DataType = ftUnknown
        Name = 'STATESID'
      end>
    object qryCityID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qryCityPOSTCODE: TStringField
      FieldName = 'POSTCODE'
      Required = True
      Size = 40
    end
    object qryCitySTATESID: TStringField
      FieldName = 'STATESID'
      Required = True
      Size = 40
    end
    object qryCityCITYID: TStringField
      FieldName = 'CITYID'
      Required = True
      Size = 40
    end
    object qryCityADDRESSNAME: TStringField
      FieldName = 'ADDRESSNAME'
      Size = 100
    end
    object qryCityADDRESSLEVEL: TStringField
      FieldName = 'ADDRESSLEVEL'
      Size = 100
    end
  end
  object dsCity: TUniDataSource
    DataSet = qryCity
    Left = 240
    Top = 48
  end
  object qryDistrict: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from Sys_Area where ADDRESSLEVEL=:level')
    MasterSource = dsCity
    MasterFields = 'CITYID'
    DetailFields = 'CITYID'
    ReadOnly = True
    Left = 200
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'level'
        ParamType = ptInput
        Value = '3'
      end
      item
        DataType = ftUnknown
        Name = 'CITYID'
      end>
  end
  object dsDistrict: TUniDataSource
    DataSet = qryDistrict
    Left = 240
    Top = 88
  end
  object qryProductInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_product_vegaga')
    ReadOnly = True
    Left = 40
    Top = 160
    object qryProductInfop_id: TIntegerField
      FieldName = 'p_id'
    end
    object qryProductInfosku: TStringField
      FieldName = 'sku'
      Required = True
      Size = 40
    end
    object qryProductInfosn: TStringField
      FieldName = 'sn'
      Required = True
      Size = 40
    end
    object qryProductInfoean: TStringField
      FieldName = 'ean'
      Size = 40
    end
    object qryProductInfotitle: TStringField
      FieldName = 'title'
      Required = True
      Size = 200
    end
    object qryProductInfoname: TStringField
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object qryProductInfochineseN: TStringField
      FieldName = 'chineseN'
      Size = 200
    end
    object qryProductInfop_price: TFloatField
      FieldName = 'p_price'
    end
    object qryProductInfoenglishN: TStringField
      FieldName = 'englishN'
      Size = 200
    end
    object qryProductInfoshortname: TStringField
      FieldName = 'shortname'
    end
    object qryProductInfopic_path: TStringField
      FieldName = 'pic_path'
      Size = 200
    end
    object qryProductInfotype: TFloatField
      FieldName = 'type'
    end
    object qryProductInfostatus: TFloatField
      FieldName = 'status'
    end
    object qryProductInfobrief: TStringField
      FieldName = 'brief'
      Size = 2000
    end
    object qryProductInfodescript: TMemoField
      FieldName = 'descript'
      BlobType = ftMemo
    end
    object qryProductInfobrand_id: TFloatField
      FieldName = 'brand_id'
    end
    object qryProductInfobcat_id: TStringField
      FieldName = 'bcat_id'
      Size = 400
    end
    object qryProductInfoscat_id: TStringField
      FieldName = 'scat_id'
      Size = 400
    end
    object qryProductInfokeyword: TStringField
      FieldName = 'keyword'
      Size = 400
    end
    object qryProductInfotag: TStringField
      FieldName = 'tag'
      Size = 400
    end
    object qryProductInfoscore: TFloatField
      FieldName = 'score'
    end
    object qryProductInfospec: TStringField
      FieldName = 'spec'
      Size = 200
    end
    object qryProductInfoorigin: TStringField
      FieldName = 'origin'
      Size = 40
    end
    object qryProductInfoweight: TStringField
      FieldName = 'weight'
      Size = 40
    end
    object qryProductInfofactory: TStringField
      FieldName = 'factory'
      Size = 100
    end
    object qryProductInfosale_unit: TStringField
      FieldName = 'sale_unit'
      Size = 100
    end
    object qryProductInfocreate_by: TStringField
      FieldName = 'create_by'
      Size = 100
    end
    object qryProductInfocreate_date: TDateField
      FieldName = 'create_date'
    end
    object qryProductInfolast_update_by: TStringField
      FieldName = 'last_update_by'
      Size = 100
    end
    object qryProductInfolast_update_date: TDateField
      FieldName = 'last_update_date'
    end
    object qryProductInfosys_status: TFloatField
      FieldName = 'sys_status'
    end
  end
  object dsProductInfo: TUniDataSource
    DataSet = qryProductInfo
    Left = 80
    Top = 160
  end
  object udsOPList: TUniUpdateSQL
    Left = 112
    Top = 104
  end
  object qryROrderInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_return_vegaga')
    ReadOnly = True
    Left = 328
    Top = 8
    object qryROrderInfoid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryROrderInforeturn_no: TStringField
      DisplayLabel = #36864#36135#21333#32534#21495
      FieldName = 'return_no'
      Size = 40
    end
    object qryROrderInfoso_id: TIntegerField
      DisplayLabel = #35746#21333'ID'
      FieldName = 'so_id'
    end
    object qryROrderInfoso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qryROrderInfoso_source: TStringField
      DisplayLabel = #35746#21333#26469#28304
      FieldName = 'so_source'
      Size = 100
    end
    object qryROrderInfoso_source_no: TStringField
      DisplayLabel = #26469#28304#32534#21495
      FieldName = 'so_source_no'
      Size = 40
    end
    object qryROrderInfomem_id: TIntegerField
      DisplayLabel = #20250#21592'ID'
      FieldName = 'mem_id'
    end
    object qryROrderInfostate: TIntegerField
      DisplayLabel = #36864#36135#21333#29366#24577
      FieldName = 'state'
    end
    object qryROrderInfosubmit_date: TDateTimeField
      DisplayLabel = #25552#20132#26085#26399
      FieldName = 'submit_date'
    end
    object qryROrderInfoconfirm_date: TDateTimeField
      DisplayLabel = #30830#35748#26085#26399
      FieldName = 'confirm_date'
    end
    object qryROrderInfoconfirm_by: TStringField
      DisplayLabel = #30830#35748#20154
      FieldName = 'confirm_by'
      Size = 100
    end
    object qryROrderInfoso_memo: TStringField
      DisplayLabel = #35746#21333#22791#27880
      FieldName = 'so_memo'
      Size = 400
    end
    object qryROrderInforeturn_men: TStringField
      DisplayLabel = #36864#36135#20154
      FieldName = 'return_men'
      Size = 100
    end
    object qryROrderInforeturn_tel: TStringField
      DisplayLabel = #22266#23450#30005#35805
      FieldName = 'return_tel'
      Size = 40
    end
    object qryROrderInforeturn_mobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'return_mobile'
      Size = 40
    end
    object qryROrderInforeturn_email: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'return_email'
      Size = 100
    end
    object qryROrderInforeturn_amount: TFloatField
      DisplayLabel = #36864#36135#21830#21697#24635#20215
      FieldName = 'return_amount'
    end
    object qryROrderInforeturn_price: TFloatField
      DisplayLabel = #36864#36135#36816#36153
      FieldName = 'return_price'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryROrderInforeturn_time: TDateTimeField
      DisplayLabel = #36864#36135#26102#38388
      FieldName = 'return_time'
    end
    object qryROrderInforeturn_settleup: TFloatField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'return_settleup'
    end
    object qryROrderInfosys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
  end
  object dsROrderInfo: TUniDataSource
    DataSet = qryROrderInfo
    Left = 368
    Top = 8
  end
  object qryROPList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_return_item_vegaga')
    MasterSource = dsROrderInfo
    MasterFields = 'return_no'
    DetailFields = 'rso_no'
    ReadOnly = True
    CachedUpdates = True
    Options.DetailDelay = 1
    Left = 328
    Top = 48
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'return_no'
      end>
    object qryROPListid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryROPListrso_id: TIntegerField
      DisplayLabel = #36864#36135#21333'ID'
      FieldName = 'rso_id'
    end
    object qryROPListrso_no: TStringField
      DisplayLabel = #36864#36135#21333#32534#21495
      FieldName = 'rso_no'
      Size = 40
    end
    object qryROPListp_id: TIntegerField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qryROPListp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qryROPListp_num: TIntegerField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'p_num'
    end
    object qryROPListp_price: TFloatField
      DisplayLabel = #38144#21806#21333#20215
      FieldName = 'p_price'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryROPListp_amount: TFloatField
      DisplayLabel = #38144#21806#24635#20215
      FieldName = 'p_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qryROPListreal_input_num: TIntegerField
      DisplayLabel = #23454#38469#20837#24211#25968#37327
      FieldName = 'real_input_num'
    end
    object qryROPListstate: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'state'
    end
    object qryROPListsys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
    object qryROPListp_name: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'p_name'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'name'
      KeyFields = 'p_id'
      Size = 100
      Lookup = True
    end
  end
  object dsROPList: TUniDataSource
    DataSet = qryROPList
    Left = 368
    Top = 48
  end
  object qrySBOrderList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_return_vegaga')
    ReadOnly = True
    Left = 328
    Top = 104
    object qrySBOrderListid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qrySBOrderListreturn_no: TStringField
      DisplayLabel = #36864#36135#21333#32534#21495
      FieldName = 'return_no'
      Size = 40
    end
    object qrySBOrderListso_id: TIntegerField
      DisplayLabel = #35746#21333#24207#21495
      FieldName = 'so_id'
    end
    object qrySBOrderListso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qrySBOrderListso_source: TStringField
      DisplayLabel = #35746#21333#26469#28304
      FieldName = 'so_source'
      Size = 100
    end
    object qrySBOrderListso_source_no: TStringField
      DisplayLabel = #26469#28304#21333#21495
      FieldName = 'so_source_no'
      Size = 40
    end
    object qrySBOrderListmem_id: TIntegerField
      DisplayLabel = #20250#21592'ID'
      FieldName = 'mem_id'
    end
    object qrySBOrderListstate: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'state'
    end
    object qrySBOrderListsubmit_date: TDateTimeField
      DisplayLabel = #25552#20132#26085#26399
      FieldName = 'submit_date'
    end
    object qrySBOrderListconfirm_date: TDateTimeField
      DisplayLabel = #30830#35748#26085#26399
      FieldName = 'confirm_date'
    end
    object qrySBOrderListconfirm_by: TStringField
      DisplayLabel = #30830#35748#20154
      FieldName = 'confirm_by'
      Size = 100
    end
    object qrySBOrderListso_memo: TStringField
      DisplayLabel = #35746#21333#22791#27880
      FieldName = 'so_memo'
      Size = 400
    end
    object qrySBOrderListreturn_men: TStringField
      DisplayLabel = #36864#36135#20154
      FieldName = 'return_men'
      Size = 100
    end
    object qrySBOrderListreturn_tel: TStringField
      DisplayLabel = #22266#23450#30005#35805
      FieldName = 'return_tel'
      Size = 40
    end
    object qrySBOrderListreturn_mobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'return_mobile'
      Size = 40
    end
    object qrySBOrderListreturn_email: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'return_email'
      Size = 100
    end
    object qrySBOrderListreturn_amount: TFloatField
      DisplayLabel = #21830#21697#24635#20215
      FieldName = 'return_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qrySBOrderListreturn_price: TFloatField
      DisplayLabel = #36864#36135#36816#36153
      FieldName = 'return_price'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qrySBOrderListreturn_time: TDateTimeField
      DisplayLabel = #36864#36135#26102#38388
      FieldName = 'return_time'
    end
    object qrySBOrderListreturn_settleup: TFloatField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'return_settleup'
    end
    object qrySBOrderListsys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
  end
  object dsSBOrderList: TUniDataSource
    DataSet = qrySBOrderList
    Left = 368
    Top = 104
  end
  object qrySBOPList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_return_item_vegaga')
    MasterSource = dsSBOrderList
    MasterFields = 'return_no'
    DetailFields = 'rso_no'
    ReadOnly = True
    Left = 328
    Top = 144
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'return_no'
      end>
    object qrySBOPListid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qrySBOPListrso_id: TIntegerField
      DisplayLabel = #36864#36135#21333'ID'
      FieldName = 'rso_id'
    end
    object qrySBOPListrso_no: TStringField
      DisplayLabel = #36864#36135#21333#32534#21495
      FieldName = 'rso_no'
      Size = 40
    end
    object qrySBOPListp_id: TIntegerField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qrySBOPListp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qrySBOPListp_num: TIntegerField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'p_num'
    end
    object qrySBOPListp_price: TFloatField
      DisplayLabel = #21830#21697#20215#26684
      FieldName = 'p_price'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qrySBOPListp_amount: TFloatField
      DisplayLabel = #21830#21697#24635#20215
      FieldName = 'p_amount'
      OnGetText = qryOPListsale_priceGetText
      OnSetText = qryOPListsale_priceSetText
    end
    object qrySBOPListreal_input_num: TIntegerField
      DisplayLabel = #23454#38469#20837#24211#25968#37327
      FieldName = 'real_input_num'
    end
    object qrySBOPListstate: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'state'
    end
    object qrySBOPListsys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
    object qrySBOPListp_name: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'p_name'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'name'
      KeyFields = 'p_id'
      Size = 100
      Lookup = True
    end
  end
  object dsSBOPList: TUniDataSource
    DataSet = qrySBOPList
    Left = 368
    Top = 144
  end
  object qryInvoiceInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_invoice_vegaga')
    ReadOnly = True
    Left = 200
    Top = 144
    object qryInvoiceInfoinvoice_id: TIntegerField
      FieldName = 'invoice_id'
    end
    object qryInvoiceInfoinvoice_code: TStringField
      FieldName = 'invoice_code'
      Size = 100
    end
    object qryInvoiceInfoso_id: TFloatField
      FieldName = 'so_id'
    end
    object qryInvoiceInfotitle: TStringField
      FieldName = 'title'
      Size = 200
    end
    object qryInvoiceInfocontent: TStringField
      FieldName = 'content'
      Size = 200
    end
    object qryInvoiceInfocreate_date: TDateField
      FieldName = 'create_date'
    end
    object qryInvoiceInfocreate_by: TFloatField
      FieldName = 'create_by'
    end
    object qryInvoiceInfoinvoice_date: TDateField
      FieldName = 'invoice_date'
    end
    object qryInvoiceInfosys_status: TFloatField
      FieldName = 'sys_status'
    end
  end
  object dsInvoiceInfo: TUniDataSource
    DataSet = qryInvoiceInfo
    Left = 240
    Top = 144
  end
  object qryMemInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tmmv.m_id,tmmv.email,tmmev.name,tmmev.tel,tmmev.mobile,tm' +
        'mev.addr from t_m_member_vegaga tmmv'
      'left join t_m_member_ext_vegaga tmmev on tmmv.m_id=tmmev.m_id')
    ReadOnly = True
    Left = 112
    Top = 64
    object qryMemInfom_id: TIntegerField
      FieldName = 'm_id'
    end
    object qryMemInfoemail: TStringField
      FieldName = 'email'
      Required = True
      Size = 100
    end
    object qryMemInfoname: TStringField
      FieldName = 'name'
      ReadOnly = True
      Size = 40
    end
    object qryMemInfotel: TStringField
      FieldName = 'tel'
      ReadOnly = True
      Size = 26
    end
    object qryMemInfomobile: TStringField
      FieldName = 'mobile'
      ReadOnly = True
      Size = 24
    end
    object qryMemInfoaddr: TStringField
      FieldName = 'addr'
      ReadOnly = True
      Size = 200
    end
  end
  object qryCSoRList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_c_so_relation_vegaga where status=1')
    MasterSource = dsOrderInfo
    MasterFields = 'so_sn'
    DetailFields = 'so_no'
    ReadOnly = True
    Left = 200
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'so_sn'
      end>
    object qryCSoRListcsr_id: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'csr_id'
    end
    object qryCSoRListso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qryCSoRListc_num: TStringField
      DisplayLabel = #20248#24800#21048#21345#21495
      FieldName = 'c_num'
    end
    object qryCSoRListso_price: TFloatField
      DisplayLabel = #35746#21333#37329#39069
      FieldName = 'so_price'
    end
    object qryCSoRListpreferential_price: TFloatField
      DisplayLabel = #20248#24800#37329#39069
      FieldName = 'preferential_price'
    end
    object qryCSoRListfinal_price: TFloatField
      DisplayLabel = #26368#32456#37329#39069
      FieldName = 'final_price'
    end
    object qryCSoRListstatus: TSmallintField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
  end
  object dsCSoRList: TUniDataSource
    DataSet = qryCSoRList
    Left = 240
    Top = 208
  end
  object qrySelectMem: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tmmv.m_id,tmmv.email,tmmv.nickname,tmmv.level,tmmv.status' +
        ',tmmv.reg_date,tmmv.reg_from,tmmv.rec_by,tmmev.name,tmmev.tel,tm' +
        'mev.mobile,tmmev.addr,tmmev.profile'
      'from t_m_member_vegaga tmmv'
      
        'left outer join t_m_member_ext_vegaga tmmev on tmmv.m_id=tmmev.m' +
        '_id')
    ReadOnly = True
    Left = 40
    Top = 208
    object qrySelectMemm_id: TIntegerField
      DisplayLabel = #20250#21592#24207#21495
      FieldName = 'm_id'
    end
    object qrySelectMememail: TStringField
      DisplayLabel = #30331#38470#21517
      FieldName = 'email'
      Required = True
      Size = 100
    end
    object qrySelectMemnickname: TStringField
      DisplayLabel = #26165#31216
      FieldName = 'nickname'
      Required = True
      Size = 100
    end
    object qrySelectMemlevel: TFloatField
      DisplayLabel = #31561#32423
      FieldName = 'level'
      Required = True
    end
    object qrySelectMemstatus: TFloatField
      DisplayLabel = #29366#24577
      FieldName = 'status'
      Required = True
    end
    object qrySelectMemreg_date: TDateField
      DisplayLabel = #27880#20876#26102#38388
      FieldName = 'reg_date'
    end
    object qrySelectMemreg_from: TStringField
      DisplayLabel = #27880#20876#26469#28304
      FieldName = 'reg_from'
      Size = 200
    end
    object qrySelectMemrec_by: TFloatField
      DisplayLabel = #25512#33616#20154
      FieldName = 'rec_by'
    end
    object qrySelectMemname: TStringField
      DisplayLabel = #30495#23454#22995#21517
      FieldName = 'name'
      ReadOnly = True
      Size = 40
    end
    object qrySelectMemtel: TStringField
      DisplayLabel = #22266#23450#30005#35805
      FieldName = 'tel'
      ReadOnly = True
      Size = 40
    end
    object qrySelectMemmobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'mobile'
      ReadOnly = True
      Size = 24
    end
    object qrySelectMemaddr: TStringField
      DisplayLabel = #23478#24237#20303#22336
      FieldName = 'addr'
      ReadOnly = True
      Size = 200
    end
    object qrySelectMemprofile: TMemoField
      DisplayLabel = #20010#20154#31616#20171
      FieldName = 'profile'
      ReadOnly = True
      BlobType = ftMemo
    end
  end
  object dsSelectMem: TUniDataSource
    DataSet = qrySelectMem
    Left = 80
    Top = 208
  end
  object qryReviewList: TUniQuery
    SQLDelete.Strings = (
      'DELETE FROM t_p_review_vegaga'
      'WHERE'
      '  review_id = :Old_review_id')
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tprv.review_id,tprv.score,tprv.content,tprv.so_id,tprv.cr' +
        'eate_date,tprv.create_ip,tprv.status,tprv.sys_status,tppv.name a' +
        's pname,tppv.sku,tmmv.email'
      'from t_p_review_vegaga tprv'
      'left outer join t_p_product_vegaga tppv on tprv.p_id=tppv.p_id'
      'left outer join t_m_member_vegaga tmmv on tprv.m_id=tmmv.m_id')
    Left = 328
    Top = 208
    object qryReviewListreview_id: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'review_id'
    end
    object qryReviewListscore: TFloatField
      DisplayLabel = #35780#20998
      FieldName = 'score'
    end
    object qryReviewListcontent: TStringField
      DisplayLabel = #35780#35770#20869#23481
      FieldName = 'content'
      Size = 2000
    end
    object qryReviewListso_id: TFloatField
      DisplayLabel = #35746#21333'ID'
      FieldName = 'so_id'
    end
    object qryReviewListcreate_date: TDateField
      DisplayLabel = #35780#35770#26085#26399
      FieldName = 'create_date'
    end
    object qryReviewListcreate_ip: TStringField
      DisplayLabel = #35780#35770'IP'
      FieldName = 'create_ip'
      Size = 30
    end
    object qryReviewListstatus: TFloatField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object qryReviewListsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryReviewListpname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'pname'
      ReadOnly = True
      Size = 200
    end
    object qryReviewListsku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'sku'
      ReadOnly = True
      Size = 40
    end
    object qryReviewListemail: TStringField
      DisplayLabel = #20250#21592#30331#38470#21517
      FieldName = 'email'
      ReadOnly = True
      Size = 100
    end
  end
  object dsReviewList: TUniDataSource
    DataSet = qryReviewList
    Left = 368
    Top = 208
  end
  object qry1: TUniQuery
    Connection = frmCommonDm.Connection
    Left = 128
    Top = 160
  end
  object qryPrdOrder: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select tssiv.*,tssv.status'
      'from t_so_sorder_item_vegaga tssiv'
      'left join t_so_sorder_vegaga tssv on tssiv.so_id=tssv.so_id'
      'where tssiv.p_sku=:psku')
    ReadOnly = True
    Left = 40
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'psku'
        ParamType = ptInput
      end>
    object qryPrdOrderso_item_id: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'so_item_id'
    end
    object qryPrdOrderso_id: TFloatField
      DisplayLabel = #35746#21333'ID'
      FieldName = 'so_id'
    end
    object qryPrdOrderso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qryPrdOrdersku_id: TFloatField
      DisplayLabel = 'SKUID'
      FieldName = 'sku_id'
    end
    object qryPrdOrderp_id: TFloatField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qryPrdOrderp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qryPrdOrderp_sn: TStringField
      DisplayLabel = #21830#21697#32534#21495
      FieldName = 'p_sn'
      Size = 40
    end
    object qryPrdOrderp_ean: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldName = 'p_ean'
      Size = 40
    end
    object qryPrdOrderp_number: TFloatField
      DisplayLabel = #36141#20080#25968#37327
      FieldName = 'p_number'
    end
    object qryPrdOrderp_cost_price: TFloatField
      DisplayLabel = #21830#21697#25104#26412
      FieldName = 'p_cost_price'
    end
    object qryPrdOrdertax: TFloatField
      DisplayLabel = #21830#21697#31246
      FieldName = 'tax'
    end
    object qryPrdOrdersale_price: TFloatField
      DisplayLabel = #21830#21697#21806#20215
      FieldName = 'sale_price'
    end
    object qryPrdOrdersale_amount: TFloatField
      DisplayLabel = #38144#21806#24635#20215
      FieldName = 'sale_amount'
    end
    object qryPrdOrderp_weight: TFloatField
      DisplayLabel = #21830#21697#37325#37327
      FieldName = 'p_weight'
    end
    object qryPrdOrdersource: TStringField
      DisplayLabel = #26469#28304
      FieldName = 'source'
      Size = 40
    end
    object qryPrdOrderreal_out_number: TFloatField
      DisplayLabel = #23454#38469#20986#24211#25968#37327
      FieldName = 'real_out_number'
    end
    object qryPrdOrdersys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryPrdOrderstatus: TFloatField
      DisplayLabel = #35746#21333#29366#24577
      FieldName = 'status'
      ReadOnly = True
    end
  end
  object dsPrdOrder: TUniDataSource
    DataSet = qryPrdOrder
    Left = 80
    Top = 272
  end
  object qryPrdDepot: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_sku_vegaga where sn=:psku')
    Left = 200
    Top = 272
    ParamData = <
      item
        DataType = ftString
        Name = 'psku'
        ParamType = ptInput
      end>
    object qryPrdDepotsku_id: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'sku_id'
    end
    object qryPrdDepotname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'name'
      Size = 200
    end
    object qryPrdDepotsn: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'sn'
      Size = 40
    end
    object qryPrdDepotp_id: TFloatField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qryPrdDepotproperties: TStringField
      DisplayLabel = #23646#24615
      FieldName = 'properties'
      Size = 2000
    end
    object qryPrdDepots_id: TFloatField
      DisplayLabel = #35746#21333'ID'
      FieldName = 's_id'
    end
    object qryPrdDepotmarket_price: TFloatField
      DisplayLabel = #24066#22330#20215
      FieldName = 'market_price'
    end
    object qryPrdDepotsale_price: TFloatField
      DisplayLabel = #21806#20215
      FieldName = 'sale_price'
    end
    object qryPrdDepotsale_limit_price: TFloatField
      DisplayLabel = #38144#21806#38480#20215
      FieldName = 'sale_limit_price'
    end
    object qryPrdDepotpromotion_price: TFloatField
      DisplayLabel = #20419#38144#20215
      FieldName = 'promotion_price'
    end
    object qryPrdDepotstock: TFloatField
      DisplayLabel = #21830#21697#24211#23384
      FieldName = 'stock'
    end
    object qryPrdDepotcan_sale_stock: TFloatField
      DisplayLabel = #21487#38144#21806#37327
      FieldName = 'can_sale_stock'
    end
    object qryPrdDepotfreeze_stock: TFloatField
      DisplayLabel = #20923#32467#37327
      FieldName = 'freeze_stock'
    end
    object qryPrdDepotsale_unit: TStringField
      DisplayLabel = #38144#21806#21333#20301
      FieldName = 'sale_unit'
    end
    object qryPrdDepotsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryPrdDepotstart_time: TDateTimeField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'start_time'
    end
    object qryPrdDepotend_time: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'end_time'
    end
  end
  object dsPrdDepot: TUniDataSource
    DataSet = qryPrdDepot
    Left = 240
    Top = 272
  end
  object UniSQLUDepot: TUniSQL
    Connection = frmCommonDm.Connection
    Left = 328
    Top = 272
  end
end
