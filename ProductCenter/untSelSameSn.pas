unit untSelSameSn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, RzButton, RzEdit,
  StdCtrls, Mask, RzDBEdit, RzLabel, Uni;

type
  TfrmSelSameSn = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    dgeSameSnList: TDBGridEh;
    pnl4: TPanel;
    pnl5: TPanel;
    btn1: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit13: TRzDBEdit;
    RzNumericEdit1: TRzNumericEdit;
    RzNumericEdit2: TRzNumericEdit;
    RzNumericEdit3: TRzNumericEdit;
    RzNumericEdit4: TRzNumericEdit;
    btn2: TRzButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    p_market,p_sela,p_limit_sela,p_promotion : Real;
    function GetPrice: string;
    procedure SetPrice;
    procedure ClearPrice;
  public
    { Public declarations }
  end;

var
  frmSelSameSn: TfrmSelSameSn;
  ProductSn : string;
  ProductSku : string;

implementation

uses untPCenterDM, untCommonDm;

{$R *.dfm}

//创建窗口
procedure TfrmSelSameSn.FormCreate(Sender: TObject);
begin
  dmPCenter.qrySameSnList.Close;
  dmPCenter.qrySameSnList.ParamByName('psn').AsString := ProductSn;
  dmPCenter.qrySameSnList.ParamByName('psku').AsString := ProductSku;
  dmPCenter.qrySameSnList.Open;
end;

//关闭窗口
procedure TfrmSelSameSn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPCenter.qrySameSnList.Close;
end;

procedure TfrmSelSameSn.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmSelSameSn.ClearPrice;
begin
  RzNumericEdit1.IntValue := 0;
  RzNumericEdit2.IntValue := 0;
  RzNumericEdit3.IntValue := 0;
  RzNumericEdit4.IntValue := 0;
end;

function TfrmSelSameSn.GetPrice: string;
begin
  Result := '';
  p_market := StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit1.Text)))*100;
  p_sela := StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit2.Text)))*100;
  p_limit_sela := StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit3.Text)))*100;
  p_promotion := StrToFloat(FormatFloat('0.00',StrToFloat(RzNumericEdit4.Text)))*100;
end;

procedure TfrmSelSameSn.SetPrice;
var
  udPrice : TUniSQL;
  skuid : Integer;
begin
  skuid := dmPCenter.qrySameSnList.FieldByName('sku_id').AsInteger;
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

  dmPCenter.qrySameSnList.Refresh;
end;

//设置
procedure TfrmSelSameSn.btn2Click(Sender: TObject);
begin
  if Application.MessageBox('价钱更改后将直接显示到网站，确认修改？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    GetPrice;
    SetPrice;
    ClearPrice;
  end;
end;

end.
