unit untStockCenterDM;

interface

uses
  SysUtils, Classes, DB, DBAccess, Uni, MemDS, MemTableDataEh,
  DataDriverEh;

type
  TdmStockCenter = class(TDataModule)
    qrySupplierList: TUniQuery;
    dsSupplierList: TUniDataSource;
    qryBrandList: TUniQuery;
    dsBrandList: TUniDataSource;
    qryBrandListbrand_id: TIntegerField;
    qryBrandListname: TStringField;
    qryBrandListbrief: TMemoField;
    qryBrandListcompany_name: TStringField;
    qryBrandListlogo_path: TStringField;
    qryBrandListsys_status: TFloatField;
    qryBrandListbrand_no: TStringField;
    qryBrandListorientation: TStringField;
    qryCatalogList: TUniQuery;
    dsCatalogList: TUniDataSource;
    qryCatalogListbcat_id: TIntegerField;
    qryCatalogListname: TStringField;
    qryCatalogListp_bcat_id: TFloatField;
    qryCatalogListis_parent: TFloatField;
    qryCatalogListstatus: TFloatField;
    qryCatalogListsort_rank: TFloatField;
    qryCatalogListsys_status: TFloatField;
    qryProductList: TUniQuery;
    dsProductList: TUniDataSource;
    qryProductListp_id: TIntegerField;
    qryProductListsn: TStringField;
    qryProductListean: TStringField;
    qryProductListtitle: TStringField;
    qryProductListname: TStringField;
    qryProductListchineseN: TStringField;
    qryProductListenglishN: TStringField;
    qryProductListshortname: TStringField;
    qryProductListpic_path: TStringField;
    qryProductListtype: TFloatField;
    qryProductListstatus: TFloatField;
    qryProductListbrief: TStringField;
    qryProductListdescript: TMemoField;
    qryProductListbrand_id: TFloatField;
    qryProductListkeyword: TStringField;
    qryProductListtag: TStringField;
    qryProductListscore: TFloatField;
    qryProductListspec: TStringField;
    qryProductListorigin: TStringField;
    qryProductListweight: TStringField;
    qryProductListfactory: TStringField;
    qryProductListcreate_by: TStringField;
    qryProductListcreate_date: TDateField;
    qryProductListlast_update_by: TStringField;
    qryProductListlast_update_date: TDateField;
    qryProductListsys_status: TFloatField;
    qryFactoryList: TUniQuery;
    qrySaleUtilList: TUniQuery;
    qryFactoryListid: TIntegerField;
    qryFactoryListfno: TStringField;
    qryFactoryListfname: TStringField;
    qryFactoryListfaddress: TStringField;
    qryFactoryListftel: TStringField;
    qrySaleUtilListid: TIntegerField;
    qrySaleUtilListsno: TStringField;
    qrySaleUtilListsname: TStringField;
    qrySaleUtilListsaddress: TStringField;
    qrySaleUtilListstel: TStringField;
    qryCreateStOrder: TUniQuery;
    dsCreateStOrder: TUniDataSource;
    qryCreateStOProduct: TUniQuery;
    dsCreateStOProduct: TUniDataSource;
    qryCreateStOrderid: TIntegerField;
    qryCreateStOrderstk_no: TStringField;
    qryCreateStOrdersupplier_no: TStringField;
    qryCreateStOrdersupplier_contract: TStringField;
    qryCreateStOrdersettlement_type: TStringField;
    qryCreateStOrdersettlement_cycle: TStringField;
    qryCreateStOrdercooperation_type: TStringField;
    qryCreateStOrderinvoice_type: TStringField;
    qryCreateStOrderdelivery_type: TStringField;
    qryCreateStOrderdelivery_price: TStringField;
    qryCreateStOrderurgent_level: TStringField;
    qryCreateStOProductid: TIntegerField;
    qryCreateStOProductstkorder_no: TStringField;
    qryCreateStOProductproduct_sku: TStringField;
    qryCreateStOProductproduct_num: TIntegerField;
    qryCreateStOProductproduct_cost: TFloatField;
    qryCreateStOProductproduct_tax: TFloatField;
    qryCreateStOProductproduct_price: TFloatField;
    qryCreateStOProductproduct_allprice: TFloatField;
    qryCreateStOProductproduct_weight: TStringField;
    qryCreateStOProductproduct_indepotnum: TIntegerField;
    qryCreateStOProductsys_status: TIntegerField;
    qryDepotInfo: TUniQuery;
    qryDepotInfoid: TIntegerField;
    qryDepotInfod_no: TStringField;
    qryDepotInfod_name: TStringField;
    qryDepotInfod_linkmen: TStringField;
    qryDepotInfod_tel: TStringField;
    qryDepotInfod_address: TStringField;
    qryCreateStOrderdepot_name: TStringField;
    qryCreateStOrderdepot_linkmen: TStringField;
    qryCreateStOrderdepot_tel: TStringField;
    qryCreateStOrderdepot_address: TStringField;
    qrySupplierInfo: TUniQuery;
    dsSupplierInfo: TUniDataSource;
    dsDepotInfo: TUniDataSource;
    qryCreateStOrderdepot_id: TIntegerField;
    qryStOAddPudt: TUniQuery;
    dsStOAddPudt: TUniDataSource;
    qryStOAddPudtp_id: TIntegerField;
    qryStOAddPudtsn: TStringField;
    qryStOAddPudtean: TStringField;
    qryStOAddPudttitle: TStringField;
    qryStOAddPudtname: TStringField;
    qryStOAddPudtchineseN: TStringField;
    qryStOAddPudtenglishN: TStringField;
    qryStOAddPudtshortname: TStringField;
    qryStOAddPudtpic_path: TStringField;
    qryStOAddPudttype: TFloatField;
    qryStOAddPudtstatus: TFloatField;
    qryStOAddPudtbrief: TStringField;
    qryStOAddPudtdescript: TMemoField;
    qryStOAddPudtbrand_id: TFloatField;
    qryStOAddPudtscat_id: TStringField;
    qryStOAddPudtkeyword: TStringField;
    qryStOAddPudttag: TStringField;
    qryStOAddPudtscore: TFloatField;
    qryStOAddPudtspec: TStringField;
    qryStOAddPudtorigin: TStringField;
    qryStOAddPudtweight: TStringField;
    qryStOAddPudtfactory: TStringField;
    qryStOAddPudtcreate_by: TStringField;
    qryStOAddPudtcreate_date: TDateField;
    qryStOAddPudtlast_update_by: TStringField;
    qryStOAddPudtlast_update_date: TDateField;
    qryStOAddPudtsys_status: TFloatField;
    qryBrandInfo: TUniQuery;
    qryBcatInfo: TUniQuery;
    qryBrandInfobrand_id: TIntegerField;
    qryBrandInfobrand_no: TStringField;
    qryBrandInfoname: TStringField;
    qryBrandInfobrief: TMemoField;
    qryBrandInfocompany_name: TStringField;
    qryBrandInfologo_path: TStringField;
    qryBrandInfosys_status: TFloatField;
    qryBrandInfoorientation: TStringField;
    qryBcatInfobcat_id: TIntegerField;
    qryBcatInfoname: TStringField;
    qryBcatInfop_bcat_id: TFloatField;
    qryBcatInfocode: TStringField;
    qryBcatInfois_parent: TFloatField;
    qryBcatInfostatus: TFloatField;
    qryBcatInfosort_rank: TFloatField;
    qryBcatInfosys_status: TFloatField;
    qryStOAddPudtbrandname: TStringField;
    qryStOAddPudtbcatname: TStringField;
    qryCreateStOProductproduct_id: TIntegerField;
    qryProductInfo: TUniQuery;
    qryProductInfop_id: TIntegerField;
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
    qryProductInfobrand_id: TFloatField;
    qryProductInfoscat_id: TStringField;
    qryProductInfokeyword: TStringField;
    qryProductInfotag: TStringField;
    qryProductInfoscore: TFloatField;
    qryProductInfospec: TStringField;
    qryProductInfoorigin: TStringField;
    qryProductInfoweight: TStringField;
    qryProductInfofactory: TStringField;
    qryProductInfocreate_by: TStringField;
    qryProductInfocreate_date: TDateField;
    qryProductInfolast_update_by: TStringField;
    qryProductInfolast_update_date: TDateField;
    qryProductInfosys_status: TFloatField;
    qryCreateStOProductproductname: TStringField;
    qryProductListsku: TStringField;
    qryProductInfosku: TStringField;
    qryStOAddPudtsku: TStringField;
    qryProductListsale_unit: TStringField;
    qryProductInfosale_unit: TStringField;
    qryStOAddPudtsale_unit: TStringField;
    qryProductListp_price: TFloatField;
    qryStOAddPudtp_price: TFloatField;
    qryCreateStOrderstate: TIntegerField;
    qryCreateStOrdersys_state: TIntegerField;
    qryCreateStOProductstkorder_id: TIntegerField;
    qryCreateStOProductstate: TIntegerField;
    qryCreateStOrdersupplier_name: TStringField;
    qryCatalogListcode: TStringField;
    qryProductListbcat_id: TStringField;
    qryProductListscat_id: TStringField;
    qryProductInfop_price: TFloatField;
    qryProductInfobcat_id: TStringField;
    qryStOAddPudtbcat_id: TStringField;
    dsEStOrder: TUniDataSource;
    qryEStOPList: TUniQuery;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField16: TStringField;
    StringField17: TStringField;
    IntegerField7: TIntegerField;
    StringField18: TStringField;
    IntegerField8: TIntegerField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField19: TStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    dsEStOPList: TUniDataSource;
    qryEStOrder: TUniQuery;
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
    StringField10: TStringField;
    IntegerField2: TIntegerField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField15: TStringField;
    qryEStOPListmemo: TStringField;
    qrySCatInfo: TUniQuery;
    qrySCatInfoscat_id: TIntegerField;
    qrySCatInfoname: TStringField;
    qrySCatInfop_scat_id: TFloatField;
    qrySCatInfocode: TStringField;
    qrySCatInfois_parent: TFloatField;
    qrySCatInfostatus: TFloatField;
    qrySCatInfosort_rank: TFloatField;
    qrySCatInfosys_status: TFloatField;
    qryStOAddPudtscatName: TStringField;
    qryProductListsupplierName: TStringField;
    qryProductListsupplier_no: TStringField;
    qryStOAddPudtsupplier_no: TStringField;
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
    qryStOAddPudtskuNum: TIntegerField;
    qryBrandListsupplies_id: TIntegerField;
    qryProductListp_size: TStringField;
    qryProductListbrand_name: TStringField;
    qryBrandLists_accredit: TIntegerField;
    qryBrandListregister: TIntegerField;
    qrySupplierLists_id: TIntegerField;
    qrySupplierListsn: TStringField;
    qrySupplierListname: TStringField;
    qrySupplierListtype: TStringField;
    qrySupplierListlevel: TStringField;
    qrySupplierListemail: TStringField;
    qrySupplierListtel: TStringField;
    qrySupplierListmobile: TStringField;
    qrySupplierListfax: TStringField;
    qrySupplierListaddr: TStringField;
    qrySupplierListlinkman: TStringField;
    qrySupplierListwebsite: TStringField;
    qrySupplierListbank: TStringField;
    qrySupplierListcooperation_type: TStringField;
    qrySupplierListstatus: TIntegerField;
    qrySupplierListbank_account: TStringField;
    qrySupplierListsys_status: TIntegerField;
    qrySupplierInfos_id: TIntegerField;
    qrySupplierInfosn: TStringField;
    qrySupplierInfoname: TStringField;
    qrySupplierInfotype: TStringField;
    qrySupplierInfolevel: TStringField;
    qrySupplierInfoemail: TStringField;
    qrySupplierInfotel: TStringField;
    qrySupplierInfomobile: TStringField;
    qrySupplierInfofax: TStringField;
    qrySupplierInfoaddr: TStringField;
    qrySupplierInfolinkman: TStringField;
    qrySupplierInfowebsite: TStringField;
    qrySupplierInfobank: TStringField;
    qrySupplierInfocooperation_type: TStringField;
    qrySupplierInfostatus: TIntegerField;
    qrySupplierInfobank_account: TStringField;
    qrySupplierInfosys_status: TIntegerField;
    qryProductListexecute_std: TStringField;
    qrySelectProduct: TUniQuery;
    IntegerField12: TIntegerField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    FloatField5: TFloatField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    StringField33: TStringField;
    MemoField1: TMemoField;
    FloatField8: TFloatField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    FloatField9: TFloatField;
    StringField37: TStringField;
    StringField38: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    DateField1: TDateField;
    StringField44: TStringField;
    DateField2: TDateField;
    FloatField10: TFloatField;
    StringField45: TStringField;
    StringField46: TStringField;
    dsSelectProduct: TUniDataSource;
    qryCreateStOrdertax_rate: TFloatField;
    qryCreateStOrderstk_price: TFloatField;
    qryCreateStOrderstkp_num: TIntegerField;
    qryCreateStOrderstk_p_compose: TStringField;
    qryCreateStOProductmemo: TStringField;
    qryBrandInforegister: TIntegerField;
    qryBrandInfos_accredit: TIntegerField;
    qryBrandInfosupplies_id: TIntegerField;
    qryCreateStOProductproductean: TStringField;
    qryCreateStOProductproductspec: TStringField;
    qryCreateStOProductbrand_id: TIntegerField;
    qryCreateStOProductbrand_name: TStringField;
    qryProductListcolor: TStringField;
    qrySelectProductcolor: TStringField;
    qryEStOrdertax_rate: TFloatField;
    qryEStOrderstk_price: TFloatField;
    qryEStOrderstkp_num: TIntegerField;
    qryEStOrderstk_p_compose: TStringField;
    qryStOAddPudtp_sale_price: TCurrencyField;
    qryEStOPListp_ean: TStringField;
    qryEStOPListp_size: TStringField;
    qryProductInfobrand_name: TStringField;
    qryProductInfop_size: TStringField;
    qryProductInfop_color: TStringField;
    qryEStOPListp_brandname: TStringField;
    qryEStOPListp_color: TStringField;
    dsBrandInfo: TUniDataSource;
    qryBrandListsupplies_name: TStringField;
    qryBrandListb_order: TIntegerField;
    qryCreateStOrdercreate_date: TDateField;
    procedure qryCreateStOProductBeforePost(DataSet: TDataSet);
    procedure qryProductListp_priceGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qryProductListp_priceSetText(Sender: TField;
      const Text: String);
  private
    { Private declarations }
  public
    procedure InitStkOrderInfo;
    procedure CloseStkOrderInfo;
    function StkOIsUnique(sno: string): Boolean;
  end;

var
  dmStockCenter: TdmStockCenter;

implementation

uses untCommonDm;

{$R *.dfm}

//初始化采购单信息
procedure TdmStockCenter.InitStkOrderInfo;
begin
  qryCreateStOrder.Open;
  qryCreateStOProduct.Open;
  qryProductInfo.Open;
  qrySupplierInfo.Open;
  qryBrandInfo.Open;
  qryDepotInfo.Open;
end;

//关闭采购单信息
procedure TdmStockCenter.CloseStkOrderInfo;
begin
  qryDepotInfo.Close;
  qryBrandInfo.Close;
  qrySupplierInfo.Close;
  qryProductInfo.Close;
  qryCreateStOProduct.Close;
  qryCreateStOrder.Close;
end;

//设置采购商品总价
procedure TdmStockCenter.qryCreateStOProductBeforePost(DataSet: TDataSet);
var
  price : Real;
  num : Integer;
begin     
  num := DataSet.FieldByName('product_num').AsInteger;
  price := DataSet.FieldByName('product_price').AsFloat;
  if (num > 0) and (price > 0) then
  begin
    DataSet.FieldByName('product_allprice').AsFloat := price*num;
  end;
end;

//商品信息表_商品价钱字段计算
procedure TdmStockCenter.qryProductListp_priceGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FormatFloat('0.00',Sender.AsFloat/100);
end;

//商品信息表_商品价钱字段计算
procedure TdmStockCenter.qryProductListp_priceSetText(Sender: TField;
  const Text: String);
begin
  Sender.AsFloat := StrToFloat(FormatFloat('0.00',StrToFloat(Text)))*100;
end;

//采购单是否唯一
function TdmStockCenter.StkOIsUnique(sno: string): Boolean;
var
  selSql : TUniQuery;
begin
  Result := True;
  selSql := TUniQuery.Create(nil);
  selSql.Connection := frmCommonDm.Connection;

  selSql.Close;
  selSql.SQL.Clear;
  selSql.SQL.Add('select id from t_stk_order_vegaga where stk_no=:sno');
  selSql.ParamByName('sno').AsString := sno;
  selSql.Open;

  if selSql.RecordCount > 0 then Result := False;

  selSql.Close;
  FreeAndNil(selSql);
end;

end.
