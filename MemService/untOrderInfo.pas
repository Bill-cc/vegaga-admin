unit untOrderInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, StdCtrls, RzCmboBx, RzDBCmbo, DBCtrls,
  RzDBEdit, Mask, RzEdit, RzLabel, DBGridEhGrouping, GridsEh, DBGridEh,
  RzButton, RzDBBnEd;

type
  TfrmOrderInfo = class(TForm)
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
    btnReturn: TRzBitBtn;
    btnCancel: TRzBitBtn;
    btnReject: TRzBitBtn;
    btnReceived: TRzBitBtn;
    RzLabel20: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit16: TRzDBEdit;
    RzDBEdit17: TRzDBEdit;
    RzDBButtonEdit1: TRzDBButtonEdit;
    RzLabel24: TRzLabel;
    RzDBEdit15: TRzDBEdit;
    RzLabel25: TRzLabel;
    RzDBEdit18: TRzDBEdit;
    RzLabel26: TRzLabel;
    edt1: TRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAssessClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnReturnClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnReceivedClick(Sender: TObject);
    procedure btnRejectClick(Sender: TObject);
    procedure RzDBButtonEdit1ButtonClick(Sender: TObject);
  private
    procedure PassAssess;
    procedure CreateSBOrder;
    procedure CancelSBOrder;
    procedure OrderReject;
    procedure OrderReveiced;
    procedure InitShowState;
    procedure InitButtonState;
    procedure SetButtonEnable(a,b,c,d,e:Boolean);
    procedure SetOState(afState: string);
    procedure InitBank(payType: Integer);
  public
    { Public declarations }
  end;

//var
//  frmOrderInfo: TfrmOrderInfo;

implementation

uses untMenServiceDM, untCommonUtil, untCreateROrder, untCSoRList, untDepotCenterDM;

{$R *.dfm}

//创建窗口
procedure TfrmOrderInfo.FormCreate(Sender: TObject);
begin
  dmMenService.qryOPList.Open;
  InitButtonState;
  InitShowState;
  if dmMenService.qryOrderInfo.FieldByName('payment_type').AsInteger = 3 then
  begin
    InitBank(dmMenService.qryOrderInfo.FieldByName('payment_status').AsInteger);
  end;
end;

//关闭窗口
procedure TfrmOrderInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmMenService.qryOPList.Close;
end;

//初始化订单状态
procedure TfrmOrderInfo.InitButtonState;
begin
  case dmMenService.qryOrderInfo.FieldByName('status').AsInteger of
    1 : SetButtonEnable(False,False,True,False,False);
    2 : SetButtonEnable(True,False,True,False,False);
    3 : SetButtonEnable(False,False,True,False,False);
    4 : SetButtonEnable(False,False,True,False,False);
    5 : SetButtonEnable(False,True,False,True,True);
    6,10,11 : SetButtonEnable(False,True,False,False,False);
    7 : SetButtonEnable(False,True,False,False,False);
    8,9 : SetButtonEnable(False,False,False,False,False);
  end;
end;

//初始化显示状态
procedure TfrmOrderInfo.InitShowState;
begin
  case dmMenService.qryOrderInfo.FieldByName('status').AsInteger of
    1 : RzLabel20.Caption := '待付款';
    2 : RzLabel20.Caption := '新单';
    3 : RzLabel20.Caption := '已审核';
    4 : RzLabel20.Caption := '已配货';
    5 : RzLabel20.Caption := '已发货';
    6 : RzLabel20.Caption := '已收货';
    7 : RzLabel20.Caption := '拒收';
    8 : RzLabel20.Caption := '退货中';
    9 : RzLabel20.Caption := '取消';
    10 : RzLabel20.Caption := '待回款';
    11 : RzLabel20.Caption := '已回款';
  end;
end;

procedure TfrmOrderInfo.SetButtonEnable(a, b, c, d, e: Boolean);
begin
  btnAssess.Enabled := a;
  btnReturn.Enabled := b;
  btnCancel.Enabled := c;
  btnReject.Enabled := d;
  btnReceived.Enabled := e;
end;

//关闭
procedure TfrmOrderInfo.btnExitClick(Sender: TObject);
begin
  Close;
end;

//审核
procedure TfrmOrderInfo.btnAssessClick(Sender: TObject);
begin
  case dmMenService.qryOrderInfo.FieldByName('status').AsInteger of
    1 : ShowMessage('订单等待付款！');
    2 : PassAssess;
    3 : ShowMessage('订单已通过审核！');
    4 : ShowMessage('订单已配货！');
    5 : ShowMessage('订单已发货！');
    6 : ShowMessage('订单已收货！');
    7 : ShowMessage('订单拒收！');
    8 : ShowMessage('订单退货中！');
    9 : ShowMessage('订单已取消！');
    10 : ShowMessage('订单已收货待回款！');
    11 : ShowMessage('订单已收货已回款！');
  end;
end;

//生成退货单
procedure TfrmOrderInfo.btnReturnClick(Sender: TObject);
begin
  case dmMenService.qryOrderInfo.FieldByName('status').AsInteger of
    1 : ShowMessage('订单等待付款！');
    2 : ShowMessage('订单未审核！');
    3 : ShowMessage('订单还未发货！');
    4 : ShowMessage('订单已配货！');
    5 : CreateSBOrder;
    6 : CreateSBOrder;
    7 : CreateSBOrder;
    8 : ShowMessage('订单退货中！');
    9 : ShowMessage('订单已取消！');
    10 : CreateSBOrder;
    11 : CreateSBOrder;
  end;
end;

//订单取消
procedure TfrmOrderInfo.btnCancelClick(Sender: TObject);
begin
  case dmMenService.qryOrderInfo.FieldByName('status').AsInteger of
    1,2,3,4 : CancelSBOrder;
    5 : ShowMessage('订单已发货！');
    6 : ShowMessage('订单已收货！');
    7 : ShowMessage('订单拒收！');
    8 : ShowMessage('订单退货中！');
    9 : ShowMessage('订单已取消！');
    10 : ShowMessage('订单已收货待回款！');
    11 : ShowMessage('订单已收货已回款！');
  end;
end;

//已收货
procedure TfrmOrderInfo.btnReceivedClick(Sender: TObject);
begin
  case dmMenService.qryOrderInfo.FieldByName('status').AsInteger of
    1,2,3,4 : ShowMessage('订单未发货！');
    5 : OrderReveiced;
    6 : ShowMessage('订单已收货！');
    7 : ShowMessage('订单拒收！');
    8 : ShowMessage('订单退货中！');
    9 : ShowMessage('订单已取消！');
    10 : ShowMessage('订单已收货待回款！');
    11 : ShowMessage('订单已收货已回款！');
  end;
end;

//订单拒收
procedure TfrmOrderInfo.btnRejectClick(Sender: TObject);
begin
  case dmMenService.qryOrderInfo.FieldByName('status').AsInteger of
    1,2,3,4 : ShowMessage('订单未发货！');
    5 : OrderReject;
    6 : ShowMessage('订单已收货！');
    7 : ShowMessage('订单拒收！');
    8 : ShowMessage('订单退货中！');
    9 : ShowMessage('订单已取消！');
    10 : ShowMessage('订单已收货待回款！');
    11 : ShowMessage('订单已收货已回款！');
  end;
end;

//打印订单
procedure TfrmOrderInfo.btnPrintClick(Sender: TObject);
begin
  //sdfas
end;

//设置订单状态
procedure TfrmOrderInfo.SetOState(afState: string);
var
  oid,af,bf : Integer;
begin
  oid := dmMenService.qryOrderInfo.FieldByName('so_id').AsInteger;
  bf := dmMenService.qryOrderInfo.FieldByName('status').AsInteger;
  af := StrToInt(afState);
  UpdateOrderState(dmMenService.qryOrderInfo,'status',af);
  SetOrderState(oid,bf,af);
end;

//通过审核
procedure TfrmOrderInfo.PassAssess;
begin
  if Application.MessageBox('确定该操作？', '提示', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    SetOState(SO_ASSESSED);
    dmMenService.qryOrderInfo.Refresh;
    InitButtonState;
    InitShowState;
  end;
end;

//生成退货单
procedure TfrmOrderInfo.CreateSBOrder;
var
  resVal : Integer;
begin
  Application.CreateForm(TfrmCreateROrder,frmCreateROrder);
  try
    resVal := frmCreateROrder.ShowModal;
  finally
    FreeAndNil(frmCreateROrder);
    if resVal = 1 then
    begin
      SetOState(SO_RETURN);
      dmMenService.qryOrderInfo.Refresh;
      InitButtonState;
      InitShowState;
    end;
  end;  
end;

//取消订单
procedure TfrmOrderInfo.CancelSBOrder;
var
  i : Integer;
begin
  if Application.MessageBox('确定取消该订单？', '提示', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    case dmMenService.qryOrderInfo.FieldByName('status').AsInteger of
      1,2,3 : begin
                for i := 0 to dmMenService.qryOPList.RecordCount - 1 do
                begin
                  if dmMenService.qryOPList.FieldByName('real_out_number').AsInteger > 0 then
                  begin
                    //设置库存量
                    dmDepotCenter.SetProductReserves(dmMenService.qryOPList.FieldByName('p_id').AsInteger,
                                                     dmMenService.qryOPList.FieldByName('real_out_number').AsInteger,
                                                     dmMenService.qryOPList.FieldByName('p_sku').AsString);
                    //设置流水
                    RCROProductInDepot(dmMenService.qryOrderInfo.FieldByName('so_sn').AsString,
                                       dmMenService.qryOPList.FieldByName('p_sku').AsString,'');
                  end else
                  begin
                    //设置冻结量
                    SetSkuFreeze(dmMenService.qryOPList.FieldByName('p_id').AsInteger,
                                 0-dmMenService.qryOPList.FieldByName('p_number').AsInteger,
                                 dmMenService.qryOPList.FieldByName('p_sku').AsString);
                  end;
                  dmMenService.qryOPList.Next;
                end;
              end;
      4 : begin
            for i := 0 to dmMenService.qryOPList.RecordCount - 1 do
            begin
              //设置库存量
              dmDepotCenter.SetProductReserves(dmMenService.qryOPList.FieldByName('p_id').AsInteger,
                                               dmMenService.qryOPList.FieldByName('p_number').AsInteger,
                                               dmMenService.qryOPList.FieldByName('p_sku').AsString);
              //设置冻结量
              //SetSkuFreeze(dmMenService.qryOPList.FieldByName('p_id').AsInteger,
              //             0-dmMenService.qryOPList.FieldByName('p_number').AsInteger,
              //             dmMenService.qryOPList.FieldByName('p_sku').AsString);
              //设置流水
              RCROProductInDepot(dmMenService.qryOrderInfo.FieldByName('so_sn').AsString,
                                 dmMenService.qryOPList.FieldByName('p_sku').AsString,'');
              dmMenService.qryOPList.Next;
            end;
          end;
    end;
    SetOState(SO_CANCEL);
    dmMenService.qryOrderInfo.Refresh;
    InitButtonState;
    InitShowState;
  end;
end;

//订单拒收
procedure TfrmOrderInfo.OrderReject;
begin
  if Application.MessageBox('确定订单拒收单？', '提示', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    SetOState(SO_REJECT);
    dmMenService.qryOrderInfo.Refresh;
    InitButtonState;
    InitShowState;
  end;
end;

//订单已收货
procedure TfrmOrderInfo.OrderReveiced;
begin
  if Application.MessageBox('确定订单已收货？', '提示', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    case dmMenService.qryOrderInfo.FieldByName('payment_type').AsInteger of
      1 : SetOState(SO_RECEVIED);
      2 : SetOState(SO_WAITCASH);
      3 : SetOState(SO_RECEVIED);
      4 : SetOState(SO_RECEVIED);
    end;
    dmMenService.qryOrderInfo.Refresh;
    InitButtonState;
    InitShowState;
  end;
end;

//查看优惠券
procedure TfrmOrderInfo.RzDBButtonEdit1ButtonClick(Sender: TObject);
begin
  Application.CreateForm(TfrmCSoRList,frmCSoRList);
  try
    frmCSoRList.ShowModal;
  finally
    FreeAndNil(frmCSoRList);
  end;
end;

procedure TfrmOrderInfo.InitBank(payType: Integer);
begin
  case payType of
    1 :edt1.Text := '中国银行';
    2 :edt1.Text := '工商银行';
    3 :edt1.Text := '建设银行';
    4 :edt1.Text := '交通银行';
    5 :edt1.Text := '招商银行';
    6 :edt1.Text := '中国农业银行';
  end;
end;

end.
