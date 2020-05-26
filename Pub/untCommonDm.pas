unit untCommonDm;

interface

uses
  SysUtils, Classes, DB, DBAccess, Uni, UniProvider, MySQLUniProvider,
  UniDacVcl, MemDS, frxClass, frxDBSet, frxExportXLS, frxExportImage, MemData;

type
  TfrmCommonDm = class(TDataModule)
    Connection: TUniConnection;
    MySQLUniProvider: TMySQLUniProvider;
    ConnDialog: TUniConnectDialog;
    qryGetEncode: TUniQuery;
    qryUpateOrderState: TUniQuery;
    qryUpdateStkOrderState: TUniQuery;
    qryUpateOrderStateid: TIntegerField;
    qryUpateOrderStateso_id: TFloatField;
    qryUpateOrderStateso_b_status: TFloatField;
    qryUpateOrderStateso_a_status: TFloatField;
    qryUpateOrderStateopt_by: TFloatField;
    qryUpateOrderStateopt_date: TDateField;
    qryUpateOrderStateopt_ip: TStringField;
    qryUpateOrderStateremark: TStringField;
    qryUpateOrderStatesys_status: TFloatField;
    qryProductOptLog: TUniQuery;
    qryProductOptLogid: TIntegerField;
    qryProductOptLogp_id: TFloatField;
    qryProductOptLogb_p_status: TFloatField;
    qryProductOptLoga_p_status: TFloatField;
    qryProductOptLogopt_desc: TStringField;
    qryProductOptLogopt_by: TStringField;
    qryProductOptLogopt_ip: TStringField;
    qryProductOptLogopt_date: TDateField;
    qryProductOptLogremark: TStringField;
    qryProductOptLogsys_status: TFloatField;
    qryUpdateStkOrderStateid: TIntegerField;
    qryUpdateStkOrderStatestkorder_no: TStringField;
    qryUpdateStkOrderStateopt_before: TIntegerField;
    qryUpdateStkOrderStateopt_after: TIntegerField;
    qryUpdateStkOrderStatemodificationby: TStringField;
    qryUpdateStkOrderStatemodification_date: TDateTimeField;
    qryUpdateStkOrderStatemodificationby_ip: TStringField;
    qryUpdateStkOrderStatememo: TStringField;
    qryUpdateStkOrderStatesys_status: TIntegerField;
    rptPrint: TfrxReport;
    dbdStockOrder: TfrxDBDataset;
    dbdStOProduct: TfrxDBDataset;
    qryUpdateSBOState: TUniQuery;
    qryUpdateSBOStateid: TIntegerField;
    qryUpdateSBOStaterso_id: TIntegerField;
    qryUpdateSBOStatebf_state: TIntegerField;
    qryUpdateSBOStateaf_state: TIntegerField;
    qryUpdateSBOStateopt_by: TIntegerField;
    qryUpdateSBOStateopt_date: TDateTimeField;
    qryUpdateSBOStateopt_ip: TStringField;
    qryUpdateSBOStatememo: TStringField;
    qryUpdateSBOStatesys_state: TIntegerField;
    frxjpgxprt1: TfrxJPEGExport;
    frxlsxprt1: TfrxXLSExport;
    dbdInDepotOrder: TfrxDBDataset;
    dbdIDOProduct: TfrxDBDataset;
    dbdAllocate: TfrxDBDataset;
    dbdEStkOrder: TfrxDBDataset;
    dbdEStkOPList: TfrxDBDataset;
    dbdOrderInfo: TfrxDBDataset;
    dbdOPList: TfrxDBDataset;
    Transaction: TUniTransaction;
    dbdSOOutDepot: TfrxDBDataset;
    dbdSOPOutDepot: TfrxDBDataset;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ConnectionAfterConnect(Sender: TObject);
    procedure ConnectionConnectionLost(Sender: TObject;
      Component: TComponent; ConnLostCause: TConnLostCause;
      var RetryMode: TRetryMode);
  private
    procedure InitData;
  public

  end;

var
  frmCommonDm: TfrmCommonDm;

implementation

uses untSysManagerDM, untMenServiceDM, untStockCenterDM, untExpressManagerDM,
     untDepotCenterDM, untPCenterDM, untFCenterDM;

{$R *.dfm}

//------------------------------------------------------------------------------
// 系统事件
//------------------------------------------------------------------------------

//创建
procedure TfrmCommonDm.DataModuleCreate(Sender: TObject);
begin
  Connection.Connected := False;
end;

//销毁
procedure TfrmCommonDm.DataModuleDestroy(Sender: TObject);
begin
  Connection.Disconnect;
end;

//连接后
procedure TfrmCommonDm.ConnectionAfterConnect(Sender: TObject);
begin
  InitData;
end;

procedure TfrmCommonDm.InitData;
begin
  if not Assigned(frmSysManagerDM) then
    frmSysManagerDM := TfrmSysManagerDM.Create(Self);
  if not Assigned(dmMenService) then
    dmMenService := TdmMenService.Create(Self);
  if not Assigned(dmStockCenter) then
    dmStockCenter := TdmStockCenter.Create(Self);
  if not Assigned(dmExpressManager) then
    dmExpressManager := TdmExpressManager.Create(Self);
  if not Assigned(dmDepotCenter) then
    dmDepotCenter := TdmDepotCenter.Create(Self);
  if not Assigned(dmPCenter) then
    dmPCenter := TdmPCenter.Create(Self);
  if not Assigned(dmFCenter) then
    dmFCenter := TdmFCenter.Create(Self);
end;

procedure TfrmCommonDm.ConnectionConnectionLost(Sender: TObject;
  Component: TComponent; ConnLostCause: TConnLostCause;
  var RetryMode: TRetryMode);
begin
  Connection.Connect;
end;

end.
