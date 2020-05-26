unit untSetConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzButton, StdCtrls, Mask, RzEdit, RzLabel;

type
  TfrmSetConfig = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    btnOk: TRzBitBtn;
    btnCancel: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    edt1: TRzEdit;
    edt2: TRzEdit;
    edt3: TRzEdit;
    RzEdit1: TRzEdit;
    RzEdit2: TRzEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetConfig: TfrmSetConfig;

implementation

uses untIniIO, untCommonUtil;

{$R *.dfm}

//取消
procedure TfrmSetConfig.btnCancelClick(Sender: TObject);
begin
  Close;
end;

//确定
procedure TfrmSetConfig.btnOkClick(Sender: TObject);
var
  conf : TIniOptions;
begin
  try
    conf := TIniOptions.Create;
    if (Trim(edt1.Text) <> '') and (Trim(edt2.Text) <> '') and
       (Trim(edt3.Text) <> '') and (Trim(RzEdit1.Text) <> '') and
       (Trim(RzEdit2.Text) <> '') then
    begin
      conf.DataConfigserverAddr := Encrypt(Trim(edt1.Text));
      conf.DataConfigserverName := Encrypt(Trim(edt2.Text));
      conf.DataConfigserverPort := Encrypt(Trim(edt3.Text));
      conf.DataConfiguserName := Encrypt(Trim(RzEdit1.Text));
      conf.DataConfigpassword := Encrypt(Trim(RzEdit2.Text));
      conf.SaveToFile('./confing.ini');
    end else
      ShowMessage('信息填写不完整！');
    FreeAndNil(conf);
  finally
    ShowMessage('修改成功！');
    Close;
  end;
end;

end.
