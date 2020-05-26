unit untExceptStockOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel, Menus,
  ImgList, ActnList, RzButton;

type
  TfrmExceptStockOrder = class(TForm)
    RzToolbar1: TRzToolbar;
    pnl1: TPanel;
    dgeEStOrder: TDBGridEh;
    btnCheck: TRzToolButton;
    pmList: TPopupMenu;
    aclOpt: TActionList;
    ilTools: TImageList;
    actCheck: TAction;
    btnExit: TRzToolButton;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCheckExecute(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    
  public
    { Public declarations }
  end;

//var
//  frmExceptStockOrder: TfrmExceptStockOrder;

implementation

uses untStockCenterDM, untEStOInfo, untCommonUtil;

{$R *.dfm}

//创建窗口
procedure TfrmExceptStockOrder.FormCreate(Sender: TObject);
begin
  dmStockCenter.qryEStOrder.Open;
  dmStockCenter.qryEStOPList.Open;
  dmStockCenter.qryDepotInfo.Open;
  dmStockCenter.qrySupplierList.Open;
end;

//窗口关闭
procedure TfrmExceptStockOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qrySupplierList.Close;
  dmStockCenter.qryDepotInfo.Close;
  dmStockCenter.qryEStOPList.Close;
  dmStockCenter.qryEStOrder.Close;
end;

//查看
procedure TfrmExceptStockOrder.actCheckExecute(Sender: TObject);
begin
  if dmStockCenter.qryEStOrder.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmEStOInfo,frmEStOInfo);
    try
      frmEStOInfo.ShowModal;
    finally
      FreeAndNil(frmEStOInfo);

      dmStockCenter.qryEStOrder.Refresh;
    end;
  end else
    ShowMessage('无可查看订单！');
end;

//退出
procedure TfrmExceptStockOrder.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
