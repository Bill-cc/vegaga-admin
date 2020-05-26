unit untSetBPicture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WebImage, ExtCtrls, StdCtrls, Mask, RzEdit, RzDBEdit, RzLabel,
  RzButton, ExtDlgs, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TfrmSetBPicture = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    WebImage1: TWebImage;
    RzLabel1: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    edtPath: TRzEdit;
    btnSelect: TRzBitBtn;
    btnUpdate: TRzBitBtn;
    btnExit: TRzBitBtn;
    opd1SelectPic: TOpenPictureDialog;
    IdHTTP: TIdHTTP;
    procedure btnSelectClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
  private
    procedure ShowWebPicture(webPath: string);
    function UploadPicture(filePath: string): string;
    procedure SaveImage(webPath: string);
  public
    { Public declarations }
  end;

var
  frmSetBPicture: TfrmSetBPicture;

implementation

uses untStockCenterDM;

{$R *.dfm}

//创建窗口
procedure TfrmSetBPicture.FormCreate(Sender: TObject);
begin
  ShowWebPicture(dmStockCenter.qryBrandList.FieldByName('logo_path').AsString);
end;

//关闭
procedure TfrmSetBPicture.btnExitClick(Sender: TObject);
begin
  Close;
end;

//选择图片按钮
procedure TfrmSetBPicture.btnSelectClick(Sender: TObject);
begin
  if opd1SelectPic.Execute then
  begin
    edtPath.Text := opd1SelectPic.FileName;
  end;
end;

//上传图片
procedure TfrmSetBPicture.btnUpdateClick(Sender: TObject);
var
  webPath : string;
begin
  webPath := '';
  if Trim(edtPath.Text) <> '' then
  begin
    webPath := UploadPicture(Trim(edtPath.Text));
    ShowWebPicture(webPath);
    SaveImage(webPath);
  end else
    ShowMessage('请选择图片！');
end;

//保存图片
procedure TfrmSetBPicture.SaveImage(webPath: string);
begin
  if webPath <> '' then
  begin
    with dmStockCenter.qryBrandList do
    begin
      ReadOnly := False;
      Edit;
      FieldByName('logo_path').AsString := webPath;
      Post;
      ReadOnly := True;
    end;
  end;
end;

//显示图片
procedure TfrmSetBPicture.ShowWebPicture(webPath: string);
begin
  if webPath <> '' then
  begin
    WebImage1.URL := webPath;
    WebImage1.Update;
  end;
end;

//上传图片
function TfrmSetBPicture.UploadPicture(filePath: string): string;
var
  inStream : TMemoryStream;
  GetStream : TStringStream;
  fileExt : string;
begin
  Result := '';
  if filePath <> '' then
  begin
    inStream := TMemoryStream.Create;
    inStream.LoadFromFile(filePath);
    filePath := AnsiLowerCaseFileName(filePath);
    fileExt := ExtractFileExt(filePath);
    if fileExt = '.jpg' then idHTTP.Request.ContentType := 'image/jpeg';
    if fileExt = '.jpeg' then idHTTP.Request.ContentType := 'image/jpeg';
    if fileExt = '.bmp' then idHTTP.Request.ContentType := 'image/bmp';
    if fileExt = '.gif' then idHTTP.Request.ContentType := 'image/gif';
    inStream.Position := 0;
    GetStream := TStringStream.Create('');
    idHTTP.Post('http://img.vegaga.com/servlet/UploadServlet.do', inStream, GetStream);
    Result := GetStream.DataString;
    GetStream.Free;
    inStream.Free;
  end;
end;

end.
