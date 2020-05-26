unit untSetROPNum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzDlgBtn, RzEdit, StdCtrls, Mask, RzLabel;

type
  TfrmSetROPNum = class(TForm)
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
    procedure RzDialogButtons1ClickCancel(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    resVal : Integer;
  public
    { Public declarations }
  end;

var
  frmSetROPNum: TfrmSetROPNum;

implementation

{$R *.dfm}

//窗口创建
procedure TfrmSetROPNum.FormCreate(Sender: TObject);
begin
  RzNumericEdit2.Max := RzNumericEdit1.IntValue;
end;

//关闭窗口
procedure TfrmSetROPNum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ModalResult := resVal;
end;

procedure TfrmSetROPNum.RzDialogButtons1ClickOk(Sender: TObject);
begin
  resVal := RzNumericEdit2.IntValue;
  Close;
end;

procedure TfrmSetROPNum.RzNumericEdit2Change(Sender: TObject);
begin
  if RzNumericEdit2.IntValue > RzNumericEdit1.IntValue then
    RzNumericEdit2.IntValue := RzNumericEdit1.IntValue;
  if RzNumericEdit2.IntValue < 1 then
    RzNumericEdit2.IntValue := 1;
end;

//取消
procedure TfrmSetROPNum.RzDialogButtons1ClickCancel(Sender: TObject);
begin
  resVal := -1;
  Close;
end;

end.
