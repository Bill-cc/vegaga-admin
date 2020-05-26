unit untProductDepotManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls, DBGridEhGrouping,
  GridsEh, DBGridEh, RzPanel, RzButton, RzDBEdit;

type
  TfrmProductDepotManager = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    RzLabel1: TRzLabel;
    RzEdit1: TRzEdit;
    pnl6: TPanel;
    pnl7: TPanel;
    RzGroupBox1: TRzGroupBox;
    DBGridEh1: TDBGridEh;
    RzGroupBox2: TRzGroupBox;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzBitBtn3: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure ShowPrdOrder(psku : string);
    procedure ShowPrdDepot(psku : string);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure PrdDepotRenew(psku : string);
    procedure PrdDepotRenewAll;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmProductDepotManager: TfrmProductDepotManager;

implementation

uses untMenServiceDM;

{$R *.dfm}

//创建窗口
procedure TfrmProductDepotManager.FormCreate(Sender: TObject);
begin
  //sdfsdf
end;

//关闭窗口
procedure TfrmProductDepotManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmMenService.qryPrdOrder.Close;
  dmMenService.qryPrdDepot.Close;
end;

//退出按钮
procedure TfrmProductDepotManager.RzBitBtn2Click(Sender: TObject);
begin
  Close;
end;

//查询
procedure TfrmProductDepotManager.RzBitBtn1Click(Sender: TObject);
begin
  if RzEdit1.Text <> '' then
  begin
    ShowPrdOrder(RzEdit1.Text);
    ShowPrdDepot(RzEdit1.Text);
  end;
end;

//显示商品
procedure TfrmProductDepotManager.ShowPrdOrder(psku: string);
begin
  dmMenService.qryPrdOrder.Close;
  dmMenService.qryPrdOrder.ParamByName('psku').AsString := psku;
  dmMenService.qryPrdOrder.Open;
end;

//恢复
procedure TfrmProductDepotManager.RzBitBtn3Click(Sender: TObject);
begin
  if dmMenService.qryPrdDepot.Active then
  begin
    PrdDepotRenew(dmMenService.qryPrdDepot.FieldByName('sn').AsString);
    dmMenService.qryPrdDepot.Refresh;
  end else
    ShowMessage('未选择商品！');
end;

//显示库存信息
procedure TfrmProductDepotManager.ShowPrdDepot(psku: string);
begin
  dmMenService.qryPrdDepot.Close;
  dmMenService.qryPrdDepot.ParamByName('psku').AsString := psku;
  dmMenService.qryPrdDepot.Open;
end;

//单个恢复
procedure TfrmProductDepotManager.PrdDepotRenew(psku: string);
var
  freezeSql,cansaleSql : string;
begin
  freezeSql := 'update t_p_sku_vegaga tpsv '
             + 'set tpsv.freeze_stock= '
             + 'IFNULL((select SUM(tssiv.p_number) '
             + 'from t_so_sorder_item_vegaga tssiv '
             + 'left outer join t_so_sorder_vegaga tssv on tssiv.so_no=tssv.so_sn '
             + 'where tssiv.p_sku=tpsv.sn and tssv.`status` in (1,2,3)),0) '
             + 'where tpsv.sn=:psku';

  cansaleSql := 'update t_p_sku_vegaga set can_sale_stock=stock-freeze_stock where sn=:psku';
  with dmMenService.UniSQLUDepot do
  begin
    SQL.Clear;
    SQL.Add(freezeSql);
    ParamByName('psku').AsString := psku;
    Execute;

    SQL.Clear;
    SQL.Add(cansaleSql);
    ParamByName('psku').AsString := psku;
    Execute;
  end;
end;

//全部恢复
procedure TfrmProductDepotManager.PrdDepotRenewAll;
begin
  //sdf
end;

end.
