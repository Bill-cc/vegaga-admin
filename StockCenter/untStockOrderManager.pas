unit untStockOrderManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DBGridEhGrouping, GridsEh, DBGridEh, RzButton,
  ImgList, Buttons, Menus, ActnList;

type
  TfrmStockOrderManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnlTop: TPanel;
    dgeStockOrderList: TDBGridEh;
    btnAssess: TRzToolButton;
    RzMenuToolbarButton1: TRzMenuToolbarButton;
    il1: TImageList;
    pmState: TPopupMenu;
    acl1: TActionList;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    actAssess: TAction;
    btnExit: TRzToolButton;
    N4: TMenuItem;
    btnRefrsh: TRzToolButton;
    actRefresh: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAssessExecute(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure dgeStockOrderListTitleBtnClick(Sender: TObject;
      ACol: Integer; Column: TColumnEh);
  private
    procedure stkOrderFilter(State : string);
  public
    { Public declarations }
  end;

//var
//  frmStockOrderManager: TfrmStockOrderManager;

implementation

uses untStockCenterDM, untStockOrderInfo, untCommonUtil;

{$R *.dfm}

//创建窗口
procedure TfrmStockOrderManager.FormCreate(Sender: TObject);
begin
  dmStockCenter.qryCreateStOrder.Filter := 'state=1 or state=2 or state=3 or state=4 or state=5';
  dmStockCenter.qryCreateStOrder.Filtered := True;

  dmStockCenter.qryCreateStOrder.Open;
  //dmStockCenter.qryCreateStOProduct.Open;
  dmStockCenter.qryProductInfo.Open;
  dmStockCenter.qrySupplierInfo.Open;
  dmStockCenter.qryDepotInfo.Open;
end;

//关闭窗口
procedure TfrmStockOrderManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qryDepotInfo.Close;
  dmStockCenter.qrySupplierInfo.Close;
  dmStockCenter.qryProductInfo.Close;
  //dmStockCenter.qryCreateStOProduct.Close;
  dmStockCenter.qryCreateStOrder.Close;
end;

//订单查看
procedure TfrmStockOrderManager.actAssessExecute(Sender: TObject);
begin
  if dmStockCenter.qryCreateStOrder.RecordCount > 0 then
  begin
    ShowModalForm(TfrmStockOrderInfo);
    dmStockCenter.qryCreateStOrder.Open;
  end else
    ShowMessage('无可查看订单！');
end;

//关闭
procedure TfrmStockOrderManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//全部状态
procedure TfrmStockOrderManager.N4Click(Sender: TObject);
begin
  dmStockCenter.qryCreateStOrder.Filtered := False;
  dmStockCenter.qryCreateStOrder.Filter := 'state=1 or state=2 or state=3 or state=4 or state=5';
  dmStockCenter.qryCreateStOrder.Filtered := True;
end;

//新单
procedure TfrmStockOrderManager.N1Click(Sender: TObject);
begin
  stkOrderFilter(STO_CREATE);
end;

//异常单
procedure TfrmStockOrderManager.N5Click(Sender: TObject);
begin
  stkOrderFilter(STO_EXCEPTION);
end;

//已入库
procedure TfrmStockOrderManager.N2Click(Sender: TObject);
begin
  stkOrderFilter(STO_WAREHOUSING);
end;

//已定价
procedure TfrmStockOrderManager.N3Click(Sender: TObject);
begin
  stkOrderFilter(STO_COMPLETED);
end;

//已修改
procedure TfrmStockOrderManager.N6Click(Sender: TObject);
begin
  stkOrderFilter(STO_AMEND);
end;

//采购单过滤
procedure TfrmStockOrderManager.stkOrderFilter(State: string);
begin
  dmStockCenter.qryCreateStOrder.Filtered := False;
  dmStockCenter.qryCreateStOrder.Filter := 'state='+State;
  dmStockCenter.qryCreateStOrder.Filtered := True;
end;

//刷新
procedure TfrmStockOrderManager.actRefreshExecute(Sender: TObject);
begin
  if not dmStockCenter.qryCreateStOrder.Active then
    dmStockCenter.qryCreateStOrder.Open
  else
    dmStockCenter.qryCreateStOrder.Refresh;
end;

procedure TfrmStockOrderManager.dgeStockOrderListTitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  FieldSort(dmStockCenter.qryCreateStOrder,Column);
end;

end.
