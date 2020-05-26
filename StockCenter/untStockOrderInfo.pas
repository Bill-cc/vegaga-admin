unit untStockOrderInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh,
  StdCtrls, RzLabel, RzButton, Mask, RzEdit, RzDBEdit;

type
  TfrmStockOrderInfo = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    dgePList: TDBGridEh;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit13: TRzDBEdit;
    RzDBEdit14: TRzDBEdit;
    pnl5: TPanel;
    btnExit: TRzBitBtn;
    btnPrint: TRzBitBtn;
    pnl6: TPanel;
    RzLabel11: TRzLabel;
    RzDBEdit15: TRzDBEdit;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzDBEdit16: TRzDBEdit;
    RzDBEdit17: TRzDBEdit;
    RzDBEdit18: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmStockOrderInfo: TfrmStockOrderInfo;

implementation

uses untStockCenterDM, untCommonDm;

{$R *.dfm}

//创建窗口
procedure TfrmStockOrderInfo.FormCreate(Sender: TObject);
begin
  dmStockCenter.qryCreateStOProduct.Open;
end;

//关闭窗口
procedure TfrmStockOrderInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qryCreateStOProduct.Close;
end;

//退出
procedure TfrmStockOrderInfo.btnExitClick(Sender: TObject);
begin
  Close;
end;

//采购订单打印
procedure TfrmStockOrderInfo.btnPrintClick(Sender: TObject);
begin
  try
    frmCommonDm.rptPrint.Clear;
    frmCommonDm.rptPrint.LoadFromFile('./Report/stockOrder.fr3');
    frmCommonDm.rptPrint.ShowReport;
  except
    ShowMessage('加载报表文件错误！请与管理员联系。');
  end;
end;

end.
