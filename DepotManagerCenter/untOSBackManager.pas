unit untOSBackManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DBGridEhGrouping, GridsEh, DBGridEh,
  RzButton, Buttons, ImgList, ActnList, Menus;

type
  TfrmOSBackManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnl1: TPanel;
    dgeSBOList: TDBGridEh;
    RzMenuToolbarButton1: TRzMenuToolbarButton;
    btnExit: TRzToolButton;
    pmState: TPopupMenu;
    pmOpt: TPopupMenu;
    aclOpt: TActionList;
    ilList: TImageList;
    actAssess: TAction;
    actRefresh: TAction;
    btnAssess: TRzToolButton;
    btnRefresh: TRzToolButton;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure actAssessExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actRefreshExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOSBackManager: TfrmOSBackManager;

implementation

uses untDepotCenterDM, untROInfo, untCommonUtil;

{$R *.dfm}

//��������
procedure TfrmOSBackManager.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryROrderList.Open;
end;

//�رմ���
procedure TfrmOSBackManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDepotCenter.qryROrderList.Close;
end;

//�鿴
procedure TfrmOSBackManager.actAssessExecute(Sender: TObject);
begin
  if dmDepotCenter.qryROrderList.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmROInfo,frmROInfo);
    try
      frmROInfo.ShowModal;
    finally
      FreeAndNil(frmROInfo);

      dmDepotCenter.qryROrderList.Refresh;
    end;  
  end else
    ShowMessage('�޿ɲ鿴������');
end;

//ˢ��
procedure TfrmOSBackManager.actRefreshExecute(Sender: TObject);
begin
  dmDepotCenter.qryROrderList.Refresh;
end;

//ȫ��
procedure TfrmOSBackManager.N1Click(Sender: TObject);
begin
  dmDepotCenter.qryROrderList.Filtered := False;
end;

//�����
procedure TfrmOSBackManager.N2Click(Sender: TObject);
begin
  dmDepotCenter.qryROrderList.Filtered := False;
  dmDepotCenter.qryROrderList.Filter := 'state'+SO_RETURN_ASSESSED;
  dmDepotCenter.qryROrderList.Filtered := True;
end;

//�����
procedure TfrmOSBackManager.N3Click(Sender: TObject);
begin
  dmDepotCenter.qryROrderList.Filtered := False;
  dmDepotCenter.qryROrderList.Filter := 'state'+SO_RETURN_WAREHOUSING;
  dmDepotCenter.qryROrderList.Filtered := True;
end;

//�˳�
procedure TfrmOSBackManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
