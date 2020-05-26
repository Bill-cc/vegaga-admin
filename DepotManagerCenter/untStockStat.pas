unit untStockStat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, StdCtrls, Mask,
  RzEdit, RzLabel, RzButton;

type
  TfrmStockStat = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    dgeSSList: TDBGridEh;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    btnCancel: TRzBitBtn;
    dgeSkuLogList: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    procedure SetStatData;
  public
    { Public declarations }
  end;

var
  frmStockStat: TfrmStockStat;

implementation

uses untDepotCenterDM;

{$R *.dfm}

//创建窗口
procedure TfrmStockStat.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryStockStat.Open;
  dmDepotCenter.qrySLList.Open;
  SetStatData;
end;

//关闭窗口
procedure TfrmStockStat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDepotCenter.qrySLList.Close;
  dmDepotCenter.qryStockStat.Close;
end;

//统计数据
procedure TfrmStockStat.SetStatData;
var
  i,s_num : Integer;
begin
  s_num := 0;
  with dmDepotCenter.qryStockStat do
  begin
    DisableControls;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      s_num := s_num + FieldByName('stock').AsInteger;
      Next;
    end;
    First;
    EnableControls;

    RzEdit1.Text := IntToStr(RecordCount);
    RzEdit2.Text := IntToStr(s_num);
  end;
end;

procedure TfrmStockStat.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
