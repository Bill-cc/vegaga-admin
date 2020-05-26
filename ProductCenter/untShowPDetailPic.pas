unit untShowPDetailPic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WebImage, ExtCtrls, RzButton;

type
  TfrmShowPDetailPic = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    WebImage1: TWebImage;
    btn1: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
  private
    procedure ShowPicture(path: string);
  public
    { Public declarations }
  end;

var
  frmShowPDetailPic: TfrmShowPDetailPic;

implementation

uses untPCenterDM;

{$R *.dfm}

//��������
procedure TfrmShowPDetailPic.FormCreate(Sender: TObject);
var
  psku : string;
begin
  psku := dmPCenter.qryShelfPList.FieldByName('sku').AsString;
  dmPCenter.qryFindPPic.Close;
  dmPCenter.qryFindPPic.ParamByName('psku').AsString := psku;
  dmPCenter.qryFindPPic.Open;
  //��ʾͼƬ
  ShowPicture(dmPCenter.qryFindPPic.FieldByName('pic_path').AsString);
end;

//�رմ���
procedure TfrmShowPDetailPic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPCenter.qryFindPPic.Close;
end;

//�رմ���
procedure TfrmShowPDetailPic.btn1Click(Sender: TObject);
begin
  Close;
end;

//��ʾͼƬ
procedure TfrmShowPDetailPic.ShowPicture(path: string);
begin
  WebImage1.URL := path;
  WebImage1.Update;
end;

end.
