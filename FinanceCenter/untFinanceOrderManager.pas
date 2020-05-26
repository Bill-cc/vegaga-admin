unit untFinanceOrderManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel,
  ActnList, Menus, RzButton, ImgList, Buttons;

type
  TfrmFinanceOrderManager = class(TForm)
    rztlbr1: TRzToolbar;
    pnl1: TPanel;
    dgeFOList: TDBGridEh;
    pmOpt: TPopupMenu;
    aclOpt: TActionList;
    ilList: TImageList;
    btnAssess: TRzToolButton;
    actAssess: TAction;
    btnExit: TRzToolButton;
    N1: TMenuItem;
    dlgSave: TSaveDialog;
    RzMenuToolbarButton1: TRzMenuToolbarButton;
    N2: TMenuItem;
    btnRefresh: TRzToolButton;
    actRefresh: TAction;
    N3: TMenuItem;
    pmState: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actAssessExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    procedure SetOState(state: string);
    procedure ShowAll;
  public
    { Public declarations }
  end;

//var
//  frmFinanceOrderManager: TfrmFinanceOrderManager;

implementation

uses untFCenterDM, untFOrderInfo, DBGridEHImpExp, untCommonUtil;

{$R *.dfm}

//��������
procedure TfrmFinanceOrderManager.FormCreate(Sender: TObject);
begin
  dmFCenter.qryMemInfo.Open;
  dmFCenter.qryExpressInfo.Open;
  dmFCenter.qryProvince.Open;
  dmFCenter.qryCity.Open;
  dmFCenter.qryDistrict.Open;
  dmFCenter.qryFOrderInfo.Open;
end;

//�رմ���
procedure TfrmFinanceOrderManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmFCenter.qryFOrderInfo.Close;
  dmFCenter.qryProvince.Close;
  dmFCenter.qryCity.Close;
  dmFCenter.qryDistrict.Close;
  dmFCenter.qryExpressInfo.Close;
  dmFCenter.qryMemInfo.Close;
end;

//�˳�
procedure TfrmFinanceOrderManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//�鿴
procedure TfrmFinanceOrderManager.actAssessExecute(Sender: TObject);
begin
  if dmFCenter.qryFOrderInfo.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmFOrderInfo,frmFOrderInfo);
    try
      frmFOrderInfo.ShowModal;
    finally
      FreeAndNil(frmFOrderInfo);

      dmFCenter.qryFOrderInfo.Refresh;
    end;
  end else
    ShowMessage('�޿ɲ鿴������');
end;

//��������
procedure TfrmFinanceOrderManager.N1Click(Sender: TObject);
begin
  if dlgSave.Execute then
  begin
    try
      SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,dgeFOList,dlgSave.FileName,true);
    except
      showMessage('����Excel����');
      Exit;
    end;
  end;
end;

//ˢ��
procedure TfrmFinanceOrderManager.actRefreshExecute(Sender: TObject);
begin
  dmFCenter.qryFOrderInfo.Refresh;
end;

//ȫ��
procedure TfrmFinanceOrderManager.N9Click(Sender: TObject);
begin
  ShowAll;
end;

//�ѷ���
procedure TfrmFinanceOrderManager.N4Click(Sender: TObject);
begin
  SetOState(SO_SHIPMENTSED);
end;

//���ջ�
procedure TfrmFinanceOrderManager.N5Click(Sender: TObject);
begin
  SetOState(SO_RECEVIED);
end;

//���ջ����ؿ�
procedure TfrmFinanceOrderManager.N6Click(Sender: TObject);
begin
  SetOState(SO_WAITCASH);
end;

//���ջ��ѻؿ�
procedure TfrmFinanceOrderManager.N7Click(Sender: TObject);
begin
  SetOState(SO_CASHED);
end;

//�˻����
procedure TfrmFinanceOrderManager.N8Click(Sender: TObject);
begin
  SetOState(SO_RETURN_OK);
end;

//���ö���״̬
procedure TfrmFinanceOrderManager.SetOState(state: string);
begin
  dmFCenter.qryFOrderInfo.Filtered := False;
  dmFCenter.qryFOrderInfo.Filter := 'status='+state;
  dmFCenter.qryFOrderInfo.Filtered := True;
end;

//��ʾȫ��
procedure TfrmFinanceOrderManager.ShowAll;
begin
  dmFCenter.qryFOrderInfo.Filtered := False;
  dmFCenter.qryFOrderInfo.Filter := '';
end;

end.
