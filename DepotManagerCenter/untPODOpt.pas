unit untPODOpt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzDBEdit, StdCtrls, Mask, RzEdit, RzLabel, RzButton;

type
  TfrmPODOpt = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    RzLabel1: TRzLabel;
    edtliushui: TRzEdit;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    btnOutDepot: TRzBitBtn;
    btnExit: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtliushuiChange(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnOutDepotClick(Sender: TObject);
  private
    procedure FindDepotProduct;
    procedure ProductOutOpt;
    procedure ReSetOutOpt;
  public
    { Public declarations }
  end;

var
  frmPODOpt: TfrmPODOpt;

implementation

uses untDepotCenterDM, untCommonUtil, untCommonDm;

{$R *.dfm}

//创建窗口
procedure TfrmPODOpt.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryPOutOpt.Close;
end;

//关闭窗口
procedure TfrmPODOpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDepotCenter.qryPOutOpt.Close;
end;

procedure TfrmPODOpt.edtliushuiChange(Sender: TObject);
begin
  if Length(Trim(edtliushui.Text)) > 7 then FindDepotProduct;
end;

//查找库存商品
procedure TfrmPODOpt.FindDepotProduct;
begin
  with dmDepotCenter.qryPOutOpt do
  begin
    Close;
    ParamByName('sono').AsString := dmDepotCenter.qrySOOutDepot.FieldByName('so_sn').AsString;
    ParamByName('pstate').AsInteger := StrToInt(P_DEPOTSTATE_IN);
    ParamByName('sortNo').AsString := Trim(edtliushui.Text);
    Open;
  end;
end;

//商品出库操作
procedure TfrmPODOpt.ProductOutOpt;
var
  slid,pstate,pid,pnum,realnum : Integer;
  soNo,psku,wn : string;
begin
  if dmDepotCenter.qryPOutOpt.RecordCount > 0 then
  begin
    pid := dmDepotCenter.qryPOutOpt.FieldByName('p_id').AsInteger;
    psku := dmDepotCenter.qryPOutOpt.FieldByName('p_sku').AsString;
    slid := dmDepotCenter.qryPOutOpt.FieldByName('ID').AsInteger;
    soNo := dmDepotCenter.qryPOutOpt.FieldByName('sono').AsString;
    pnum := dmDepotCenter.qryPOutOpt.FieldByName('p_number').AsInteger;
    wn := dmDepotCenter.qryPOutOpt.FieldByName('wh_n').AsString;
    realnum := dmDepotCenter.qryPOutOpt.FieldByName('real_out_number').AsInteger;
    pstate := StrToInt(P_DEPOTSTATE_OUT);

    if pnum > realnum then
    begin
      //frmCommonDm.Connection.StartTransaction;
      try
        //设置商品实际出库数量
        dmDepotCenter.SetSOOutdepotNum(pid,1);
        //出库记录
        dmDepotCenter.UpdateOptLog(slid,pstate,soNo);
        //设置商品库存
        dmDepotCenter.SetProductReserves(pid,-1,psku);
        //设置仓位信息
        dmDepotCenter.SetDpositionInfo(wn,psku,'OUT');
        //frmCommonDm.Connection.Commit;
      except
        //frmCommonDm.Connection.Rollback;
        ShowMessage('出库出错！');
      end;
    end else
      ShowMessage('改商品已全部出库！');
  end else
    ShowMessage('未找到库存商品!');
end;

//出库操作
procedure TfrmPODOpt.btnOutDepotClick(Sender: TObject);
begin
  ProductOutOpt;
  ReSetOutOpt;
end;

//复位出库操作
procedure TfrmPODOpt.ReSetOutOpt;
begin
  edtliushui.Text := '';
  dmDepotCenter.qryPOutOpt.Close;
end;

//退出
procedure TfrmPODOpt.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
