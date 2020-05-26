unit untEStOPDel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzDlgBtn, StdCtrls, RzLabel, Mask, RzEdit;

type
  TfrmEStOPDel = class(TForm)
    RzDialogButtons1: TRzDialogButtons;
    pnl1: TPanel;
    RzNumericEdit1: TRzNumericEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzNumericEdit2: TRzNumericEdit;
    procedure RzNumericEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEStOPDel: TfrmEStOPDel;

implementation

{$R *.dfm}

procedure TfrmEStOPDel.RzNumericEdit2Change(Sender: TObject);
var
  num,delnum : Integer;
begin
  num := StrToInt(RzNumericEdit1.Text);
  delnum := StrToInt(RzNumericEdit2.Text);

  if delnum > num then
  begin
    RzNumericEdit2.Text := IntToStr(num);
  end;
end;

end.
