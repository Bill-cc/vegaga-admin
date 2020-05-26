unit untSelectMem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzButton;

type
  TfrmSelectMem = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    dge1: TDBGridEh;
    pnl3: TPanel;
    pnl4: TPanel;
    btnOk: TRzBitBtn;
    btnExit: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectMem: TfrmSelectMem;
  selMemberId : Integer;

implementation

uses untMenServiceDM;

{$R *.dfm}

//创建窗口
procedure TfrmSelectMem.FormCreate(Sender: TObject);
begin
  dmMenService.qrySelectMem.Open;
end;

//关闭窗口
procedure TfrmSelectMem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmMenService.qrySelectMem.Close;
end;

//确定
procedure TfrmSelectMem.btnOkClick(Sender: TObject);
begin
  selMemberId := dmMenService.qrySelectMem.FieldByName('m_id').AsInteger;
  Close;
  ModalResult := 1;
end;

//退出
procedure TfrmSelectMem.btnExitClick(Sender: TObject);
begin
  Close;
  ModalResult := 2;
end;

end.
