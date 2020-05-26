unit untFCenterDM;

interface

uses
  SysUtils, Classes, DB, DBAccess, Uni, MemDS;

type
  TdmFCenter = class(TDataModule)
    qryFOrderInfo: TUniQuery;
    qryFOrderInfoso_id: TIntegerField;
    qryFOrderInfoso_source: TStringField;
    qryFOrderInfosource_no: TStringField;
    qryFOrderInfom_id: TFloatField;
    qryFOrderInfotype: TFloatField;
    qryFOrderInfostatus: TFloatField;
    qryFOrderInfopayment_id: TFloatField;
    qryFOrderInfosend_type: TStringField;
    qryFOrderInfopayment_type: TFloatField;
    qryFOrderInfopayment_status: TFloatField;
    qryFOrderInfosub_date: TDateField;
    qryFOrderInfoconfirm_date: TDateField;
    qryFOrderInfoconfirm_by: TFloatField;
    qryFOrderInfoinvoice_id: TFloatField;
    qryFOrderInfosub_ip: TStringField;
    qryFOrderInfoprovince: TFloatField;
    qryFOrderInfocity: TFloatField;
    qryFOrderInfodistrict: TFloatField;
    qryFOrderInfoaddr: TStringField;
    qryFOrderInfoso_remark: TStringField;
    qryFOrderInfopost_code: TStringField;
    qryFOrderInforeceiver: TStringField;
    qryFOrderInfotel: TStringField;
    qryFOrderInfomobile: TStringField;
    qryFOrderInfocost_price: TFloatField;
    qryFOrderInfotax: TFloatField;
    qryFOrderInfop_amount: TFloatField;
    qryFOrderInfop_settle_amount: TFloatField;
    qryFOrderInfoship_amount: TFloatField;
    qryFOrderInfoship_settle_amount: TFloatField;
    qryFOrderInfoamount: TFloatField;
    qryFOrderInfosettle_amount: TFloatField;
    qryFOrderInforeturn_amount: TFloatField;
    qryFOrderInfofinal_amount: TFloatField;
    qryFOrderInfoship_order_number: TStringField;
    qryFOrderInfoscan_status: TFloatField;
    qryFOrderInfoship_remark: TStringField;
    qryFOrderInfosys_status: TFloatField;
    dsFOrderInfo: TUniDataSource;
    qryFOPList: TUniQuery;
    qryFOPListso_item_id: TIntegerField;
    qryFOPListso_id: TFloatField;
    qryFOPListso_no: TStringField;
    qryFOPListsku_id: TFloatField;
    qryFOPListp_id: TFloatField;
    qryFOPListp_sku: TStringField;
    qryFOPListp_sn: TStringField;
    qryFOPListp_ean: TStringField;
    qryFOPListp_number: TFloatField;
    qryFOPListp_cost_price: TFloatField;
    qryFOPListtax: TFloatField;
    qryFOPListsale_price: TFloatField;
    qryFOPListsale_amount: TFloatField;
    qryFOPListp_weight: TFloatField;
    qryFOPListsource: TStringField;
    qryFOPListreal_out_number: TFloatField;
    qryFOPListsys_status: TFloatField;
    qryFOPListpdt_name: TStringField;
    dsFOPList: TUniDataSource;
    qryFSBOList: TUniQuery;
    dsFSBOList: TUniDataSource;
    qryFSBOPList: TUniQuery;
    dsFSBOPList: TUniDataSource;
    qryFOrderInfoso_sn: TStringField;
    qryFOrderInfoRECEIVE_EMAIL: TStringField;
    qryProvince: TUniQuery;
    qryProvinceID: TFloatField;
    qryProvincePOSTCODE: TStringField;
    qryProvinceSTATESID: TStringField;
    qryProvinceCITYID: TStringField;
    qryProvinceADDRESSNAME: TStringField;
    qryProvinceADDRESSLEVEL: TStringField;
    dsProvince: TUniDataSource;
    qryCity: TUniQuery;
    qryCityID: TFloatField;
    qryCityPOSTCODE: TStringField;
    qryCitySTATESID: TStringField;
    qryCityCITYID: TStringField;
    qryCityADDRESSNAME: TStringField;
    qryCityADDRESSLEVEL: TStringField;
    dsCity: TUniDataSource;
    qryDistrict: TUniQuery;
    dsDistrict: TUniDataSource;
    qryPInfo: TUniQuery;
    qryPInfop_id: TIntegerField;
    qryPInfosku: TStringField;
    qryPInfosn: TStringField;
    qryPInfoean: TStringField;
    qryPInfotitle: TStringField;
    qryPInfoname: TStringField;
    qryPInfochineseN: TStringField;
    qryPInfoenglishN: TStringField;
    qryPInfoshortname: TStringField;
    qryPInfopic_path: TStringField;
    qryPInfotype: TFloatField;
    qryPInfostatus: TFloatField;
    qryPInfobrief: TStringField;
    qryPInfodescript: TMemoField;
    qryPInfobrand_id: TFloatField;
    qryPInfobcat_id: TStringField;
    qryPInfoscat_id: TStringField;
    qryPInfokeyword: TStringField;
    qryPInfotag: TStringField;
    qryPInfoscore: TFloatField;
    qryPInfospec: TStringField;
    qryPInfoorigin: TStringField;
    qryPInfoweight: TStringField;
    qryPInfofactory: TStringField;
    qryPInfosale_unit: TStringField;
    qryPInfocreate_by: TStringField;
    qryPInfocreate_date: TDateField;
    qryPInfolast_update_by: TStringField;
    qryPInfolast_update_date: TDateField;
    qryPInfosys_status: TFloatField;
    qryPInfop_price: TFloatField;
    qryFSBOListid: TIntegerField;
    qryFSBOListreturn_no: TStringField;
    qryFSBOListso_id: TIntegerField;
    qryFSBOListso_no: TStringField;
    qryFSBOListso_source: TStringField;
    qryFSBOListso_source_no: TStringField;
    qryFSBOListmem_id: TIntegerField;
    qryFSBOListstate: TIntegerField;
    qryFSBOListsubmit_date: TDateTimeField;
    qryFSBOListconfirm_date: TDateTimeField;
    qryFSBOListconfirm_by: TStringField;
    qryFSBOListso_memo: TStringField;
    qryFSBOListreturn_men: TStringField;
    qryFSBOListreturn_tel: TStringField;
    qryFSBOListreturn_mobile: TStringField;
    qryFSBOListreturn_email: TStringField;
    qryFSBOListreturn_amount: TFloatField;
    qryFSBOListreturn_price: TFloatField;
    qryFSBOListreturn_time: TDateTimeField;
    qryFSBOListreturn_settleup: TFloatField;
    qryFSBOListsys_state: TIntegerField;
    qryFSBOPListid: TIntegerField;
    qryFSBOPListrso_id: TIntegerField;
    qryFSBOPListrso_no: TStringField;
    qryFSBOPListp_id: TIntegerField;
    qryFSBOPListp_sku: TStringField;
    qryFSBOPListp_num: TIntegerField;
    qryFSBOPListp_price: TFloatField;
    qryFSBOPListp_amount: TFloatField;
    qryFSBOPListreal_input_num: TIntegerField;
    qryFSBOPListstate: TIntegerField;
    qryFSBOPListsys_state: TIntegerField;
    qryFSBOPListp_name: TStringField;
    qryFOrderInfosend_date: TStringField;
    qryFOrderInfoexpress_id: TIntegerField;
    qryExpressInfo: TUniQuery;
    qryExpressInfoid: TLargeintField;
    qryExpressInfoexpress_no: TStringField;
    qryExpressInfoexpress_name: TStringField;
    qryExpressInfoexpress_tel: TStringField;
    qryExpressInfoexpress_mobile: TStringField;
    qryExpressInfoexpress_fax: TStringField;
    qryExpressInfoexpressex_mail: TStringField;
    qryExpressInfoexpress_addr: TStringField;
    qryExpressInfoexpress_post: TFloatField;
    qryExpressInfoexpress_website: TStringField;
    qryExpressInfoexpress_msn: TStringField;
    qryExpressInfoexpress_qq: TStringField;
    qryExpressInfoexpress_create: TDateTimeField;
    qryExpressInfoexpress_info: TMemoField;
    qryExpressInfoexpress_interface: TStringField;
    qryExpressInfoexpress_model: TStringField;
    qryExpressInfocontract_linkmen: TStringField;
    qryExpressInfocontract_tel: TStringField;
    qryExpressInfocontract_mobile: TStringField;
    qryExpressInfocontract_email: TStringField;
    qryExpressInfocontract_fax: TStringField;
    qryExpressInfocontract_msn: TStringField;
    qryExpressInfocontract_qq: TStringField;
    qryExpressInfobusiness_linkmen: TStringField;
    qryExpressInfobusiness_tel: TStringField;
    qryExpressInfobusiness_mobile: TStringField;
    qryExpressInfobusiness_fax: TStringField;
    qryExpressInfobusiness_email: TStringField;
    qryExpressInfobusiness_msn: TStringField;
    qryExpressInfobusiness_qq: TStringField;
    qryExpressInfoaccounts_linkmen: TStringField;
    qryExpressInfoaccounts_tel: TStringField;
    qryExpressInfoaccounts_mobile: TStringField;
    qryExpressInfoaccounts_email: TStringField;
    qryExpressInfoaccounts_fax: TStringField;
    qryExpressInfoaccounts_msn: TStringField;
    qryExpressInfoaccounts_qq: TStringField;
    qryFOrderInfoexp_name: TStringField;
    qryMemInfo: TUniQuery;
    dsMemInfo: TUniDataSource;
    qryMemInfoemail: TStringField;
    qryMemInfonickname: TStringField;
    qryMemInfoname: TStringField;
    qryMemInfotel: TStringField;
    qryMemInfomobile: TStringField;
    qryMemInfom_id: TIntegerField;
    qryFOrderInfom_name: TStringField;
    qryFOrderInfom_mobile: TStringField;
    qryFOrderInfopreferential_price: TFloatField;
    qryDepotStat: TUniQuery;
    dsDepotStat: TUniDataSource;
    qryDepotStatsku: TStringField;
    qryDepotStatname: TStringField;
    qryDepotStatbrand_name: TStringField;
    qryDepotStatean: TStringField;
    qryDepotStatspec: TStringField;
    qryDepotStatcolor: TStringField;
    qryDepotStatp_size: TStringField;
    qryDepotStatstock: TFloatField;
    qryDepotStatdp_dpnum: TStringField;
    qryDepotStats_name: TStringField;
    qryDepotStatsort_n: TFloatField;
    qryDepotStatproduct_price: TFloatField;
    qryDepotStatsto_no: TStringField;
    qryDepotStatso_no: TStringField;
    qryDepotStatsupplier_contract: TStringField;
    qryFOrderInfocoupon_price: TFloatField;
    procedure priceGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure priceSetText(Sender: TField;
      const Text: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFCenter: TdmFCenter;

implementation

uses untCommonDm;

{$R *.dfm}

//获取商品价格
procedure TdmFCenter.priceGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := FormatFloat('0.00',Sender.AsFloat/100);
end;

//设置商品价格
procedure TdmFCenter.priceSetText(Sender: TField; const Text: String);
begin
  Sender.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(Text)))*100;
end;

end.
