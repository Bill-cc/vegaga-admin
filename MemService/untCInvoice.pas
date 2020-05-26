unit untCInvoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, StdCtrls, RzCmboBx, Mask, RzEdit, RzDBEdit,
  RzLabel;

type
  TfrmCInvoice = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnOk: TRzBitBtn;
    btnCancel: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzEdit1: TRzEdit;
    RzComboBox1: TRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    function CreateInvoice: Integer;
  public
    { Public declarations }
  end;

var
  frmCInvoice: TfrmCInvoice;

implementation

uses untMenServiceDM;

{$R *.dfm}

//��������
procedure TfrmCInvoice.FormCreate(Sender: TObject);
begin
  //asdf
end;

//�رմ���
procedure TfrmCInvoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //asf
end;

//ȡ��
procedure TfrmCInvoice.btnCancelClick(Sender: TObject);
begin
  Close;
end;

//ȷ��
procedure TfrmCInvoice.btnOkClick(Sender: TObject);
begin
  if Trim(RzEdit1.Text) <> '' then
  begin
    dmMenService.qryOrderInfo.FieldByName('invoice_id').AsInteger := CreateInvoice;
    Close;
  end else
    ShowMessage('�����뷢Ʊ̧ͷ��');
end;

//������Ʊ
function TfrmCInvoice.CreateInvoice: Integer;
var
  oid : Integer;
begin
  oid := dmMenService.qryOrderInfo.FieldByName('so_id').AsInteger;
  with dmMenService.qryInvoiceInfo do
  begin
    ReadOnly := False;
    Append;
    FieldByName('so_id').AsInteger := oid;
    FieldByName('title').AsString := Trim(RzEdit1.Text);
    FieldByName('content').AsString := Trim(RzComboBox1.Text);
    FieldByName('create_date').AsDateTime := Date;
    FieldByName('sys_status').AsInteger := 1;
    Post;
    Refresh;
    Result := FieldByName('invoice_id').AsInteger;
  end;
end;

end.
