unit about;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, RzButton, ComCtrls, RzEdit;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    img1: TImage;
    RzRichEdit1: TRzRichEdit;
    btnOk: TRzBitBtn;
    procedure btnOkClick(Sender: TObject);
    procedure img1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses untShowSql;

{$R *.dfm}

procedure TAboutBox.btnOkClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutBox.img1DblClick(Sender: TObject);
begin
  if not Assigned(frmShowSql) then
    Application.CreateForm(TfrmShowSql,frmShowSql);
  frmShowSql.Show;
end;

end.
 
