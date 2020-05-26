unit untAllocatePrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, RzButton, GridsEh, DBGridEh, ExtCtrls;

type
  TfrmAllocatePrint = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    dgeGoodsList: TDBGridEh;
    btnPrint: TRzBitBtn;
    btnCancel: TRzBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { public declarations }
  end;

var
  frmAllocatePrint: TfrmAllocatePrint;
  SOrderIds : string;

implementation

uses untDepotCenterDM, untCommonDm;

{$R *.dfm}

//创建窗口
procedure TfrmAllocatePrint.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryGoodsList.Close;
  dmDepotCenter.qryGoodsList.DeleteWhere;
  dmDepotCenter.qryGoodsList.AddWhere('tssv.so_id in ('+SOrderIds+')');
  dmDepotCenter.qryGoodsList.Open;
end;

//关闭窗口
procedure TfrmAllocatePrint.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDepotCenter.qryGoodsList.Close;
end;

//打印
procedure TfrmAllocatePrint.btnPrintClick(Sender: TObject);
begin
  try
    frmCommonDm.rptPrint.Clear;
    frmCommonDm.rptPrint.LoadFromFile('./Report/Allocate.fr3');
    frmCommonDm.rptPrint.ShowReport;
  except
    ShowMessage('加载报表文件错误！请与管理员联系。');
  end;
end;

//取消
procedure TfrmAllocatePrint.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
