unit untSetShelfPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzButton, StdCtrls, RzLabel, Mask, RzEdit, RzDBEdit, Uni,
  RzDBBnEd;

type
  TfrmSetShelfPrice = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    btnOk: TRzBitBtn;
    btnCancel: TRzBitBtn;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzNumericEdit1: TRzNumericEdit;
    RzNumericEdit2: TRzNumericEdit;
    RzNumericEdit3: TRzNumericEdit;
    RzNumericEdit4: TRzNumericEdit;
    RzDateTimeEdit1: TRzDateTimeEdit;
    RzDateTimeEdit2: TRzDateTimeEdit;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzDateTimeEdit3: TRzDateTimeEdit;
    RzDateTimeEdit4: TRzDateTimeEdit;
    RzLabel13: TRzLabel;
    RzDBButtonEdit1: TRzDBButtonEdit;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure RzDBButtonEdit1ButtonClick(Sender: TObject);
  private
    procedure SetPrice;
    function InitPrice: Boolean;
  public
    { Public declarations }
  end;

var
  frmSetShelfPrice: TfrmSetShelfPrice;

implementation

uses untPCenterDM, untCommonDm;

{$R *.dfm}

//创建窗口
procedure TfrmSetShelfPrice.FormCreate(Sender: TObject);
begin
  dmPCenter.qryGetPrdPrice.Close;
  dmPCenter.qryGetPrdPrice.ParamByName('sku').AsString :=
    dmPCenter.qryShelfPList.FieldByName('sku').AsString;
  dmPCenter.qryGetPrdPrice.Open;
  if not InitPrice then ShowMessage('库存无此商品记录！');
  RzDateTimeEdit1.Date := dmPCenter.qryGetPrdPrice.FieldByName('start_time').AsDateTime;
  RzDateTimeEdit2.Time := dmPCenter.qryGetPrdPrice.FieldByName('start_time').AsDateTime;
  RzDateTimeEdit3.Date := dmPCenter.qryGetPrdPrice.FieldByName('end_time').AsDateTime;
  RzDateTimeEdit4.Time := dmPCenter.qryGetPrdPrice.FieldByName('end_time').AsDateTime;
end;

//关闭窗口
procedure TfrmSetShelfPrice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPCenter.qryGetPrdPrice.Close;
end;

//确定
procedure TfrmSetShelfPrice.btnOkClick(Sender: TObject);
begin
  SetPrice;
  Close;
end;

//取消
procedure TfrmSetShelfPrice.btnCancelClick(Sender: TObject);
begin
  Close;
end;

//设置价格
procedure TfrmSetShelfPrice.SetPrice;
var
  udPrice : TUniSQL;
  skuid : Integer;
begin
  if Application.MessageBox('价钱更改后将直接显示到网站，确认修改？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    skuid := dmPCenter.qryGetPrdPrice.FieldByName('sku_id').AsInteger;
    udPrice := TUniSQL.Create(nil);
    udPrice.Connection := frmCommonDm.Connection;
    udPrice.SQL.Clear;
    udPrice.SQL.Add('update t_p_sku_vegaga set market_price=:mp,sale_price=:sp,'
                  + 'sale_limit_price=:slp,promotion_price=:pp,'
                  + 'start_time=:stime,end_time=:etime '
                  + 'where sku_id=:id');

    udPrice.ParamByName('id').AsInteger := skuid;
    udPrice.ParamByName('mp').AsFloat :=
      StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit1.Text)))*100;
    udPrice.ParamByName('sp').AsFloat :=
      StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit2.Text)))*100;
    udPrice.ParamByName('slp').AsFloat :=
      StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit3.Text)))*100;
    udPrice.ParamByName('pp').AsFloat :=
      StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit4.Text)))*100;
    udPrice.ParamByName('stime').AsDateTime :=
      RzDateTimeEdit1.Date + RzDateTimeEdit2.Time;
    udPrice.ParamByName('etime').AsDateTime :=
      RzDateTimeEdit3.Date + RzDateTimeEdit4.Time;
    udPrice.Execute;

    FreeAndNil(udPrice);
  end;
end;

//初始化价格
function TfrmSetShelfPrice.InitPrice: Boolean;
begin
  Result := False;
  with dmPCenter.qryGetPrdPrice do
  begin
    if RecordCount > 0 then
    begin
      RzNumericEdit1.Value :=  FieldByName('market_price').AsFloat/100;
      RzNumericEdit2.Value :=  FieldByName('sale_price').AsFloat/100;
      RzNumericEdit3.Value :=  FieldByName('sale_limit_price').AsFloat/100;
      RzNumericEdit4.Value :=  FieldByName('promotion_price').AsFloat/100;

      RzDateTimeEdit1.Date := FieldByName('start_time').AsDateTime;
      RzDateTimeEdit2.Time := FieldByName('start_time').AsDateTime;
      RzDateTimeEdit3.Date := FieldByName('end_time').AsDateTime;
      RzDateTimeEdit4.Time := FieldByName('end_time').AsDateTime;
      Result := True;
    end;
  end;
end;

procedure TfrmSetShelfPrice.RzDBButtonEdit1ButtonClick(Sender: TObject);
begin
  //sdf
end;

end.
