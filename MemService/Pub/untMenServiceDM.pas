unit untMenServiceDM;

interface

uses
  SysUtils, Classes, DB, DBAccess, Uni, MemDS;

type
  TdmMenService = class(TDataModule)
    qryMenList: TUniQuery;
    dsMenList: TUniDataSource;
    qryMenListm_id: TIntegerField;
    qryMenListemail: TStringField;
    qryMenListpassword: TStringField;
    qryMenListnickname: TStringField;
    qryMenListlevel: TFloatField;
    qryMenListstatus: TFloatField;
    qryMenListis_activated: TStringField;
    qryMenListactivate_date: TDateField;
    qryMenListpassword_q: TStringField;
    qryMenListpassword_a: TStringField;
    qryMenListreg_date: TDateField;
    qryMenListreg_ip: TStringField;
    qryMenListreg_from: TStringField;
    qryMenListrec_by: TFloatField;
    qryMenListfreeze_date: TDateField;
    qryMenListfreeze_by: TStringField;
    qryMenListunfreeze_date: TDateField;
    qryMenListunfreeze_by: TStringField;
    qryMenListlogin_amount: TFloatField;
    qryMenListlogin_date: TDateField;
    qryMenListsys_status: TFloatField;
    qryMenListkeyString: TStringField;
    qryOrderInfo: TUniQuery;
    dsOrderInfo: TUniDataSource;
    qryOrderInfoso_id: TIntegerField;
    qryOrderInfom_id: TFloatField;
    qryOrderInfotype: TFloatField;
    qryOrderInfostatus: TFloatField;
    qryOrderInfopayment_id: TFloatField;
    qryOrderInfosend_type: TStringField;
    qryOrderInfopayment_type: TFloatField;
    qryOrderInfopayment_status: TFloatField;
    qryOrderInfosub_date: TDateField;
    qryOrderInfoconfirm_date: TDateField;
    qryOrderInfoconfirm_by: TFloatField;
    qryOrderInfoinvoice_id: TFloatField;
    qryOrderInfosub_ip: TStringField;
    qryOrderInfoprovince: TFloatField;
    qryOrderInfocity: TFloatField;
    qryOrderInfodistrict: TFloatField;
    qryOrderInfoaddr: TStringField;
    qryOrderInfoso_remark: TStringField;
    qryOrderInfopost_code: TStringField;
    qryOrderInforeceiver: TStringField;
    qryOrderInfotel: TStringField;
    qryOrderInfomobile: TStringField;
    qryOrderInfocost_price: TFloatField;
    qryOrderInfotax: TFloatField;
    qryOrderInfop_amount: TFloatField;
    qryOrderInfop_settle_amount: TFloatField;
    qryOrderInfoship_amount: TFloatField;
    qryOrderInfoship_settle_amount: TFloatField;
    qryOrderInfoamount: TFloatField;
    qryOrderInfosettle_amount: TFloatField;
    qryOrderInforeturn_amount: TFloatField;
    qryOrderInfofinal_amount: TFloatField;
    qryOrderInfoship_order_number: TStringField;
    qryOrderInfoscan_status: TFloatField;
    qryOrderInfoship_remark: TStringField;
    qryOrderInfosys_status: TFloatField;
    qryOPList: TUniQuery;
    dsOPList: TUniDataSource;
    qryOPListso_item_id: TIntegerField;
    qryOPListso_id: TFloatField;
    qryOPListso_no: TStringField;
    qryOPListsku_id: TFloatField;
    qryOPListp_id: TFloatField;
    qryOPListp_sn: TStringField;
    qryOPListp_ean: TStringField;
    qryOPListp_number: TFloatField;
    qryOPListp_cost_price: TFloatField;
    qryOPListtax: TFloatField;
    qryOPListsale_price: TFloatField;
    qryOPListsale_amount: TFloatField;
    qryOPListp_weight: TFloatField;
    qryOPListsource: TStringField;
    qryOPListreal_out_number: TFloatField;
    qryOPListsys_status: TFloatField;
    qryOPListp_sku: TStringField;
    qryOrderInfoso_source: TStringField;
    qryOrderInfosource_no: TStringField;
    qryProvince: TUniQuery;
    dsProvince: TUniDataSource;
    qryCity: TUniQuery;
    dsCity: TUniDataSource;
    qryDistrict: TUniQuery;
    dsDistrict: TUniDataSource;
    qryProvinceID: TFloatField;
    qryProvincePOSTCODE: TStringField;
    qryProvinceSTATESID: TStringField;
    qryProvinceCITYID: TStringField;
    qryProvinceADDRESSNAME: TStringField;
    qryProvinceADDRESSLEVEL: TStringField;
    qryCityID: TFloatField;
    qryCityPOSTCODE: TStringField;
    qryCitySTATESID: TStringField;
    qryCityCITYID: TStringField;
    qryCityADDRESSNAME: TStringField;
    qryCityADDRESSLEVEL: TStringField;
    qryProductInfo: TUniQuery;
    dsProductInfo: TUniDataSource;
    qryProductInfop_id: TIntegerField;
    qryProductInfosku: TStringField;
    qryProductInfosn: TStringField;
    qryProductInfoean: TStringField;
    qryProductInfotitle: TStringField;
    qryProductInfoname: TStringField;
    qryProductInfochineseN: TStringField;
    qryProductInfop_price: TFloatField;
    qryProductInfoenglishN: TStringField;
    qryProductInfoshortname: TStringField;
    qryProductInfopic_path: TStringField;
    qryProductInfotype: TFloatField;
    qryProductInfostatus: TFloatField;
    qryProductInfobrief: TStringField;
    qryProductInfodescript: TMemoField;
    qryProductInfobrand_id: TFloatField;
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
    qryOPListpdt_name: TStringField;
    qryProductInfobcat_id: TStringField;
    qryOrderInfoso_sn: TStringField;
    qryOrderInfoRECEIVE_EMAIL: TStringField;
    udsOPList: TUniUpdateSQL;
    qryROrderInfo: TUniQuery;
    qryROrderInfoid: TIntegerField;
    qryROrderInforeturn_no: TStringField;
    qryROrderInfoso_id: TIntegerField;
    qryROrderInfoso_no: TStringField;
    qryROrderInfoso_source: TStringField;
    qryROrderInfoso_source_no: TStringField;
    qryROrderInfomem_id: TIntegerField;
    qryROrderInfostate: TIntegerField;
    qryROrderInfosubmit_date: TDateTimeField;
    qryROrderInfoconfirm_date: TDateTimeField;
    qryROrderInfoconfirm_by: TStringField;
    qryROrderInfoso_memo: TStringField;
    qryROrderInforeturn_men: TStringField;
    qryROrderInforeturn_tel: TStringField;
    qryROrderInforeturn_mobile: TStringField;
    qryROrderInforeturn_email: TStringField;
    qryROrderInforeturn_amount: TFloatField;
    qryROrderInforeturn_price: TFloatField;
    qryROrderInforeturn_time: TDateTimeField;
    qryROrderInforeturn_settleup: TFloatField;
    qryROrderInfosys_state: TIntegerField;
    dsROrderInfo: TUniDataSource;
    qryROPList: TUniQuery;
    qryROPListid: TIntegerField;
    qryROPListrso_id: TIntegerField;
    qryROPListrso_no: TStringField;
    qryROPListp_id: TIntegerField;
    qryROPListp_sku: TStringField;
    qryROPListp_num: TIntegerField;
    qryROPListp_price: TFloatField;
    qryROPListp_amount: TFloatField;
    qryROPListreal_input_num: TIntegerField;
    qryROPListstate: TIntegerField;
    qryROPListsys_state: TIntegerField;
    dsROPList: TUniDataSource;
    qryROPListp_name: TStringField;
    qryOrderInfosend_date: TStringField;
    qryOrderInfoexpress_id: TIntegerField;
    qrySBOrderList: TUniQuery;
    dsSBOrderList: TUniDataSource;
    qrySBOPList: TUniQuery;
    dsSBOPList: TUniDataSource;
    qrySBOrderListid: TIntegerField;
    qrySBOrderListreturn_no: TStringField;
    qrySBOrderListso_id: TIntegerField;
    qrySBOrderListso_no: TStringField;
    qrySBOrderListso_source: TStringField;
    qrySBOrderListso_source_no: TStringField;
    qrySBOrderListmem_id: TIntegerField;
    qrySBOrderListstate: TIntegerField;
    qrySBOrderListsubmit_date: TDateTimeField;
    qrySBOrderListconfirm_date: TDateTimeField;
    qrySBOrderListconfirm_by: TStringField;
    qrySBOrderListso_memo: TStringField;
    qrySBOrderListreturn_men: TStringField;
    qrySBOrderListreturn_tel: TStringField;
    qrySBOrderListreturn_mobile: TStringField;
    qrySBOrderListreturn_email: TStringField;
    qrySBOrderListreturn_amount: TFloatField;
    qrySBOrderListreturn_price: TFloatField;
    qrySBOrderListreturn_time: TDateTimeField;
    qrySBOrderListreturn_settleup: TFloatField;
    qrySBOrderListsys_state: TIntegerField;
    qrySBOPListid: TIntegerField;
    qrySBOPListrso_id: TIntegerField;
    qrySBOPListrso_no: TStringField;
    qrySBOPListp_id: TIntegerField;
    qrySBOPListp_sku: TStringField;
    qrySBOPListp_num: TIntegerField;
    qrySBOPListp_price: TFloatField;
    qrySBOPListp_amount: TFloatField;
    qrySBOPListreal_input_num: TIntegerField;
    qrySBOPListstate: TIntegerField;
    qrySBOPListsys_state: TIntegerField;
    qrySBOPListp_name: TStringField;
    qryInvoiceInfo: TUniQuery;
    dsInvoiceInfo: TUniDataSource;
    qryInvoiceInfoinvoice_id: TIntegerField;
    qryInvoiceInfoinvoice_code: TStringField;
    qryInvoiceInfoso_id: TFloatField;
    qryInvoiceInfotitle: TStringField;
    qryInvoiceInfocontent: TStringField;
    qryInvoiceInfocreate_date: TDateField;
    qryInvoiceInfocreate_by: TFloatField;
    qryInvoiceInfoinvoice_date: TDateField;
    qryInvoiceInfosys_status: TFloatField;
    qryOrderInfoInv_Tiitle: TStringField;
    qryMemInfo: TUniQuery;
    qryMemInfom_id: TIntegerField;
    qryMemInfoemail: TStringField;
    qryMemInfoname: TStringField;
    qryMemInfotel: TStringField;
    qryMemInfomobile: TStringField;
    qryMemInfoaddr: TStringField;
    qryOrderInfom_email: TStringField;
    qryOrderInfom_name: TStringField;
    qryOrderInfom_mobile: TStringField;
    qryOrderInfopreferential_price: TFloatField;
    qryCSoRList: TUniQuery;
    dsCSoRList: TUniDataSource;
    qryCSoRListcsr_id: TIntegerField;
    qryCSoRListso_no: TStringField;
    qryCSoRListc_num: TStringField;
    qryCSoRListso_price: TFloatField;
    qryCSoRListpreferential_price: TFloatField;
    qryCSoRListfinal_price: TFloatField;
    qryCSoRListstatus: TSmallintField;
    qrySelectMem: TUniQuery;
    dsSelectMem: TUniDataSource;
    qrySelectMemm_id: TIntegerField;
    qrySelectMememail: TStringField;
    qrySelectMemnickname: TStringField;
    qrySelectMemlevel: TFloatField;
    qrySelectMemstatus: TFloatField;
    qrySelectMemreg_date: TDateField;
    qrySelectMemreg_from: TStringField;
    qrySelectMemrec_by: TFloatField;
    qrySelectMemname: TStringField;
    qrySelectMemtel: TStringField;
    qrySelectMemmobile: TStringField;
    qrySelectMemaddr: TStringField;
    qrySelectMemprofile: TMemoField;
    qryReviewList: TUniQuery;
    dsReviewList: TUniDataSource;
    qryReviewListreview_id: TIntegerField;
    qryReviewListscore: TFloatField;
    qryReviewListcontent: TStringField;
    qryReviewListso_id: TFloatField;
    qryReviewListcreate_date: TDateField;
    qryReviewListcreate_ip: TStringField;
    qryReviewListstatus: TFloatField;
    qryReviewListsys_status: TFloatField;
    qryReviewListpname: TStringField;
    qryReviewListsku: TStringField;
    qryReviewListemail: TStringField;
    qryOrderInfocoupon_price: TFloatField;
    qry1: TUniQuery;
    qryPrdOrder: TUniQuery;
    dsPrdOrder: TUniDataSource;
    qryPrdOrderso_item_id: TIntegerField;
    qryPrdOrderso_id: TFloatField;
    qryPrdOrderso_no: TStringField;
    qryPrdOrdersku_id: TFloatField;
    qryPrdOrderp_id: TFloatField;
    qryPrdOrderp_sku: TStringField;
    qryPrdOrderp_sn: TStringField;
    qryPrdOrderp_ean: TStringField;
    qryPrdOrderp_number: TFloatField;
    qryPrdOrderp_cost_price: TFloatField;
    qryPrdOrdertax: TFloatField;
    qryPrdOrdersale_price: TFloatField;
    qryPrdOrdersale_amount: TFloatField;
    qryPrdOrderp_weight: TFloatField;
    qryPrdOrdersource: TStringField;
    qryPrdOrderreal_out_number: TFloatField;
    qryPrdOrdersys_status: TFloatField;
    qryPrdDepot: TUniQuery;
    dsPrdDepot: TUniDataSource;
    qryPrdDepotsku_id: TIntegerField;
    qryPrdDepotname: TStringField;
    qryPrdDepotsn: TStringField;
    qryPrdDepotp_id: TFloatField;
    qryPrdDepotproperties: TStringField;
    qryPrdDepots_id: TFloatField;
    qryPrdDepotmarket_price: TFloatField;
    qryPrdDepotsale_price: TFloatField;
    qryPrdDepotsale_limit_price: TFloatField;
    qryPrdDepotpromotion_price: TFloatField;
    qryPrdDepotstock: TFloatField;
    qryPrdDepotcan_sale_stock: TFloatField;
    qryPrdDepotfreeze_stock: TFloatField;
    qryPrdDepotsale_unit: TStringField;
    qryPrdDepotsys_status: TFloatField;
    qryPrdDepotstart_time: TDateTimeField;
    qryPrdDepotend_time: TDateTimeField;
    qryPrdOrderstatus: TFloatField;
    UniSQLUDepot: TUniSQL;
    procedure qryOPListBeforePost(DataSet: TDataSet);
    procedure qryOPListsale_priceGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryOPListsale_priceSetText(Sender: TField;
      const Text: String);
    procedure qryOPListUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
  private

  public
    procedure InitOrderInfo;
    procedure CloseOrderInfo;
  end;

var
  dmMenService: TdmMenService;

implementation

uses untCommonDm, untCommonUtil;

{$R *.dfm}

//初始化订单信息
procedure TdmMenService.InitOrderInfo;
begin
  qryInvoiceInfo.Open;
  qryProvince.Open;
  qryCity.Open;
  qryDistrict.Open;
  qryProductInfo.Open;
  qryOrderInfo.Open;
  qryOPList.Open;
end;

//关闭订单信息
procedure TdmMenService.CloseOrderInfo;
begin
  qryOPList.Close;
  qryOrderInfo.Close;
  qryDistrict.Close;
  qryCity.Close;
  qryProvince.Close;
  qryProductInfo.Close;
  qryInvoiceInfo.Close;
end;

//设置销售总价
procedure TdmMenService.qryOPListBeforePost(DataSet: TDataSet);
var
  price : Real;
  num : Integer;
begin
  num := qryOPList.FieldByName('p_number').AsInteger;
  price := qryOPList.FieldByName('sale_price').AsFloat;
  if (num > 0) and (price > 0) then
  begin
    qryOPList.FieldByName('sale_amount').AsFloat := price*num;
  end;
end;

//获取数值
procedure TdmMenService.qryOPListsale_priceGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FormatFloat('0.00',Sender.AsFloat/100);
end;

//保存数值
procedure TdmMenService.qryOPListsale_priceSetText(Sender: TField;
  const Text: String);
begin
  Sender.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(Text)))*100;
end;

//商品列表实际更新数据
procedure TdmMenService.qryOPListUpdateRecord(DataSet: TDataSet;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
var
  pid,pnum : Integer;
  psku : string;
begin
  pid := DataSet.FieldByName('p_id').AsInteger;
  psku := DataSet.FieldByName('p_sku').AsString;
  pnum := DataSet.FieldByName('p_number').AsInteger;
  //更新数据
  udsOPList.Apply(UpdateKind);
  //设置冻结数量
  case UpdateKind of
    ukInsert : SetSkuFreeze(pid,pnum,psku);
    ukDelete : SetSkuFreeze(pid,0-pnum,psku);
  end;
  //设置成功更新
  UpdateAction := uaApplied;
end;

end.
