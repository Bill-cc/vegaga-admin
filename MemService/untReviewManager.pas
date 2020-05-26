unit untReviewManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel, RzButton,
  ImgList;

type
  TfrmReviewManager = class(TForm)
    rztlbr1: TRzToolbar;
    pnl1: TPanel;
    pnl2: TPanel;
    dge1: TDBGridEh;
    pnl3: TPanel;
    pnl4: TPanel;
    btnExit: TRzBitBtn;
    btn1: TRzToolButton;
    il1: TImageList;
    btn2: TRzToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReviewManager: TfrmReviewManager;

implementation

uses untMenServiceDM;

{$R *.dfm}

//创建窗口
procedure TfrmReviewManager.FormCreate(Sender: TObject);
begin
  dmMenService.qryReviewList.Open;
end;

//关闭窗口
procedure TfrmReviewManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmMenService.qryReviewList.Close;
end;

//退出
procedure TfrmReviewManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//刷新
procedure TfrmReviewManager.btn2Click(Sender: TObject);
begin
  dmMenService.qryReviewList.Refresh;
end;

//删除
procedure TfrmReviewManager.btn1Click(Sender: TObject);
begin
  if Application.MessageBox('确定删除记录？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    dmMenService.qryReviewList.Delete;
  end;
end;

end.
