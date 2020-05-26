unit untOrderManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel, RzButton,
  Menus, Buttons, ImgList, ActnList;

type
  TfrmOrderManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnlCenter: TPanel;
    dgeOrderList: TDBGridEh;
    RzMenuToolbarButton1: TRzMenuToolbarButton;
    pmOrderMenu: TPopupMenu;
    N1: TMenuItem;
    pmToollMenu: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    btnAssess: TRzToolButton;
    aclOrderOpt: TActionList;
    actAssess: TAction;
    il1: TImageList;
    btnRefresh: TRzToolButton;
    btnExit: TRzToolButton;
    actRefresh: TAction;
    N9: TMenuItem;
    rzbPDManager: TRzToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N13Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure actAssessExecute(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dgeOrderListTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure rzbPDManagerClick(Sender: TObject);
  private
    procedure InitOrderSate;
    procedure SetOrderFilter(state : string);
  public
    { Public declarations }
  end;

//var
//  frmOrderManager: TfrmOrderManager;

implementation

uses untMenServiceDM, untCommonUtil, untOrderInfo, untProductDepotManager;

{$R *.dfm}

//���ڴ���
procedure TfrmOrderManager.FormCreate(Sender: TObject);
begin
  dmMenService.qryMemInfo.Open;
  dmMenService.qryProvince.Open;
  dmMenService.qryCity.Open;
  dmMenService.qryDistrict.Open;
  dmMenService.qryProductInfo.Open;
  dmMenService.qryOrderInfo.Open;

  InitOrderSate;
end;

//���ڹر�
procedure TfrmOrderManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmMenService.qryOrderInfo.Close;
  dmMenService.qryDistrict.Close;
  dmMenService.qryCity.Close;
  dmMenService.qryProvince.Close;
  dmMenService.qryProductInfo.Close;
  dmMenService.qryMemInfo.Close;
end;

//��ʼ������״̬
procedure TfrmOrderManager.InitOrderSate;
begin
  dmMenService.qryOrderInfo.Filtered := False;
end;

//�鿴��������
procedure TfrmOrderManager.actAssessExecute(Sender: TObject);
begin
  if dmMenService.qryOrderInfo.RecordCount > 0 then
  begin
    ShowModalForm(TfrmOrderInfo);
    //dmMenService.qryOrderInfo.Open;
  end else
    ShowMessage('�޿ɲ鿴������');
end;

//���ù�������
procedure TfrmOrderManager.SetOrderFilter(state: string);
begin
  dmMenService.qryOrderInfo.Filtered := False;
  dmMenService.qryOrderInfo.Filter := 'status='+state;
  dmMenService.qryOrderInfo.Filtered := True;
end;

//ȫ��
procedure TfrmOrderManager.N13Click(Sender: TObject);
begin
  dmMenService.qryOrderInfo.Filtered := False;
end;

//�µ�
procedure TfrmOrderManager.N2Click(Sender: TObject);
begin
  SetOrderFilter(SO_NEWORDER);
end;

//������
procedure TfrmOrderManager.N3Click(Sender: TObject);
begin
  SetOrderFilter(SO_PAYMENT_WAIT);
end;

//�����
procedure TfrmOrderManager.N4Click(Sender: TObject);
begin
  SetOrderFilter(SO_ASSESSED);
end;

//�����
procedure TfrmOrderManager.N5Click(Sender: TObject);
begin
  SetOrderFilter(SO_DISPATCHED);
end;

//�ѷ���
procedure TfrmOrderManager.N6Click(Sender: TObject);
begin
  SetOrderFilter(SO_SHIPMENTSED);
end;

//���ջ�
procedure TfrmOrderManager.N7Click(Sender: TObject);
begin
  SetOrderFilter(SO_RECEVIED);
end;

//����
procedure TfrmOrderManager.N8Click(Sender: TObject);
begin
  SetOrderFilter(SO_REJECT);
end;

//ȡ��
procedure TfrmOrderManager.N10Click(Sender: TObject);
begin
  SetOrderFilter(SO_CANCEL);
end;

//���ջ����ؿ�
procedure TfrmOrderManager.N11Click(Sender: TObject);
begin
  SetOrderFilter(SO_WAITCASH);
end;

//���ջ��ѻؿ�
procedure TfrmOrderManager.N12Click(Sender: TObject);
begin
  SetOrderFilter(SO_CASHED);
end;

//�ر�
procedure TfrmOrderManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//ˢ��
procedure TfrmOrderManager.actRefreshExecute(Sender: TObject);
begin
  if not dmMenService.qryOrderInfo.Active then
    dmMenService.qryOrderInfo.Open
  else
    dmMenService.qryOrderInfo.Refresh;
end;

procedure TfrmOrderManager.dgeOrderListTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  FieldSort(dmMenService.qryOrderInfo,Column);
end;

procedure TfrmOrderManager.rzbPDManagerClick(Sender: TObject);
begin
  ShowModalForm(TfrmProductDepotManager);
end;

end.
