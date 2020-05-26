unit untShowSql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzButton, DASQLMonitor, UniSQLMonitor, StdCtrls,
  RzEdit;

type
  TfrmShowSql = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btn1: TRzBitBtn;
    RzMemo: TRzMemo;
    UniSQLMonitor: TUniSQLMonitor;
    procedure UniSQLMonitorSQL(Sender: TObject; Text: String;
      Flag: TDATraceFlag);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    lineCount : Integer;
  public
    { Public declarations }
  end;

var
  frmShowSql: TfrmShowSql;

implementation

{$R *.dfm}

procedure TfrmShowSql.UniSQLMonitorSQL(Sender: TObject; Text: String;
  Flag: TDATraceFlag);
begin
  RzMemo.Lines.Append('--------------'+IntToStr(lineCount)+'--------------');
  RzMemo.Lines.Append(Text);
  Inc(lineCount);
end;

procedure TfrmShowSql.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmShowSql.FormCreate(Sender: TObject);
begin
  lineCount := 1;
end;

procedure TfrmShowSql.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
