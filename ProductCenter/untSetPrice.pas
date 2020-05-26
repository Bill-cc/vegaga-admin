unit untSetPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, RzDBEdit, StdCtrls, Mask, RzEdit, RzLabel,
  GridsEh, DBGridEh, RzButton, ExtCtrls, Uni, RzDBBnEd;

type
  TfrmSetPrice = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    btnOk: TRzBitBtn;
    btnCancel: TRzBitBtn;
    dgePdtList: TDBGridEh;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    btnSetOk: TRzButton;
    RzNumericEdit1: TRzNumericEdit;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzNumericEdit2: TRzNumericEdit;
    RzNumericEdit3: TRzNumericEdit;
    RzNumericEdit4: TRzNumericEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzLabel13: TRzLabel;
    RzDBEdit9: TRzDBEdit;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzLabel17: TRzLabel;
    RzDBButtonEdit1: TRzDBButtonEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnSetOkClick(Sender: TObject);
    procedure RzDBButtonEdit1ButtonClick(Sender: TObject);
  private
    p_market,p_sela,p_limit_sela,p_promotion : Real;
    function GetPrice: Boolean;
    procedure SetPrice;
    procedure ClearPrice;
  public
    { Public declarations }
  end;

var
  frmSetPrice: TfrmSetPrice;

implementation

uses untPCenterDM, untCommonUtil, untCommonDm, untSelSameSn;

{$R *.dfm}

//��������
procedure TfrmSetPrice.FormCreate(Sender: TObject);
begin
  //������
end;

//�رմ���
procedure TfrmSetPrice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //ʿ���
end;

//�ر�
procedure TfrmSetPrice.btnCancelClick(Sender: TObject);
begin
  Close;
end;

//��ɶ���
procedure TfrmSetPrice.btnOkClick(Sender: TObject);
var
  oid : string;
  bfs,afs : Integer;
begin
  if Application.MessageBox('ȷ����ɶ��ۣ�', '��ʾ', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    oid := dmPCenter.qrySetOPrice.FieldByName('stk_no').AsString;
    bfs := dmPCenter.qrySetOPrice.FieldByName('state').AsInteger;
    afs := StrToInt(STO_COMPLETED);
    UpdateOrderState(dmPCenter.qrySetOPrice,'state',afs);
    SetStkOrderState(oid,bfs,afs);
  end;
end;

//���ü�Ǯ
procedure TfrmSetPrice.btnSetOkClick(Sender: TObject);
begin
  if GetPrice then
  begin
    SetPrice;
    ClearPrice;
  end else
  begin
    if Application.MessageBox('��ע�⣬��Ʒ�ۼ�С����Ʒ�ɹ����ۣ��Ƿ������',
      '��ʾ', MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      SetPrice;
      ClearPrice;
    end;
  end;
end;

//��ȡ��Ǯ
function TfrmSetPrice.GetPrice: Boolean;
var
  price : Real;
begin
  Result := True;
  price := StrToFloat(FormatFloat('0.00',StrToFloat(RzDBEdit4.Text)))*100;
  p_market := StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit2.Text)))*100;
  p_sela := StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit1.Text)))*100;
  p_limit_sela := StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit3.Text)))*100;
  p_promotion := StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit4.Text)))*100;

  if p_market < price then
  begin
    Result := False;
  end;
end;

//���ü�Ǯ
procedure TfrmSetPrice.SetPrice;
var
  udPrice : TUniSQL;
  skuid : Integer;
begin
  if Application.MessageBox('��Ǯ���ĺ�ֱ����ʾ����վ��ȷ���޸ģ�', '��ʾ', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    skuid := dmPCenter.qrySetOPdtPrice.FieldByName('sku_id').AsInteger;
    udPrice := TUniSQL.Create(nil);
    udPrice.Connection := frmCommonDm.Connection;
    udPrice.SQL.Clear;
    udPrice.SQL.Add('update t_p_sku_vegaga set market_price=:mp,sale_price=:sp,'
                  + 'sale_limit_price=:slp,promotion_price=:pp '
                  + 'where sku_id=:id');

    udPrice.ParamByName('id').AsInteger := skuid;
    udPrice.ParamByName('mp').AsFloat := p_market;
    udPrice.ParamByName('sp').AsFloat := p_sela;
    udPrice.ParamByName('slp').AsFloat := p_limit_sela;
    udPrice.ParamByName('pp').AsFloat := p_promotion;
    udPrice.Execute;

    FreeAndNil(udPrice);

    dmPCenter.qrySetOPdtPrice.Refresh;
  end;
end;

//����۸�
procedure TfrmSetPrice.ClearPrice;
begin
  RzNumericEdit1.IntValue := 0;
  RzNumericEdit2.IntValue := 0;
  RzNumericEdit3.IntValue := 0;
  RzNumericEdit4.IntValue := 0;
end;

procedure TfrmSetPrice.RzDBButtonEdit1ButtonClick(Sender: TObject);
begin
  ProductSn := dmPCenter.qrySetOPdtPrice.FieldByName('sn').AsString;
  ProductSku := dmPCenter.qrySetOPdtPrice.FieldByName('product_sku').AsString;
  Application.CreateForm(TfrmSelSameSn,frmSelSameSn);
  try
    frmSelSameSn.ShowModal;
  finally
    FreeAndNil(frmSelSameSn);

    dmPCenter.qrySetOPdtPrice.Refresh;
  end;
end;

end.
