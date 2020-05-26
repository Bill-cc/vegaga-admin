unit untExpressManagerDM;

interface

uses
  SysUtils, Classes, DB, DBAccess, Uni, MemDS;

type
  TdmExpressManager = class(TDataModule)
    qryTdmExpressList: TUniQuery;
    dsTdmExpressList: TUniDataSource;
    qryTdmExpressListid: TLargeintField;
    qryTdmExpressListexpress_no: TStringField;
    qryTdmExpressListexpress_name: TStringField;
    qryTdmExpressListexpress_tel: TStringField;
    qryTdmExpressListexpress_mobile: TStringField;
    qryTdmExpressListexpress_fax: TStringField;
    qryTdmExpressListexpressex_mail: TStringField;
    qryTdmExpressListexpress_addr: TStringField;
    qryTdmExpressListexpress_post: TFloatField;
    qryTdmExpressListexpress_website: TStringField;
    qryTdmExpressListexpress_msn: TStringField;
    qryTdmExpressListexpress_qq: TStringField;
    qryTdmExpressListexpress_create: TDateField;
    qryTdmExpressListexpress_info: TMemoField;
    qryTdmExpressListexpress_interface: TStringField;
    qryTdmExpressListexpress_model: TStringField;
    qryTdmExpressListcontract_linkmen: TStringField;
    qryTdmExpressListcontract_tel: TStringField;
    qryTdmExpressListcontract_mobile: TStringField;
    qryTdmExpressListcontract_email: TStringField;
    qryTdmExpressListcontract_fax: TStringField;
    qryTdmExpressListcontract_msn: TStringField;
    qryTdmExpressListcontract_qq: TStringField;
    qryTdmExpressListbusiness_linkmen: TStringField;
    qryTdmExpressListbusiness_tel: TStringField;
    qryTdmExpressListbusiness_mobile: TStringField;
    qryTdmExpressListbusiness_fax: TStringField;
    qryTdmExpressListbusiness_email: TStringField;
    qryTdmExpressListbusiness_msn: TStringField;
    qryTdmExpressListbusiness_qq: TStringField;
    qryTdmExpressListaccounts_linkmen: TStringField;
    qryTdmExpressListaccounts_tel: TStringField;
    qryTdmExpressListaccounts_mobile: TStringField;
    qryTdmExpressListaccounts_email: TStringField;
    qryTdmExpressListaccounts_fax: TStringField;
    qryTdmExpressListaccounts_msn: TStringField;
    qryTdmExpressListaccounts_qq: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmExpressManager: TdmExpressManager;

implementation

uses untCommonDm;

{$R *.dfm}

end.
