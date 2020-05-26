unit untSetCOPNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzDlgBtn, RzEdit, StdCtrls, Mask, RzLabel;

type
  TfrmSetCOPNum = class(TForm)
    RzDialogButtons1: TRzDialogButtons;
    pnl1: TPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edt1: TRzEdit;
    edt2: TRzEdit;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzNumericEdit1: TRzNumericEdit;
    RzNumericEdit2: TRzNumericEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzDialogButtons1ClickOk(Sender: TObject);
    procedure RzNumericEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetCOPNum: TfrmSetCOPNum;

implementation

{$R *.dfm}

//¹Ø±Õ´°¿Ú
procedure TfrmSetCOPNum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ModalResult := RzNumericEdit2.IntValue;
end;

procedure TfrmSetCOPNum.RzDialogButtons1ClickOk(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetCOPNum.RzNumericEdit2Change(Sender: TObject);
begin
  if RzNumericEdit2.IntValue > RzNumericEdit1.IntValue then
    RzNumericEdit2.IntValue := RzNumericEdit1.IntValue;
end;

end.
