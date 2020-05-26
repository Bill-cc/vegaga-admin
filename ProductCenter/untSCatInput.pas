unit untSCatInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Mask, RzEdit, DBCtrls, RzDBCmbo, RzLabel,
  RzDBEdit;

type
  TfrmSCatInput = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel3: TRzLabel;
    btnOk: TRzBitBtn;
    btnCancel: TRzBitBtn;
    edtName: TRzEdit;
    edtPName: TRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSCatInput: TfrmSCatInput;
  okFlag : Boolean;
  scatName : string;

implementation

uses untPCenterDM;

{$R *.dfm}

//����
procedure TfrmSCatInput.FormCreate(Sender: TObject);
begin
  //
end;

//�ر�
procedure TfrmSCatInput.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //
end;

//ȷ��
procedure TfrmSCatInput.btnOkClick(Sender: TObject);
begin
  if Trim(edtName.Text) <> '' then
  begin
    okFlag := True;
    scatName := Trim(edtName.Text);
    Close;
  end else
    ShowMessage('����д����');
end;

//ȡ��
procedure TfrmSCatInput.btnCancelClick(Sender: TObject);
begin
  okFlag := False;
  Close;
end;

end.
