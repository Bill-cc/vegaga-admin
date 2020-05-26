unit untSendBackManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DBGridEhGrouping, GridsEh, DBGridEh, Buttons,
  RzButton, Menus, ImgList, ActnList;

type
  TfrmSendBackManager = class(TForm)
    RzToolbar1: TRzToolbar;
    RzMenuToolbarButton1: TRzMenuToolbarButton;
    pmState: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    btnExit: TRzToolButton;
    pmOpt: TPopupMenu;
    aclOpt: TActionList;
    ilList: TImageList;
    N6: TMenuItem;
    dgeSBOList: TDBGridEh;
    actAssess: TAction;
    actRefresh: TAction;
    btnAssess: TRzToolButton;
    btnRefresh: TRzToolButton;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure actAssessExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    procedure SetSBOFilter(state: string);
  public
    { Public declarations }
  end;

//var
//  frmSendBackManager: TfrmSendBackManager;

implementation

uses untMenServiceDM, untCommonUtil, untSBOInfo;

{$R *.dfm}

//��������
procedure TfrmSendBackManager.FormCreate(Sender: TObject);
begin
  dmMenService.qrySBOrderList.Open;
end;

//�رմ���
procedure TfrmSendBackManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmMenService.qrySBOrderList.Close;
end;

//�鿴��������
procedure TfrmSendBackManager.actAssessExecute(Sender: TObject);
begin
  if dmMenService.qrySBOrderList.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmSBOInfo,frmSBOInfo);
    try
      frmSBOInfo.ShowModal;
    finally
      FreeAndNil(frmSBOInfo);

      dmMenService.qrySBOrderList.Refresh;
    end;
  end else
    ShowMessage('�޿ɲ鿴������');
end;

//�˳�
procedure TfrmSendBackManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//�����˻�����״̬
procedure TfrmSendBackManager.SetSBOFilter(state: string);
begin
  dmMenService.qrySBOrderList.Filtered := False;
  dmMenService.qrySBOrderList.Filter := 'state='+state;
  dmMenService.qrySBOrderList.Filtered := True;
end;

//ȫ��
procedure TfrmSendBackManager.N1Click(Sender: TObject);
begin
  dmMenService.qrySBOrderList.Filtered := False;
end;

//�µ�
procedure TfrmSendBackManager.N6Click(Sender: TObject);
begin
  SetSBOFilter(SO_RETURN_NEW);
end;

//�����
procedure TfrmSendBackManager.N2Click(Sender: TObject);
begin
  SetSBOFilter(SO_RETURN_ASSESSED);
end;

//�����
procedure TfrmSendBackManager.N3Click(Sender: TObject);
begin
  SetSBOFilter(SO_RETURN_WAREHOUSING);
end;

//���˿�
procedure TfrmSendBackManager.N4Click(Sender: TObject);
begin
  SetSBOFilter(SO_RETURN_BACKCASH);
end;

//�����
procedure TfrmSendBackManager.N5Click(Sender: TObject);
begin
  SetSBOFilter(SO_RETURN_FINISH);
end;

//ˢ��
procedure TfrmSendBackManager.actRefreshExecute(Sender: TObject);
begin
  dmMenService.qrySBOrderList.Refresh;
end;

end.
