unit untFSBOInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGridEhGrouping, RzButton, GridsEh, DBGridEh,
  StdCtrls, RzLabel, Mask, RzEdit, RzDBEdit;

type
  TfrmFSBOInfo = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    dgeSBOPList: TDBGridEh;
    btnPrint: TRzBitBtn;
    btnAssess: TRzBitBtn;
    btnExit: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAssessClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    procedure AssessPass;
  public
    { Public declarations }
  end;

var
  frmFSBOInfo: TfrmFSBOInfo;

implementation

uses untCommonUtil, untFCenterDM;

{$R *.dfm}

//创建窗口
procedure TfrmFSBOInfo.FormCreate(Sender: TObject);
begin
  dmFCenter.qryPInfo.Open;
  dmFCenter.qryFSBOPList.Open;
end;

//关闭窗口
procedure TfrmFSBOInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmFCenter.qryFSBOPList.Close;
  dmFCenter.qryPInfo.Close;
end;

//审核通过
procedure TfrmFSBOInfo.btnAssessClick(Sender: TObject);
begin
  case dmFCenter.qryFSBOList.FieldByName('state').AsInteger of
    1 : ShowMessage('退货订单未审核！');
    2 : ShowMessage('退货订单已审核！');
    3 : AssessPass;
    4 : ShowMessage('退货订单已退款！');
    5 : ShowMessage('退货订单已完成！');
  end;
end;

//确认退款
procedure TfrmFSBOInfo.AssessPass;
var
  sboid,af,bf : Integer;
begin
  if Application.MessageBox('确定已退款？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    sboid := dmFCenter.qryFSBOList.FieldByName('id').AsInteger;
    bf := dmFCenter.qryFSBOList.FieldByName('state').AsInteger;
    af := StrToInt(SO_RETURN_BACKCASH);
    UpdateOrderState(dmFCenter.qryFSBOList,'state',af);
    SetSBOrderState(sboid,bf,af);
    Close;
  end;
end;

//退货单打印
procedure TfrmFSBOInfo.btnPrintClick(Sender: TObject);
begin
  //asdf
end;

//关闭
procedure TfrmFSBOInfo.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
