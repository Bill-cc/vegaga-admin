unit MAIN;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  Dialogs, Buttons, Messages, ExtCtrls, 
  ActnList, AdvMenus, RzButton, ImgList, RzPanel, RzStatus,
  RzDBStat, ExceptionLog;

type
  TMainForm = class(TForm)
    ActionList: TActionList;
    Panel1: TPanel;
    pnlMain: TPanel;
    RzMainToolbar: TRzToolbar;
    sbrSysStatus: TRzStatusBar;
    ImageList: TImageList;
    btnCreateStockOrder: TRzToolButton;
    imgTitleImage: TImage;
    BtnStockCenter: TRzBitBtn;
    actCreateSupplier: TAction;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    RzBitBtn5: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    actSupplierManager: TAction;
    actCreateBrand: TAction;
    actBrandManager: TAction;
    actCreateProduct: TAction;
    actProductManager: TAction;
    actCreateCatalog: TAction;
    actCatalogManager: TAction;
    actCreateStockOrder: TAction;
    actStockOrderManager: TAction;
    actExceptStockOrder: TAction;
    actPriceEdit: TAction;
    actProductEdit: TAction;
    actShelfManager: TAction;
    actSellStat: TAction;
    actCreateOrder: TAction;
    actOrderManager: TAction;
    actSendBackManager: TAction;
    actDispatchingQuery: TAction;
    actMemberManager: TAction;
    actProductIntoDepot: TAction;
    actCreateDepotPosition: TAction;
    actDepotPositionManager: TAction;
    actProductDepotManager: TAction;
    actCreateExceptStockOrder: TAction;
    actOrderDispatchingManager: TAction;
    actOrderSendBackManager: TAction;
    actCreateExpress: TAction;
    actExpressManager: TAction;
    actOrderDispatchingQuery: TAction;
    actRoleManager: TAction;
    actUserManager: TAction;
    actFinanceOrderManager: TAction;
    actFinanceSendBackManager: TAction;
    actStockCenter: TAction;
    actFinanceCenter: TAction;
    actDepotCenter: TAction;
    actProductCenter: TAction;
    actMemServiceCenter: TAction;
    actLogisticsCenter: TAction;
    actSysCenter: TAction;
    mmMain: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    clkstDateTime: TRzClockStatus;
    vrstsVersion: TRzVersionInfoStatus;
    vrinfVersion: TRzVersionInfo;
    stspnRealName: TRzStatusPane;
    stspnCreateDate: TRzStatusPane;
    stspnLastLoginDate: TRzStatusPane;
    N8: TMenuItem;
    btnStkoManager: TRzToolButton;
    RzSpacer1: TRzSpacer;
    btnCreateOrder: TRzToolButton;
    btnOrderManager: TRzToolButton;
    RzSpacer2: TRzSpacer;
    btnProductIntoDepot: TRzToolButton;
    btnOrderOut: TRzToolButton;
    N12: TMenuItem;
    N14: TMenuItem;
    N17: TMenuItem;
    stspnServer: TRzStatusPane;
    actFinanceStat: TAction;
    procedure actFinanceCenterExecute(Sender: TObject);
    procedure actFinanceOrderManagerExecute(Sender: TObject);
    procedure actFinanceSendBackManagerExecute(Sender: TObject);
    procedure actStockCenterExecute(Sender: TObject);
    procedure actCreateSupplierExecute(Sender: TObject);
    procedure actSupplierManagerExecute(Sender: TObject);
    procedure actCreateBrandExecute(Sender: TObject);
    procedure actBrandManagerExecute(Sender: TObject);
    procedure actCreateProductExecute(Sender: TObject);
    procedure actProductManagerExecute(Sender: TObject);
    procedure actCreateCatalogExecute(Sender: TObject);
    procedure actCatalogManagerExecute(Sender: TObject);
    procedure actCreateStockOrderExecute(Sender: TObject);
    procedure actStockOrderManagerExecute(Sender: TObject);
    procedure actExceptStockOrderExecute(Sender: TObject);
    procedure actDepotCenterExecute(Sender: TObject);
    procedure actProductIntoDepotExecute(Sender: TObject);
    procedure actCreateDepotPositionExecute(Sender: TObject);
    procedure actDepotPositionManagerExecute(Sender: TObject);
    procedure actProductDepotManagerExecute(Sender: TObject);
    procedure actCreateExceptStockOrderExecute(Sender: TObject);
    procedure actOrderDispatchingManagerExecute(Sender: TObject);
    procedure actOrderSendBackManagerExecute(Sender: TObject);
    procedure actProductCenterExecute(Sender: TObject);
    procedure actPriceEditExecute(Sender: TObject);
    procedure actProductEditExecute(Sender: TObject);
    procedure actShelfManagerExecute(Sender: TObject);
    procedure actSellStatExecute(Sender: TObject);
    procedure actMemServiceCenterExecute(Sender: TObject);
    procedure actCreateOrderExecute(Sender: TObject);
    procedure actOrderManagerExecute(Sender: TObject);
    procedure actSendBackManagerExecute(Sender: TObject);
    procedure actDispatchingQueryExecute(Sender: TObject);
    procedure actMemberManagerExecute(Sender: TObject);
    procedure actLogisticsCenterExecute(Sender: TObject);
    procedure actCreateExpressExecute(Sender: TObject);
    procedure actExpressManagerExecute(Sender: TObject);
    procedure actOrderDispatchingQueryExecute(Sender: TObject);
    procedure actSysCenterExecute(Sender: TObject);
    procedure actRoleManagerExecute(Sender: TObject);
    procedure actUserManagerExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure actFinanceStatExecute(Sender: TObject);
  private
    procedure InitData;
    procedure SetStatusBar;
    procedure SetPrivilege;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  CurrencyFrame : TFrame;

implementation

{$R *.dfm}

uses untSysManager, untUserManager, untLogin,about, untCommonUtil, untRoleManager,
     untMenServiceCenter,untMenManager, untStockCenter, untProductCenter, untFinanceCenter,
     untDepotManagerCenter, untLogisticsCenter, untSupplierManager, untBrandManager,
     untCatalogManager, untExpressManager, untProductManager, untCreateStockOrder,
     untStockOrderManager, untExceptStockOrder, untPriceEdit, untProductEdit, untShelfManager,
     untSellStat, untCreateOrder, untOrderManager, untSendBackManager, untDispatchingQuery,
     untProductIntoDepot, untDepotPositionManager, untFinanceOrderManager, untFinanceSendBackManager,
     untEStockOrder, untODpManager, untOSBackManager, untFinanceStat;

var currButton : TRzBitBtn;

//------------------------------------------------------------------------------
// 系统事件
//------------------------------------------------------------------------------

//窗口创建
procedure TMainForm.FormCreate(Sender: TObject);
begin
  InitData;
end;

//窗口关闭
procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

//------------------------------------------------------------------------------
// 函数和过程
//------------------------------------------------------------------------------

//数据初始化
procedure TMainForm.InitData;
begin
  currButton := TRzBitBtn.Create(nil);
  SetPrivilege;
  SetStatusBar;
end;

//设置状态栏
procedure TMainForm.SetStatusBar;
begin
  stspnRealName.Caption := '姓名：' + CurrentUser.RealName;
  stspnCreateDate.Caption := '创建时间：' + CurrentUser.CreateDate;
  stspnLastLoginDate.Caption := '最后登录时间：' + CurrentUser.LastLoginDate;
  stspnServer.Caption := CurrentUser.server;
end;

//设置权限
procedure TMainForm.SetPrivilege;
var
  i,listIndex : Integer;
begin
  for i := 0 to ActionList.ActionCount - 1 do
  begin
    if CurrentUser.RoleList.Find(IntToStr(ActionList.Actions[i].Tag),listIndex) then
      TAction(ActionList.Actions[i]).Enabled := True
    else
      TAction(ActionList.Actions[i]).Enabled := False;
  end;
end;

//------------------------------------------------------------------------------
// 动作执行
//------------------------------------------------------------------------------

//财务中心
procedure TMainForm.actFinanceCenterExecute(Sender: TObject);
begin
  currButton.Color := clBtnFace;
  currButton := RzBitBtn6;
  currButton.Color := clSkyBlue;
  CurrencyFrame := ShowFrame(CurrencyFrame,TfrmFinanceCenter,pnlMain);
end;

//财务订单管理
procedure TMainForm.actFinanceOrderManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmFinanceOrderManager);
  MainForm.Show;
end;

//退货信息管理
procedure TMainForm.actFinanceSendBackManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmFinanceSendBackManager);
  MainForm.Show;
end;

//财务统计
procedure TMainForm.actFinanceStatExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmFinanceStat);
  MainForm.Show;
end;

//采购中心
procedure TMainForm.actStockCenterExecute(Sender: TObject);
begin
  currButton.Color := clBtnFace;
  currButton := RzBitBtn5;
  currButton.Color := clSkyBlue;
  CurrencyFrame := ShowFrame(CurrencyFrame,TfrmStockCenter,pnlMain);
end;

//新建供应商
procedure TMainForm.actCreateSupplierExecute(Sender: TObject);
begin
  //---
end;

//供应商信息管理
procedure TMainForm.actSupplierManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmSupplierManager);
  MainForm.Show;
end;

//新建品牌
procedure TMainForm.actCreateBrandExecute(Sender: TObject);
begin
 //---
end;

//品牌管理
procedure TMainForm.actBrandManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmBrandManager);
  MainForm.Show;
end;

//新建商品信息
procedure TMainForm.actCreateProductExecute(Sender: TObject);
begin
  //sfd
end;

//商品信息管理
procedure TMainForm.actProductManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmProductManager);
  MainForm.Show;
end;

//新建商品目录
procedure TMainForm.actCreateCatalogExecute(Sender: TObject);
begin
  //sdf
end;

//商品目录管理
procedure TMainForm.actCatalogManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmCatalogManager);
  MainForm.Show;
end;

//新建采购订单
procedure TMainForm.actCreateStockOrderExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmCreateStockOrder);
  MainForm.Show;
end;

//采购订单管理
procedure TMainForm.actStockOrderManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmStockOrderManager);
  MainForm.Show;
end;

//异常采购订单
procedure TMainForm.actExceptStockOrderExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmExceptStockOrder);
  MainForm.Show;
end;

//仓储管理中心
procedure TMainForm.actDepotCenterExecute(Sender: TObject);
begin
  currButton.Color := clBtnFace;
  currButton := RzBitBtn2;
  currButton.Color := clSkyBlue;
  CurrencyFrame := ShowFrame(CurrencyFrame,TfrmDepotManagerCenter,pnlMain);
end;

//商品入库管理
procedure TMainForm.actProductIntoDepotExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmProductIntoDepot);
  MainForm.Show;
end;

//新建商品仓位
procedure TMainForm.actCreateDepotPositionExecute(Sender: TObject);
begin
 //sdf
end;

//商品仓位信息管理
procedure TMainForm.actDepotPositionManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmDepotPositionManager);
  MainForm.Show;
end;

//商品仓位关系管理
procedure TMainForm.actProductDepotManagerExecute(Sender: TObject);
begin
  //asdfg
end;

//仓库异常采购订单
procedure TMainForm.actCreateExceptStockOrderExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmEStockOrder);
  MainForm.Show;
end;

//配送订单信息管理
procedure TMainForm.actOrderDispatchingManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmODpManager);
  MainForm.Show;
end;

//退货订单管理
procedure TMainForm.actOrderSendBackManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmOSBackManager);
  MainForm.Show;
end;

//产品中心
procedure TMainForm.actProductCenterExecute(Sender: TObject);
begin
  currButton.Color := clBtnFace;
  currButton := RzBitBtn4;
  currButton.Color := clSkyBlue;
  CurrencyFrame := ShowFrame(CurrencyFrame,TfrmProductCenter,pnlMain);
end;

//价格编辑
procedure TMainForm.actPriceEditExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmPriceEdit);
  MainForm.Show;
end;

//商品编辑
procedure TMainForm.actProductEditExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmProductEdit);
  MainForm.Show;
end;

//货架管理
procedure TMainForm.actShelfManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmShelfManager);
  MainForm.Show;
end;

//销售统计
procedure TMainForm.actSellStatExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmSellStat);
  MainForm.Show;
end;

//客户服务中心
procedure TMainForm.actMemServiceCenterExecute(Sender: TObject);
begin
  currButton.Color := clBtnFace;
  currButton := RzBitBtn3;
  currButton.Color := clSkyBlue;
  CurrencyFrame := ShowFrame(CurrencyFrame,TfrmMenServiceCenter,pnlMain);
end;

//新建订单
procedure TMainForm.actCreateOrderExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmCreateOrder);
  MainForm.Show;
end;

//订单管理
procedure TMainForm.actOrderManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmOrderManager);
  MainForm.Show;
end;

//退货信息管理
procedure TMainForm.actSendBackManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmSendBackManager);
  MainForm.Show;
end;

//配送查询
procedure TMainForm.actDispatchingQueryExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmDispatchingQuery);
  MainForm.Show;
end;

//会员信息管理
procedure TMainForm.actMemberManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmMenManager);
  MainForm.Show;
end;

//物流管理中心
procedure TMainForm.actLogisticsCenterExecute(Sender: TObject);
begin
  currButton.Color := clBtnFace;
  currButton := RzBitBtn1;
  currButton.Color := clSkyBlue;
  CurrencyFrame := ShowFrame(CurrencyFrame,TfrmLogisticsCenter,pnlMain);
end;

//新建快递公司
procedure TMainForm.actCreateExpressExecute(Sender: TObject);
begin
  //sdf
end;

//快递公司管理
procedure TMainForm.actExpressManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmExpressManager);
  MainForm.Show;
end;

//订单配送查询
procedure TMainForm.actOrderDispatchingQueryExecute(Sender: TObject);
begin
 //sdf
end;

//系统管理中心
procedure TMainForm.actSysCenterExecute(Sender: TObject);
begin
  currButton.Color := clBtnFace;
  currButton := BtnStockCenter;
  currButton.Color := clSkyBlue;
  CurrencyFrame := ShowFrame(CurrencyFrame,TfrmSysManager,pnlMain);
end;

//角色管理
procedure TMainForm.actRoleManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmRoleManager);
  MainForm.Show;
end;

//用户管理
procedure TMainForm.actUserManagerExecute(Sender: TObject);
begin
  MainForm.Hide;
  ShowModalForm(TfrmUserManager);
  MainForm.Show;
end;

//关于
procedure TMainForm.N17Click(Sender: TObject);
begin
  ShowModalForm(TAboutBox);
end;

end.
