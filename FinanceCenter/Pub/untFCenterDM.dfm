object dmFCenter: TdmFCenter
  OldCreateOrder = False
  Left = 400
  Top = 274
  Height = 261
  Width = 447
  object qryFOrderInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_sorder_vegaga where status in (5,6,10,11,12)')
    ReadOnly = True
    Left = 40
    Top = 24
    object qryFOrderInfoso_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #24207#21495
      FieldName = 'so_id'
    end
    object qryFOrderInfoso_sn: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_sn'
      Required = True
      Size = 40
    end
    object qryFOrderInfoso_source: TStringField
      DisplayLabel = #35746#21333#26469#28304
      FieldName = 'so_source'
      Size = 200
    end
    object qryFOrderInfosource_no: TStringField
      DisplayLabel = #26469#28304#21333#21495
      FieldName = 'source_no'
      Size = 100
    end
    object qryFOrderInfom_id: TFloatField
      DisplayLabel = #20250#21592'ID'
      FieldName = 'm_id'
    end
    object qryFOrderInfotype: TFloatField
      DisplayLabel = #31867#22411
      FieldName = 'type'
    end
    object qryFOrderInfostatus: TFloatField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object qryFOrderInfopayment_id: TFloatField
      DisplayLabel = #25903#20184'ID'
      FieldName = 'payment_id'
    end
    object qryFOrderInfosend_type: TStringField
      DisplayLabel = #36865#36135#26041#24335
      FieldName = 'send_type'
      Size = 200
    end
    object qryFOrderInfopayment_type: TFloatField
      DisplayLabel = #25903#20184#31867#22411
      FieldName = 'payment_type'
    end
    object qryFOrderInfopayment_status: TFloatField
      DisplayLabel = #25903#20184#29366#24577
      FieldName = 'payment_status'
    end
    object qryFOrderInfosub_date: TDateField
      DisplayLabel = #25552#20132#26102#38388
      FieldName = 'sub_date'
    end
    object qryFOrderInfoconfirm_date: TDateField
      DisplayLabel = #30830#35748#26102#38388
      FieldName = 'confirm_date'
    end
    object qryFOrderInfoconfirm_by: TFloatField
      DisplayLabel = #30830#35748#32773
      FieldName = 'confirm_by'
    end
    object qryFOrderInfoinvoice_id: TFloatField
      DisplayLabel = #21457#31080'ID'
      FieldName = 'invoice_id'
    end
    object qryFOrderInfosub_ip: TStringField
      DisplayLabel = #35746#21333#25552#20132'IP'
      FieldName = 'sub_ip'
      Size = 30
    end
    object qryFOrderInfoprovince: TFloatField
      DisplayLabel = #30465
      FieldName = 'province'
    end
    object qryFOrderInfocity: TFloatField
      DisplayLabel = #24066
      FieldName = 'city'
    end
    object qryFOrderInfodistrict: TFloatField
      DisplayLabel = #21306
      FieldName = 'district'
    end
    object qryFOrderInfoaddr: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'addr'
      Size = 200
    end
    object qryFOrderInfoso_remark: TStringField
      DisplayLabel = #35746#21333#22791#27880
      FieldName = 'so_remark'
      Size = 400
    end
    object qryFOrderInfopost_code: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'post_code'
    end
    object qryFOrderInforeceiver: TStringField
      DisplayLabel = #25910#20214#20154
      FieldName = 'receiver'
    end
    object qryFOrderInfotel: TStringField
      DisplayLabel = #22266#23450#30005#35805
      FieldName = 'tel'
      Size = 30
    end
    object qryFOrderInfomobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'mobile'
      Size = 30
    end
    object qryFOrderInfoRECEIVE_EMAIL: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'RECEIVE_EMAIL'
      Size = 100
    end
    object qryFOrderInfocost_price: TFloatField
      DisplayLabel = #25104#26412#24635#20215
      FieldName = 'cost_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfotax: TFloatField
      DisplayLabel = #31246#24635#20215
      FieldName = 'tax'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfop_amount: TFloatField
      DisplayLabel = #38144#21806#24635#20215
      FieldName = 'p_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfop_settle_amount: TFloatField
      DisplayLabel = #32467#31639#24635#39069
      FieldName = 'p_settle_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfoship_amount: TFloatField
      DisplayLabel = #36816#36153
      FieldName = 'ship_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfoship_settle_amount: TFloatField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'ship_settle_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfoamount: TFloatField
      DisplayLabel = #35746#21333#37329#39069
      FieldName = 'amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfocoupon_price: TFloatField
      DisplayLabel = #31036#21697#21345#37329#39069
      FieldName = 'coupon_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfopreferential_price: TFloatField
      DisplayLabel = #20248#24800#37329#39069
      FieldName = 'preferential_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfosettle_amount: TFloatField
      DisplayLabel = #32467#31639#37329#39069
      FieldName = 'settle_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInforeturn_amount: TFloatField
      DisplayLabel = #36864#36135#37329#39069
      FieldName = 'return_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfofinal_amount: TFloatField
      DisplayLabel = #26368#32456#37329#39069
      FieldName = 'final_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOrderInfoship_order_number: TStringField
      DisplayLabel = #24555#36882#21333#21495
      FieldName = 'ship_order_number'
      Size = 100
    end
    object qryFOrderInfoscan_status: TFloatField
      DisplayLabel = #25195#25551#29366#24577
      FieldName = 'scan_status'
    end
    object qryFOrderInfoship_remark: TStringField
      DisplayLabel = #21457#36135#21333#22791#27880
      FieldName = 'ship_remark'
      Size = 2000
    end
    object qryFOrderInfosys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryFOrderInfosend_date: TStringField
      FieldName = 'send_date'
      Size = 200
    end
    object qryFOrderInfoexpress_id: TIntegerField
      FieldName = 'express_id'
    end
    object qryFOrderInfoexp_name: TStringField
      DisplayLabel = #24555#36882#20844#21496
      FieldKind = fkLookup
      FieldName = 'exp_name'
      LookupDataSet = qryExpressInfo
      LookupKeyFields = 'id'
      LookupResultField = 'express_name'
      KeyFields = 'express_id'
      Size = 100
      Lookup = True
    end
    object qryFOrderInfom_name: TStringField
      DisplayLabel = #20250#21592#21517#31216
      FieldKind = fkLookup
      FieldName = 'm_name'
      LookupDataSet = qryMemInfo
      LookupKeyFields = 'm_id'
      LookupResultField = 'nickname'
      KeyFields = 'm_id'
      Size = 30
      Lookup = True
    end
    object qryFOrderInfom_mobile: TStringField
      DisplayLabel = #20250#21592#25163#26426
      FieldKind = fkLookup
      FieldName = 'm_mobile'
      LookupDataSet = qryMemInfo
      LookupKeyFields = 'm_id'
      LookupResultField = 'mobile'
      KeyFields = 'm_id'
      Lookup = True
    end
  end
  object dsFOrderInfo: TUniDataSource
    DataSet = qryFOrderInfo
    Left = 80
    Top = 24
  end
  object qryFOPList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_sorder_item_vegaga')
    MasterSource = dsFOrderInfo
    MasterFields = 'so_sn'
    DetailFields = 'so_no'
    ReadOnly = True
    CachedUpdates = True
    Options.DetailDelay = 1
    Left = 40
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'so_sn'
      end>
    object qryFOPListso_item_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #35746#21333#39033'ID'
      FieldName = 'so_item_id'
    end
    object qryFOPListso_id: TFloatField
      DisplayLabel = #35746#21333'ID'
      FieldName = 'so_id'
    end
    object qryFOPListso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qryFOPListsku_id: TFloatField
      DisplayLabel = 'SKUID'
      FieldName = 'sku_id'
    end
    object qryFOPListp_id: TFloatField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qryFOPListp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qryFOPListp_sn: TStringField
      DisplayLabel = #21830#21697#32534#21495
      FieldName = 'p_sn'
      Size = 40
    end
    object qryFOPListp_ean: TStringField
      DisplayLabel = #21830#21697#26465#24418#30721
      FieldName = 'p_ean'
      Size = 40
    end
    object qryFOPListp_number: TFloatField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'p_number'
    end
    object qryFOPListp_cost_price: TFloatField
      DisplayLabel = #21830#21697#25104#26412#20215
      FieldName = 'p_cost_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOPListtax: TFloatField
      DisplayLabel = #21830#21697#31246
      FieldName = 'tax'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOPListsale_price: TFloatField
      DisplayLabel = #38144#21806#21333#20215
      FieldName = 'sale_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOPListsale_amount: TFloatField
      DisplayLabel = #38144#21806#24635#20215
      FieldName = 'sale_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFOPListp_weight: TFloatField
      DisplayLabel = #24635#37325#37327
      FieldName = 'p_weight'
    end
    object qryFOPListsource: TStringField
      DisplayLabel = #35746#36141#26469#28304
      FieldName = 'source'
      Size = 40
    end
    object qryFOPListreal_out_number: TFloatField
      DisplayLabel = #23454#38469#20986#24211#25968#37327
      FieldName = 'real_out_number'
    end
    object qryFOPListsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryFOPListpdt_name: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'pdt_name'
      LookupDataSet = qryPInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'name'
      KeyFields = 'p_id'
      ProviderFlags = [pfInWhere]
      Size = 100
      Lookup = True
    end
  end
  object dsFOPList: TUniDataSource
    DataSet = qryFOPList
    Left = 80
    Top = 64
  end
  object qryFSBOList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_return_vegaga where state in (3,4)')
    ReadOnly = True
    Left = 40
    Top = 120
    object qryFSBOListid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryFSBOListreturn_no: TStringField
      DisplayLabel = #36864#36135#21333#32534#21495
      FieldName = 'return_no'
      Size = 40
    end
    object qryFSBOListso_id: TIntegerField
      DisplayLabel = #35746#21333#24207#21495
      FieldName = 'so_id'
    end
    object qryFSBOListso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qryFSBOListso_source: TStringField
      DisplayLabel = #35746#21333#26469#28304
      FieldName = 'so_source'
      Size = 100
    end
    object qryFSBOListso_source_no: TStringField
      DisplayLabel = #26469#28304#21333#21495
      FieldName = 'so_source_no'
      Size = 40
    end
    object qryFSBOListmem_id: TIntegerField
      DisplayLabel = #20250#21592'ID'
      FieldName = 'mem_id'
    end
    object qryFSBOListstate: TIntegerField
      DisplayLabel = #36864#36135#21333#29366#24577
      FieldName = 'state'
    end
    object qryFSBOListsubmit_date: TDateTimeField
      DisplayLabel = #25552#20132#26085#26399
      FieldName = 'submit_date'
    end
    object qryFSBOListconfirm_date: TDateTimeField
      DisplayLabel = #30830#35748#26085#26399
      FieldName = 'confirm_date'
    end
    object qryFSBOListconfirm_by: TStringField
      DisplayLabel = #30830#35748#20154
      FieldName = 'confirm_by'
      Size = 100
    end
    object qryFSBOListso_memo: TStringField
      DisplayLabel = #35746#21333#22791#27880
      FieldName = 'so_memo'
      Size = 400
    end
    object qryFSBOListreturn_men: TStringField
      DisplayLabel = #36864#36135#20154
      FieldName = 'return_men'
      Size = 100
    end
    object qryFSBOListreturn_tel: TStringField
      DisplayLabel = #22266#23450#30005#35805
      FieldName = 'return_tel'
      Size = 40
    end
    object qryFSBOListreturn_mobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'return_mobile'
      Size = 40
    end
    object qryFSBOListreturn_email: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'return_email'
      Size = 100
    end
    object qryFSBOListreturn_amount: TFloatField
      DisplayLabel = #36864#36135#24635#37329#39069
      FieldName = 'return_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFSBOListreturn_price: TFloatField
      DisplayLabel = #36864#36135#36816#36153
      FieldName = 'return_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFSBOListreturn_time: TDateTimeField
      DisplayLabel = #36864#36135#26102#38388
      FieldName = 'return_time'
    end
    object qryFSBOListreturn_settleup: TFloatField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'return_settleup'
    end
    object qryFSBOListsys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
  end
  object dsFSBOList: TUniDataSource
    DataSet = qryFSBOList
    Left = 80
    Top = 120
  end
  object qryFSBOPList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_return_item_vegaga')
    MasterSource = dsFSBOList
    MasterFields = 'return_no'
    DetailFields = 'rso_no'
    ReadOnly = True
    CachedUpdates = True
    Options.DetailDelay = 1
    Left = 40
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'return_no'
      end>
    object qryFSBOPListid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryFSBOPListrso_id: TIntegerField
      DisplayLabel = #36864#36135#21333'ID'
      FieldName = 'rso_id'
    end
    object qryFSBOPListrso_no: TStringField
      DisplayLabel = #36864#36135#21333#32534#21495
      FieldName = 'rso_no'
      Size = 40
    end
    object qryFSBOPListp_id: TIntegerField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qryFSBOPListp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qryFSBOPListp_num: TIntegerField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'p_num'
    end
    object qryFSBOPListp_price: TFloatField
      DisplayLabel = #21830#21697#21806#20215
      FieldName = 'p_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFSBOPListp_amount: TFloatField
      DisplayLabel = #38144#21806#24635#20215
      FieldName = 'p_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryFSBOPListreal_input_num: TIntegerField
      DisplayLabel = #23454#38469#20837#24211#25968#37327
      FieldName = 'real_input_num'
    end
    object qryFSBOPListstate: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'state'
    end
    object qryFSBOPListsys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
    object qryFSBOPListp_name: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'p_name'
      LookupDataSet = qryPInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'name'
      KeyFields = 'p_id'
      Size = 100
      Lookup = True
    end
  end
  object dsFSBOPList: TUniDataSource
    DataSet = qryFSBOPList
    Left = 80
    Top = 160
  end
  object qryProvince: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from Sys_Area where ADDRESSLEVEL=:level')
    ReadOnly = True
    Left = 168
    Top = 24
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
    Left = 208
    Top = 24
  end
  object qryCity: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from Sys_Area where ADDRESSLEVEL=:level')
    MasterSource = dsProvince
    MasterFields = 'STATESID'
    DetailFields = 'STATESID'
    ReadOnly = True
    Left = 168
    Top = 64
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
    Left = 208
    Top = 64
  end
  object qryDistrict: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from Sys_Area where ADDRESSLEVEL=:level')
    MasterSource = dsCity
    MasterFields = 'CITYID'
    DetailFields = 'CITYID'
    ReadOnly = True
    Left = 168
    Top = 104
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
    Left = 208
    Top = 104
  end
  object qryPInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_product_vegaga')
    ReadOnly = True
    Left = 128
    Top = 24
    object qryPInfop_id: TIntegerField
      FieldName = 'p_id'
    end
    object qryPInfosku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'sku'
      Required = True
      Size = 40
    end
    object qryPInfosn: TStringField
      FieldName = 'sn'
      Required = True
      Size = 40
    end
    object qryPInfoean: TStringField
      FieldName = 'ean'
      Size = 40
    end
    object qryPInfotitle: TStringField
      FieldName = 'title'
      Required = True
      Size = 200
    end
    object qryPInfoname: TStringField
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object qryPInfochineseN: TStringField
      FieldName = 'chineseN'
      Size = 200
    end
    object qryPInfoenglishN: TStringField
      FieldName = 'englishN'
      Size = 200
    end
    object qryPInfoshortname: TStringField
      FieldName = 'shortname'
    end
    object qryPInfopic_path: TStringField
      FieldName = 'pic_path'
      ReadOnly = True
      Size = 200
    end
    object qryPInfotype: TFloatField
      FieldName = 'type'
    end
    object qryPInfostatus: TFloatField
      FieldName = 'status'
    end
    object qryPInfobrief: TStringField
      FieldName = 'brief'
      Size = 2000
    end
    object qryPInfodescript: TMemoField
      FieldName = 'descript'
      BlobType = ftMemo
    end
    object qryPInfobrand_id: TFloatField
      FieldName = 'brand_id'
    end
    object qryPInfobcat_id: TStringField
      FieldName = 'bcat_id'
      Size = 400
    end
    object qryPInfoscat_id: TStringField
      FieldName = 'scat_id'
      Size = 400
    end
    object qryPInfokeyword: TStringField
      FieldName = 'keyword'
      Size = 400
    end
    object qryPInfotag: TStringField
      FieldName = 'tag'
      Size = 400
    end
    object qryPInfoscore: TFloatField
      FieldName = 'score'
    end
    object qryPInfospec: TStringField
      FieldName = 'spec'
      Size = 200
    end
    object qryPInfoorigin: TStringField
      FieldName = 'origin'
      Size = 40
    end
    object qryPInfoweight: TStringField
      FieldName = 'weight'
      Size = 40
    end
    object qryPInfofactory: TStringField
      FieldName = 'factory'
      Size = 40
    end
    object qryPInfosale_unit: TStringField
      DisplayLabel = #38144#21806#21333#20301
      FieldName = 'sale_unit'
      Size = 100
    end
    object qryPInfocreate_by: TStringField
      FieldName = 'create_by'
      Size = 100
    end
    object qryPInfocreate_date: TDateField
      FieldName = 'create_date'
    end
    object qryPInfolast_update_by: TStringField
      FieldName = 'last_update_by'
      Size = 100
    end
    object qryPInfolast_update_date: TDateField
      FieldName = 'last_update_date'
    end
    object qryPInfosys_status: TFloatField
      FieldName = 'sys_status'
    end
    object qryPInfop_price: TFloatField
      FieldName = 'p_price'
    end
  end
  object qryExpressInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_e_express_vegaga')
    ReadOnly = True
    Left = 168
    Top = 152
    object qryExpressInfoid: TLargeintField
      FieldName = 'id'
    end
    object qryExpressInfoexpress_no: TStringField
      FieldName = 'express_no'
      Required = True
      Size = 40
    end
    object qryExpressInfoexpress_name: TStringField
      FieldName = 'express_name'
      Size = 60
    end
    object qryExpressInfoexpress_tel: TStringField
      FieldName = 'express_tel'
      Size = 40
    end
    object qryExpressInfoexpress_mobile: TStringField
      FieldName = 'express_mobile'
      Size = 40
    end
    object qryExpressInfoexpress_fax: TStringField
      FieldName = 'express_fax'
      Size = 40
    end
    object qryExpressInfoexpressex_mail: TStringField
      FieldName = 'expressex_mail'
      Size = 100
    end
    object qryExpressInfoexpress_addr: TStringField
      FieldName = 'express_addr'
      Size = 400
    end
    object qryExpressInfoexpress_post: TFloatField
      FieldName = 'express_post'
    end
    object qryExpressInfoexpress_website: TStringField
      FieldName = 'express_website'
      Size = 100
    end
    object qryExpressInfoexpress_msn: TStringField
      FieldName = 'express_msn'
      Size = 40
    end
    object qryExpressInfoexpress_qq: TStringField
      FieldName = 'express_qq'
      Size = 40
    end
    object qryExpressInfoexpress_create: TDateTimeField
      FieldName = 'express_create'
    end
    object qryExpressInfoexpress_info: TMemoField
      FieldName = 'express_info'
      BlobType = ftMemo
    end
    object qryExpressInfoexpress_interface: TStringField
      FieldName = 'express_interface'
      FixedChar = True
      Size = 2
    end
    object qryExpressInfoexpress_model: TStringField
      FieldName = 'express_model'
      Size = 100
    end
    object qryExpressInfocontract_linkmen: TStringField
      FieldName = 'contract_linkmen'
      Size = 60
    end
    object qryExpressInfocontract_tel: TStringField
      FieldName = 'contract_tel'
      Size = 40
    end
    object qryExpressInfocontract_mobile: TStringField
      FieldName = 'contract_mobile'
      Size = 40
    end
    object qryExpressInfocontract_email: TStringField
      FieldName = 'contract_email'
      Size = 100
    end
    object qryExpressInfocontract_fax: TStringField
      FieldName = 'contract_fax'
      Size = 40
    end
    object qryExpressInfocontract_msn: TStringField
      FieldName = 'contract_msn'
      Size = 40
    end
    object qryExpressInfocontract_qq: TStringField
      FieldName = 'contract_qq'
      Size = 40
    end
    object qryExpressInfobusiness_linkmen: TStringField
      FieldName = 'business_linkmen'
      Size = 60
    end
    object qryExpressInfobusiness_tel: TStringField
      FieldName = 'business_tel'
      Size = 40
    end
    object qryExpressInfobusiness_mobile: TStringField
      FieldName = 'business_mobile'
      Size = 40
    end
    object qryExpressInfobusiness_fax: TStringField
      FieldName = 'business_fax'
      Size = 100
    end
    object qryExpressInfobusiness_email: TStringField
      FieldName = 'business_email'
      Size = 100
    end
    object qryExpressInfobusiness_msn: TStringField
      FieldName = 'business_msn'
      Size = 40
    end
    object qryExpressInfobusiness_qq: TStringField
      FieldName = 'business_qq'
      Size = 40
    end
    object qryExpressInfoaccounts_linkmen: TStringField
      FieldName = 'accounts_linkmen'
      Size = 60
    end
    object qryExpressInfoaccounts_tel: TStringField
      FieldName = 'accounts_tel'
      Size = 40
    end
    object qryExpressInfoaccounts_mobile: TStringField
      FieldName = 'accounts_mobile'
      Size = 40
    end
    object qryExpressInfoaccounts_email: TStringField
      FieldName = 'accounts_email'
      Size = 100
    end
    object qryExpressInfoaccounts_fax: TStringField
      FieldName = 'accounts_fax'
      Size = 40
    end
    object qryExpressInfoaccounts_msn: TStringField
      FieldName = 'accounts_msn'
      Size = 40
    end
    object qryExpressInfoaccounts_qq: TStringField
      FieldName = 'accounts_qq'
      Size = 40
    end
  end
  object qryMemInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tmmv.m_id,tmmv.email,tmmv.nickname,tmmev.name,tmmev.tel,t' +
        'mmev.mobile'
      'from t_m_member_vegaga tmmv'
      
        'left outer join t_m_member_ext_vegaga tmmev on tmmv.m_id=tmmev.m' +
        '_id')
    ReadOnly = True
    Left = 296
    Top = 24
    object qryMemInfom_id: TIntegerField
      FieldName = 'm_id'
    end
    object qryMemInfoemail: TStringField
      FieldName = 'email'
      Required = True
      Size = 100
    end
    object qryMemInfonickname: TStringField
      FieldName = 'nickname'
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
  end
  object dsMemInfo: TUniDataSource
    DataSet = qryMemInfo
    Left = 336
    Top = 24
  end
  object qryDepotStat: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tppv.sku,tppv.name,tppv.brand_name,tppv.ean,tppv.spec,tpp' +
        'v.color,tppv.p_size,tssv.name as s_name,tpsv.stock,tddv.dp_dpnum' +
        ',tpslv.sto_no,tpslv.so_no,tsov.supplier_contract,tpslv.sort_n,ts' +
        'opv.product_price'
      'from t_p_sku_vegaga tpsv'
      'left outer join t_p_product_vegaga tppv on tpsv.sn=tppv.sku'
      
        'left outer join t_s_supplier_vegaga tssv on tppv.supplier_no=tss' +
        'v.sn'
      
        'left outer join t_dp_dposition_vegaga tddv on tpsv.sn=tddv.dp_sk' +
        'u'
      
        'left outer join t_stk_order_product_vegaga tsopv on tppv.sku=tso' +
        'pv.product_sku'
      
        'left outer join t_p_sku_log_vegaga tpslv on tsopv.stkorder_no=tp' +
        'slv.sto_no and tsopv.product_sku=tpslv.p_sku'
      
        'left outer join t_stk_order_vegaga tsov on tpslv.sto_no=tsov.stk' +
        '_no')
    ReadOnly = True
    Left = 296
    Top = 96
    object qryDepotStatsku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'sku'
      Size = 40
    end
    object qryDepotStatname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      Size = 200
    end
    object qryDepotStatbrand_name: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'brand_name'
      Size = 100
    end
    object qryDepotStatean: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldName = 'ean'
      Size = 40
    end
    object qryDepotStatspec: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldName = 'spec'
      Size = 200
    end
    object qryDepotStatcolor: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldName = 'color'
      Size = 100
    end
    object qryDepotStatp_size: TStringField
      DisplayLabel = #35797#29992#24202#23610#23544
      FieldName = 'p_size'
      Size = 100
    end
    object qryDepotStats_name: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 's_name'
      ReadOnly = True
      Size = 400
    end
    object qryDepotStatstock: TFloatField
      DisplayLabel = #24211#23384#37327
      FieldName = 'stock'
      ReadOnly = True
    end
    object qryDepotStatdp_dpnum: TStringField
      DisplayLabel = #20179#20301#21495
      FieldName = 'dp_dpnum'
      ReadOnly = True
      Size = 50
    end
    object qryDepotStatsort_n: TFloatField
      DisplayLabel = #27969#27700#30721
      FieldName = 'sort_n'
      ReadOnly = True
    end
    object qryDepotStatproduct_price: TFloatField
      DisplayLabel = #37319#36141#20215
      FieldName = 'product_price'
      ReadOnly = True
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryDepotStatsto_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'sto_no'
      ReadOnly = True
      Size = 40
    end
    object qryDepotStatso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      ReadOnly = True
      Size = 40
    end
    object qryDepotStatsupplier_contract: TStringField
      DisplayLabel = #37319#36141#21512#21516#21495
      FieldName = 'supplier_contract'
      ReadOnly = True
      Size = 60
    end
  end
  object dsDepotStat: TUniDataSource
    DataSet = qryDepotStat
    Left = 336
    Top = 96
  end
end
