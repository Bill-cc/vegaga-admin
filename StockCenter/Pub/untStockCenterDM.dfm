object dmStockCenter: TdmStockCenter
  OldCreateOrder = False
  Left = 464
  Top = 176
  Height = 295
  Width = 560
  object qrySupplierList: TUniQuery
    Connection = frmCommonDm.Connection
    Transaction = frmCommonDm.Transaction
    SQL.Strings = (
      'select * from t_s_supplier_vegaga order by s_id desc')
    ReadOnly = True
    Left = 48
    Top = 16
    object qrySupplierLists_id: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 's_id'
    end
    object qrySupplierListsn: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'sn'
      Size = 40
    end
    object qrySupplierListname: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldName = 'name'
      Size = 400
    end
    object qrySupplierListtype: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'type'
    end
    object qrySupplierListlevel: TStringField
      DisplayLabel = #31561#32423
      FieldName = 'level'
    end
    object qrySupplierListemail: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'email'
      Size = 100
    end
    object qrySupplierListtel: TStringField
      DisplayLabel = #22266#23450#30005#35805
      FieldName = 'tel'
      Size = 40
    end
    object qrySupplierListmobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'mobile'
      Size = 40
    end
    object qrySupplierListfax: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'fax'
      Size = 40
    end
    object qrySupplierListaddr: TStringField
      DisplayLabel = #20844#21496#22320#22336
      FieldName = 'addr'
      Size = 400
    end
    object qrySupplierListlinkman: TStringField
      DisplayLabel = #32852#31995#20154
      FieldName = 'linkman'
      Size = 40
    end
    object qrySupplierListwebsite: TStringField
      DisplayLabel = #20844#21496#32593#22336
      FieldName = 'website'
      Size = 200
    end
    object qrySupplierListbank: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'bank'
      Size = 200
    end
    object qrySupplierListcooperation_type: TStringField
      DisplayLabel = #21512#20316#26041#24335
      FieldName = 'cooperation_type'
      Size = 40
    end
    object qrySupplierListstatus: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object qrySupplierListbank_account: TStringField
      DisplayLabel = #20844#21496#36134#21495
      FieldName = 'bank_account'
      Size = 200
    end
    object qrySupplierListsys_status: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
  end
  object dsSupplierList: TUniDataSource
    DataSet = qrySupplierList
    Left = 88
    Top = 16
  end
  object qryBrandList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_brand_vegaga order by brand_id desc')
    ReadOnly = True
    Left = 48
    Top = 64
    object qryBrandListbrand_id: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'brand_id'
    end
    object qryBrandListbrand_no: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'brand_no'
      Required = True
      Size = 40
    end
    object qryBrandListname: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object qryBrandListbrief: TMemoField
      DisplayLabel = #31616#20171
      FieldName = 'brief'
      BlobType = ftMemo
    end
    object qryBrandListcompany_name: TStringField
      DisplayLabel = #21407#21378#21830
      FieldName = 'company_name'
      Size = 200
    end
    object qryBrandListlogo_path: TStringField
      DisplayLabel = #21697#29260#22270#26631
      FieldName = 'logo_path'
      Size = 200
    end
    object qryBrandListsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryBrandListorientation: TStringField
      DisplayLabel = #21697#29260#23450#20301
      FieldName = 'orientation'
      Size = 40
    end
    object qryBrandListregister: TIntegerField
      DisplayLabel = #21830#26631#27880#20876#35777
      FieldName = 'register'
    end
    object qryBrandLists_accredit: TIntegerField
      DisplayLabel = #38144#21806#25480#26435
      FieldName = 's_accredit'
    end
    object qryBrandListsupplies_id: TIntegerField
      FieldName = 'supplies_id'
    end
    object qryBrandListsupplies_name: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldKind = fkLookup
      FieldName = 'supplies_name'
      LookupDataSet = qrySupplierInfo
      LookupKeyFields = 's_id'
      LookupResultField = 'name'
      KeyFields = 'supplies_id'
      Size = 100
      Lookup = True
    end
    object qryBrandListb_order: TIntegerField
      DisplayLabel = #25490#24207
      FieldName = 'b_order'
    end
  end
  object dsBrandList: TUniDataSource
    DataSet = qryBrandList
    Left = 88
    Top = 64
  end
  object qryCatalogList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_bcat_vegaga')
    ReadOnly = True
    Left = 48
    Top = 112
    object qryCatalogListbcat_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #24207#21495
      FieldName = 'bcat_id'
    end
    object qryCatalogListname: TStringField
      DisplayLabel = #30446#24405#21517
      FieldName = 'name'
      Size = 30
    end
    object qryCatalogListp_bcat_id: TFloatField
      DisplayLabel = #29238#30446#24405'ID'
      FieldName = 'p_bcat_id'
    end
    object qryCatalogListcode: TStringField
      DisplayLabel = #30446#24405#32534#30721
      FieldName = 'code'
      Size = 400
    end
    object qryCatalogListis_parent: TFloatField
      DisplayLabel = #26159#21542#29238#33410#28857
      FieldName = 'is_parent'
    end
    object qryCatalogListstatus: TFloatField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object qryCatalogListsort_rank: TFloatField
      DisplayLabel = #25490#24207#26435#37325
      FieldName = 'sort_rank'
    end
    object qryCatalogListsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
  end
  object dsCatalogList: TUniDataSource
    DataSet = qryCatalogList
    Left = 88
    Top = 112
  end
  object qryProductList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_product_vegaga order by p_id desc')
    ReadOnly = True
    Left = 152
    Top = 16
    object qryProductListp_id: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'p_id'
    end
    object qryProductListsku: TStringField
      DisplayLabel = 'SKU'#21495
      FieldName = 'sku'
      Required = True
      Size = 40
    end
    object qryProductListsn: TStringField
      DisplayLabel = #38144#21806#20195#30721
      FieldName = 'sn'
      Required = True
      Size = 40
    end
    object qryProductListean: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldName = 'ean'
      Size = 40
    end
    object qryProductListtitle: TStringField
      DisplayLabel = #21830#21697#26631#39064
      FieldName = 'title'
      Size = 200
    end
    object qryProductListname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object qryProductListchineseN: TStringField
      DisplayLabel = #21517#31216#25340#38899
      FieldName = 'chineseN'
      Size = 200
    end
    object qryProductListenglishN: TStringField
      DisplayLabel = #33521#25991#21517#31216
      FieldName = 'englishN'
      Size = 200
    end
    object qryProductListshortname: TStringField
      DisplayLabel = #21517#31216#21161#35760#31526
      FieldName = 'shortname'
    end
    object qryProductListpic_path: TStringField
      DisplayLabel = #21830#21697#22270#29255
      FieldName = 'pic_path'
      Size = 200
    end
    object qryProductListcolor: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldName = 'color'
      Size = 100
    end
    object qryProductListp_price: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#20215#26684
      FieldName = 'p_price'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
      currency = True
    end
    object qryProductListp_size: TStringField
      DisplayLabel = #35797#29992#24202#23610#23544
      FieldName = 'p_size'
      Size = 100
    end
    object qryProductListbcat_id: TStringField
      DisplayLabel = #30446#24405#32534#30721
      FieldName = 'bcat_id'
      Size = 400
    end
    object qryProductListscat_id: TStringField
      DisplayLabel = #38144#21806#32534#30721
      FieldName = 'scat_id'
      Size = 400
    end
    object qryProductListtype: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#31867#22411
      FieldName = 'type'
    end
    object qryProductListstatus: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object qryProductListbrief: TStringField
      DisplayLabel = #21253#35013#35828#26126
      FieldName = 'brief'
      Size = 2000
    end
    object qryProductListdescript: TMemoField
      DisplayLabel = #21830#21697#25551#36848
      FieldName = 'descript'
      BlobType = ftMemo
    end
    object qryProductListbrand_id: TFloatField
      DisplayLabel = #21697#29260'ID'
      FieldName = 'brand_id'
    end
    object qryProductListbrand_name: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'brand_name'
      Size = 100
    end
    object qryProductListkeyword: TStringField
      DisplayLabel = #21830#21697#20851#38190#23383
      FieldName = 'keyword'
      Size = 400
    end
    object qryProductListtag: TStringField
      DisplayLabel = #26631#31614
      FieldName = 'tag'
      Size = 400
    end
    object qryProductListscore: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#31561#32423
      FieldName = 'score'
    end
    object qryProductListspec: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldName = 'spec'
      Size = 200
    end
    object qryProductListorigin: TStringField
      DisplayLabel = #21830#21697#20135#22320
      FieldName = 'origin'
      Size = 40
    end
    object qryProductListweight: TStringField
      DisplayLabel = #21830#21697#37325#37327
      FieldName = 'weight'
      Size = 40
    end
    object qryProductListfactory: TStringField
      DisplayLabel = #29983#20135#21378#23478
      FieldName = 'factory'
      Size = 40
    end
    object qryProductListsale_unit: TStringField
      DisplayLabel = #38144#21806#21333#20301
      FieldName = 'sale_unit'
      Size = 100
    end
    object qryProductListsupplier_no: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'supplier_no'
      Size = 40
    end
    object qryProductListcreate_by: TStringField
      DisplayLabel = #21019#24314#32773
      FieldName = 'create_by'
      Size = 100
    end
    object qryProductListcreate_date: TDateField
      DisplayLabel = #21019#24314#26102#38388
      FieldName = 'create_date'
    end
    object qryProductListlast_update_by: TStringField
      DisplayLabel = #26368#36817#26356#26032#32773
      FieldName = 'last_update_by'
      Size = 100
    end
    object qryProductListlast_update_date: TDateField
      DisplayLabel = #26368#36817#26356#26032#26102#38388
      FieldName = 'last_update_date'
    end
    object qryProductListsys_status: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryProductListsupplierName: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldKind = fkLookup
      FieldName = 'supplierName'
      LookupDataSet = qrySupplierInfo
      LookupKeyFields = 'sn'
      LookupResultField = 'name'
      KeyFields = 'supplier_no'
      Size = 50
      Lookup = True
    end
    object qryProductListexecute_std: TStringField
      DisplayLabel = #25191#34892#26631#20934
      FieldName = 'execute_std'
      Size = 100
    end
  end
  object dsProductList: TUniDataSource
    DataSet = qryProductList
    Left = 192
    Top = 16
  end
  object qryFactoryList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_f_factory_vegaga')
    FetchRows = 1000
    Left = 152
    Top = 64
    object qryFactoryListid: TIntegerField
      DisplayLabel = #24207#21495
      DisplayWidth = 50
      FieldName = 'id'
      Visible = False
      MaxValue = 50
    end
    object qryFactoryListfno: TStringField
      DisplayLabel = #32534#21495
      DisplayWidth = 100
      FieldName = 'fno'
      Visible = False
      Size = 40
    end
    object qryFactoryListfname: TStringField
      DisplayLabel = #21517#31216
      DisplayWidth = 120
      FieldName = 'fname'
      Size = 100
    end
    object qryFactoryListftel: TStringField
      DisplayLabel = #30005#35805
      DisplayWidth = 100
      FieldName = 'ftel'
      Size = 40
    end
    object qryFactoryListfaddress: TStringField
      DisplayLabel = #22320#22336
      DisplayWidth = 150
      FieldName = 'faddress'
      Size = 200
    end
  end
  object qrySaleUtilList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_su_saleunit_vegaga')
    FetchRows = 1000
    Left = 192
    Top = 64
    object qrySaleUtilListid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
      Visible = False
    end
    object qrySaleUtilListsno: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'sno'
      Visible = False
      Size = 40
    end
    object qrySaleUtilListsname: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'sname'
      Size = 100
    end
    object qrySaleUtilListsaddress: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'saddress'
      Size = 200
    end
    object qrySaleUtilListstel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'stel'
      Size = 40
    end
  end
  object qryCreateStOrder: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_stk_order_vegaga order by id desc')
    ReadOnly = True
    Left = 272
    Top = 16
    object qryCreateStOrderid: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryCreateStOrderstk_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'stk_no'
      Required = True
      Size = 40
    end
    object qryCreateStOrdersupplier_no: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'supplier_no'
      Size = 40
    end
    object qryCreateStOrdersupplier_contract: TStringField
      DisplayLabel = #20379#24212#21830#21512#21516#21495
      FieldName = 'supplier_contract'
      Size = 60
    end
    object qryCreateStOrdersettlement_type: TStringField
      DisplayLabel = #32467#31639#24418#24335
      FieldName = 'settlement_type'
      Size = 40
    end
    object qryCreateStOrdersettlement_cycle: TStringField
      DisplayLabel = #32467#31639#21608#26399
      FieldName = 'settlement_cycle'
      Size = 40
    end
    object qryCreateStOrdercooperation_type: TStringField
      DisplayLabel = #21512#20316#26041#24335
      FieldName = 'cooperation_type'
      Size = 40
    end
    object qryCreateStOrderinvoice_type: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldName = 'invoice_type'
      Size = 40
    end
    object qryCreateStOrderdelivery_type: TStringField
      DisplayLabel = #36865#36135#26041#24335
      FieldName = 'delivery_type'
      Size = 40
    end
    object qryCreateStOrderdelivery_price: TStringField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'delivery_price'
      Size = 40
    end
    object qryCreateStOrderurgent_level: TStringField
      DisplayLabel = #32039#24613#31243#24230
      FieldName = 'urgent_level'
      Size = 40
    end
    object qryCreateStOrderdepot_id: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #24211#25151'ID'
      FieldName = 'depot_id'
    end
    object qryCreateStOrderdepot_name: TStringField
      DisplayLabel = #24211#25151#21517#31216
      FieldKind = fkLookup
      FieldName = 'depot_name'
      LookupDataSet = qryDepotInfo
      LookupKeyFields = 'id'
      LookupResultField = 'd_name'
      KeyFields = 'depot_id'
      ProviderFlags = [pfInWhere]
      Size = 100
      Lookup = True
    end
    object qryCreateStOrderdepot_linkmen: TStringField
      DisplayLabel = #24211#25151#32852#31995#20154
      FieldKind = fkLookup
      FieldName = 'depot_linkmen'
      LookupDataSet = qryDepotInfo
      LookupKeyFields = 'id'
      LookupResultField = 'd_linkmen'
      KeyFields = 'depot_id'
      ProviderFlags = [pfInWhere]
      Size = 40
      Lookup = True
    end
    object qryCreateStOrderdepot_tel: TStringField
      DisplayLabel = #24211#25151#30005#35805
      FieldKind = fkLookup
      FieldName = 'depot_tel'
      LookupDataSet = qryDepotInfo
      LookupKeyFields = 'id'
      LookupResultField = 'd_tel'
      KeyFields = 'depot_id'
      ProviderFlags = [pfInWhere]
      Size = 40
      Lookup = True
    end
    object qryCreateStOrderdepot_address: TStringField
      DisplayLabel = #24211#25151#22320#22336
      FieldKind = fkLookup
      FieldName = 'depot_address'
      LookupDataSet = qryDepotInfo
      LookupKeyFields = 'id'
      LookupResultField = 'd_address'
      KeyFields = 'depot_id'
      ProviderFlags = [pfInWhere]
      Size = 200
      Lookup = True
    end
    object qryCreateStOrderstate: TIntegerField
      DisplayLabel = #35746#21333#29366#24577
      FieldName = 'state'
    end
    object qryCreateStOrdersys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
    object qryCreateStOrdersupplier_name: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldKind = fkLookup
      FieldName = 'supplier_name'
      LookupDataSet = qrySupplierInfo
      LookupKeyFields = 'sn'
      LookupResultField = 'name'
      KeyFields = 'supplier_no'
      ProviderFlags = [pfInWhere]
      Size = 100
      Lookup = True
    end
    object qryCreateStOrdertax_rate: TFloatField
      FieldName = 'tax_rate'
    end
    object qryCreateStOrderstk_price: TFloatField
      DisplayLabel = #35746#21333#37329#39069
      FieldName = 'stk_price'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
    end
    object qryCreateStOrderstkp_num: TIntegerField
      DisplayLabel = #20135#21697#25968#37327
      FieldName = 'stkp_num'
    end
    object qryCreateStOrderstk_p_compose: TStringField
      DisplayLabel = #36827#20215#32452#25104
      FieldName = 'stk_p_compose'
      Size = 40
    end
    object qryCreateStOrdercreate_date: TDateField
      DisplayLabel = #21019#24314#26085#26399
      FieldName = 'create_date'
    end
  end
  object dsCreateStOrder: TUniDataSource
    DataSet = qryCreateStOrder
    Left = 312
    Top = 16
  end
  object qryCreateStOProduct: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_stk_order_product_vegaga')
    MasterSource = dsCreateStOrder
    MasterFields = 'stk_no'
    DetailFields = 'stkorder_no'
    ReadOnly = True
    CachedUpdates = True
    Options.DetailDelay = 10
    BeforePost = qryCreateStOProductBeforePost
    Left = 272
    Top = 64
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'stk_no'
      end>
    object qryCreateStOProductid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryCreateStOProductstkorder_id: TIntegerField
      DisplayLabel = #37319#36141#21333'ID'
      FieldName = 'stkorder_id'
    end
    object qryCreateStOProductstkorder_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'stkorder_no'
      Required = True
      Size = 40
    end
    object qryCreateStOProductproductname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'productname'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'name'
      KeyFields = 'product_id'
      ProviderFlags = [pfInWhere]
      Size = 200
      Lookup = True
    end
    object qryCreateStOProductproductean: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldKind = fkLookup
      FieldName = 'productean'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'ean'
      KeyFields = 'product_id'
      ProviderFlags = [pfInWhere]
      Size = 50
      Lookup = True
    end
    object qryCreateStOProductproductspec: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldKind = fkLookup
      FieldName = 'productspec'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'spec'
      KeyFields = 'product_id'
      ProviderFlags = [pfInWhere]
      Size = 50
      Lookup = True
    end
    object qryCreateStOProductproduct_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'product_sku'
      Required = True
      Size = 40
    end
    object qryCreateStOProductproduct_id: TIntegerField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'product_id'
      Required = True
    end
    object qryCreateStOProductproduct_num: TIntegerField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'product_num'
    end
    object qryCreateStOProductproduct_cost: TFloatField
      DisplayLabel = #38144#21806#38480#20215
      FieldName = 'product_cost'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
      currency = True
    end
    object qryCreateStOProductproduct_tax: TFloatField
      DisplayLabel = #21514#29260#20215
      FieldName = 'product_tax'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
      currency = True
    end
    object qryCreateStOProductproduct_price: TFloatField
      DisplayLabel = #37319#36141#20215
      FieldName = 'product_price'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
      currency = True
    end
    object qryCreateStOProductproduct_allprice: TFloatField
      DisplayLabel = #37319#36141#24635#20215
      FieldName = 'product_allprice'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
      currency = True
    end
    object qryCreateStOProductproduct_weight: TStringField
      DisplayLabel = #24635#37325#37327
      FieldName = 'product_weight'
      Size = 40
    end
    object qryCreateStOProductproduct_indepotnum: TIntegerField
      DisplayLabel = #23454#38469#20837#24211#25968#37327
      FieldName = 'product_indepotnum'
    end
    object qryCreateStOProductstate: TIntegerField
      DisplayLabel = #21830#21697#29366#24577
      FieldName = 'state'
    end
    object qryCreateStOProductsys_status: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryCreateStOProductmemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'memo'
      Size = 200
    end
    object qryCreateStOProductbrand_id: TIntegerField
      DisplayLabel = #21697#29260'ID'
      FieldKind = fkLookup
      FieldName = 'brand_id'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'brand_id'
      KeyFields = 'product_id'
      ProviderFlags = [pfInWhere]
      Lookup = True
    end
    object qryCreateStOProductbrand_name: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldKind = fkLookup
      FieldName = 'brand_name'
      LookupDataSet = qryBrandInfo
      LookupKeyFields = 'brand_id'
      LookupResultField = 'name'
      KeyFields = 'brand_id'
      ProviderFlags = [pfInWhere]
      Size = 50
      Lookup = True
    end
  end
  object dsCreateStOProduct: TUniDataSource
    DataSet = qryCreateStOProduct
    Left = 312
    Top = 64
  end
  object qryDepotInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_dp_depot_vegaga')
    ReadOnly = True
    Left = 272
    Top = 112
    object qryDepotInfoid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
      Visible = False
    end
    object qryDepotInfod_no: TStringField
      DisplayLabel = #24211#25151#32534#21495
      FieldName = 'd_no'
      Visible = False
      Size = 40
    end
    object qryDepotInfod_name: TStringField
      DisplayLabel = #24211#25151#21517#31216
      FieldName = 'd_name'
      Size = 100
    end
    object qryDepotInfod_linkmen: TStringField
      DisplayLabel = #24211#25151#32852#31995#20154
      FieldName = 'd_linkmen'
      Size = 40
    end
    object qryDepotInfod_tel: TStringField
      DisplayLabel = #24211#25151#30005#35805
      FieldName = 'd_tel'
      Size = 40
    end
    object qryDepotInfod_address: TStringField
      DisplayLabel = #24211#25151#22320#22336
      FieldName = 'd_address'
      Size = 200
    end
  end
  object qrySupplierInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_s_supplier_vegaga')
    ReadOnly = True
    Left = 272
    Top = 160
    object qrySupplierInfos_id: TIntegerField
      FieldName = 's_id'
    end
    object qrySupplierInfosn: TStringField
      FieldName = 'sn'
      Size = 40
    end
    object qrySupplierInfoname: TStringField
      FieldName = 'name'
      Size = 400
    end
    object qrySupplierInfotype: TStringField
      FieldName = 'type'
    end
    object qrySupplierInfolevel: TStringField
      FieldName = 'level'
    end
    object qrySupplierInfoemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object qrySupplierInfotel: TStringField
      FieldName = 'tel'
      Size = 40
    end
    object qrySupplierInfomobile: TStringField
      FieldName = 'mobile'
      Size = 40
    end
    object qrySupplierInfofax: TStringField
      FieldName = 'fax'
      Size = 40
    end
    object qrySupplierInfoaddr: TStringField
      FieldName = 'addr'
      Size = 400
    end
    object qrySupplierInfolinkman: TStringField
      FieldName = 'linkman'
      Size = 40
    end
    object qrySupplierInfowebsite: TStringField
      FieldName = 'website'
      Size = 200
    end
    object qrySupplierInfobank: TStringField
      FieldName = 'bank'
      Size = 200
    end
    object qrySupplierInfocooperation_type: TStringField
      FieldName = 'cooperation_type'
      Size = 40
    end
    object qrySupplierInfostatus: TIntegerField
      FieldName = 'status'
    end
    object qrySupplierInfobank_account: TStringField
      FieldName = 'bank_account'
      Size = 200
    end
    object qrySupplierInfosys_status: TIntegerField
      FieldName = 'sys_status'
    end
  end
  object dsSupplierInfo: TUniDataSource
    DataSet = qrySupplierInfo
    Left = 312
    Top = 160
  end
  object dsDepotInfo: TUniDataSource
    DataSet = qryDepotInfo
    Left = 312
    Top = 112
  end
  object qryStOAddPudt: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_product_vegaga')
    ReadOnly = True
    Filtered = True
    Left = 272
    Top = 208
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
    Left = 312
    Top = 208
  end
  object qryBrandInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_brand_vegaga order by brand_id desc')
    Left = 344
    Top = 208
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
    Left = 408
    Top = 208
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
  object qryProductInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_product_vegaga')
    Left = 352
    Top = 64
    object qryProductInfop_id: TIntegerField
      FieldName = 'p_id'
    end
    object qryProductInfosku: TStringField
      DisplayLabel = #21830#21697'SKU'
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
    object qryProductInfoenglishN: TStringField
      FieldName = 'englishN'
      Size = 200
    end
    object qryProductInfoshortname: TStringField
      FieldName = 'shortname'
    end
    object qryProductInfopic_path: TStringField
      FieldName = 'pic_path'
      ReadOnly = True
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
      Size = 40
    end
    object qryProductInfosale_unit: TStringField
      DisplayLabel = #38144#21806#21333#20301
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
    object qryProductInfop_price: TFloatField
      FieldName = 'p_price'
    end
    object qryProductInfobrand_name: TStringField
      FieldName = 'brand_name'
      Size = 100
    end
    object qryProductInfop_size: TStringField
      FieldName = 'p_size'
      Size = 100
    end
    object qryProductInfop_color: TStringField
      FieldName = 'p_color'
      Size = 100
    end
  end
  object dsEStOrder: TUniDataSource
    DataSet = qryEStOrder
    Left = 88
    Top = 168
  end
  object qryEStOPList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_stk_order_product_vegaga')
    MasterSource = dsEStOrder
    MasterFields = 'stk_no'
    DetailFields = 'stkorder_no'
    CachedUpdates = True
    Options.DetailDelay = 1
    BeforePost = qryCreateStOProductBeforePost
    Left = 48
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'stk_no'
      end>
    object IntegerField5: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object IntegerField6: TIntegerField
      DisplayLabel = #37319#36141#21333'ID'
      FieldName = 'stkorder_id'
    end
    object StringField16: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'stkorder_no'
      Required = True
      Size = 40
    end
    object StringField17: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'productname'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'name'
      KeyFields = 'product_id'
      ProviderFlags = [pfInWhere]
      Size = 200
      Lookup = True
    end
    object IntegerField7: TIntegerField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'product_id'
      Required = True
    end
    object StringField18: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'product_sku'
      Required = True
      Size = 40
    end
    object IntegerField8: TIntegerField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'product_num'
    end
    object FloatField1: TFloatField
      DisplayLabel = #38144#21806#38480#20215
      FieldName = 'product_cost'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
      currency = True
    end
    object FloatField2: TFloatField
      DisplayLabel = #21514#29260#20215
      FieldName = 'product_tax'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
      currency = True
    end
    object FloatField3: TFloatField
      DisplayLabel = #37319#36141#21333#20215
      FieldName = 'product_price'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
      currency = True
    end
    object FloatField4: TFloatField
      DisplayLabel = #37319#36141#24635#20215
      FieldName = 'product_allprice'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
      currency = True
    end
    object StringField19: TStringField
      DisplayLabel = #24635#37325#37327
      FieldName = 'product_weight'
      Size = 40
    end
    object IntegerField9: TIntegerField
      DisplayLabel = #23454#38469#20837#24211#25968#37327
      FieldName = 'product_indepotnum'
    end
    object IntegerField10: TIntegerField
      DisplayLabel = #21830#21697#29366#24577
      FieldName = 'state'
    end
    object IntegerField11: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryEStOPListmemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'memo'
      Size = 200
    end
    object qryEStOPListp_ean: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldKind = fkLookup
      FieldName = 'p_ean'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'ean'
      KeyFields = 'product_id'
      Size = 50
      Lookup = True
    end
    object qryEStOPListp_size: TStringField
      DisplayLabel = #21830#21697#23610#23544
      FieldKind = fkLookup
      FieldName = 'p_size'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'p_size'
      KeyFields = 'product_id'
      Size = 50
      Lookup = True
    end
    object qryEStOPListp_brandname: TStringField
      DisplayLabel = #21830#21697#21697#29260
      FieldKind = fkLookup
      FieldName = 'p_brandname'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'brand_name'
      KeyFields = 'product_id'
      Size = 50
      Lookup = True
    end
    object qryEStOPListp_color: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldKind = fkLookup
      FieldName = 'p_color'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'p_color'
      KeyFields = 'product_id'
      Size = 50
      Lookup = True
    end
  end
  object dsEStOPList: TUniDataSource
    DataSet = qryEStOPList
    Left = 88
    Top = 208
  end
  object qryEStOrder: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_stk_order_vegaga where state=2')
    ReadOnly = True
    Left = 48
    Top = 168
    object IntegerField1: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object StringField1: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'stk_no'
      Required = True
      Size = 40
    end
    object StringField2: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'supplier_no'
      Size = 40
    end
    object StringField3: TStringField
      DisplayLabel = #20379#24212#21830#21512#21516#21495
      FieldName = 'supplier_contract'
      Size = 60
    end
    object StringField4: TStringField
      DisplayLabel = #32467#31639#24418#24335
      FieldName = 'settlement_type'
      Size = 40
    end
    object StringField5: TStringField
      DisplayLabel = #32467#31639#21608#26399
      FieldName = 'settlement_cycle'
      Size = 40
    end
    object StringField6: TStringField
      DisplayLabel = #21512#20316#26041#24335
      FieldName = 'cooperation_type'
      Size = 40
    end
    object StringField7: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldName = 'invoice_type'
      Size = 40
    end
    object StringField8: TStringField
      DisplayLabel = #36865#36135#26041#24335
      FieldName = 'delivery_type'
      Size = 40
    end
    object StringField9: TStringField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'delivery_price'
      Size = 40
    end
    object StringField10: TStringField
      DisplayLabel = #32039#24613#31243#24230
      FieldName = 'urgent_level'
      Size = 40
    end
    object IntegerField2: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #24211#25151'ID'
      FieldName = 'depot_id'
    end
    object StringField11: TStringField
      DisplayLabel = #24211#25151#21517#31216
      FieldKind = fkLookup
      FieldName = 'depot_name'
      LookupDataSet = qryDepotInfo
      LookupKeyFields = 'id'
      LookupResultField = 'd_name'
      KeyFields = 'depot_id'
      ProviderFlags = [pfInWhere]
      Size = 100
      Lookup = True
    end
    object StringField12: TStringField
      DisplayLabel = #24211#25151#32852#31995#20154
      FieldKind = fkLookup
      FieldName = 'depot_linkmen'
      LookupDataSet = qryDepotInfo
      LookupKeyFields = 'id'
      LookupResultField = 'd_linkmen'
      KeyFields = 'depot_id'
      ProviderFlags = [pfInWhere]
      Size = 40
      Lookup = True
    end
    object StringField13: TStringField
      DisplayLabel = #24211#25151#30005#35805
      FieldKind = fkLookup
      FieldName = 'depot_tel'
      LookupDataSet = qryDepotInfo
      LookupKeyFields = 'id'
      LookupResultField = 'd_tel'
      KeyFields = 'depot_id'
      ProviderFlags = [pfInWhere]
      Size = 40
      Lookup = True
    end
    object StringField14: TStringField
      DisplayLabel = #24211#25151#22320#22336
      FieldKind = fkLookup
      FieldName = 'depot_address'
      LookupDataSet = qryDepotInfo
      LookupKeyFields = 'id'
      LookupResultField = 'd_address'
      KeyFields = 'depot_id'
      ProviderFlags = [pfInWhere]
      Size = 200
      Lookup = True
    end
    object IntegerField3: TIntegerField
      DisplayLabel = #35746#21333#29366#24577
      FieldName = 'state'
    end
    object IntegerField4: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
    object StringField15: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldKind = fkLookup
      FieldName = 'supplier_name'
      LookupDataSet = qrySupplierInfo
      LookupKeyFields = 'sn'
      LookupResultField = 'name'
      KeyFields = 'supplier_no'
      Size = 100
      Lookup = True
    end
    object qryEStOrdertax_rate: TFloatField
      DisplayLabel = #31246#29575
      FieldName = 'tax_rate'
    end
    object qryEStOrderstk_price: TFloatField
      DisplayLabel = #35746#21333#37329#39069
      FieldName = 'stk_price'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
    end
    object qryEStOrderstkp_num: TIntegerField
      DisplayLabel = #20135#21697#25968#37327
      FieldName = 'stkp_num'
    end
    object qryEStOrderstk_p_compose: TStringField
      DisplayLabel = #36827#20215#32452#25104
      FieldName = 'stk_p_compose'
      Size = 40
    end
  end
  object qrySCatInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_scat_vegaga')
    ReadOnly = True
    Left = 240
    Top = 208
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
    Left = 208
    Top = 208
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
  object qrySelectProduct: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_product_vegaga')
    ReadOnly = True
    Left = 416
    Top = 16
    object IntegerField12: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'p_id'
    end
    object StringField20: TStringField
      DisplayLabel = 'SKU'#21495
      FieldName = 'sku'
      Required = True
      Size = 40
    end
    object StringField21: TStringField
      DisplayLabel = #38144#21806#20195#30721
      FieldName = 'sn'
      Required = True
      Size = 40
    end
    object StringField22: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldName = 'ean'
      Size = 40
    end
    object StringField23: TStringField
      DisplayLabel = #21830#21697#26631#39064
      FieldName = 'title'
      Required = True
      Size = 200
    end
    object StringField24: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      Required = True
      Size = 200
    end
    object StringField25: TStringField
      DisplayLabel = #21517#31216#25340#38899
      FieldName = 'chineseN'
      Size = 200
    end
    object StringField26: TStringField
      DisplayLabel = #33521#25991#21517#31216
      FieldName = 'englishN'
      Size = 200
    end
    object StringField27: TStringField
      DisplayLabel = #21517#31216#21161#35760#31526
      FieldName = 'shortname'
    end
    object StringField28: TStringField
      DisplayLabel = #21830#21697#22270#29255
      FieldName = 'pic_path'
      Size = 200
    end
    object FloatField5: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#20215#26684
      FieldName = 'p_price'
      OnGetText = qryProductListp_priceGetText
      OnSetText = qryProductListp_priceSetText
      currency = True
    end
    object StringField29: TStringField
      DisplayLabel = #35797#29992#24202#23610#23544
      FieldName = 'p_size'
      Size = 100
    end
    object StringField30: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldName = 'p_color'
      Size = 100
    end
    object StringField31: TStringField
      DisplayLabel = #30446#24405#32534#30721
      FieldName = 'bcat_id'
      Size = 400
    end
    object StringField32: TStringField
      DisplayLabel = #38144#21806#32534#30721
      FieldName = 'scat_id'
      Size = 400
    end
    object FloatField6: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#31867#22411
      FieldName = 'type'
    end
    object FloatField7: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object StringField33: TStringField
      DisplayLabel = #21253#35013#35828#26126
      FieldName = 'brief'
      Size = 2000
    end
    object MemoField1: TMemoField
      DisplayLabel = #21830#21697#25551#36848
      FieldName = 'descript'
      BlobType = ftMemo
    end
    object FloatField8: TFloatField
      DisplayLabel = #21697#29260'ID'
      FieldName = 'brand_id'
    end
    object StringField34: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'brand_name'
      Size = 100
    end
    object StringField35: TStringField
      DisplayLabel = #21830#21697#20851#38190#23383
      FieldName = 'keyword'
      Size = 400
    end
    object StringField36: TStringField
      DisplayLabel = #26631#31614
      FieldName = 'tag'
      Size = 400
    end
    object FloatField9: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #21830#21697#31561#32423
      FieldName = 'score'
    end
    object StringField37: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldName = 'spec'
      Size = 200
    end
    object StringField38: TStringField
      DisplayLabel = #21830#21697#20135#22320
      FieldName = 'origin'
      Size = 40
    end
    object StringField39: TStringField
      DisplayLabel = #21830#21697#37325#37327
      FieldName = 'weight'
      Size = 40
    end
    object StringField40: TStringField
      DisplayLabel = #29983#20135#21378#23478
      FieldName = 'factory'
      Size = 40
    end
    object StringField41: TStringField
      DisplayLabel = #38144#21806#21333#20301
      FieldName = 'sale_unit'
      Size = 100
    end
    object StringField42: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'supplier_no'
      Size = 40
    end
    object StringField43: TStringField
      DisplayLabel = #21019#24314#32773
      FieldName = 'create_by'
      Size = 100
    end
    object DateField1: TDateField
      DisplayLabel = #21019#24314#26102#38388
      FieldName = 'create_date'
    end
    object StringField44: TStringField
      DisplayLabel = #26368#36817#26356#26032#32773
      FieldName = 'last_update_by'
      Size = 100
    end
    object DateField2: TDateField
      DisplayLabel = #26368#36817#26356#26032#26102#38388
      FieldName = 'last_update_date'
    end
    object FloatField10: TFloatField
      Alignment = taLeftJustify
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object StringField45: TStringField
      DisplayLabel = #20379#24212#21830#21517#31216
      FieldKind = fkLookup
      FieldName = 'supplierName'
      LookupDataSet = qrySupplierInfo
      LookupKeyFields = 'sn'
      LookupResultField = 'name'
      KeyFields = 'supplier_no'
      Size = 50
      Lookup = True
    end
    object StringField46: TStringField
      DisplayLabel = #25191#34892#26631#20934
      FieldName = 'execute_std'
      Size = 100
    end
    object qrySelectProductcolor: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldName = 'color'
      Size = 100
    end
  end
  object dsSelectProduct: TUniDataSource
    DataSet = qrySelectProduct
    Left = 456
    Top = 16
  end
  object dsBrandInfo: TUniDataSource
    DataSet = qryBrandInfo
    Left = 376
    Top = 208
  end
end
