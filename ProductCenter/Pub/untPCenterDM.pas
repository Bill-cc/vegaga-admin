unit untPCenterDM;

interface

uses
  SysUtils, Classes, DB, DBAccess, Uni, MemDS;

type
  TdmPCenter = class(TDataModule)
    qrySCatList: TUniQuery;
    dsSCatList: TUniDataSource;
    qrySCatListscat_id: TIntegerField;
    qrySCatListname: TStringField;
    qrySCatListp_scat_id: TFloatField;
    qrySCatListcode: TStringField;
    qrySCatListis_parent: TFloatField;
    qrySCatListstatus: TFloatField;
    qrySCatListsort_rank: TFloatField;
    qrySCatListsys_status: TFloatField;
    qryShelfPList: TUniQuery;
    qryShelfPListp_id: TIntegerField;
    qryShelfPListsku: TStringField;
    qryShelfPListsn: TStringField;
    qryShelfPListean: TStringField;
    qryShelfPListtitle: TStringField;
    qryShelfPListname: TStringField;
    qryShelfPListchineseN: TStringField;
    qryShelfPListenglishN: TStringField;
    qryShelfPListshortname: TStringField;
    qryShelfPListpic_path: TStringField;
    qryShelfPListp_price: TFloatField;
    qryShelfPListbcat_id: TStringField;
    qryShelfPListscat_id: TStringField;
    qryShelfPListtype: TFloatField;
    qryShelfPListstatus: TFloatField;
    qryShelfPListbrief: TStringField;
    qryShelfPListdescript: TMemoField;
    qryShelfPListbrand_id: TFloatField;
    qryShelfPListkeyword: TStringField;
    qryShelfPListtag: TStringField;
    qryShelfPListscore: TFloatField;
    qryShelfPListspec: TStringField;
    qryShelfPListorigin: TStringField;
    qryShelfPListweight: TStringField;
    qryShelfPListfactory: TStringField;
    qryShelfPListsale_unit: TStringField;
    qryShelfPListcreate_by: TStringField;
    qryShelfPListcreate_date: TDateField;
    qryShelfPListlast_update_by: TStringField;
    qryShelfPListlast_update_date: TDateField;
    qryShelfPListsys_status: TFloatField;
    dsShelfPList: TUniDataSource;
    qrySetOPrice: TUniQuery;
    qrySetOPriceid: TIntegerField;
    qrySetOPricestk_no: TStringField;
    qrySetOPricesupplier_no: TStringField;
    qrySetOPricesupplier_contract: TStringField;
    qrySetOPricesettlement_type: TStringField;
    qrySetOPricesettlement_cycle: TStringField;
    qrySetOPricecooperation_type: TStringField;
    qrySetOPriceinvoice_type: TStringField;
    qrySetOPricedelivery_type: TStringField;
    qrySetOPricedelivery_price: TStringField;
    qrySetOPriceurgent_level: TStringField;
    qrySetOPricedepot_id: TIntegerField;
    qrySetOPricestate: TIntegerField;
    qrySetOPricesys_state: TIntegerField;
    dsSetOPrice: TUniDataSource;
    qrySetOPdtPrice: TUniQuery;
    dsSetOPdtPrice: TUniDataSource;
    qrySetOPdtPricestkorder_id: TIntegerField;
    qrySetOPdtPricestkorder_no: TStringField;
    qrySetOPdtPriceproduct_id: TIntegerField;
    qrySetOPdtPriceproduct_sku: TStringField;
    qrySetOPdtPriceproduct_price: TFloatField;
    qrySetOPdtPricemarket_price: TFloatField;
    qrySetOPdtPricesale_price: TFloatField;
    qrySetOPdtPricesale_limit_price: TFloatField;
    qrySetOPdtPricepromotion_price: TFloatField;
    qrySetOPdtPriceproduct_cost: TFloatField;
    qrySetOPdtPricename: TStringField;
    qrySetOPdtPricesku_id: TIntegerField;
    qryImageList: TUniQuery;
    dsImageList: TUniDataSource;
    qryImageListID: TIntegerField;
    qryImageListobj_id: TFloatField;
    qryImageListobj_type: TFloatField;
    qryImageListpic_path: TStringField;
    qryImageListpic_type: TFloatField;
    qryImageListpic_explain: TStringField;
    qryImageListsys_status: TFloatField;
    qryShelfPListcolor: TStringField;
    qryShelfPListbrand_name: TStringField;
    qryShelfPListexecute_std: TStringField;
    qryShelfPListp_size: TStringField;
    qryShelfPListp_color: TStringField;
    qryShelfPListsupplier_no: TStringField;
    qryShelfPListstyle_type: TIntegerField;
    qryShelfPListlining: TStringField;
    qryShelfPListmaterial: TStringField;
    qryShelfPListtechnics: TStringField;
    qryShelfPListpadding: TStringField;
    qryShelfPListpadding_weight: TStringField;
    qryShelfPListwash_exp: TStringField;
    qryShelfPListwarm_hint: TStringField;
    qryPrdStyle: TUniQuery;
    dsPrdStyle: TUniDataSource;
    qryPrdStyleStyleName: TStringField;
    qryPrdStyleStyleDesc: TStringField;
    qryIndexPList: TUniQuery;
    dsIndexPList: TUniDataSource;
    qryIndexPListmp_id: TIntegerField;
    qryIndexPListViewType: TIntegerField;
    qryIndexPListscat_code: TStringField;
    qryGetPrdPrice: TUniQuery;
    dsGetPrdPrice: TUniDataSource;
    qryGetPrdPricesku_id: TIntegerField;
    qryGetPrdPricename: TStringField;
    qryGetPrdPricesn: TStringField;
    qryGetPrdPricep_id: TFloatField;
    qryGetPrdPriceproperties: TStringField;
    qryGetPrdPrices_id: TFloatField;
    qryGetPrdPricemarket_price: TFloatField;
    qryGetPrdPricesale_price: TFloatField;
    qryGetPrdPricesale_limit_price: TFloatField;
    qryGetPrdPricepromotion_price: TFloatField;
    qryGetPrdPricestock: TFloatField;
    qryGetPrdPricecan_sale_stock: TFloatField;
    qryGetPrdPricefreeze_stock: TFloatField;
    qryGetPrdPricesale_unit: TStringField;
    qryGetPrdPricesys_status: TFloatField;
    qryGetPrdPricestart_time: TDateTimeField;
    qryGetPrdPriceend_time: TDateTimeField;
    qryPdtInfo: TUniQuery;
    qryPdtInfop_id: TIntegerField;
    qryPdtInfosku: TStringField;
    qryPdtInfosn: TStringField;
    qryPdtInfoean: TStringField;
    qryPdtInfoname: TStringField;
    qryPdtInfobrand_name: TStringField;
    qryPdtInfospec: TStringField;
    qryPdtInfop_color: TStringField;
    qryPdtInfop_size: TStringField;
    qryPdtInfostatus: TFloatField;
    qryIndexPListp_id: TIntegerField;
    qryIndexPListsn: TStringField;
    qryIndexPListean: TStringField;
    qryIndexPListname: TStringField;
    qryIndexPListbrand_name: TStringField;
    qryIndexPListspec: TStringField;
    qryIndexPListp_color: TStringField;
    qryIndexPListp_size: TStringField;
    qryIndexPListstatus: TIntegerField;
    qryIndexPListsku: TStringField;
    qryIndexPListsubmiter: TStringField;
    qryIndexPListdt_submit: TDateTimeField;
    qryIndexPListdt_start: TDateTimeField;
    qryIndexPListdt_end: TDateTimeField;
    qryPrdStyleStyleID: TIntegerField;
    qrySetOPdtPriceproduct_tax: TFloatField;
    qryImageListp_sku: TStringField;
    qrySetOPdtPricebrand_name: TStringField;
    qrySetOPdtPricespec: TStringField;
    qrySetOPdtPricep_color: TStringField;
    qrySetOPdtPricep_size: TStringField;
    qrySetOPdtPricestatus: TFloatField;
    qrySetOPdtPricesn: TStringField;
    qrySameSnList: TUniQuery;
    dsSameSnList: TUniDataSource;
    qrySameSnListsku_id: TIntegerField;
    qrySameSnListname: TStringField;
    qrySameSnListbrand_name: TStringField;
    qrySameSnListspec: TStringField;
    qrySameSnListp_color: TStringField;
    qrySameSnListp_size: TStringField;
    qrySameSnListstatus: TFloatField;
    qrySameSnListsn: TStringField;
    qrySameSnListmarket_price: TFloatField;
    qrySameSnListsale_price: TFloatField;
    qrySameSnListsale_limit_price: TFloatField;
    qrySameSnListpromotion_price: TFloatField;
    qrySameSnListsku: TStringField;
    qryImageListpic_s_path: TStringField;
    qryFindPPic: TUniQuery;
    qryFindPPicpic_path: TStringField;
    qryScatPList: TUniQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    FloatField1: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField12: TStringField;
    MemoField1: TMemoField;
    FloatField4: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField5: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    DateField1: TDateField;
    StringField21: TStringField;
    DateField2: TDateField;
    FloatField6: TFloatField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    IntegerField2: TIntegerField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    dsScatPList: TUniDataSource;
    qrySelScatList: TUniQuery;
    IntegerField3: TIntegerField;
    StringField35: TStringField;
    FloatField7: TFloatField;
    StringField36: TStringField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    dsSelScatList: TUniDataSource;
    qryStOAddPudt: TUniQuery;
    qryStOAddPudtp_id: TIntegerField;
    qryStOAddPudtsku: TStringField;
    qryStOAddPudtsn: TStringField;
    qryStOAddPudtean: TStringField;
    qryStOAddPudttitle: TStringField;
    qryStOAddPudtname: TStringField;
    qryStOAddPudtchineseN: TStringField;
    qryStOAddPudtenglishN: TStringField;
    qryStOAddPudtshortname: TStringField;
    qryStOAddPudtpic_path: TStringField;
    qryStOAddPudtp_price: TFloatField;
    qryStOAddPudttype: TFloatField;
    qryStOAddPudtstatus: TFloatField;
    qryStOAddPudtbrief: TStringField;
    qryStOAddPudtdescript: TMemoField;
    qryStOAddPudtbrand_id: TFloatField;
    qryStOAddPudtbrandname: TStringField;
    qryStOAddPudtbcatname: TStringField;
    qryStOAddPudtbcat_id: TStringField;
    qryStOAddPudtscat_id: TStringField;
    qryStOAddPudtsupplier_no: TStringField;
    qryStOAddPudtkeyword: TStringField;
    qryStOAddPudttag: TStringField;
    qryStOAddPudtscore: TFloatField;
    qryStOAddPudtspec: TStringField;
    qryStOAddPudtorigin: TStringField;
    qryStOAddPudtweight: TStringField;
    qryStOAddPudtfactory: TStringField;
    qryStOAddPudtsale_unit: TStringField;
    qryStOAddPudtcreate_by: TStringField;
    qryStOAddPudtcreate_date: TDateField;
    qryStOAddPudtlast_update_by: TStringField;
    qryStOAddPudtlast_update_date: TDateField;
    qryStOAddPudtsys_status: TFloatField;
    qryStOAddPudtscatName: TStringField;
    qryStOAddPudtskuNum: TIntegerField;
    qryStOAddPudtp_sale_price: TCurrencyField;
    dsStOAddPudt: TUniDataSource;
    qrySCatInfo: TUniQuery;
    qrySCatInfoscat_id: TIntegerField;
    qrySCatInfoname: TStringField;
    qrySCatInfop_scat_id: TFloatField;
    qrySCatInfocode: TStringField;
    qrySCatInfois_parent: TFloatField;
    qrySCatInfostatus: TFloatField;
    qrySCatInfosort_rank: TFloatField;
    qrySCatInfosys_status: TFloatField;
    qryPSku: TUniQuery;
    qryPSkusku_id: TIntegerField;
    qryPSkuname: TStringField;
    qryPSkusn: TStringField;
    qryPSkup_id: TFloatField;
    qryPSkuproperties: TStringField;
    qryPSkus_id: TFloatField;
    qryPSkumarket_price: TFloatField;
    qryPSkusale_price: TFloatField;
    qryPSkusale_limit_price: TFloatField;
    qryPSkupromotion_price: TFloatField;
    qryPSkustock: TFloatField;
    qryPSkucan_sale_stock: TFloatField;
    qryPSkufreeze_stock: TFloatField;
    qryPSkusale_unit: TStringField;
    qryPSkusys_status: TFloatField;
    qryBrandInfo: TUniQuery;
    qryBrandInfobrand_id: TIntegerField;
    qryBrandInfobrand_no: TStringField;
    qryBrandInfoname: TStringField;
    qryBrandInfobrief: TMemoField;
    qryBrandInfocompany_name: TStringField;
    qryBrandInfologo_path: TStringField;
    qryBrandInfosys_status: TFloatField;
    qryBrandInfoorientation: TStringField;
    qryBrandInforegister: TIntegerField;
    qryBrandInfos_accredit: TIntegerField;
    qryBrandInfosupplies_id: TIntegerField;
    qryBcatInfo: TUniQuery;
    qryBcatInfobcat_id: TIntegerField;
    qryBcatInfoname: TStringField;
    qryBcatInfop_bcat_id: TFloatField;
    qryBcatInfocode: TStringField;
    qryBcatInfois_parent: TFloatField;
    qryBcatInfostatus: TFloatField;
    qryBcatInfosort_rank: TFloatField;
    qryBcatInfosys_status: TFloatField;
    dsBrandInfo: TUniDataSource;
    qryImageListpic_m_path: TStringField;
    procedure priceGetText(Sender: TField; var Text: String; DisplayText: Boolean);
    procedure priceSetText(Sender: TField; const Text: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPCenter: TdmPCenter;

implementation

uses untCommonDm;

{$R *.dfm}

{ TdmPCenter }

//获取价格
procedure TdmPCenter.priceGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  Text := FormatFloat('0.00',Sender.AsFloat/100);
end;

//设置价格
procedure TdmPCenter.priceSetText(Sender: TField; const Text: String);
begin
  Sender.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(Text)))*100;
end;

end.
