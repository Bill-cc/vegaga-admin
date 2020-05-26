unit untCSoRList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh;

type
  TfrmCSoRList = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btn1: TRzBitBtn;
    dge1: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCSoRList: TfrmCSoRList;

implementation

uses untMenServiceDM;

{$R *.dfm}

//´´½¨
procedure TfrmCSoRList.FormCreate(Sender: TObject);
begin
  dmMenService.qryCSoRList.Open;
end;

//¹Ø±Õ
procedure TfrmCSoRList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmMenService.qryCSoRList.Close;
end;

procedure TfrmCSoRList.btn1Click(Sender: TObject);
begin
  Close;
end;

end.
