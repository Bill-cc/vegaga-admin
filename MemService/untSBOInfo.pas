unit untSBOInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGridEhGrouping, RzButton, GridsEh, DBGridEh,
  StdCtrls, RzLabel, Mask, RzEdit, RzDBEdit;

type
  TfrmSBOInfo = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    dgeSBOPList: TDBGridEh;
    btnPrint: TRzBitBtn;
    btnAssess: TRzBitBtn;
    btnExit: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAssessClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    procedure AssessPass;
  public
    { Public declarations }
  end;

var
  frmSBOInfo: TfrmSBOInfo;

implementation

uses untMenServiceDM, untCommonUtil;

{$R *.dfm}

//��������
procedure TfrmSBOInfo.FormCreate(Sender: TObject);
begin
  dmMenService.qryProductInfo.Open;
  dmMenService.qrySBOPList.Open;
end;

//�رմ���
procedure TfrmSBOInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmMenService.qrySBOPList.Close;
  dmMenService.qryProductInfo.Close;
end;

//���ͨ��
procedure TfrmSBOInfo.btnAssessClick(Sender: TObject);
begin
  case dmMenService.qrySBOrderList.FieldByName('state').AsInteger of
    1 : AssessPass;
    2 : ShowMessage('�˻���������ˣ�');
    3 : ShowMessage('�˻�������Ʒ����⣡');
    4 : ShowMessage('�˻��������˿');
    5 : ShowMessage('�˻���������ɣ�');
  end;
end;

//ͨ�����
procedure TfrmSBOInfo.AssessPass;
var
  sboid,af,bf : Integer;
begin
  sboid := dmMenService.qrySBOrderList.FieldByName('id').AsInteger;
  bf := dmMenService.qrySBOrderList.FieldByName('state').AsInteger;
  af := StrToInt(SO_RETURN_ASSESSED);
  UpdateOrderState(dmMenService.qrySBOrderList,'state',af);
  SetSBOrderState(sboid,bf,af);
  Close;
end;

//�˻�����ӡ
procedure TfrmSBOInfo.btnPrintClick(Sender: TObject);
begin
  //asdf
end;

//�ر�
procedure TfrmSBOInfo.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
