unit untExpressInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzDlgBtn, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh;

type
  TfrmExpressInfo = class(TForm)
    pnl1: TPanel;
    RzDialogButtons1: TRzDialogButtons;
    dgeEList: TDBGridEh;
    procedure RzDialogButtons1ClickOk(Sender: TObject);
    procedure RzDialogButtons1ClickCancel(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExpressInfo: TfrmExpressInfo;
  expressId : Integer;

implementation

uses untDepotCenterDM;

{$R *.dfm}

//确定
procedure TfrmExpressInfo.RzDialogButtons1ClickOk(Sender: TObject);
begin
  expressId := dmDepotCenter.qryExpInfo.FieldByName('id').AsInteger;
  Close;
  Self.ModalResult := 1;
end;

//取消
procedure TfrmExpressInfo.RzDialogButtons1ClickCancel(Sender: TObject);
begin
  Close;
  Self.ModalResult := 2;
end;

end.
