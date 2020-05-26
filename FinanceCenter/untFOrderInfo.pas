unit untFOrderInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, StdCtrls, RzCmboBx, RzDBCmbo, DBCtrls,
  RzDBEdit, Mask, RzEdit, RzLabel, DBGridEhGrouping, GridsEh, DBGridEh,
  RzButton;

type
  TfrmFOrderInfo = class(TForm)
    pnlBaseInfo: TPanel;
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    RzGroupBox4: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzLabel17: TRzLabel;
    RzLabel19: TRzLabel;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    dgeProductList: TDBGridEh;
    RzDBEdit13: TRzDBEdit;
    RzDBComboBox2: TRzDBComboBox;
    RzDBEdit14: TRzDBEdit;
    pnl6: TPanel;
    btnExit: TRzBitBtn;
    btnPrint: TRzBitBtn;
    btnAssess: TRzBitBtn;
    pnl7: TPanel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzDBEdit15: TRzDBEdit;
    RzDBEdit16: TRzDBEdit;
    RzLabel22: TRzLabel;
    RzDBEdit17: TRzDBEdit;
    RzLabel23: TRzLabel;
    RzDBEdit18: TRzDBEdit;
    RzLabel18: TRzLabel;
    RzDBEdit10: TRzDBEdit;
    RzLabel24: TRzLabel;
    RzDBEdit19: TRzDBEdit;
    RzLabel25: TRzLabel;
    RzDBEdit20: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAssessClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    procedure PassAssess;
  public
    { Public declarations }
  end;

var
  frmFOrderInfo: TfrmFOrderInfo;

implementation

uses untFCenterDM, untCommonUtil;

{$R *.dfm}

//创建窗口
procedure TfrmFOrderInfo.FormCreate(Sender: TObject);
begin
  dmFCenter.qryPInfo.Open;
  dmFCenter.qryFOPList.Open;
end;

//关闭窗口
procedure TfrmFOrderInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmFCenter.qryFOPList.Close;
  dmFCenter.qryPInfo.Close;
end;

//审核
procedure TfrmFOrderInfo.btnAssessClick(Sender: TObject);
begin
  if dmFCenter.qryFOrderInfo.FieldByName('status').AsInteger = 10 then
  begin
    if Application.MessageBox('确定通过审核？', '提示', MB_OKCANCEL + 
      MB_DEFBUTTON2) = IDOK then
    begin
      PassAssess;
      Close;
    end;
  end else
    ShowMessage('未处于 已收货待回款 状态！');
end;

//关闭
procedure TfrmFOrderInfo.btnExitClick(Sender: TObject);
begin
  Close;
end;

//通过审核
procedure TfrmFOrderInfo.PassAssess;
var
  oid,af,bf : Integer;
begin
  oid := dmFCenter.qryFOrderInfo.FieldByName('so_id').AsInteger;
  bf := dmFCenter.qryFOrderInfo.FieldByName('status').AsInteger;
  af := StrToInt(SO_CASHED);
  UpdateOrderState(dmFCenter.qryFOrderInfo,'status',af);
  SetOrderState(oid,bf,af);
end;

//打印订单
procedure TfrmFOrderInfo.btnPrintClick(Sender: TObject);
begin
  //sdfas
end;

end.
