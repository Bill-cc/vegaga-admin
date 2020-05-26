unit untEStockOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel, Menus,
  ImgList, ActnList, RzButton;

type
  TfrmEStockOrder = class(TForm)
    RzToolbar1: TRzToolbar;
    pnl1: TPanel;
    dgeEStOrder: TDBGridEh;
    btnCheck: TRzToolButton;
    pmList: TPopupMenu;
    aclOpt: TActionList;
    ilTools: TImageList;
    actCheck: TAction;
    btnExit: TRzToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCheckExecute(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    
  public
    { Public declarations }
  end;

//var
//  frmEStockOrder: TfrmEStockOrder;

implementation

uses untStockCenterDM, untEStOrderInfo;

{$R *.dfm}

//��������
procedure TfrmEStockOrder.FormCreate(Sender: TObject);
begin
  dmStockCenter.qryEStOrder.Open;
  dmStockCenter.qryEStOPList.Open;
  dmStockCenter.qryProductInfo.Open;
  dmStockCenter.qryDepotInfo.Open;
  dmStockCenter.qrySupplierInfo.Open;
end;

//���ڹر�
procedure TfrmEStockOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qrySupplierInfo.Close;
  dmStockCenter.qryDepotInfo.Close;
  dmStockCenter.qryProductInfo.Close;
  dmStockCenter.qryEStOPList.Close;
  dmStockCenter.qryEStOrder.Close;
end;

//�鿴
procedure TfrmEStockOrder.actCheckExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmEStOrderInfo,frmEStOrderInfo);
  try
    frmEStOrderInfo.ShowModal;
  finally
    FreeAndNil(frmEStOrderInfo);
  end;
end;

//�˳�
procedure TfrmEStockOrder.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
