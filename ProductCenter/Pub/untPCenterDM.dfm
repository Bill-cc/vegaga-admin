object dmPCenter: TdmPCenter
  OldCreateOrder = False
  Left = 392
  Top = 284
  Height = 341
  Width = 546
  object qrySCatList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_scat_vegaga')
    Left = 48
    Top = 32
    object qrySCatListscat_id: TIntegerField
      FieldName = 'scat_id'
    end
    object qrySCatListname: TStringField
      FieldName = 'name'
      Size = 30
    end
    object qrySCatListp_scat_id: TFloatField
      FieldName = 'p_scat_id'
    end
    object qrySCatListcode: TStringField
      FieldName = 'code'
      Size = 400
    end
    object qrySCatListis_parent: TFloatField
      FieldName = 'is_parent'
    end
    object qrySCatListstatus: TFloatField
      FieldName = 'status'
    end
    object qrySCatListsort_rank: TFloatField
      FieldName = 'sort_rank'
    end
    object qrySCatListsys_status: TFloatField
      FieldName = 'sys_status'
    end
  end
  object dsSCatList: TUniDataSource
    DataSet = qrySCatList
    Left = 88
    Top = 32
  end
  object qryShelfPList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_product_vegaga')
    Left = 48
    Top = 72
    object qryShelfPListp_id: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'p_id'
    end
    object qryShelfPListsku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'sku'
      Required = True
      Size = 40
    end
    object qryShelfPListsn: TStringField
      DisplayLabel = #38144#21806#20195#30721
      FieldName = 'sn'
      Required = True
      Size = 40
    end
    object qryShelfPListean: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldName = 'ean'
      Size = 40
    end
    object qryShelfPListtitle: TStringField
      DisplayLabel = #26174#31034#21517#31216
      FieldName = 'title'
      Required = True
      Size = 200
    end
    object qryShelfPListname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object qryShelfPListchineseN: TStringField
      DisplayLabel = #21517#31216#25340#38899
      FieldName = 'chineseN'
      Size = 200
    end
    object qryShelfPListenglishN: TStringField
      DisplayLabel = #33521#25991#21517#31216
      FieldName = 'englishN'
      Size = 200
    end
    object qryShelfPListshortname: TStringField
      DisplayLabel = #21517#31216#21161#35760#31526
      FieldName = 'shortname'
    end
    object qryShelfPListpic_path: TStringField
      DisplayLabel = #21830#21697#22270#29255
      FieldName = 'pic_path'
      Size = 200
    end
    object qryShelfPListp_price: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#20215#26684
      FieldName = 'p_price'
      currency = True
    end
    object qryShelfPListbcat_id: TStringField
      DisplayLabel = #30446#24405#32534#30721
      FieldName = 'bcat_id'
      Size = 400
    end
    object qryShelfPListscat_id: TStringField
      DisplayLabel = #38144#21806#32534#30721
      FieldName = 'scat_id'
      Size = 400
    end
    object qryShelfPListtype: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#31867#22411
      FieldName = 'type'
    end
    object qryShelfPListstatus: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object qryShelfPListbrief: TStringField
      DisplayLabel = #21830#21697#31616#20171
      FieldName = 'brief'
      Size = 2000
    end
    object qryShelfPListdescript: TMemoField
      DisplayLabel = #21830#21697#25551#36848
      FieldName = 'descript'
      BlobType = ftMemo
    end
    object qryShelfPListbrand_id: TFloatField
      DisplayLabel = #21697#29260'ID'
      FieldName = 'brand_id'
    end
    object qryShelfPListkeyword: TStringField
      DisplayLabel = #21830#21697#20851#38190#23383
      FieldName = 'keyword'
      Size = 400
    end
    object qryShelfPListtag: TStringField
      DisplayLabel = #26631#31614
      FieldName = 'tag'
      Size = 400
    end
    object qryShelfPListscore: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#31561#32423
      FieldName = 'score'
    end
    object qryShelfPListspec: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldName = 'spec'
      Size = 200
    end
    object qryShelfPListorigin: TStringField
      DisplayLabel = #21830#21697#20135#22320
      FieldName = 'origin'
      Size = 40
    end
    object qryShelfPListweight: TStringField
      DisplayLabel = #21830#21697#37325#37327
      FieldName = 'weight'
      Size = 40
    end
    object qryShelfPListfactory: TStringField
      DisplayLabel = #29983#20135#21378#23478
      FieldName = 'factory'
      Size = 40
    end
    object qryShelfPListsale_unit: TStringField
      DisplayLabel = #38144#21806#21333#20301
      FieldName = 'sale_unit'
      Size = 100
    end
    object qryShelfPListcreate_by: TStringField
      DisplayLabel = #21019#24314#32773
      FieldName = 'create_by'
      Size = 100
    end
    object qryShelfPListcreate_date: TDateField
      DisplayLabel = #21019#24314#26102#38388
      FieldName = 'create_date'
    end
    object qryShelfPListlast_update_by: TStringField
      DisplayLabel = #26368#36817#26356#26032#32773
      FieldName = 'last_update_by'
      Size = 100
    end
    object qryShelfPListlast_update_date: TDateField
      DisplayLabel = #26368#36817#26356#26032#26102#38388
      FieldName = 'last_update_date'
    end
    object qryShelfPListsys_status: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryShelfPListcolor: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldName = 'color'
      Size = 100
    end
    object qryShelfPListbrand_name: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'brand_name'
      Size = 100
    end
    object qryShelfPListexecute_std: TStringField
      DisplayLabel = #25191#34892#26631#20934
      FieldName = 'execute_std'
      Size = 100
    end
    object qryShelfPListp_size: TStringField
      DisplayLabel = #35797#29992#24202#23610#23544
      FieldName = 'p_size'
      Size = 100
    end
    object qryShelfPListp_color: TStringField
      DisplayLabel = #21069#21488#39068#33394
      FieldName = 'p_color'
      Size = 100
    end
    object qryShelfPListsupplier_no: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'supplier_no'
      Size = 40
    end
    object qryShelfPListstyle_type: TIntegerField
      DisplayLabel = #39118#26684#31867#21035
      FieldName = 'style_type'
    end
    object qryShelfPListlining: TStringField
      DisplayLabel = #37324#26009
      FieldName = 'lining'
      Size = 100
    end
    object qryShelfPListmaterial: TStringField
      DisplayLabel = #38754#26009
      FieldName = 'material'
      Size = 100
    end
    object qryShelfPListtechnics: TStringField
      DisplayLabel = #24037#33402
      FieldName = 'technics'
      Size = 100
    end
    object qryShelfPListpadding: TStringField
      DisplayLabel = #22635#20805#29289
      FieldName = 'padding'
      Size = 100
    end
    object qryShelfPListpadding_weight: TStringField
      DisplayLabel = #22635#20805#29289#21547#37327
      FieldName = 'padding_weight'
      Size = 100
    end
    object qryShelfPListwash_exp: TStringField
      DisplayLabel = #27927#28068#35828#26126
      FieldName = 'wash_exp'
      Size = 100
    end
    object qryShelfPListwarm_hint: TStringField
      DisplayLabel = #28201#39336#25552#31034
      FieldName = 'warm_hint'
      Size = 200
    end
  end
  object dsShelfPList: TUniDataSource
    DataSet = qryShelfPList
    Left = 88
    Top = 72
  end
  object qrySetOPrice: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_stk_order_vegaga where state=3')
    ReadOnly = True
    Left = 48
    Top = 192
    object qrySetOPriceid: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qrySetOPricestk_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'stk_no'
      Required = True
      Size = 40
    end
    object qrySetOPricesupplier_no: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'supplier_no'
      Size = 40
    end
    object qrySetOPricesupplier_contract: TStringField
      DisplayLabel = #20379#24212#21830#21512#21516#21495
      FieldName = 'supplier_contract'
      Size = 60
    end
    object qrySetOPricesettlement_type: TStringField
      DisplayLabel = #32467#31639#24418#24335
      FieldName = 'settlement_type'
      Size = 40
    end
    object qrySetOPricesettlement_cycle: TStringField
      DisplayLabel = #32467#31639#21608#26399
      FieldName = 'settlement_cycle'
      Size = 40
    end
    object qrySetOPricecooperation_type: TStringField
      DisplayLabel = #21512#20316#26041#24335
      FieldName = 'cooperation_type'
      Size = 40
    end
    object qrySetOPriceinvoice_type: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldName = 'invoice_type'
      Size = 40
    end
    object qrySetOPricedelivery_type: TStringField
      DisplayLabel = #36865#36135#26041#24335
      FieldName = 'delivery_type'
      Size = 40
    end
    object qrySetOPricedelivery_price: TStringField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'delivery_price'
      Size = 40
    end
    object qrySetOPriceurgent_level: TStringField
      DisplayLabel = #32039#24613#31243#24230
      FieldName = 'urgent_level'
      Size = 40
    end
    object qrySetOPricedepot_id: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #24211#25151'ID'
      FieldName = 'depot_id'
    end
    object qrySetOPricestate: TIntegerField
      DisplayLabel = #35746#21333#29366#24577
      FieldName = 'state'
    end
    object qrySetOPricesys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
  end
  object dsSetOPrice: TUniDataSource
    DataSet = qrySetOPrice
    Left = 88
    Top = 192
  end
  object qrySetOPdtPrice: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tpsv.sku_id,tsopv.stkorder_id,tsopv.stkorder_no,tsopv.pro' +
        'duct_id,tsopv.product_sku,tppv.name,tppv.brand_name,tppv.spec,tp' +
        'pv.p_color,tppv.p_size,tppv.status,tppv.sn,tsopv.product_cost,ts' +
        'opv.product_price,tsopv.product_tax,tpsv.market_price,tpsv.sale_' +
        'price,tpsv.sale_limit_price,tpsv.promotion_price'
      'from t_stk_order_product_vegaga tsopv '
      'left join t_p_sku_vegaga tpsv on tsopv.product_id=tpsv.p_id'
      'left join t_p_product_vegaga tppv on tsopv.product_id=tppv.p_id')
    MasterSource = dsSetOPrice
    MasterFields = 'stk_no'
    DetailFields = 'stkorder_no'
    ReadOnly = True
    Options.DetailDelay = 1
    Left = 48
    Top = 232
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'stk_no'
      end>
    object qrySetOPdtPricesku_id: TIntegerField
      DisplayLabel = #24211#23384'ID'
      FieldName = 'sku_id'
    end
    object qrySetOPdtPricestkorder_id: TIntegerField
      DisplayLabel = #37319#36141#21333'ID'
      FieldName = 'stkorder_id'
    end
    object qrySetOPdtPricestkorder_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'stkorder_no'
      Required = True
      Size = 40
    end
    object qrySetOPdtPriceproduct_id: TIntegerField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'product_id'
      Required = True
    end
    object qrySetOPdtPriceproduct_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'product_sku'
      Required = True
      Size = 40
    end
    object qrySetOPdtPricename: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      ReadOnly = True
      Size = 200
    end
    object qrySetOPdtPriceproduct_tax: TFloatField
      DisplayLabel = #21514#29260#20215
      FieldName = 'product_tax'
      ReadOnly = True
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySetOPdtPriceproduct_cost: TFloatField
      DisplayLabel = #38144#21806#38480#20215
      FieldName = 'product_cost'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object qrySetOPdtPriceproduct_price: TFloatField
      DisplayLabel = #37319#36141#21333#20215
      FieldName = 'product_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object qrySetOPdtPricemarket_price: TFloatField
      DisplayLabel = #24066#22330#20215
      FieldName = 'market_price'
      ReadOnly = True
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object qrySetOPdtPricesale_price: TFloatField
      DisplayLabel = #38144#21806#21333#20215
      FieldName = 'sale_price'
      ReadOnly = True
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object qrySetOPdtPricesale_limit_price: TFloatField
      DisplayLabel = #38144#21806#38480#20215
      FieldName = 'sale_limit_price'
      ReadOnly = True
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object qrySetOPdtPricepromotion_price: TFloatField
      DisplayLabel = #20419#38144#20215
      FieldName = 'promotion_price'
      ReadOnly = True
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object qrySetOPdtPricebrand_name: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'brand_name'
      ReadOnly = True
      Size = 100
    end
    object qrySetOPdtPricespec: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldName = 'spec'
      ReadOnly = True
      Size = 200
    end
    object qrySetOPdtPricep_color: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldName = 'p_color'
      ReadOnly = True
      Size = 100
    end
    object qrySetOPdtPricep_size: TStringField
      DisplayLabel = #21830#21697#23610#23544
      FieldName = 'p_size'
      ReadOnly = True
      Size = 100
    end
    object qrySetOPdtPricestatus: TFloatField
      DisplayLabel = #21830#21697#29366#24577
      FieldName = 'status'
      ReadOnly = True
    end
    object qrySetOPdtPricesn: TStringField
      DisplayLabel = #38144#21806#20195#30721
      FieldName = 'sn'
      ReadOnly = True
      Size = 40
    end
  end
  object dsSetOPdtPrice: TUniDataSource
    DataSet = qrySetOPdtPrice
    Left = 88
    Top = 232
  end
  object qryImageList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from picture_vegaga')
    MasterSource = dsShelfPList
    MasterFields = 'p_id'
    DetailFields = 'obj_id'
    Left = 48
    Top = 120
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_id'
      end>
    object qryImageListID: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'ID'
    end
    object qryImageListp_sku: TStringField
      FieldName = 'p_sku'
      Size = 100
    end
    object qryImageListobj_id: TFloatField
      DisplayLabel = #23545#35937'ID'
      FieldName = 'obj_id'
      Required = True
    end
    object qryImageListobj_type: TFloatField
      DisplayLabel = #23545#35937#31867#22411
      FieldName = 'obj_type'
      Required = True
    end
    object qryImageListpic_path: TStringField
      DisplayLabel = #22270#29255#36335#24452
      FieldName = 'pic_path'
      Required = True
      Size = 400
    end
    object qryImageListpic_m_path: TStringField
      DisplayLabel = #20013#22270#36335#24452
      FieldName = 'pic_m_path'
      Size = 400
    end
    object qryImageListpic_s_path: TStringField
      DisplayLabel = #23567#22270#36335#24452
      FieldName = 'pic_s_path'
      Size = 400
    end
    object qryImageListpic_type: TFloatField
      DisplayLabel = #22270#29255#31867#22411
      FieldName = 'pic_type'
      Required = True
    end
    object qryImageListpic_explain: TStringField
      DisplayLabel = #22270#29255#35828#26126
      FieldName = 'pic_explain'
      Size = 1000
    end
    object qryImageListsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
  end
  object dsImageList: TUniDataSource
    DataSet = qryImageList
    Left = 88
    Top = 120
  end
  object qryPrdStyle: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_styleclass')
    ReadOnly = True
    Left = 192
    Top = 32
    object qryPrdStyleStyleID: TIntegerField
      DisplayLabel = #39118#26684#24207#21495
      FieldName = 'StyleID'
      Required = True
    end
    object qryPrdStyleStyleName: TStringField
      DisplayLabel = #39118#26684#21517#31216
      FieldName = 'StyleName'
      Size = 128
    end
    object qryPrdStyleStyleDesc: TStringField
      DisplayLabel = #39118#26684#25551#36848
      FieldName = 'StyleDesc'
      Size = 2048
    end
  end
  object dsPrdStyle: TUniDataSource
    DataSet = qryPrdStyle
    Left = 232
    Top = 32
  end
  object qryIndexPList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_mp_view')
    CachedUpdates = True
    Left = 192
    Top = 72
    object qryIndexPListmp_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #24207#21495
      FieldName = 'mp_id'
    end
    object qryIndexPListdt_start: TDateTimeField
      DisplayLabel = #24320#22987#26102#38388
      FieldName = 'dt_start'
      DisplayFormat = 'yyyy-MM-dd hh:mm:ss'
    end
    object qryIndexPListdt_end: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'dt_end'
      DisplayFormat = 'yyyy-MM-dd hh:mm:ss'
    end
    object qryIndexPListsku: TStringField
      DisplayLabel = 'SKU'#21495
      FieldName = 'sku'
      Size = 40
    end
    object qryIndexPListViewType: TIntegerField
      DisplayLabel = #26639#30446#31867#22411
      FieldName = 'ViewType'
    end
    object qryIndexPListscat_code: TStringField
      DisplayLabel = #38144#21806#30446#24405
      FieldName = 'scat_code'
    end
    object qryIndexPListp_id: TIntegerField
      DisplayLabel = #21830#21697'ID'
      FieldKind = fkLookup
      FieldName = 'p_id'
      LookupDataSet = qryPdtInfo
      LookupKeyFields = 'sku'
      LookupResultField = 'p_id'
      KeyFields = 'sku'
      ProviderFlags = [pfInWhere]
      Lookup = True
    end
    object qryIndexPListdt_submit: TDateTimeField
      DisplayLabel = #25552#20132#26102#38388
      FieldName = 'dt_submit'
    end
    object qryIndexPListsubmiter: TStringField
      DisplayLabel = #25552#20132#20154
      FieldName = 'submiter'
      Size = 40
    end
    object qryIndexPListsn: TStringField
      DisplayLabel = #38144#21806#20195#30721
      FieldKind = fkLookup
      FieldName = 'sn'
      LookupDataSet = qryPdtInfo
      LookupKeyFields = 'sku'
      LookupResultField = 'sn'
      KeyFields = 'sku'
      ProviderFlags = [pfInWhere]
      Size = 50
      Lookup = True
    end
    object qryIndexPListean: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldKind = fkLookup
      FieldName = 'ean'
      LookupDataSet = qryPdtInfo
      LookupKeyFields = 'sku'
      LookupResultField = 'ean'
      KeyFields = 'sku'
      ProviderFlags = [pfInWhere]
      Size = 50
      Lookup = True
    end
    object qryIndexPListname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'name'
      LookupDataSet = qryPdtInfo
      LookupKeyFields = 'sku'
      LookupResultField = 'name'
      KeyFields = 'sku'
      ProviderFlags = [pfInWhere]
      Size = 100
      Lookup = True
    end
    object qryIndexPListbrand_name: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldKind = fkLookup
      FieldName = 'brand_name'
      LookupDataSet = qryPdtInfo
      LookupKeyFields = 'sku'
      LookupResultField = 'brand_name'
      KeyFields = 'sku'
      ProviderFlags = [pfInWhere]
      Size = 50
      Lookup = True
    end
    object qryIndexPListspec: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldKind = fkLookup
      FieldName = 'spec'
      LookupDataSet = qryPdtInfo
      LookupKeyFields = 'sku'
      LookupResultField = 'spec'
      KeyFields = 'sku'
      ProviderFlags = [pfInWhere]
      Size = 50
      Lookup = True
    end
    object qryIndexPListp_color: TStringField
      DisplayLabel = #39068#33394
      FieldKind = fkLookup
      FieldName = 'p_color'
      LookupDataSet = qryPdtInfo
      LookupKeyFields = 'sku'
      LookupResultField = 'p_color'
      KeyFields = 'sku'
      ProviderFlags = [pfInWhere]
      Lookup = True
    end
    object qryIndexPListp_size: TStringField
      DisplayLabel = #35797#29992#24202#23610#23544
      FieldKind = fkLookup
      FieldName = 'p_size'
      LookupDataSet = qryPdtInfo
      LookupKeyFields = 'sku'
      LookupResultField = 'p_size'
      KeyFields = 'sku'
      ProviderFlags = [pfInWhere]
      Size = 30
      Lookup = True
    end
    object qryIndexPListstatus: TIntegerField
      DisplayLabel = #21830#21697#29366#24577
      FieldKind = fkLookup
      FieldName = 'status'
      LookupDataSet = qryPdtInfo
      LookupKeyFields = 'sku'
      LookupResultField = 'status'
      KeyFields = 'sku'
      ProviderFlags = [pfInWhere]
      Lookup = True
    end
  end
  object dsIndexPList: TUniDataSource
    DataSet = qryIndexPList
    Left = 232
    Top = 72
  end
  object qryGetPrdPrice: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_sku_vegaga where sn=:sku')
    ReadOnly = True
    Left = 192
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'sku'
        ParamType = ptInput
      end>
    object qryGetPrdPricesku_id: TIntegerField
      FieldName = 'sku_id'
    end
    object qryGetPrdPricename: TStringField
      FieldName = 'name'
      Size = 200
    end
    object qryGetPrdPricesn: TStringField
      FieldName = 'sn'
      Size = 40
    end
    object qryGetPrdPricep_id: TFloatField
      FieldName = 'p_id'
    end
    object qryGetPrdPriceproperties: TStringField
      FieldName = 'properties'
      Size = 2000
    end
    object qryGetPrdPrices_id: TFloatField
      FieldName = 's_id'
    end
    object qryGetPrdPricemarket_price: TFloatField
      FieldName = 'market_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryGetPrdPricesale_price: TFloatField
      FieldName = 'sale_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryGetPrdPricesale_limit_price: TFloatField
      FieldName = 'sale_limit_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryGetPrdPricepromotion_price: TFloatField
      FieldName = 'promotion_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryGetPrdPricestock: TFloatField
      FieldName = 'stock'
    end
    object qryGetPrdPricecan_sale_stock: TFloatField
      FieldName = 'can_sale_stock'
    end
    object qryGetPrdPricefreeze_stock: TFloatField
      FieldName = 'freeze_stock'
    end
    object qryGetPrdPricesale_unit: TStringField
      FieldName = 'sale_unit'
    end
    object qryGetPrdPricesys_status: TFloatField
      FieldName = 'sys_status'
    end
    object qryGetPrdPricestart_time: TDateTimeField
      FieldName = 'start_time'
    end
    object qryGetPrdPriceend_time: TDateTimeField
      FieldName = 'end_time'
    end
  end
  object dsGetPrdPrice: TUniDataSource
    DataSet = qryGetPrdPrice
    Left = 232
    Top = 128
  end
  object qryPdtInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select p_id,sku,sn,ean,name,brand_name,spec,p_color,p_size,statu' +
        's'
      'from t_p_product_vegaga')
    Left = 272
    Top = 72
    object qryPdtInfop_id: TIntegerField
      FieldName = 'p_id'
    end
    object qryPdtInfosku: TStringField
      FieldName = 'sku'
      Size = 40
    end
    object qryPdtInfosn: TStringField
      FieldName = 'sn'
      Size = 40
    end
    object qryPdtInfoean: TStringField
      FieldName = 'ean'
      Size = 40
    end
    object qryPdtInfoname: TStringField
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object qryPdtInfobrand_name: TStringField
      FieldName = 'brand_name'
      Size = 100
    end
    object qryPdtInfospec: TStringField
      FieldName = 'spec'
      Size = 200
    end
    object qryPdtInfop_color: TStringField
      FieldName = 'p_color'
      Size = 100
    end
    object qryPdtInfop_size: TStringField
      FieldName = 'p_size'
      Size = 100
    end
    object qryPdtInfostatus: TFloatField
      FieldName = 'status'
    end
  end
  object qrySameSnList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tpsv.sku_id,tppv.name,tppv.sku,tppv.brand_name,tppv.spec,' +
        'tppv.p_color,tppv.p_size,tppv.status,tppv.sn,tpsv.market_price,t' +
        'psv.sale_price,tpsv.sale_limit_price,tpsv.promotion_price'
      'from t_p_product_vegaga tppv'
      'left join t_p_sku_vegaga tpsv on tppv.sku=tpsv.sn'
      'where tppv.sn=:psn and tppv.sku!=:psku')
    ReadOnly = True
    Left = 192
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'psn'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'psku'
        ParamType = ptInput
      end>
    object qrySameSnListsku_id: TIntegerField
      DisplayLabel = #24211#23384#24207#21495
      FieldName = 'sku_id'
    end
    object qrySameSnListsku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'sku'
      ReadOnly = True
      Size = 40
    end
    object qrySameSnListname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      ReadOnly = True
      Required = True
      Size = 200
    end
    object qrySameSnListbrand_name: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'brand_name'
      ReadOnly = True
      Size = 100
    end
    object qrySameSnListspec: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'spec'
      ReadOnly = True
      Size = 200
    end
    object qrySameSnListp_color: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldName = 'p_color'
      ReadOnly = True
      Size = 100
    end
    object qrySameSnListp_size: TStringField
      DisplayLabel = #35797#29992#24202#23610#23544
      FieldName = 'p_size'
      ReadOnly = True
      Size = 100
    end
    object qrySameSnListstatus: TFloatField
      DisplayLabel = #21830#21697#29366#24577
      FieldName = 'status'
      ReadOnly = True
    end
    object qrySameSnListsn: TStringField
      DisplayLabel = #38144#21806#20195#30721
      FieldName = 'sn'
      ReadOnly = True
      Size = 40
    end
    object qrySameSnListmarket_price: TFloatField
      DisplayLabel = #24066#22330#20215
      FieldName = 'market_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySameSnListsale_price: TFloatField
      DisplayLabel = #38144#21806#20215
      FieldName = 'sale_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySameSnListsale_limit_price: TFloatField
      DisplayLabel = #38144#21806#38480#20215
      FieldName = 'sale_limit_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySameSnListpromotion_price: TFloatField
      DisplayLabel = #20419#38144#20215
      FieldName = 'promotion_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
  end
  object dsSameSnList: TUniDataSource
    DataSet = qrySameSnList
    Left = 232
    Top = 168
  end
  object qryFindPPic: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select pic_path from picture_vegaga where p_sku=:psku and pic_ty' +
        'pe=1')
    ReadOnly = True
    Left = 272
    Top = 32
    ParamData = <
      item
        DataType = ftString
        Name = 'psku'
        ParamType = ptInput
      end>
    object qryFindPPicpic_path: TStringField
      FieldName = 'pic_path'
      Required = True
      Size = 400
    end
  end
  object qryScatPList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_product_vegaga')
    Left = 368
    Top = 72
    object IntegerField1: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'p_id'
    end
    object StringField1: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'sku'
      Required = True
      Size = 40
    end
    object StringField2: TStringField
      DisplayLabel = #38144#21806#20195#30721
      FieldName = 'sn'
      Required = True
      Size = 40
    end
    object StringField3: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldName = 'ean'
      Size = 40
    end
    object StringField4: TStringField
      DisplayLabel = #26174#31034#21517#31216
      FieldName = 'title'
      Required = True
      Size = 200
    end
    object StringField5: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object StringField6: TStringField
      DisplayLabel = #21517#31216#25340#38899
      FieldName = 'chineseN'
      Size = 200
    end
    object StringField7: TStringField
      DisplayLabel = #33521#25991#21517#31216
      FieldName = 'englishN'
      Size = 200
    end
    object StringField8: TStringField
      DisplayLabel = #21517#31216#21161#35760#31526
      FieldName = 'shortname'
    end
    object StringField9: TStringField
      DisplayLabel = #21830#21697#22270#29255
      FieldName = 'pic_path'
      Size = 200
    end
    object FloatField1: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#20215#26684
      FieldName = 'p_price'
      currency = True
    end
    object StringField10: TStringField
      DisplayLabel = #30446#24405#32534#30721
      FieldName = 'bcat_id'
      Size = 400
    end
    object StringField11: TStringField
      DisplayLabel = #38144#21806#32534#30721
      FieldName = 'scat_id'
      Size = 400
    end
    object FloatField2: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#31867#22411
      FieldName = 'type'
    end
    object FloatField3: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object StringField12: TStringField
      DisplayLabel = #21830#21697#31616#20171
      FieldName = 'brief'
      Size = 2000
    end
    object MemoField1: TMemoField
      DisplayLabel = #21830#21697#25551#36848
      FieldName = 'descript'
      BlobType = ftMemo
    end
    object FloatField4: TFloatField
      DisplayLabel = #21697#29260'ID'
      FieldName = 'brand_id'
    end
    object StringField13: TStringField
      DisplayLabel = #21830#21697#20851#38190#23383
      FieldName = 'keyword'
      Size = 400
    end
    object StringField14: TStringField
      DisplayLabel = #26631#31614
      FieldName = 'tag'
      Size = 400
    end
    object FloatField5: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#31561#32423
      FieldName = 'score'
    end
    object StringField15: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldName = 'spec'
      Size = 200
    end
    object StringField16: TStringField
      DisplayLabel = #21830#21697#20135#22320
      FieldName = 'origin'
      Size = 40
    end
    object StringField17: TStringField
      DisplayLabel = #21830#21697#37325#37327
      FieldName = 'weight'
      Size = 40
    end
    object StringField18: TStringField
      DisplayLabel = #29983#20135#21378#23478
      FieldName = 'factory'
      Size = 40
    end
    object StringField19: TStringField
      DisplayLabel = #38144#21806#21333#20301
      FieldName = 'sale_unit'
      Size = 100
    end
    object StringField20: TStringField
      DisplayLabel = #21019#24314#32773
      FieldName = 'create_by'
      Size = 100
    end
    object DateField1: TDateField
      DisplayLabel = #21019#24314#26102#38388
      FieldName = 'create_date'
    end
    object StringField21: TStringField
      DisplayLabel = #26368#36817#26356#26032#32773
      FieldName = 'last_update_by'
      Size = 100
    end
    object DateField2: TDateField
      DisplayLabel = #26368#36817#26356#26032#26102#38388
      FieldName = 'last_update_date'
    end
    object FloatField6: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object StringField22: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldName = 'color'
      Size = 100
    end
    object StringField23: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'brand_name'
      Size = 100
    end
    object StringField24: TStringField
      DisplayLabel = #25191#34892#26631#20934
      FieldName = 'execute_std'
      Size = 100
    end
    object StringField25: TStringField
      DisplayLabel = #35797#29992#24202#23610#23544
      FieldName = 'p_size'
      Size = 100
    end
    object StringField26: TStringField
      DisplayLabel = #21069#21488#39068#33394
      FieldName = 'p_color'
      Size = 100
    end
    object StringField27: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'supplier_no'
      Size = 40
    end
    object IntegerField2: TIntegerField
      DisplayLabel = #39118#26684#31867#21035
      FieldName = 'style_type'
    end
    object StringField28: TStringField
      DisplayLabel = #37324#26009
      FieldName = 'lining'
      Size = 100
    end
    object StringField29: TStringField
      DisplayLabel = #38754#26009
      FieldName = 'material'
      Size = 100
    end
    object StringField30: TStringField
      DisplayLabel = #24037#33402
      FieldName = 'technics'
      Size = 100
    end
    object StringField31: TStringField
      DisplayLabel = #22635#20805#29289
      FieldName = 'padding'
      Size = 100
    end
    object StringField32: TStringField
      DisplayLabel = #22635#20805#29289#21547#37327
      FieldName = 'padding_weight'
      Size = 100
    end
    object StringField33: TStringField
      DisplayLabel = #27927#28068#35828#26126
      FieldName = 'wash_exp'
      Size = 100
    end
    object StringField34: TStringField
      DisplayLabel = #28201#39336#25552#31034
      FieldName = 'warm_hint'
      Size = 200
    end
  end
  object dsScatPList: TUniDataSource
    DataSet = qryScatPList
    Left = 408
    Top = 72
  end
  object qrySelScatList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_scat_vegaga')
    Left = 368
    Top = 32
    object IntegerField3: TIntegerField
      FieldName = 'scat_id'
    end
    object StringField35: TStringField
      FieldName = 'name'
      Size = 30
    end
    object FloatField7: TFloatField
      FieldName = 'p_scat_id'
    end
    object StringField36: TStringField
      FieldName = 'code'
      Size = 400
    end
    object FloatField8: TFloatField
      FieldName = 'is_parent'
    end
    object FloatField9: TFloatField
      FieldName = 'status'
    end
    object FloatField10: TFloatField
      FieldName = 'sort_rank'
    end
    object FloatField11: TFloatField
      FieldName = 'sys_status'
    end
  end
  object dsSelScatList: TUniDataSource
    DataSet = qrySelScatList
    Left = 408
    Top = 32
  end
  object qryStOAddPudt: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_product_vegaga')
    ReadOnly = True
    Filtered = True
    Left = 408
    Top = 128
    object qryStOAddPudtp_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #24207#21495
      FieldName = 'p_id'
    end
    object qryStOAddPudtsku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'sku'
      Required = True
      Size = 40
    end
    object qryStOAddPudtsn: TStringField
      DisplayLabel = #38144#21806#20195#30721
      FieldName = 'sn'
      Required = True
      Size = 40
    end
    object qryStOAddPudtean: TStringField
      DisplayLabel = #26465#24418#30721
      FieldName = 'ean'
      Size = 40
    end
    object qryStOAddPudttitle: TStringField
      DisplayLabel = #21830#21697#26631#39064
      FieldName = 'title'
      Required = True
      Size = 200
    end
    object qryStOAddPudtname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object qryStOAddPudtchineseN: TStringField
      DisplayLabel = #21517#31216#25340#38899
      FieldName = 'chineseN'
      Size = 200
    end
    object qryStOAddPudtenglishN: TStringField
      DisplayLabel = #33521#25991#21517#31216
      FieldName = 'englishN'
      Size = 200
    end
    object qryStOAddPudtshortname: TStringField
      DisplayLabel = #21161#35760#31526
      FieldName = 'shortname'
    end
    object qryStOAddPudtpic_path: TStringField
      DisplayLabel = #22270#29255#22320#22336
      FieldName = 'pic_path'
      Size = 200
    end
    object qryStOAddPudtp_price: TFloatField
      DisplayLabel = #21830#21697#20215#26684
      FieldName = 'p_price'
    end
    object qryStOAddPudttype: TFloatField
      DisplayLabel = #21830#21697#31867#22411
      FieldName = 'type'
    end
    object qryStOAddPudtstatus: TFloatField
      DisplayLabel = #21830#21697#29366#24577
      FieldName = 'status'
    end
    object qryStOAddPudtbrief: TStringField
      DisplayLabel = #21830#21697#31616#20171
      FieldName = 'brief'
      Size = 2000
    end
    object qryStOAddPudtdescript: TMemoField
      DisplayLabel = #21830#21697#25551#36848
      FieldName = 'descript'
      BlobType = ftMemo
    end
    object qryStOAddPudtbrand_id: TFloatField
      DisplayLabel = #21697#29260'ID'
      FieldName = 'brand_id'
    end
    object qryStOAddPudtbrandname: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldKind = fkLookup
      FieldName = 'brandname'
      LookupDataSet = qryBrandInfo
      LookupKeyFields = 'brand_id'
      LookupResultField = 'name'
      KeyFields = 'brand_id'
      Size = 200
      Lookup = True
    end
    object qryStOAddPudtbcatname: TStringField
      DisplayLabel = #30446#24405#21517#31216
      FieldKind = fkLookup
      FieldName = 'bcatname'
      LookupDataSet = qryBcatInfo
      LookupKeyFields = 'bcat_id'
      LookupResultField = 'name'
      KeyFields = 'bcat_id'
      Size = 30
      Lookup = True
    end
    object qryStOAddPudtbcat_id: TStringField
      FieldName = 'bcat_id'
      Size = 400
    end
    object qryStOAddPudtscat_id: TStringField
      DisplayLabel = #38144#21806#20998#31867'ID'
      FieldName = 'scat_id'
      Size = 400
    end
    object qryStOAddPudtsupplier_no: TStringField
      DisplayLabel = #20379#24212#38378#32534#21495
      FieldName = 'supplier_no'
      Size = 40
    end
    object qryStOAddPudtkeyword: TStringField
      DisplayLabel = #20851#38190#23383
      FieldName = 'keyword'
      Size = 400
    end
    object qryStOAddPudttag: TStringField
      DisplayLabel = #26631#31614
      FieldName = 'tag'
      Size = 400
    end
    object qryStOAddPudtscore: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #35780#20998
      FieldName = 'score'
    end
    object qryStOAddPudtspec: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'spec'
      Size = 200
    end
    object qryStOAddPudtorigin: TStringField
      DisplayLabel = #20135#22320
      FieldName = 'origin'
      Size = 40
    end
    object qryStOAddPudtweight: TStringField
      DisplayLabel = #37325#37327
      FieldName = 'weight'
      Size = 40
    end
    object qryStOAddPudtfactory: TStringField
      DisplayLabel = #29983#20135#21378#23478
      FieldName = 'factory'
      Size = 100
    end
    object qryStOAddPudtsale_unit: TStringField
      DisplayLabel = #38144#21806#21333#20301
      FieldName = 'sale_unit'
      Size = 100
    end
    object qryStOAddPudtcreate_by: TStringField
      DisplayLabel = #21019#24314#32773
      FieldName = 'create_by'
      Size = 100
    end
    object qryStOAddPudtcreate_date: TDateField
      DisplayLabel = #21019#24314#26102#38388
      FieldName = 'create_date'
    end
    object qryStOAddPudtlast_update_by: TStringField
      DisplayLabel = #26368#21518#20462#25913#32773
      FieldName = 'last_update_by'
      Size = 100
    end
    object qryStOAddPudtlast_update_date: TDateField
      DisplayLabel = #20462#25913#26102#38388
      FieldName = 'last_update_date'
    end
    object qryStOAddPudtsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryStOAddPudtscatName: TStringField
      DisplayLabel = #38144#21806#30446#24405
      FieldKind = fkLookup
      FieldName = 'scatName'
      LookupDataSet = qrySCatInfo
      LookupKeyFields = 'code'
      LookupResultField = 'name'
      KeyFields = 'scat_id'
      Size = 50
      Lookup = True
    end
    object qryStOAddPudtskuNum: TIntegerField
      DisplayLabel = #21487#38144#21806#25968#37327
      FieldKind = fkLookup
      FieldName = 'skuNum'
      LookupDataSet = qryPSku
      LookupKeyFields = 'sn'
      LookupResultField = 'can_sale_stock'
      KeyFields = 'sku'
      ProviderFlags = [pfInWhere]
      Lookup = True
    end
    object qryStOAddPudtp_sale_price: TCurrencyField
      DisplayLabel = #21830#21697#21806#20215
      FieldKind = fkLookup
      FieldName = 'p_sale_price'
      LookupDataSet = qryPSku
      LookupKeyFields = 'sn'
      LookupResultField = 'sale_price'
      KeyFields = 'sku'
      Lookup = True
    end
  end
  object dsStOAddPudt: TUniDataSource
    DataSet = qryStOAddPudt
    Left = 440
    Top = 128
  end
  object qrySCatInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_scat_vegaga')
    ReadOnly = True
    Left = 376
    Top = 128
    object qrySCatInfoscat_id: TIntegerField
      FieldName = 'scat_id'
    end
    object qrySCatInfoname: TStringField
      FieldName = 'name'
      Size = 30
    end
    object qrySCatInfop_scat_id: TFloatField
      FieldName = 'p_scat_id'
    end
    object qrySCatInfocode: TStringField
      FieldName = 'code'
      Size = 400
    end
    object qrySCatInfois_parent: TFloatField
      FieldName = 'is_parent'
    end
    object qrySCatInfostatus: TFloatField
      FieldName = 'status'
    end
    object qrySCatInfosort_rank: TFloatField
      FieldName = 'sort_rank'
    end
    object qrySCatInfosys_status: TFloatField
      FieldName = 'sys_status'
    end
  end
  object qryPSku: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_sku_vegaga')
    Left = 344
    Top = 128
    object qryPSkusku_id: TIntegerField
      FieldName = 'sku_id'
    end
    object qryPSkuname: TStringField
      FieldName = 'name'
      Size = 200
    end
    object qryPSkusn: TStringField
      FieldName = 'sn'
      Size = 40
    end
    object qryPSkup_id: TFloatField
      FieldName = 'p_id'
    end
    object qryPSkuproperties: TStringField
      FieldName = 'properties'
      Size = 2000
    end
    object qryPSkus_id: TFloatField
      FieldName = 's_id'
    end
    object qryPSkumarket_price: TFloatField
      FieldName = 'market_price'
    end
    object qryPSkusale_price: TFloatField
      FieldName = 'sale_price'
    end
    object qryPSkusale_limit_price: TFloatField
      FieldName = 'sale_limit_price'
    end
    object qryPSkupromotion_price: TFloatField
      FieldName = 'promotion_price'
    end
    object qryPSkustock: TFloatField
      FieldName = 'stock'
    end
    object qryPSkucan_sale_stock: TFloatField
      FieldName = 'can_sale_stock'
    end
    object qryPSkufreeze_stock: TFloatField
      FieldName = 'freeze_stock'
    end
    object qryPSkusale_unit: TStringField
      FieldName = 'sale_unit'
    end
    object qryPSkusys_status: TFloatField
      FieldName = 'sys_status'
    end
  end
  object qryBrandInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_brand_vegaga order by brand_id desc')
    Left = 320
    Top = 168
    object qryBrandInfobrand_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'brand_id'
    end
    object qryBrandInfobrand_no: TStringField
      FieldName = 'brand_no'
      Required = True
      Size = 40
    end
    object qryBrandInfoname: TStringField
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object qryBrandInfobrief: TMemoField
      FieldName = 'brief'
      BlobType = ftMemo
    end
    object qryBrandInfocompany_name: TStringField
      FieldName = 'company_name'
      Size = 200
    end
    object qryBrandInfologo_path: TStringField
      FieldName = 'logo_path'
      Size = 200
    end
    object qryBrandInfosys_status: TFloatField
      FieldName = 'sys_status'
    end
    object qryBrandInfoorientation: TStringField
      FieldName = 'orientation'
      Size = 40
    end
    object qryBrandInforegister: TIntegerField
      FieldName = 'register'
    end
    object qryBrandInfos_accredit: TIntegerField
      FieldName = 's_accredit'
    end
    object qryBrandInfosupplies_id: TIntegerField
      FieldName = 'supplies_id'
    end
  end
  object qryBcatInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_bcat_vegaga')
    Left = 384
    Top = 168
    object qryBcatInfobcat_id: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'bcat_id'
    end
    object qryBcatInfoname: TStringField
      FieldName = 'name'
      Size = 30
    end
    object qryBcatInfop_bcat_id: TFloatField
      FieldName = 'p_bcat_id'
    end
    object qryBcatInfocode: TStringField
      FieldName = 'code'
      Size = 400
    end
    object qryBcatInfois_parent: TFloatField
      FieldName = 'is_parent'
    end
    object qryBcatInfostatus: TFloatField
      FieldName = 'status'
    end
    object qryBcatInfosort_rank: TFloatField
      FieldName = 'sort_rank'
    end
    object qryBcatInfosys_status: TFloatField
      FieldName = 'sys_status'
    end
  end
  object dsBrandInfo: TUniDataSource
    DataSet = qryBrandInfo
    Left = 352
    Top = 168
  end
end
