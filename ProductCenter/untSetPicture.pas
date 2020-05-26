unit untSetPicture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzDBEdit, RzLabel, RzButton, Uni,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ExtCtrls, RzCmboBx, WebImage, GridsEh, DBGridEh, Menus, DBGridEhGrouping;

type
  TfrmSetPicture = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    IdHTTP: TIdHTTP;
    btnOK: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzLabel3: TRzLabel;
    edtPath: TRzEdit;
    btnxiugai: TRzButton;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    WebImage1: TWebImage;
    pnl10: TPanel;
    RzLabel4: TRzLabel;
    RzComboBox1: TRzComboBox;
    btnUpload: TRzBitBtn;
    btnSave: TRzBitBtn;
    edtImageLocalPath: TRzEdit;
    dgeImageList: TDBGridEh;
    pmOpt: TPopupMenu;
    N1: TMenuItem;
    dlgOpen: TOpenDialog;
    procedure btnxiugaiClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnUploadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgeImageListCellClick(Column: TColumnEh);
    procedure N1Click(Sender: TObject);
  private
    function UploadPicture(filePath: string): string;
    procedure SavePictureWebPath(webPath: string);
    procedure ShowWebPicture(webPath: string);
  public
    { Public declarations }
  end;

var
  frmSetPicture: TfrmSetPicture;

implementation

uses untPCenterDM;

{$R *.dfm}

{ TfrmSetPicture }

//创建窗口
procedure TfrmSetPicture.FormCreate(Sender: TObject);
begin
  dmPCenter.qryImageList.Open;
end;

//关闭窗口
procedure TfrmSetPicture.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPCenter.qryImageList.Close;
end;

//选择图片
procedure TfrmSetPicture.btnUploadClick(Sender: TObject);
begin
  if dlgOpen.Execute then
  begin
    edtImageLocalPath.Text := dlgOpen.FileName;
  end;
end;

//上传
procedure TfrmSetPicture.btnSaveClick(Sender: TObject);
var
  webPath : string;
begin
  if dmPCenter.qryShelfPList.FieldByName('sku').AsString <> '' then
  begin
    if Trim(edtImageLocalPath.Text) <> '' then
    begin
      webPath := UploadPicture(Trim(edtImageLocalPath.Text));
      if webPath <> '' then
      begin
        SavePictureWebPath(webPath);
        ShowWebPicture(webPath);
      end;
      edtImageLocalPath.Text := '';
    end;
  end else
    ShowMessage('连接断开，请重新登陆！');
end;

//图片上传
function TfrmSetPicture.UploadPicture(filePath: string): string;
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
    idHTTP.Post(Trim(edtPath.Text), inStream, GetStream);
    Result := GetStream.DataString;
    GetStream.Free;
    inStream.Free;
  end;
end;

//保存上传图片
procedure TfrmSetPicture.SavePictureWebPath(webPath: string);
var
  psku,fileExt : string;
begin
  fileExt := ExtractFileExt(webPath);
  psku := dmPCenter.qryShelfPList.FieldByName('sku').AsString;
  with dmPCenter.qryImageList do
  begin
    Append;
    FieldByName('p_sku').AsString := psku;
    FieldByName('obj_type').AsInteger := 2;
    FieldByName('pic_path').AsString := webPath;
    FieldByName('pic_m_path').AsString := StringReplace(webPath,fileExt,'_m'+fileExt,[]);
    FieldByName('pic_s_path').AsString := StringReplace(webPath,fileExt,'_s'+fileExt,[]);
    FieldByName('pic_type').AsInteger := StrToInt(RzComboBox1.Value);
    FieldByName('sys_status').AsInteger := 1;
    Post;
  end;
end;

procedure TfrmSetPicture.btnxiugaiClick(Sender: TObject);
begin
  if btnxiugai.Caption = '修改' then
  begin
    edtPath.ReadOnly := False;
    btnxiugai.Caption := '确定';
  end else
  begin
    edtPath.ReadOnly := True;
    btnxiugai.Caption := '修改';
  end;
end;

procedure TfrmSetPicture.btnOKClick(Sender: TObject);
begin
  Close;
end;

//查看图片
procedure TfrmSetPicture.dgeImageListCellClick(Column: TColumnEh);
begin
  if dmPCenter.qryImageList.RecordCount > 0 then
  begin
    ShowWebPicture(dmPCenter.qryImageList.FieldByName('pic_path').AsString);
  end;
end;

//显示图片
procedure TfrmSetPicture.ShowWebPicture(webPath: string);
begin
  WebImage1.URL := webPath;
  WebImage1.Update;
end;

//删除
procedure TfrmSetPicture.N1Click(Sender: TObject);
begin
  if dmPCenter.qryImageList.RecordCount > 0 then
  begin
    if Application.MessageBox('确定删除图片？', '提示', MB_OKCANCEL + 
      MB_DEFBUTTON2) = IDOK then
    begin
      dmPCenter.qryImageList.Delete;
    end;
  end;
end;

end.
