unit untEStOPUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzDlgBtn, StdCtrls, Mask, RzEdit, RzLabel;

type
  TfrmEStOPUpdate = class(TForm)
    RzDialogButtons1: TRzDialogButtons;
    pnl1: TPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzNumericEdit1: TRzNumericEdit;
    RzNumericEdit2: TRzNumericEdit;
    procedure RzNumericEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEStOPUpdate: TfrmEStOPUpdate;

implementation

{$R *.dfm}

procedure TfrmEStOPUpdate.RzNumericEdit2Change(Sender: TObject);
var
  num,udnum : Integer;
begin
  num := StrToInt(RzNumericEdit1.Text);
  udnum := StrToInt(RzNumericEdit2.Text);

  if udnum < num then
  begin
    RzNumericEdit2.Text := IntToStr(num);
  end;
end;

end.
