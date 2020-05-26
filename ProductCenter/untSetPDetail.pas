unit untSetPDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzButton, mshtml, OleCtrls, SHDocVw, ActiveX, RzPanel,
  StdCtrls, RzLabel, Mask, RzEdit, RzDBEdit, DBCtrls, RzCmboBx, RzDBCmbo, DB;

type
  TfrmSetPDetail = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    pnl4: TPanel;
    pnl5: TPanel;
    btnOk: TRzBitBtn;
    btnCancel: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit13: TRzDBEdit;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    RzDBEdit14: TRzDBEdit;
    RzDBEdit15: TRzDBEdit;
    RzDBEdit16: TRzDBEdit;
    RzDBComboBox1: TRzDBComboBox;
    RzDBEdit17: TRzDBEdit;
    RzDBEdit18: TRzDBEdit;
    RzDBEdit19: TRzDBEdit;
    RzDBEdit20: TRzDBEdit;
    RzDBMemo1: TRzDBMemo;
    RzDBEdit21: TRzDBEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzLabel25: TRzLabel;
    RzDBEdit22: TRzDBEdit;
    RzLabel26: TRzLabel;
    RzDBComboBox2: TRzDBComboBox;
    btn1: TRzBitBtn;
    btn2: TRzBitBtn;
    btn3: TRzBitBtn;
    RzLabel27: TRzLabel;
    RzDBEdit23: TRzDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetPDetail: TfrmSetPDetail;

implementation

uses untPCenterDM, untShowPDetailPic;

{$R *.dfm}

//创建窗口
procedure TfrmSetPDetail.FormCreate(Sender: TObject);
begin
  dmPCenter.qryPrdStyle.Open;
  dmPCenter.qryShelfPList.Edit;
end;

//关闭窗口
procedure TfrmSetPDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dmPCenter.qryShelfPList.State <> dsBrowse then
    dmPCenter.qryShelfPList.Cancel;
  dmPCenter.qryPrdStyle.Close;
end;

//取消
procedure TfrmSetPDetail.btnCancelClick(Sender: TObject);
begin
  dmPCenter.qryShelfPList.Cancel;
  Close;
end;

//确定
procedure TfrmSetPDetail.btnOkClick(Sender: TObject);
begin
  dmPCenter.qryShelfPList.Post;
  Close;
end;

procedure TfrmSetPDetail.btn1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmShowPDetailPic,frmShowPDetailPic);
  try
    frmShowPDetailPic.ShowModal;
  finally
    FreeAndNil(frmShowPDetailPic);
  end;
end;

//上一商品
procedure TfrmSetPDetail.btn2Click(Sender: TObject);
begin
  dmPCenter.qryShelfPList.Post;
  dmPCenter.qryShelfPList.Prior;
  dmPCenter.qryShelfPList.Edit;
end;

//下一商品
procedure TfrmSetPDetail.btn3Click(Sender: TObject);
begin
  dmPCenter.qryShelfPList.Post;
  dmPCenter.qryShelfPList.Next;
  dmPCenter.qryShelfPList.Edit;
end;

end.
