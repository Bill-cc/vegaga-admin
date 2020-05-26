unit untDepotCenterDM;

interface

uses
  SysUtils, Classes, DB, DBAccess, Uni, MemDS;

type
  TdmDepotCenter = class(TDataModule)
    qryDpList: TUniQuery;
    qryDpListid: TIntegerField;
    qryDpListtype: TStringField;
    qryDpListcol: TStringField;
    qryDpListnum: TStringField;
    qryDpListlayer: TStringField;
    qryDpListposition: TStringField;
    qryDpListdpnum: TStringField;
    qryDpListsku: TStringField;
    qryDpListrating: TIntegerField;
    qryDpListdpuse: TIntegerField;
    qryDpListremnant: TIntegerField;
    dsDpList: TUniDataSource;
    qryStOInDepot: TUniQuery;
    qryStOInDepotid: TIntegerField;
    qryStOInDepotstk_no: TStringField;
    qryStOInDepotsupplier_no: TStringField;
    qryStOInDepotsupplier_contract: TStringField;
    qryStOInDepotsettlement_type: TStringField;
    qryStOInDepotsettlement_cycle: TStringField;
    qryStOInDepotcooperation_type: TStringField;
    qryStOInDepotinvoice_type: TStringField;
    qryStOInDepotdelivery_type: TStringField;
    qryStOInDepotdelivery_price: TStringField;
    qryStOInDepoturgent_level: TStringField;
    qryStOInDepotdepot_id: TIntegerField;
    qryStOInDepotstate: TIntegerField;
    qryStOInDepotsys_state: TIntegerField;
    dsStOInDepot: TUniDataSource;
    qryStOPInDepot: TUniQuery;
    qryStOPInDepotid: TIntegerField;
    qryStOPInDepotstkorder_id: TIntegerField;
    qryStOPInDepotstkorder_no: TStringField;
    qryStOPInDepotproductname: TStringField;
    qryStOPInDepotproduct_id: TIntegerField;
    qryStOPInDepotproduct_sku: TStringField;
    qryStOPInDepotproduct_num: TIntegerField;
    qryStOPInDepotproduct_cost: TFloatField;
    qryStOPInDepotproduct_tax: TFloatField;
    qryStOPInDepotproduct_price: TFloatField;
    qryStOPInDepotproduct_allprice: TFloatField;
    qryStOPInDepotproduct_weight: TStringField;
    qryStOPInDepotproduct_indepotnum: TIntegerField;
    qryStOPInDepotstate: TIntegerField;
    qryStOPInDepotsys_status: TIntegerField;
    dsStOPInDepot: TUniDataSource;
    qryProductInfo: TUniQuery;
    qryProductInfop_id: TIntegerField;
    qryProductInfosku: TStringField;
    qryProductInfosn: TStringField;
    qryProductInfoean: TStringField;
    qryProductInfotitle: TStringField;
    qryProductInfoname: TStringField;
    qryProductInfochineseN: TStringField;
    qryProductInfoenglishN: TStringField;
    qryProductInfoshortname: TStringField;
    qryProductInfopic_path: TStringField;
    qryProductInfotype: TFloatField;
    qryProductInfostatus: TFloatField;
    qryProductInfobrief: TStringField;
    qryProductInfodescript: TMemoField;
    qryProductInfoscat_id: TStringField;
    qryProductInfokeyword: TStringField;
    qryProductInfotag: TStringField;
    qryProductInfoscore: TFloatField;
    qryProductInfospec: TStringField;
    qryProductInfoorigin: TStringField;
    qryProductInfoweight: TStringField;
    qryProductInfofactory: TStringField;
    qryProductInfosale_unit: TStringField;
    qryProductInfocreate_by: TStringField;
    qryProductInfocreate_date: TDateField;
    qryProductInfolast_update_by: TStringField;
    qryProductInfolast_update_date: TDateField;
    qryProductInfosys_status: TFloatField;
    qrySkuLog: TUniQuery;
    dsSkuLog: TUniDataSource;
    qrySkuLogID: TIntegerField;
    qrySkuLoglot_id: TFloatField;
    qrySkuLogp_id: TFloatField;
    qrySkuLogsort_n: TFloatField;
    qrySkuLogentrance_date: TDateTimeField;
    qrySkuLogexit_date: TDateTimeField;
    qrySkuLogopt_by: TStringField;
    qrySkuLogopt_date: TDateField;
    qrySkuLogopt_ip: TStringField;
    qrySkuLogremark: TStringField;
    qrySkuLogsys_status: TFloatField;
    qrySkuLogso_no: TStringField;
    qrySkuLogsto_no: TStringField;
    qrySkuLogproductName: TStringField;
    qrySkuLogp_sku: TStringField;
    qryDpositionInfo: TUniQuery;
    qryProductReserves: TUniQuery;
    qryProductReservessku_id: TIntegerField;
    qryProductReservesname: TStringField;
    qryProductReservessn: TStringField;
    qryProductReservesp_id: TFloatField;
    qryProductReservesproperties: TStringField;
    qryProductReservess_id: TFloatField;
    qryProductReservesmarket_price: TFloatField;
    qryProductReservessale_price: TFloatField;
    qryProductReservessale_limit_price: TFloatField;
    qryProductReservespromotion_price: TFloatField;
    qryProductReservesstock: TFloatField;
    qryProductReservescan_sale_stock: TFloatField;
    qryProductReservesfreeze_stock: TFloatField;
    qryProductReservessale_unit: TStringField;
    qryProductReservessys_status: TFloatField;
    qrySkuLogwh_n: TStringField;
    qryProductInfop_price: TFloatField;
    qryProductInfobrand_id: TFloatField;
    qryProductInfobcat_id: TStringField;
    qrySOOutDepot: TUniQuery;
    dsSOOutDepot: TUniDataSource;
    qrySOOutDepotso_id: TIntegerField;
    qrySOOutDepotso_source: TStringField;
    qrySOOutDepotsource_no: TStringField;
    qrySOOutDepotm_id: TFloatField;
    qrySOOutDepottype: TFloatField;
    qrySOOutDepotstatus: TFloatField;
    qrySOOutDepotpayment_id: TFloatField;
    qrySOOutDepotsend_type: TStringField;
    qrySOOutDepotpayment_type: TFloatField;
    qrySOOutDepotpayment_status: TFloatField;
    qrySOOutDepotsub_date: TDateField;
    qrySOOutDepotconfirm_date: TDateField;
    qrySOOutDepotconfirm_by: TFloatField;
    qrySOOutDepotinvoice_id: TFloatField;
    qrySOOutDepotsub_ip: TStringField;
    qrySOOutDepotprovince: TFloatField;
    qrySOOutDepotcity: TFloatField;
    qrySOOutDepotdistrict: TFloatField;
    qrySOOutDepotaddr: TStringField;
    qrySOOutDepotso_remark: TStringField;
    qrySOOutDepotpost_code: TStringField;
    qrySOOutDepotreceiver: TStringField;
    qrySOOutDepottel: TStringField;
    qrySOOutDepotmobile: TStringField;
    qrySOOutDepotcost_price: TFloatField;
    qrySOOutDepottax: TFloatField;
    qrySOOutDepotp_amount: TFloatField;
    qrySOOutDepotp_settle_amount: TFloatField;
    qrySOOutDepotship_amount: TFloatField;
    qrySOOutDepotship_settle_amount: TFloatField;
    qrySOOutDepotamount: TFloatField;
    qrySOOutDepotsettle_amount: TFloatField;
    qrySOOutDepotreturn_amount: TFloatField;
    qrySOOutDepotfinal_amount: TFloatField;
    qrySOOutDepotship_order_number: TStringField;
    qrySOOutDepotscan_status: TFloatField;
    qrySOOutDepotship_remark: TStringField;
    qrySOOutDepotsys_status: TFloatField;
    qrySOPOutDepot: TUniQuery;
    qrySOPOutDepotso_item_id: TIntegerField;
    qrySOPOutDepotso_id: TFloatField;
    qrySOPOutDepotso_no: TStringField;
    qrySOPOutDepotsku_id: TFloatField;
    qrySOPOutDepotp_id: TFloatField;
    qrySOPOutDepotp_sku: TStringField;
    qrySOPOutDepotp_sn: TStringField;
    qrySOPOutDepotp_ean: TStringField;
    qrySOPOutDepotp_number: TFloatField;
    qrySOPOutDepotp_cost_price: TFloatField;
    qrySOPOutDepottax: TFloatField;
    qrySOPOutDepotsale_price: TFloatField;
    qrySOPOutDepotsale_amount: TFloatField;
    qrySOPOutDepotp_weight: TFloatField;
    qrySOPOutDepotsource: TStringField;
    qrySOPOutDepotreal_out_number: TFloatField;
    qrySOPOutDepotsys_status: TFloatField;
    qrySOPOutDepotpdt_name: TStringField;
    dsSOPOutDepot: TUniDataSource;
    qrySkuOutLog: TUniQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    StringField3: TStringField;
    FloatField3: TFloatField;
    StringField4: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    StringField6: TStringField;
    DateField1: TDateField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField4: TFloatField;
    StringField9: TStringField;
    dsSkuOutLog: TUniDataSource;
    qryPOutOpt: TUniQuery;
    dsPOutOpt: TUniDataSource;
    qryPOutOptp_id: TFloatField;
    qryPOutOptp_sku: TStringField;
    qryPOutOptp_number: TFloatField;
    qryPOutOptreal_out_number: TFloatField;
    qryPOutOptsto_no: TStringField;
    qryPOutOptsort_n: TFloatField;
    qryPOutOptwh_n: TStringField;
    qryPOutOptp_name: TStringField;
    qryPOutOptID: TIntegerField;
    qrySkuLogis_sales: TIntegerField;
    qrySkuOutLogis_sales: TIntegerField;
    qrySOOutDepotso_sn: TStringField;
    qrySOOutDepotRECEIVE_EMAIL: TStringField;
    qryPOutOptsono: TStringField;
    qryExpInfo: TUniQuery;
    qryExpInfoid: TLargeintField;
    qryExpInfoexpress_no: TStringField;
    qryExpInfoexpress_name: TStringField;
    qryExpInfoexpress_tel: TStringField;
    qryExpInfoexpress_mobile: TStringField;
    qryExpInfoexpress_fax: TStringField;
    qryExpInfoexpressex_mail: TStringField;
    qryExpInfoexpress_addr: TStringField;
    qryExpInfoexpress_post: TFloatField;
    qryExpInfoexpress_website: TStringField;
    qryExpInfoexpress_msn: TStringField;
    qryExpInfoexpress_qq: TStringField;
    qryExpInfoexpress_create: TDateField;
    qryExpInfoexpress_info: TMemoField;
    qryExpInfoexpress_interface: TStringField;
    qryExpInfoexpress_model: TStringField;
    qryExpInfocontract_linkmen: TStringField;
    qryExpInfocontract_tel: TStringField;
    qryExpInfocontract_mobile: TStringField;
    qryExpInfocontract_email: TStringField;
    qryExpInfocontract_fax: TStringField;
    qryExpInfocontract_msn: TStringField;
    qryExpInfocontract_qq: TStringField;
    qryExpInfobusiness_linkmen: TStringField;
    qryExpInfobusiness_tel: TStringField;
    qryExpInfobusiness_mobile: TStringField;
    qryExpInfobusiness_fax: TStringField;
    qryExpInfobusiness_email: TStringField;
    qryExpInfobusiness_msn: TStringField;
    qryExpInfobusiness_qq: TStringField;
    qryExpInfoaccounts_linkmen: TStringField;
    qryExpInfoaccounts_tel: TStringField;
    qryExpInfoaccounts_mobile: TStringField;
    qryExpInfoaccounts_email: TStringField;
    qryExpInfoaccounts_fax: TStringField;
    qryExpInfoaccounts_msn: TStringField;
    qryExpInfoaccounts_qq: TStringField;
    dsExpInfo: TUniDataSource;
    qrySOOutDepotsend_date: TStringField;
    qrySOOutDepotexpress_id: TIntegerField;
    qrySOOutDepotexpress_name: TStringField;
    qrySOOD: TUniQuery;
    IntegerField2: TIntegerField;
    StringField5: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    StringField12: TStringField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    DateField2: TDateField;
    DateField3: TDateField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    StringField13: TStringField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    StringField21: TStringField;
    FloatField26: TFloatField;
    StringField22: TStringField;
    FloatField27: TFloatField;
    StringField23: TStringField;
    IntegerField3: TIntegerField;
    StringField24: TStringField;
    dsSOOD: TUniDataSource;
    qryROrderList: TUniQuery;
    qryROrderListid: TIntegerField;
    qryROrderListreturn_no: TStringField;
    qryROrderListso_id: TIntegerField;
    qryROrderListso_no: TStringField;
    qryROrderListso_source: TStringField;
    qryROrderListso_source_no: TStringField;
    qryROrderListmem_id: TIntegerField;
    qryROrderListstate: TIntegerField;
    qryROrderListsubmit_date: TDateTimeField;
    qryROrderListconfirm_date: TDateTimeField;
    qryROrderListconfirm_by: TStringField;
    qryROrderListso_memo: TStringField;
    qryROrderListreturn_men: TStringField;
    qryROrderListreturn_tel: TStringField;
    qryROrderListreturn_mobile: TStringField;
    qryROrderListreturn_email: TStringField;
    qryROrderListreturn_amount: TFloatField;
    qryROrderListreturn_price: TFloatField;
    qryROrderListreturn_time: TDateTimeField;
    qryROrderListreturn_settleup: TFloatField;
    qryROrderListsys_state: TIntegerField;
    dsROrderList: TUniDataSource;
    qryROProductList: TUniQuery;
    dsROProductList: TUniDataSource;
    qryDpositionInfodpinfo: TStringField;
    qryDpositionInfodp_dpuse: TIntegerField;
    qryDpositionInfodp_remnant: TIntegerField;
    qryDpositionInfodp_rating: TIntegerField;
    qryDpositionInfodp_sku: TStringField;
    qryStockStat: TUniQuery;
    dsStockStat: TUniDataSource;
    qryGoodsList: TUniQuery;
    dsGoodsList: TUniDataSource;
    qryGoodsListp_sku: TStringField;
    qryGoodsListp_number: TFloatField;
    qryGoodsListname: TStringField;
    qryGoodsListbrand_name: TStringField;
    qryGoodsListean: TStringField;
    qryGoodsListspec: TStringField;
    qryGoodsListcolor: TStringField;
    qryGoodsListp_size: TStringField;
    qryIDOPrint: TUniQuery;
    qryIDOPrintid: TIntegerField;
    qryIDOPrintstkorder_no: TStringField;
    qryIDOPrintproduct_sku: TStringField;
    qryIDOPrintmemo: TStringField;
    qryIDOPrintwh_n: TStringField;
    qryIDOPrintname: TStringField;
    qryIDOPrintbrand_name: TStringField;
    qryIDOPrintean: TStringField;
    qryIDOPrintp_size: TStringField;
    qryStOInDepottax_rate: TFloatField;
    qryStOInDepotstk_price: TFloatField;
    qryStOInDepotstkp_num: TIntegerField;
    qryStOInDepotstk_p_compose: TStringField;
    qryIDOPrintproduct_num: TIntegerField;
    qryStOPInDepotp_size: TStringField;
    qryProductInfobrand_name: TStringField;
    qryProductInfop_size: TStringField;
    qryProductInfop_color: TStringField;
    qryGoodsListdp_dpnum: TStringField;
    qryStockStatsn: TStringField;
    qryStockStatstock: TFloatField;
    qryStockStatcan_sale_stock: TFloatField;
    qryStockStatfreeze_stock: TFloatField;
    qryStockStatname: TStringField;
    qryStockStatbrand_name: TStringField;
    qryStockStatean: TStringField;
    qryStockStatspec: TStringField;
    qryStockStatcolor: TStringField;
    qryStockStatp_size: TStringField;
    qrySLList: TUniQuery;
    dsSLList: TUniDataSource;
    qrySLListID: TIntegerField;
    qrySLListso_no: TStringField;
    qrySLListsto_no: TStringField;
    qrySLListlot_id: TFloatField;
    qrySLListp_id: TFloatField;
    qrySLListp_sku: TStringField;
    qrySLListsort_n: TFloatField;
    qrySLListwh_n: TStringField;
    qrySLListentrance_date: TDateTimeField;
    qrySLListexit_date: TDateTimeField;
    qrySLListis_sales: TIntegerField;
    qrySLListopt_by: TStringField;
    qrySLListopt_date: TDateField;
    qrySLListopt_ip: TStringField;
    qrySLListremark: TStringField;
    qrySLListsys_status: TFloatField;
    qryROProductListid: TIntegerField;
    qryROProductListrso_id: TIntegerField;
    qryROProductListrso_no: TStringField;
    qryROProductListp_id: TIntegerField;
    qryROProductListp_sku: TStringField;
    qryROProductListp_num: TIntegerField;
    qryROProductListp_price: TFloatField;
    qryROProductListp_amount: TFloatField;
    qryROProductListreal_input_num: TIntegerField;
    qryROProductListstate: TIntegerField;
    qryROProductListsys_state: TIntegerField;
    qryROProductListp_name: TStringField;
    qryROProductListp_size: TStringField;
    qryROProductListp_color: TStringField;
    qryROPSkuLogList: TUniQuery;
    dsROPSkuLogList: TUniDataSource;
    qryROPSkuLogListp_sku: TStringField;
    qryROPSkuLogListsort_n: TFloatField;
    qryROPSkuLogListwh_n: TStringField;
    qryROPSkuLogListis_sales: TIntegerField;
    qryROPSkuLogListso_no: TStringField;
    qryROPSkuLogListID: TIntegerField;
    qryROPSkuLogListp_id: TFloatField;
    qryROPSkuLogListro_id: TIntegerField;
    qryAreaInfo: TUniQuery;
    qryAreaInfoID: TFloatField;
    qryAreaInfoPOSTCODE: TStringField;
    qryAreaInfoSTATESID: TStringField;
    qryAreaInfoCITYID: TStringField;
    qryAreaInfoADDRESSNAME: TStringField;
    qryAreaInfoADDRESSLEVEL: TStringField;
    qrySOOutDepotprovince_name: TStringField;
    qrySOOutDepotcity_name: TStringField;
    qrySOOutDepotdistrict_name: TStringField;
    qrySOOutDepotpreferential_price: TFloatField;
    qrySOOutDepotcoupon_price: TFloatField;
    qryStOPInDepotpdt_ean: TStringField;
    qryStOPInDepotpdt_spec: TStringField;
    procedure priceGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure priceSetText(Sender: TField;
      const Text: String);
  private
    { Private declarations }
  public
    procedure SetSTOIndepotNum(Num: Integer); //设置入库数量
    procedure SetSOOutdepotNum(Pid,Num: Integer); //设置出库数量
    procedure SetOptLog(pid: Integer;sku,sn,wn,remark: string);
    procedure UpdateOptLog(slid,pstate: Integer;sono: string);
    procedure SetProductReserves(pid,num: Integer;sku: string);
    procedure SetDpositionInfo(dpt,psku,state: string); //仓位设置
    procedure UpdateROPState(roid,pstate: Integer);
  end;

var
  dmDepotCenter: TdmDepotCenter;

implementation

uses untCommonDm, untCommonUtil;

{$R *.dfm}

{ TdmDepotCenter }

//获取商品价格
procedure TdmDepotCenter.priceGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := FormatFloat('0.00',Sender.AsFloat/100);
end;

//设置商品价格
procedure TdmDepotCenter.priceSetText(Sender: TField; const Text: String);
begin
  Sender.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(Text)))*100;
end;

//设置采购单商品实际入库数量
procedure TdmDepotCenter.SetSTOIndepotNum(Num: Integer);
var
  currNum : Integer;
begin
  with qryStOPInDepot do
  begin
    if Active then
    begin
      currNum := FieldByName('product_indepotnum').AsInteger;
      currNum := currNum + Num;
      Edit;
      FieldByName('product_indepotnum').AsInteger := currNum;
      Post;
    end;
  end;
end;

//设置商品入库日志
procedure TdmDepotCenter.SetOptLog(pid: Integer; sku, sn, wn,
  remark: string);
begin
  with qrySkuLog do
  begin
    if Active then
    begin
      Append;
      FieldByName('p_id').AsInteger := pid;
      FieldByName('p_sku').AsString := sku;
      FieldByName('sort_n').AsString := sn;
      FieldByName('wh_n').AsString := wn;
      FieldByName('entrance_date').AsDateTime := Date+Time;
      FieldByName('is_sales').AsInteger := StrToInt(P_DEPOTSTATE_IN);
      FieldByName('opt_by').AsString := CurrentUser.RealName;
      FieldByName('opt_date').AsDateTime := Date+Time;
      FieldByName('remark').AsString := remark;
      FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
      Post;
    end;
  end;
end;

//设置销售单商品实际出库数量
procedure TdmDepotCenter.SetSOOutdepotNum(Pid,Num: Integer);
var
  currNum : Integer;
begin
  with qrySOPOutDepot do
  begin
    if Active then
    begin
      Filter := 'p_id='+IntToStr(Pid);
      Filtered := True;
      currNum := FieldByName('real_out_number').AsInteger;
      currNum := currNum + Num;
      if ReadOnly then ReadOnly := False;
      Edit;
      FieldByName('real_out_number').AsInteger := currNum;
      Post;
      Filtered := False;
      Filter := '';
      ReadOnly := True;
    end;
  end;
end;

//更新商品出库日志
procedure TdmDepotCenter.UpdateOptLog(slid, pstate: Integer; sono: string);
var
  updateSql : TUniSQL;
begin
  updateSql := TUniSQL.Create(nil);
  updateSql.Connection := frmCommonDm.Connection;

  updateSql.SQL.Clear;
  updateSql.SQL.Add('update t_p_sku_log_vegaga set exit_date=now(),so_no=:soNo,is_sales=:state where ID=:slid');
  updateSql.ParamByName('soNo').AsString := sono;
  updateSql.ParamByName('state').AsInteger := StrToInt(P_DEPOTSTATE_OUT);
  updateSql.ParamByName('slid').AsInteger := slid;
  updateSql.Execute;

  qrySkuOutLog.Refresh;
end;

//设置商品库存
procedure TdmDepotCenter.SetProductReserves(pid, num: Integer;
  sku: string);
var
  currNum,freezeNum : Integer;
begin
//  currNum := 0;
//  freezeNum := 0;
  with qryProductReserves do
  begin
    Close;
    //ParamByName('pid').AsInteger := pid;
    ParamByName('sku').AsString := sku;
    Open;

    if RecordCount > 0 then
    begin
      currNum := FieldByName('stock').AsInteger + num;
      freezeNum := FieldByName('freeze_stock').AsInteger;
      if num < 0 then freezeNum := freezeNum + num;
      Edit;
      FieldByName('stock').AsInteger := currNum;
      FieldByName('can_sale_stock').AsInteger := currNum - freezeNum;
      FieldByName('freeze_stock').AsInteger := freezeNum;
    end else
    begin
      if num > 0 then
      begin
        Append;
        FieldByName('sn').AsString := sku;
        FieldByName('p_id').AsInteger := pid;
        FieldByName('stock').AsInteger := num;
        FieldByName('can_sale_stock').AsInteger := num;
        FieldByName('freeze_stock').AsInteger := 0;
        FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
      end;
    end;
    if State <> dsBrowse then Post;
    Close;
  end;
end;

//改变退货商品状态
procedure TdmDepotCenter.UpdateROPState(roid,pstate: Integer);
var
  upQry : TUniSQL;
begin
  upQry := TUniSQL.Create(nil);
  upQry.Connection := frmCommonDm.Connection;

  upQry.SQL.Clear;
  upQry.SQL.Add('update t_so_return_item_vegaga set state=:state where rso_id=:soid');
  upQry.ParamByName('soid').AsInteger := roid;
  upQry.ParamByName('state').AsInteger := pstate;
  upQry.Execute;
end;

//仓位设置
procedure TdmDepotCenter.SetDpositionInfo(dpt, psku, state: string);
var
  ioQry : TUniQuery;
  dpsku : string;
  usenum,rating : Integer;
begin
  ioQry := TUniQuery.Create(nil);
  ioQry.Connection := frmCommonDm.Connection;

  ioQry.Close;
  ioQry.SQL.Clear;
  ioQry.SQL.Add('select id,dp_dpnum,dp_sku,dp_rating,dp_dpuse,dp_remnant '
              + 'from t_dp_dposition_vegaga where dp_dpnum=:dpnum');
  ioQry.ParamByName('dpnum').AsString := dpt;
  ioQry.Open;

  rating := ioQry.FieldByName('dp_rating').AsInteger;
  if state = 'IN' then
  begin
    usenum := ioQry.FieldByName('dp_dpuse').AsInteger + 1;
  end else
  if state = 'OUT' then
  begin
    usenum := ioQry.FieldByName('dp_dpuse').AsInteger - 1;
    if usenum < 0 then usenum := 0;
  end;

  if ioQry.RecordCount > 0 then
  begin
    dpsku := ioQry.FieldByName('dp_sku').AsString;
    ioQry.Edit;
    if (dpsku = '') and (state = 'IN') then
    begin
      ioQry.FieldByName('dp_sku').AsString := psku;
    end;
    ioQry.FieldByName('dp_dpuse').AsInteger := usenum;
    ioQry.FieldByName('dp_remnant').AsInteger := rating - usenum;
    ioQry.Post;
  end;

  ioQry.Close;
  FreeAndNil(ioQry);
end;

end.
