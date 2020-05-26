object dmDepotCenter: TdmDepotCenter
  OldCreateOrder = False
  Left = 315
  Top = 306
  Height = 297
  Width = 613
  object qryDpList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_dp_dposition_vegaga order by dp_type asc')
    ReadOnly = True
    Left = 152
    Top = 16
    object qryDpListid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryDpListtype: TStringField
      DisplayLabel = #31867#21035
      FieldName = 'dp_type'
      Size = 10
    end
    object qryDpListcol: TStringField
      DisplayLabel = #36135#26550#21015
      FieldName = 'dp_col'
      Size = 10
    end
    object qryDpListnum: TStringField
      DisplayLabel = #36135#26550#21495
      FieldName = 'dp_num'
      Size = 10
    end
    object qryDpListlayer: TStringField
      DisplayLabel = #23618#21495
      FieldName = 'dp_layer'
      Size = 10
    end
    object qryDpListposition: TStringField
      DisplayLabel = #20301#32622#21495
      FieldName = 'dp_position'
      Size = 10
    end
    object qryDpListdpnum: TStringField
      DisplayLabel = #20179#20301#21495
      FieldName = 'dp_dpnum'
      Size = 50
    end
    object qryDpListsku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'dp_sku'
      Size = 40
    end
    object qryDpListrating: TIntegerField
      DisplayLabel = #39069#23450#37327
      FieldName = 'dp_rating'
    end
    object qryDpListdpuse: TIntegerField
      DisplayLabel = #20351#29992#37327
      FieldName = 'dp_dpuse'
    end
    object qryDpListremnant: TIntegerField
      DisplayLabel = #21097#20313#37327
      FieldName = 'dp_remnant'
    end
  end
  object dsDpList: TUniDataSource
    DataSet = qryDpList
    Left = 192
    Top = 16
  end
  object qryStOInDepot: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_stk_order_vegaga order by id desc')
    Left = 40
    Top = 72
    object qryStOInDepotid: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryStOInDepotstk_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'stk_no'
      Size = 40
    end
    object qryStOInDepotsupplier_no: TStringField
      DisplayLabel = #20379#24212#21830#32534#21495
      FieldName = 'supplier_no'
      Size = 40
    end
    object qryStOInDepotsupplier_contract: TStringField
      DisplayLabel = #20379#24212#21830#21512#21516#21495
      FieldName = 'supplier_contract'
      Size = 60
    end
    object qryStOInDepotsettlement_type: TStringField
      DisplayLabel = #32467#31639#24418#24335
      FieldName = 'settlement_type'
      Size = 40
    end
    object qryStOInDepotsettlement_cycle: TStringField
      DisplayLabel = #32467#31639#21608#26399
      FieldName = 'settlement_cycle'
      Size = 40
    end
    object qryStOInDepotcooperation_type: TStringField
      DisplayLabel = #21512#20316#26041#24335
      FieldName = 'cooperation_type'
      Size = 40
    end
    object qryStOInDepotinvoice_type: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldName = 'invoice_type'
      Size = 40
    end
    object qryStOInDepotdelivery_type: TStringField
      DisplayLabel = #36865#36135#26041#24335
      FieldName = 'delivery_type'
      Size = 40
    end
    object qryStOInDepotdelivery_price: TStringField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'delivery_price'
      Size = 40
    end
    object qryStOInDepoturgent_level: TStringField
      DisplayLabel = #32039#24613#31243#24230
      FieldName = 'urgent_level'
      Size = 40
    end
    object qryStOInDepotdepot_id: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = #24211#25151'ID'
      FieldName = 'depot_id'
    end
    object qryStOInDepotstate: TIntegerField
      DisplayLabel = #35746#21333#29366#24577
      FieldName = 'state'
    end
    object qryStOInDepotsys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
    object qryStOInDepottax_rate: TFloatField
      DisplayLabel = #31246#29575
      FieldName = 'tax_rate'
    end
    object qryStOInDepotstk_price: TFloatField
      DisplayLabel = #35746#21333#37329#39069
      FieldName = 'stk_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryStOInDepotstkp_num: TIntegerField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'stkp_num'
    end
    object qryStOInDepotstk_p_compose: TStringField
      DisplayLabel = #37319#36141#20215#32452#25104
      FieldName = 'stk_p_compose'
      Size = 40
    end
  end
  object dsStOInDepot: TUniDataSource
    DataSet = qryStOInDepot
    Left = 80
    Top = 72
  end
  object qryStOPInDepot: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_stk_order_product_vegaga')
    MasterSource = dsStOInDepot
    MasterFields = 'stk_no'
    DetailFields = 'stkorder_no'
    Options.DetailDelay = 1
    Left = 40
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'stk_no'
      end>
    object qryStOPInDepotid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryStOPInDepotstkorder_id: TIntegerField
      DisplayLabel = #37319#36141#21333'ID'
      FieldName = 'stkorder_id'
    end
    object qryStOPInDepotstkorder_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'stkorder_no'
      Required = True
      Size = 40
    end
    object qryStOPInDepotproduct_id: TIntegerField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'product_id'
      Required = True
    end
    object qryStOPInDepotproduct_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'product_sku'
      Required = True
      Size = 40
    end
    object qryStOPInDepotproduct_num: TIntegerField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'product_num'
    end
    object qryStOPInDepotproduct_cost: TFloatField
      DisplayLabel = #21830#21697#25104#26412
      FieldName = 'product_cost'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object qryStOPInDepotproduct_tax: TFloatField
      DisplayLabel = #21830#21697#31246
      FieldName = 'product_tax'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object qryStOPInDepotproduct_price: TFloatField
      DisplayLabel = #37319#36141#20215
      FieldName = 'product_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object qryStOPInDepotproduct_allprice: TFloatField
      DisplayLabel = #37319#36141#24635#20215
      FieldName = 'product_allprice'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object qryStOPInDepotproduct_weight: TStringField
      DisplayLabel = #24635#37325#37327
      FieldName = 'product_weight'
      Size = 40
    end
    object qryStOPInDepotproduct_indepotnum: TIntegerField
      DisplayLabel = #23454#38469#20837#24211#25968#37327
      FieldName = 'product_indepotnum'
    end
    object qryStOPInDepotstate: TIntegerField
      DisplayLabel = #21830#21697#29366#24577
      FieldName = 'state'
    end
    object qryStOPInDepotsys_status: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qryStOPInDepotproductname: TStringField
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
    object qryStOPInDepotp_size: TStringField
      DisplayLabel = #21830#21697#23610#23544
      FieldKind = fkLookup
      FieldName = 'pdt_size'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'p_size'
      KeyFields = 'product_id'
      Size = 50
      Lookup = True
    end
    object qryStOPInDepotpdt_ean: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldKind = fkLookup
      FieldName = 'pdt_ean'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'ean'
      KeyFields = 'product_id'
      Size = 50
      Lookup = True
    end
    object qryStOPInDepotpdt_spec: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldKind = fkLookup
      FieldName = 'pdt_spec'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'spec'
      KeyFields = 'product_id'
      Size = 50
      Lookup = True
    end
  end
  object dsStOPInDepot: TUniDataSource
    DataSet = qryStOPInDepot
    Left = 80
    Top = 112
  end
  object qryProductInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_product_vegaga')
    Left = 120
    Top = 72
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
    object qryProductInfop_price: TFloatField
      FieldName = 'p_price'
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
  object qrySkuLog: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_sku_log_vegaga')
    MasterSource = dsStOInDepot
    MasterFields = 'stk_no'
    DetailFields = 'sto_no'
    Options.DetailDelay = 1
    Left = 40
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'stk_no'
      end>
    object qrySkuLogID: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'ID'
    end
    object qrySkuLogsto_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'sto_no'
      Size = 40
    end
    object qrySkuLogso_no: TStringField
      DisplayLabel = #38144#21806#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qrySkuLoglot_id: TFloatField
      DisplayLabel = #25209#27425'ID'
      FieldName = 'lot_id'
    end
    object qrySkuLogp_id: TFloatField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qrySkuLogp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qrySkuLogsort_n: TFloatField
      DisplayLabel = #27969#27700#30721
      FieldName = 'sort_n'
    end
    object qrySkuLogwh_n: TStringField
      DisplayLabel = #20179#20301#21495
      FieldName = 'wh_n'
      Size = 50
    end
    object qrySkuLogentrance_date: TDateTimeField
      DisplayLabel = #20837#24211#26102#38388
      FieldName = 'entrance_date'
    end
    object qrySkuLogis_sales: TIntegerField
      DisplayLabel = #21830#21697#29366#24577
      FieldName = 'is_sales'
    end
    object qrySkuLogexit_date: TDateTimeField
      DisplayLabel = #20986#24211#26102#38388
      FieldName = 'exit_date'
    end
    object qrySkuLogopt_by: TStringField
      DisplayLabel = #25805#20316#32773
      FieldName = 'opt_by'
    end
    object qrySkuLogopt_date: TDateField
      DisplayLabel = #25805#20316#26102#38388
      FieldName = 'opt_date'
    end
    object qrySkuLogopt_ip: TStringField
      DisplayLabel = #25805#20316'IP'
      FieldName = 'opt_ip'
      Size = 30
    end
    object qrySkuLogremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 400
    end
    object qrySkuLogsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qrySkuLogproductName: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'productName'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'sku'
      LookupResultField = 'name'
      KeyFields = 'p_sku'
      Size = 100
      Lookup = True
    end
  end
  object dsSkuLog: TUniDataSource
    DataSet = qrySkuLog
    Left = 80
    Top = 152
  end
  object qryDpositionInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select concat(dp_dpnum,'#39'--'#39',if(dp_sku='#39#39','#39#31354#39',dp_sku)) as dpinfo,' +
        'dp_rating,dp_dpuse,dp_remnant,dp_sku'
      'from t_dp_dposition_vegaga'
      'order by dp_dpuse asc')
    Left = 152
    Top = 72
    object qryDpositionInfodpinfo: TStringField
      FieldName = 'dpinfo'
      ReadOnly = True
      Size = 94
    end
    object qryDpositionInfodp_rating: TIntegerField
      FieldName = 'dp_rating'
    end
    object qryDpositionInfodp_dpuse: TIntegerField
      FieldName = 'dp_dpuse'
    end
    object qryDpositionInfodp_remnant: TIntegerField
      FieldName = 'dp_remnant'
    end
    object qryDpositionInfodp_sku: TStringField
      FieldName = 'dp_sku'
      Size = 40
    end
  end
  object qryProductReserves: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_sku_vegaga where sn=:sku')
    Left = 184
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'sku'
        ParamType = ptInput
      end>
    object qryProductReservessku_id: TIntegerField
      FieldName = 'sku_id'
    end
    object qryProductReservesname: TStringField
      FieldName = 'name'
      Size = 200
    end
    object qryProductReservessn: TStringField
      FieldName = 'sn'
      Size = 40
    end
    object qryProductReservesp_id: TFloatField
      FieldName = 'p_id'
    end
    object qryProductReservesproperties: TStringField
      FieldName = 'properties'
      Size = 2000
    end
    object qryProductReservess_id: TFloatField
      FieldName = 's_id'
    end
    object qryProductReservesmarket_price: TFloatField
      FieldName = 'market_price'
    end
    object qryProductReservessale_price: TFloatField
      FieldName = 'sale_price'
    end
    object qryProductReservessale_limit_price: TFloatField
      FieldName = 'sale_limit_price'
    end
    object qryProductReservespromotion_price: TFloatField
      FieldName = 'promotion_price'
    end
    object qryProductReservesstock: TFloatField
      FieldName = 'stock'
    end
    object qryProductReservescan_sale_stock: TFloatField
      FieldName = 'can_sale_stock'
    end
    object qryProductReservesfreeze_stock: TFloatField
      FieldName = 'freeze_stock'
    end
    object qryProductReservessale_unit: TStringField
      FieldName = 'sale_unit'
    end
    object qryProductReservessys_status: TFloatField
      FieldName = 'sys_status'
    end
  end
  object qrySOOutDepot: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select * from t_so_sorder_vegaga where status in (3,4,5,9) order' +
        ' by so_id desc')
    Left = 256
    Top = 72
    object qrySOOutDepotso_id: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'so_id'
    end
    object qrySOOutDepotso_sn: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_sn'
      Required = True
      Size = 40
    end
    object qrySOOutDepotso_source: TStringField
      DisplayLabel = #35746#21333#26469#28304
      FieldName = 'so_source'
      Size = 200
    end
    object qrySOOutDepotsource_no: TStringField
      DisplayLabel = #26469#28304#21333#21495
      FieldName = 'source_no'
      Size = 100
    end
    object qrySOOutDepotm_id: TFloatField
      DisplayLabel = #20250#21592'ID'
      FieldName = 'm_id'
    end
    object qrySOOutDepottype: TFloatField
      DisplayLabel = #31867#22411
      FieldName = 'type'
    end
    object qrySOOutDepotstatus: TFloatField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object qrySOOutDepotpayment_id: TFloatField
      DisplayLabel = #25903#20184'ID'
      FieldName = 'payment_id'
    end
    object qrySOOutDepotsend_type: TStringField
      DisplayLabel = #36865#36135#26041#24335
      FieldName = 'send_type'
      Size = 200
    end
    object qrySOOutDepotpayment_type: TFloatField
      DisplayLabel = #25903#20184#26041#24335
      FieldName = 'payment_type'
    end
    object qrySOOutDepotpayment_status: TFloatField
      DisplayLabel = #25903#20184#29366#24577
      FieldName = 'payment_status'
    end
    object qrySOOutDepotsub_date: TDateField
      DisplayLabel = #25552#20132#26102#38388
      FieldName = 'sub_date'
    end
    object qrySOOutDepotconfirm_date: TDateField
      DisplayLabel = #30830#35748#26102#38388
      FieldName = 'confirm_date'
    end
    object qrySOOutDepotconfirm_by: TFloatField
      DisplayLabel = #30830#35748#20154
      FieldName = 'confirm_by'
    end
    object qrySOOutDepotinvoice_id: TFloatField
      DisplayLabel = #21457#31080'ID'
      FieldName = 'invoice_id'
    end
    object qrySOOutDepotsub_ip: TStringField
      DisplayLabel = #25552#20132'IP'
      FieldName = 'sub_ip'
      Size = 30
    end
    object qrySOOutDepotprovince: TFloatField
      DisplayLabel = #30465
      FieldName = 'province'
    end
    object qrySOOutDepotcity: TFloatField
      DisplayLabel = #24066
      FieldName = 'city'
    end
    object qrySOOutDepotdistrict: TFloatField
      DisplayLabel = #21306
      FieldName = 'district'
    end
    object qrySOOutDepotaddr: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'addr'
      Size = 200
    end
    object qrySOOutDepotso_remark: TStringField
      DisplayLabel = #35746#21333#22791#27880
      FieldName = 'so_remark'
      Size = 400
    end
    object qrySOOutDepotpost_code: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'post_code'
    end
    object qrySOOutDepotreceiver: TStringField
      DisplayLabel = #25910#20214#20154
      FieldName = 'receiver'
    end
    object qrySOOutDepottel: TStringField
      DisplayLabel = #22266#23450#30005#35805
      FieldName = 'tel'
      Size = 30
    end
    object qrySOOutDepotmobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'mobile'
      Size = 30
    end
    object qrySOOutDepotRECEIVE_EMAIL: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'RECEIVE_EMAIL'
      Size = 100
    end
    object qrySOOutDepotcost_price: TFloatField
      DisplayLabel = #25104#26412#24635#20215
      FieldName = 'cost_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepottax: TFloatField
      DisplayLabel = #31246#24635#20215
      FieldName = 'tax'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotp_amount: TFloatField
      DisplayLabel = #21830#21697#24635#20215
      FieldName = 'p_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotp_settle_amount: TFloatField
      DisplayLabel = #32467#31639#24635#39069
      FieldName = 'p_settle_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotship_amount: TFloatField
      DisplayLabel = #35746#21333#36816#36153
      FieldName = 'ship_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotship_settle_amount: TFloatField
      DisplayLabel = #32467#31639#36816#36153
      FieldName = 'ship_settle_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotamount: TFloatField
      DisplayLabel = #35746#21333#37329#39069
      FieldName = 'amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotcoupon_price: TFloatField
      DisplayLabel = #31036#21697#21345#37329#39069
      FieldName = 'coupon_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotpreferential_price: TFloatField
      DisplayLabel = #20248#24800#37329#39069
      FieldName = 'preferential_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotsettle_amount: TFloatField
      DisplayLabel = #32467#31639#37329#39069
      FieldName = 'settle_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotreturn_amount: TFloatField
      DisplayLabel = #36864#36135#37329#39069
      FieldName = 'return_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotfinal_amount: TFloatField
      DisplayLabel = #26368#32456#37329#39069
      FieldName = 'final_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOOutDepotship_order_number: TStringField
      DisplayLabel = #21457#36135#21333#21495
      FieldName = 'ship_order_number'
      Size = 100
    end
    object qrySOOutDepotscan_status: TFloatField
      DisplayLabel = #25195#25551#29366#24577
      FieldName = 'scan_status'
    end
    object qrySOOutDepotship_remark: TStringField
      DisplayLabel = #21457#36135#21333#22791#27880
      FieldName = 'ship_remark'
      Size = 2000
    end
    object qrySOOutDepotsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qrySOOutDepotsend_date: TStringField
      DisplayLabel = #36865#36135#26102#38388
      FieldName = 'send_date'
      Size = 200
    end
    object qrySOOutDepotexpress_id: TIntegerField
      FieldName = 'express_id'
    end
    object qrySOOutDepotexpress_name: TStringField
      FieldKind = fkLookup
      FieldName = 'express_name'
      LookupDataSet = qryExpInfo
      LookupKeyFields = 'id'
      LookupResultField = 'express_name'
      KeyFields = 'express_id'
      Size = 50
      Lookup = True
    end
    object qrySOOutDepotprovince_name: TStringField
      DisplayLabel = #30465
      FieldKind = fkLookup
      FieldName = 'province_name'
      LookupDataSet = qryAreaInfo
      LookupKeyFields = 'STATESID'
      LookupResultField = 'ADDRESSNAME'
      KeyFields = 'province'
      Lookup = True
    end
    object qrySOOutDepotcity_name: TStringField
      DisplayLabel = #24066
      FieldKind = fkLookup
      FieldName = 'city_name'
      LookupDataSet = qryAreaInfo
      LookupKeyFields = 'CITYID'
      LookupResultField = 'ADDRESSNAME'
      KeyFields = 'city'
      Lookup = True
    end
    object qrySOOutDepotdistrict_name: TStringField
      DisplayLabel = #21306
      FieldKind = fkLookup
      FieldName = 'district_name'
      LookupDataSet = qryAreaInfo
      LookupKeyFields = 'POSTCODE'
      LookupResultField = 'ADDRESSNAME'
      KeyFields = 'district'
      Lookup = True
    end
  end
  object dsSOOutDepot: TUniDataSource
    DataSet = qrySOOutDepot
    Left = 296
    Top = 72
  end
  object qrySOPOutDepot: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_sorder_item_vegaga')
    MasterSource = dsSOOutDepot
    MasterFields = 'so_sn'
    DetailFields = 'so_no'
    ReadOnly = True
    Options.DetailDelay = 1
    Left = 256
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'so_sn'
      end>
    object qrySOPOutDepotso_item_id: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = #35746#21333#39033'ID'
      FieldName = 'so_item_id'
    end
    object qrySOPOutDepotso_id: TFloatField
      DisplayLabel = #35746#21333'ID'
      FieldName = 'so_id'
    end
    object qrySOPOutDepotso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qrySOPOutDepotsku_id: TFloatField
      DisplayLabel = 'SKUID'
      FieldName = 'sku_id'
    end
    object qrySOPOutDepotp_id: TFloatField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qrySOPOutDepotp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qrySOPOutDepotp_sn: TStringField
      DisplayLabel = #21830#21697#32534#21495
      FieldName = 'p_sn'
      Size = 40
    end
    object qrySOPOutDepotp_ean: TStringField
      DisplayLabel = #21830#21697#26465#24418#30721
      FieldName = 'p_ean'
      Size = 40
    end
    object qrySOPOutDepotp_number: TFloatField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'p_number'
    end
    object qrySOPOutDepotp_cost_price: TFloatField
      DisplayLabel = #21830#21697#25104#26412#20215
      FieldName = 'p_cost_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOPOutDepottax: TFloatField
      DisplayLabel = #21830#21697#31246
      FieldName = 'tax'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOPOutDepotsale_price: TFloatField
      DisplayLabel = #38144#21806#21333#20215
      FieldName = 'sale_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOPOutDepotsale_amount: TFloatField
      DisplayLabel = #38144#21806#24635#20215
      FieldName = 'sale_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qrySOPOutDepotp_weight: TFloatField
      DisplayLabel = #24635#37325#37327
      FieldName = 'p_weight'
    end
    object qrySOPOutDepotsource: TStringField
      DisplayLabel = #35746#36141#26469#28304
      FieldName = 'source'
      Size = 40
    end
    object qrySOPOutDepotreal_out_number: TFloatField
      DisplayLabel = #23454#38469#20986#24211#25968#37327
      FieldName = 'real_out_number'
    end
    object qrySOPOutDepotsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object qrySOPOutDepotpdt_name: TStringField
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
  object dsSOPOutDepot: TUniDataSource
    DataSet = qrySOPOutDepot
    Left = 296
    Top = 112
  end
  object qrySkuOutLog: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_sku_log_vegaga')
    MasterSource = dsSOOutDepot
    MasterFields = 'so_sn'
    DetailFields = 'so_no'
    Options.DetailDelay = 1
    Left = 256
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'so_sn'
      end>
    object IntegerField1: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'ID'
    end
    object StringField1: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'sto_no'
      Size = 40
    end
    object StringField2: TStringField
      DisplayLabel = #38144#21806#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object FloatField1: TFloatField
      DisplayLabel = #25209#27425'ID'
      FieldName = 'lot_id'
    end
    object FloatField2: TFloatField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object StringField3: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object FloatField3: TFloatField
      DisplayLabel = #27969#27700#30721
      FieldName = 'sort_n'
    end
    object StringField4: TStringField
      DisplayLabel = #20179#20301#21495
      FieldName = 'wh_n'
      Size = 50
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #20837#24211#26102#38388
      FieldName = 'entrance_date'
    end
    object qrySkuOutLogis_sales: TIntegerField
      DisplayLabel = #21830#21697#29366#24577
      FieldName = 'is_sales'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #20986#24211#26102#38388
      FieldName = 'exit_date'
    end
    object StringField6: TStringField
      DisplayLabel = #25805#20316#32773
      FieldName = 'opt_by'
    end
    object DateField1: TDateField
      DisplayLabel = #25805#20316#26102#38388
      FieldName = 'opt_date'
    end
    object StringField7: TStringField
      DisplayLabel = #25805#20316'IP'
      FieldName = 'opt_ip'
      Size = 30
    end
    object StringField8: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 400
    end
    object FloatField4: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object StringField9: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'productName'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'name'
      KeyFields = 'p_id'
      Size = 100
      Lookup = True
    end
  end
  object dsSkuOutLog: TUniDataSource
    DataSet = qrySkuOutLog
    Left = 296
    Top = 152
  end
  object qryPOutOpt: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tssiv.so_no sono,tssiv.p_id,tssiv.p_sku,tssiv.p_number,ts' +
        'siv.real_out_number,tpslv.ID,tpslv.sto_no,tpslv.sort_n,tpslv.wh_' +
        'n '
      'from t_so_sorder_item_vegaga tssiv '
      'left join t_p_sku_log_vegaga tpslv on tssiv.p_id=tpslv.p_id'
      
        'where tpslv.is_sales=:pstate and tpslv.sort_n=:sortNo and tssiv.' +
        'so_no=:sono')
    ReadOnly = True
    Left = 256
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pstate'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sortNo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'sono'
        ParamType = ptInput
      end>
    object qryPOutOptID: TIntegerField
      DisplayLabel = #26085#24535'ID'
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryPOutOptsono: TStringField
      DisplayLabel = #38144#21806#35746#21333
      FieldName = 'sono'
      Size = 40
    end
    object qryPOutOptsto_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'sto_no'
      ReadOnly = True
      Size = 40
    end
    object qryPOutOptp_id: TFloatField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qryPOutOptp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qryPOutOptp_number: TFloatField
      DisplayLabel = #35746#36141#25968#37327
      FieldName = 'p_number'
    end
    object qryPOutOptreal_out_number: TFloatField
      DisplayLabel = #23454#38469#20986#24211#25968#37327
      FieldName = 'real_out_number'
    end
    object qryPOutOptsort_n: TFloatField
      DisplayLabel = #27969#27700#21495
      FieldName = 'sort_n'
      ReadOnly = True
    end
    object qryPOutOptwh_n: TStringField
      DisplayLabel = #20179#20301#21495
      FieldName = 'wh_n'
      ReadOnly = True
      Size = 50
    end
    object qryPOutOptp_name: TStringField
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
  object dsPOutOpt: TUniDataSource
    DataSet = qryPOutOpt
    Left = 296
    Top = 192
  end
  object qryExpInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_e_express_vegaga')
    FetchRows = 1000
    ReadOnly = True
    Left = 152
    Top = 152
    object qryExpInfoid: TLargeintField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryExpInfoexpress_no: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'express_no'
      Required = True
      Size = 40
    end
    object qryExpInfoexpress_name: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'express_name'
      Size = 60
    end
    object qryExpInfoexpress_tel: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'express_tel'
      Size = 40
    end
    object qryExpInfoexpress_mobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'express_mobile'
      Size = 40
    end
    object qryExpInfoexpress_fax: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'express_fax'
      Size = 40
    end
    object qryExpInfoexpressex_mail: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'expressex_mail'
      Size = 100
    end
    object qryExpInfoexpress_addr: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'express_addr'
      Size = 400
    end
    object qryExpInfoexpress_post: TFloatField
      DisplayLabel = #37038#32534
      FieldName = 'express_post'
    end
    object qryExpInfoexpress_website: TStringField
      DisplayLabel = #32593#22336
      FieldName = 'express_website'
      Size = 100
    end
    object qryExpInfoexpress_msn: TStringField
      DisplayLabel = 'MSN'
      FieldName = 'express_msn'
      Size = 40
    end
    object qryExpInfoexpress_qq: TStringField
      DisplayLabel = 'QQ'
      FieldName = 'express_qq'
      Size = 40
    end
    object qryExpInfoexpress_create: TDateField
      DisplayLabel = #25104#31435#26085#26399
      FieldName = 'express_create'
    end
    object qryExpInfoexpress_info: TMemoField
      DisplayLabel = #31616#20171
      FieldName = 'express_info'
      BlobType = ftMemo
    end
    object qryExpInfoexpress_interface: TStringField
      DisplayLabel = #26159#21542#25903#25345#25509#21475
      FieldName = 'express_interface'
      FixedChar = True
      Size = 2
    end
    object qryExpInfoexpress_model: TStringField
      DisplayLabel = #38754#21333#27169#26495
      FieldName = 'express_model'
      Size = 100
    end
    object qryExpInfocontract_linkmen: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154
      FieldName = 'contract_linkmen'
      Size = 60
    end
    object qryExpInfocontract_tel: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154#30005#35805
      FieldName = 'contract_tel'
      Size = 40
    end
    object qryExpInfocontract_mobile: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154#31227#21160#30005#35805
      FieldName = 'contract_mobile'
      Size = 40
    end
    object qryExpInfocontract_email: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154#30005#23376#37038#20214
      FieldName = 'contract_email'
      Size = 100
    end
    object qryExpInfocontract_fax: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154#20256#30495
      FieldName = 'contract_fax'
      Size = 40
    end
    object qryExpInfocontract_msn: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154'MSN'
      FieldName = 'contract_msn'
      Size = 40
    end
    object qryExpInfocontract_qq: TStringField
      DisplayLabel = #21512#21516#32852#31995#20154'QQ'
      FieldName = 'contract_qq'
      Size = 40
    end
    object qryExpInfobusiness_linkmen: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154
      FieldName = 'business_linkmen'
      Size = 60
    end
    object qryExpInfobusiness_tel: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154#30005#35805
      FieldName = 'business_tel'
      Size = 40
    end
    object qryExpInfobusiness_mobile: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154#31227#21160#30005#35805
      FieldName = 'business_mobile'
      Size = 40
    end
    object qryExpInfobusiness_fax: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154#20256#30495
      FieldName = 'business_fax'
      Size = 100
    end
    object qryExpInfobusiness_email: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154#30005#23376#37038#20214
      FieldName = 'business_email'
      Size = 100
    end
    object qryExpInfobusiness_msn: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154'MSN'
      FieldName = 'business_msn'
      Size = 40
    end
    object qryExpInfobusiness_qq: TStringField
      DisplayLabel = #19994#21153#32852#31995#20154'QQ'
      FieldName = 'business_qq'
      Size = 40
    end
    object qryExpInfoaccounts_linkmen: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154
      FieldName = 'accounts_linkmen'
      Size = 60
    end
    object qryExpInfoaccounts_tel: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154#30005#35805
      FieldName = 'accounts_tel'
      Size = 40
    end
    object qryExpInfoaccounts_mobile: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154#31227#21160#30005#35805
      FieldName = 'accounts_mobile'
      Size = 40
    end
    object qryExpInfoaccounts_email: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154#30005#23376#37038#20214
      FieldName = 'accounts_email'
      Size = 100
    end
    object qryExpInfoaccounts_fax: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154#20256#30495
      FieldName = 'accounts_fax'
      Size = 40
    end
    object qryExpInfoaccounts_msn: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154'MSN'
      FieldName = 'accounts_msn'
      Size = 40
    end
    object qryExpInfoaccounts_qq: TStringField
      DisplayLabel = #32467#31639#32852#31995#20154'QQ'
      FieldName = 'accounts_qq'
      Size = 40
    end
  end
  object dsExpInfo: TUniDataSource
    DataSet = qryExpInfo
    Left = 192
    Top = 152
  end
  object qrySOOD: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select * from t_so_sorder_vegaga where status in (3,4,9) and shi' +
        'p_order_number=:shipno')
    Left = 152
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'shipno'
        ParamType = ptInput
      end>
    object IntegerField2: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'so_id'
    end
    object StringField5: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_sn'
      Required = True
      Size = 40
    end
    object StringField10: TStringField
      DisplayLabel = #35746#21333#26469#28304
      FieldName = 'so_source'
      Size = 200
    end
    object StringField11: TStringField
      DisplayLabel = #26469#28304#21333#21495
      FieldName = 'source_no'
      Size = 100
    end
    object FloatField5: TFloatField
      DisplayLabel = #20250#21592'ID'
      FieldName = 'm_id'
    end
    object FloatField6: TFloatField
      DisplayLabel = #31867#22411
      FieldName = 'type'
    end
    object FloatField7: TFloatField
      DisplayLabel = #29366#24577
      FieldName = 'status'
    end
    object FloatField8: TFloatField
      DisplayLabel = #25903#20184'ID'
      FieldName = 'payment_id'
    end
    object StringField12: TStringField
      DisplayLabel = #36865#36135#26041#24335
      FieldName = 'send_type'
      Size = 200
    end
    object FloatField9: TFloatField
      DisplayLabel = #25903#20184#26041#24335
      FieldName = 'payment_type'
    end
    object FloatField10: TFloatField
      DisplayLabel = #25903#20184#29366#24577
      FieldName = 'payment_status'
    end
    object DateField2: TDateField
      DisplayLabel = #25552#20132#26102#38388
      FieldName = 'sub_date'
    end
    object DateField3: TDateField
      DisplayLabel = #30830#35748#26102#38388
      FieldName = 'confirm_date'
    end
    object FloatField11: TFloatField
      DisplayLabel = #30830#35748#20154
      FieldName = 'confirm_by'
    end
    object FloatField12: TFloatField
      DisplayLabel = #21457#31080'ID'
      FieldName = 'invoice_id'
    end
    object StringField13: TStringField
      DisplayLabel = #25552#20132'IP'
      FieldName = 'sub_ip'
      Size = 30
    end
    object FloatField13: TFloatField
      DisplayLabel = #30465
      FieldName = 'province'
    end
    object FloatField14: TFloatField
      DisplayLabel = #24066
      FieldName = 'city'
    end
    object FloatField15: TFloatField
      DisplayLabel = #21306
      FieldName = 'district'
    end
    object StringField14: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'addr'
      Size = 200
    end
    object StringField15: TStringField
      DisplayLabel = #35746#21333#22791#27880
      FieldName = 'so_remark'
      Size = 400
    end
    object StringField16: TStringField
      DisplayLabel = #37038#32534
      FieldName = 'post_code'
    end
    object StringField17: TStringField
      DisplayLabel = #25910#20214#20154
      FieldName = 'receiver'
    end
    object StringField18: TStringField
      DisplayLabel = #22266#23450#30005#35805
      FieldName = 'tel'
      Size = 30
    end
    object StringField19: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'mobile'
      Size = 30
    end
    object StringField20: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'RECEIVE_EMAIL'
      Size = 100
    end
    object FloatField16: TFloatField
      DisplayLabel = #25104#26412#24635#20215
      FieldName = 'cost_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object FloatField17: TFloatField
      DisplayLabel = #31246#24635#20215
      FieldName = 'tax'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object FloatField18: TFloatField
      DisplayLabel = #38144#21806#24635#20215
      FieldName = 'p_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object FloatField19: TFloatField
      DisplayLabel = #32467#31639#24635#39069
      FieldName = 'p_settle_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object FloatField20: TFloatField
      DisplayLabel = #36816#36153
      FieldName = 'ship_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object FloatField21: TFloatField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'ship_settle_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object FloatField22: TFloatField
      DisplayLabel = #35746#21333#37329#39069
      FieldName = 'amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object FloatField23: TFloatField
      DisplayLabel = #32467#31639#37329#39069
      FieldName = 'settle_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
      currency = True
    end
    object FloatField24: TFloatField
      DisplayLabel = #36864#36135#37329#39069
      FieldName = 'return_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object FloatField25: TFloatField
      DisplayLabel = #26368#32456#37329#39069
      FieldName = 'final_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object StringField21: TStringField
      DisplayLabel = #21457#36135#21333#21495
      FieldName = 'ship_order_number'
      Size = 100
    end
    object FloatField26: TFloatField
      DisplayLabel = #25195#25551#29366#24577
      FieldName = 'scan_status'
    end
    object StringField22: TStringField
      DisplayLabel = #21457#36135#21333#22791#27880
      FieldName = 'ship_remark'
      Size = 2000
    end
    object FloatField27: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
    object StringField23: TStringField
      DisplayLabel = #36865#36135#26102#38388
      FieldName = 'send_date'
      Size = 200
    end
    object IntegerField3: TIntegerField
      FieldName = 'express_id'
    end
    object StringField24: TStringField
      DisplayLabel = #24555#36882#21517#31216
      FieldKind = fkLookup
      FieldName = 'express_name'
      LookupDataSet = qryExpInfo
      LookupKeyFields = 'id'
      LookupResultField = 'express_name'
      KeyFields = 'express_id'
      Size = 50
      Lookup = True
    end
  end
  object dsSOOD: TUniDataSource
    DataSet = qrySOOD
    Left = 192
    Top = 208
  end
  object qryROrderList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_return_vegaga where state in (2,3)')
    ReadOnly = True
    Left = 376
    Top = 72
    object qryROrderListid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryROrderListreturn_no: TStringField
      DisplayLabel = #36864#36135#21333#32534#21495
      FieldName = 'return_no'
      Size = 40
    end
    object qryROrderListso_id: TIntegerField
      DisplayLabel = #35746#21333'ID'
      FieldName = 'so_id'
    end
    object qryROrderListso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qryROrderListso_source: TStringField
      DisplayLabel = #35746#21333#26469#28304
      FieldName = 'so_source'
      Size = 100
    end
    object qryROrderListso_source_no: TStringField
      DisplayLabel = #26469#28304#32534#21495
      FieldName = 'so_source_no'
      Size = 40
    end
    object qryROrderListmem_id: TIntegerField
      DisplayLabel = #20250#21592'ID'
      FieldName = 'mem_id'
    end
    object qryROrderListstate: TIntegerField
      DisplayLabel = #36864#36135#21333#29366#24577
      FieldName = 'state'
    end
    object qryROrderListsubmit_date: TDateTimeField
      DisplayLabel = #25552#20132#26085#26399
      FieldName = 'submit_date'
    end
    object qryROrderListconfirm_date: TDateTimeField
      DisplayLabel = #30830#35748#26085#26399
      FieldName = 'confirm_date'
    end
    object qryROrderListconfirm_by: TStringField
      DisplayLabel = #30830#35748#20154
      FieldName = 'confirm_by'
      Size = 100
    end
    object qryROrderListso_memo: TStringField
      DisplayLabel = #35746#21333#22791#27880
      FieldName = 'so_memo'
      Size = 400
    end
    object qryROrderListreturn_men: TStringField
      DisplayLabel = #36864#36135#20154
      FieldName = 'return_men'
      Size = 100
    end
    object qryROrderListreturn_tel: TStringField
      DisplayLabel = #22266#23450#30005#35805
      FieldName = 'return_tel'
      Size = 40
    end
    object qryROrderListreturn_mobile: TStringField
      DisplayLabel = #31227#21160#30005#35805
      FieldName = 'return_mobile'
      Size = 40
    end
    object qryROrderListreturn_email: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'return_email'
      Size = 100
    end
    object qryROrderListreturn_amount: TFloatField
      DisplayLabel = #36864#36135#21830#21697#24635#20215
      FieldName = 'return_amount'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryROrderListreturn_price: TFloatField
      DisplayLabel = #36864#36135#36816#36153
      FieldName = 'return_price'
      OnGetText = priceGetText
      OnSetText = priceSetText
    end
    object qryROrderListreturn_time: TDateTimeField
      DisplayLabel = #36864#36135#26102#38388
      FieldName = 'return_time'
    end
    object qryROrderListreturn_settleup: TFloatField
      DisplayLabel = #36816#36153#32467#31639
      FieldName = 'return_settleup'
    end
    object qryROrderListsys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
  end
  object dsROrderList: TUniDataSource
    DataSet = qryROrderList
    Left = 416
    Top = 72
  end
  object qryROProductList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_so_return_item_vegaga')
    MasterSource = dsROrderList
    MasterFields = 'return_no'
    DetailFields = 'rso_no'
    ReadOnly = True
    Options.DetailDelay = 1
    Left = 376
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'return_no'
      end>
    object qryROProductListid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryROProductListrso_id: TIntegerField
      DisplayLabel = #36864#36135#21333'ID'
      FieldName = 'rso_id'
    end
    object qryROProductListrso_no: TStringField
      DisplayLabel = #36864#36135#21333#32534#21495
      FieldName = 'rso_no'
      Size = 40
    end
    object qryROProductListp_id: TIntegerField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qryROProductListp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qryROProductListp_num: TIntegerField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'p_num'
    end
    object qryROProductListp_price: TFloatField
      DisplayLabel = #21830#21697#21333#20215
      FieldName = 'p_price'
    end
    object qryROProductListp_amount: TFloatField
      DisplayLabel = #21830#21697#24635#20215
      FieldName = 'p_amount'
    end
    object qryROProductListreal_input_num: TIntegerField
      DisplayLabel = #23454#38469#20837#24211#25968#37327
      FieldName = 'real_input_num'
    end
    object qryROProductListstate: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'state'
    end
    object qryROProductListsys_state: TIntegerField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_state'
    end
    object qryROProductListp_name: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'p_name'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'name'
      KeyFields = 'p_id'
      Size = 50
      Lookup = True
    end
    object qryROProductListp_size: TStringField
      DisplayLabel = #21830#21697#23610#23544
      FieldKind = fkLookup
      FieldName = 'p_size'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'p_size'
      KeyFields = 'p_id'
      Size = 50
      Lookup = True
    end
    object qryROProductListp_color: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldKind = fkLookup
      FieldName = 'p_color'
      LookupDataSet = qryProductInfo
      LookupKeyFields = 'p_id'
      LookupResultField = 'p_color'
      KeyFields = 'p_id'
      Size = 50
      Lookup = True
    end
  end
  object dsROProductList: TUniDataSource
    DataSet = qryROProductList
    Left = 416
    Top = 112
  end
  object qryStockStat: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tpsv.sn,tpsv.stock,tpsv.can_sale_stock,tpsv.freeze_stock,' +
        'tppv.name,tppv.brand_name,tppv.ean,tppv.spec,tppv.color,tppv.p_s' +
        'ize'
      'from t_p_sku_vegaga tpsv'
      'left join t_p_product_vegaga tppv on tpsv.sn=tppv.sku')
    ReadOnly = True
    Left = 496
    Top = 72
    object qryStockStatsn: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'sn'
      Size = 40
    end
    object qryStockStatstock: TFloatField
      DisplayLabel = #24211#23384#37327
      FieldName = 'stock'
    end
    object qryStockStatcan_sale_stock: TFloatField
      DisplayLabel = #21487#38144#21806#37327
      FieldName = 'can_sale_stock'
    end
    object qryStockStatfreeze_stock: TFloatField
      DisplayLabel = #20923#32467#37327
      FieldName = 'freeze_stock'
    end
    object qryStockStatname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      ReadOnly = True
      Size = 200
    end
    object qryStockStatbrand_name: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'brand_name'
      ReadOnly = True
      Size = 100
    end
    object qryStockStatean: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldName = 'ean'
      ReadOnly = True
      Size = 40
    end
    object qryStockStatspec: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldName = 'spec'
      ReadOnly = True
      Size = 200
    end
    object qryStockStatcolor: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldName = 'color'
      ReadOnly = True
      Size = 100
    end
    object qryStockStatp_size: TStringField
      DisplayLabel = #21830#21697#23610#23544
      FieldName = 'p_size'
      ReadOnly = True
      Size = 100
    end
  end
  object dsStockStat: TUniDataSource
    DataSet = qryStockStat
    Left = 536
    Top = 72
  end
  object qryGoodsList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tssiv.p_sku,SUM(tssiv.p_number) as p_number,tppv.name,tpp' +
        'v.brand_name,tppv.ean,tppv.spec,tppv.color,tppv.p_size,tddv.dp_d' +
        'pnum'
      'from t_so_sorder_vegaga tssv'
      
        'left join t_so_sorder_item_vegaga tssiv on tssv.so_id=tssiv.so_i' +
        'd'
      'left join t_p_product_vegaga tppv on tssiv.p_sku=tppv.sku'
      'left join t_dp_dposition_vegaga tddv on tssiv.p_sku=tddv.dp_sku'
      'group by tssiv.p_sku'
      'order by tddv.dp_dpnum asc')
    ReadOnly = True
    Left = 376
    Top = 192
    object qryGoodsListp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      ReadOnly = True
      Size = 40
    end
    object qryGoodsListp_number: TFloatField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'p_number'
      ReadOnly = True
    end
    object qryGoodsListname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      ReadOnly = True
      Size = 200
    end
    object qryGoodsListbrand_name: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'brand_name'
      ReadOnly = True
      Size = 100
    end
    object qryGoodsListean: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldName = 'ean'
      ReadOnly = True
      Size = 40
    end
    object qryGoodsListspec: TStringField
      DisplayLabel = #21830#21697#35268#26684
      FieldName = 'spec'
      ReadOnly = True
      Size = 200
    end
    object qryGoodsListcolor: TStringField
      DisplayLabel = #21830#21697#39068#33394
      FieldName = 'color'
      ReadOnly = True
      Size = 100
    end
    object qryGoodsListp_size: TStringField
      DisplayLabel = #21830#21697#23610#23544
      FieldName = 'p_size'
      ReadOnly = True
      Size = 100
    end
    object qryGoodsListdp_dpnum: TStringField
      DisplayLabel = #20179#20301#21495
      FieldName = 'dp_dpnum'
      ReadOnly = True
      Size = 50
    end
  end
  object dsGoodsList: TUniDataSource
    DataSet = qryGoodsList
    Left = 416
    Top = 192
  end
  object qryIDOPrint: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select distinct tsopv.id,tsopv.stkorder_no,tsopv.product_sku,tso' +
        'pv.product_num,tsopv.memo,tpslv.wh_n,tppv.name,tppv.brand_name,t' +
        'ppv.ean,tppv.p_size'
      'from t_stk_order_product_vegaga tsopv'
      
        'inner join t_p_sku_log_vegaga tpslv on tsopv.stkorder_no=tpslv.s' +
        'to_no and tsopv.product_sku=tpslv.p_sku'
      'inner join t_p_product_vegaga tppv on tsopv.product_sku=tppv.sku'
      'order by tpslv.wh_n asc')
    MasterSource = dsStOInDepot
    MasterFields = 'stk_no'
    DetailFields = 'stkorder_no'
    ReadOnly = True
    Left = 40
    Top = 32
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'stk_no'
      end>
    object qryIDOPrintid: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'id'
    end
    object qryIDOPrintstkorder_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'stkorder_no'
      Required = True
      Size = 40
    end
    object qryIDOPrintproduct_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'product_sku'
      Required = True
      Size = 40
    end
    object qryIDOPrintmemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'memo'
      Size = 200
    end
    object qryIDOPrintwh_n: TStringField
      DisplayLabel = #20179#20301#21495
      FieldName = 'wh_n'
      ReadOnly = True
      Size = 50
    end
    object qryIDOPrintname: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'name'
      ReadOnly = True
      Required = True
      Size = 200
    end
    object qryIDOPrintbrand_name: TStringField
      DisplayLabel = #21697#29260#21517#31216
      FieldName = 'brand_name'
      ReadOnly = True
      Size = 100
    end
    object qryIDOPrintean: TStringField
      DisplayLabel = #21830#21697#36135#21495
      FieldName = 'ean'
      ReadOnly = True
      Size = 40
    end
    object qryIDOPrintp_size: TStringField
      DisplayLabel = #21830#21697#23610#23544
      FieldName = 'p_size'
      ReadOnly = True
      Size = 100
    end
    object qryIDOPrintproduct_num: TIntegerField
      DisplayLabel = #21830#21697#25968#37327
      FieldName = 'product_num'
    end
  end
  object qrySLList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from t_p_sku_log_vegaga')
    MasterSource = dsStockStat
    MasterFields = 'sn'
    DetailFields = 'p_sku'
    ReadOnly = True
    Left = 496
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sn'
      end>
    object qrySLListID: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'ID'
    end
    object qrySLListso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      Size = 40
    end
    object qrySLListsto_no: TStringField
      DisplayLabel = #37319#36141#21333#32534#21495
      FieldName = 'sto_no'
      Size = 40
    end
    object qrySLListlot_id: TFloatField
      FieldName = 'lot_id'
    end
    object qrySLListp_id: TFloatField
      DisplayLabel = #21830#21697'ID'
      FieldName = 'p_id'
    end
    object qrySLListp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qrySLListsort_n: TFloatField
      DisplayLabel = #27969#27700#30721
      FieldName = 'sort_n'
    end
    object qrySLListwh_n: TStringField
      DisplayLabel = #20179#20301#21495
      FieldName = 'wh_n'
      Size = 50
    end
    object qrySLListentrance_date: TDateTimeField
      DisplayLabel = #20837#24211#26102#38388
      FieldName = 'entrance_date'
    end
    object qrySLListexit_date: TDateTimeField
      DisplayLabel = #20986#24211#26102#38388
      FieldName = 'exit_date'
    end
    object qrySLListis_sales: TIntegerField
      DisplayLabel = #29366#24577
      FieldName = 'is_sales'
    end
    object qrySLListopt_by: TStringField
      FieldName = 'opt_by'
    end
    object qrySLListopt_date: TDateField
      FieldName = 'opt_date'
    end
    object qrySLListopt_ip: TStringField
      FieldName = 'opt_ip'
      Size = 30
    end
    object qrySLListremark: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'remark'
      Size = 400
    end
    object qrySLListsys_status: TFloatField
      DisplayLabel = #31995#32479#29366#24577
      FieldName = 'sys_status'
    end
  end
  object dsSLList: TUniDataSource
    DataSet = qrySLList
    Left = 536
    Top = 128
  end
  object qryROPSkuLogList: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      
        'select tpslv.ID,tpslv.p_sku,tpslv.p_id,tpslv.sort_n,tpslv.wh_n,t' +
        'pslv.is_sales,tsrv.so_no,tsrv.id as ro_id'
      'from t_p_sku_log_vegaga tpslv'
      'inner join t_so_return_vegaga tsrv on tpslv.so_no=tsrv.so_no')
    MasterSource = dsROProductList
    MasterFields = 'p_sku'
    DetailFields = 'p_sku'
    Left = 376
    Top = 152
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_sku'
      end>
    object qryROPSkuLogListID: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'ID'
    end
    object qryROPSkuLogListp_sku: TStringField
      DisplayLabel = #21830#21697'SKU'
      FieldName = 'p_sku'
      Size = 40
    end
    object qryROPSkuLogListsort_n: TFloatField
      DisplayLabel = #27969#27700#30721
      FieldName = 'sort_n'
    end
    object qryROPSkuLogListwh_n: TStringField
      DisplayLabel = #20179#20301#21495
      FieldName = 'wh_n'
      Size = 50
    end
    object qryROPSkuLogListis_sales: TIntegerField
      DisplayLabel = #21830#21697#24211#23384#29366#24577
      FieldName = 'is_sales'
    end
    object qryROPSkuLogListso_no: TStringField
      DisplayLabel = #35746#21333#32534#21495
      FieldName = 'so_no'
      ReadOnly = True
      Size = 40
    end
    object qryROPSkuLogListp_id: TFloatField
      FieldName = 'p_id'
    end
    object qryROPSkuLogListro_id: TIntegerField
      FieldName = 'ro_id'
      ReadOnly = True
    end
  end
  object dsROPSkuLogList: TUniDataSource
    DataSet = qryROPSkuLogList
    Left = 416
    Top = 152
  end
  object qryAreaInfo: TUniQuery
    Connection = frmCommonDm.Connection
    SQL.Strings = (
      'select * from Sys_Area')
    ReadOnly = True
    Left = 216
    Top = 72
    object qryAreaInfoID: TFloatField
      FieldName = 'ID'
      Required = True
    end
    object qryAreaInfoPOSTCODE: TStringField
      FieldName = 'POSTCODE'
      Required = True
      Size = 40
    end
    object qryAreaInfoSTATESID: TStringField
      FieldName = 'STATESID'
      Required = True
      Size = 40
    end
    object qryAreaInfoCITYID: TStringField
      FieldName = 'CITYID'
      Required = True
      Size = 40
    end
    object qryAreaInfoADDRESSNAME: TStringField
      FieldName = 'ADDRESSNAME'
      Size = 100
    end
    object qryAreaInfoADDRESSLEVEL: TStringField
      FieldName = 'ADDRESSLEVEL'
      Size = 100
    end
  end
end
