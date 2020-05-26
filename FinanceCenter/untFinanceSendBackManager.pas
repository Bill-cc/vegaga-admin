unit untFinanceSendBackManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel,
  ActnList, RzButton, ImgList, Menus, Buttons;

type
  TfrmFinanceSendBackManager = class(TForm)
    rztlbr1: TRzToolbar;
    pnl1: TPanel;
    aclOpt: TActionList;
    pmOpt: TPopupMenu;
    ilImage: TImageList;
    btnInfo: TRzToolButton;
    actOInfo: TAction;
    btnExit: TRzToolButton;
    dgeFSBOList: TDBGridEh;
    RzMenuToolbarButton1: TRzMenuToolbarButton;
    pmState: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    btnrefresh: TRzToolButton;
    actRefresh: TAction;
    N5: TMenuItem;
    procedure actOInfoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmFinanceSendBackManager: TfrmFinanceSendBackManager;

implementation

uses untFCenterDM, untFSBOInfo, untCommonUtil;

{$R *.dfm}

//�򿪴���
procedure TfrmFinanceSendBackManager.FormCreate(Sender: TObject);
begin
  dmFCenter.qryFSBOList.Open;
end;

//�رմ���
procedure TfrmFinanceSendBackManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmFCenter.qryFSBOList.Close;
end;

//�鿴������Ϣ
procedure TfrmFinanceSendBackManager.actOInfoExecute(Sender: TObject);
begin
  if dmFCenter.qryFSBOList.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmFSBOInfo,frmFSBOInfo);
    try
      frmFSBOInfo.ShowModal;
    finally
      FreeAndNil(frmFSBOInfo);

      dmFCenter.qryFSBOList.Refresh;
    end;
  end else
    ShowMessage('�޿ɲ鿴�˻�����');
end;

//�˳�
procedure TfrmFinanceSendBackManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//ˢ��
procedure TfrmFinanceSendBackManager.actRefreshExecute(Sender: TObject);
begin
  dmFCenter.qryFSBOList.Refresh;
end;

//ȫ��
procedure TfrmFinanceSendBackManager.N1Click(Sender: TObject);
begin
  dmFCenter.qryFSBOList.Filtered := False;
end;

//�����
procedure TfrmFinanceSendBackManager.N2Click(Sender: TObject);
begin
  dmFCenter.qryFSBOList.Filtered := False;
  dmFCenter.qryFSBOList.Filter := 'state='+SO_RETURN_WAREHOUSING;
  dmFCenter.qryFSBOList.Filtered := True;
end;

//���˿�
procedure TfrmFinanceSendBackManager.N3Click(Sender: TObject);
begin
  dmFCenter.qryFSBOList.Filtered := False;
  dmFCenter.qryFSBOList.Filter := 'state='+SO_RETURN_BACKCASH;
  dmFCenter.qryFSBOList.Filtered := True;
end;

end.
