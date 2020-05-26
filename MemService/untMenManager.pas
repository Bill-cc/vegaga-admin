unit untMenManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, GridsEh, DBGridEh, Menus, DB,
  RzButton, StdCtrls, RzLabel, Mask, RzEdit, RzDBEdit, ImgList, ActnList,
  DBGridEhGrouping;

type
  TfrmMenManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    dgeMemList: TDBGridEh;
    actlstMenManager: TActionList;
    ilMemMananger: TImageList;
    pmMemList: TPopupMenu;
    edtEmail: TRzDBEdit;
    edtNickName: TRzDBEdit;
    edtLevel: TRzDBEdit;
    btnUpdate: TRzToolButton;
    btnOK: TRzToolButton;
    lblEmail: TRzLabel;
    lblNickName: TRzLabel;
    lblLevel: TRzLabel;
    lblRegDate: TRzLabel;
    lblRegIp: TRzLabel;
    lblRegFrom: TRzLabel;
    lblRecByName: TRzLabel;
    lblLoginTimes: TRzLabel;
    lblLoginDate: TRzLabel;
    edtRegDate: TRzDBEdit;
    edtRegIp: TRzDBEdit;
    edtRegFrom: TRzDBEdit;
    edtRecByName: TRzDBEdit;
    edtLoginTimes: TRzDBEdit;
    edtLoginDate: TRzDBEdit;
    actUpdate: TAction;
    btnCancel: TRzToolButton;
    btnExit: TRzToolButton;
    actCreate: TAction;
    btnCreate: TRzToolButton;
    btn1: TRzToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actUpdateExecute(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure actCreateExecute(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    procedure SetButtonEnable;
  public
    { Public declarations }
  end;

//var
//  frmMenManager: TfrmMenManager;

implementation

uses untMenServiceDM, untReviewManager;

{$R *.dfm}

procedure TfrmMenManager.FormCreate(Sender: TObject);
begin
  dmMenService.qryMenList.Open;
end;

procedure TfrmMenManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dmMenService.qryMenList.State in [dsInsert,dsEdit] then
  begin
    dmMenService.qryMenList.Cancel;
  end;
  dmMenService.qryMenList.Close;
end;

procedure TfrmMenManager.SetButtonEnable;
begin
  //按钮互斥
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOK.Enabled := not btnOK.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;

  //编辑框互斥
  //edtEmail.ReadOnly := not edtEmail.ReadOnly;
  edtNickName.ReadOnly := not edtNickName.ReadOnly;
  edtLevel.ReadOnly := not edtLevel.ReadOnly;
  edtRegDate.ReadOnly := not edtRegDate.ReadOnly;
  edtRegIp.ReadOnly := not edtRegIp.ReadOnly;
  edtRegFrom.ReadOnly := not edtRegFrom.ReadOnly;
  edtRecByName.ReadOnly := not edtRecByName.ReadOnly;
  edtLoginTimes.ReadOnly := not edtLoginTimes.ReadOnly;
  edtLoginDate.ReadOnly := not edtLoginDate.ReadOnly;

  //列表
  dgeMemList.Enabled := not dgeMemList.Enabled;
end;

//创建用户
procedure TfrmMenManager.actCreateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmMenService.qryMenList.State <> dsBrowse then
  begin
    dmMenService.qryMenList.Post;
  end;
  dmMenService.qryMenList.Append;
end;

//修改
procedure TfrmMenManager.actUpdateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmMenService.qryMenList.State <> dsBrowse then
  begin
    dmMenService.qryMenList.Post;
  end;
  dmMenService.qryMenList.Edit;
end;

//确定
procedure TfrmMenManager.btnOKClick(Sender: TObject);
begin
  if dmMenService.qryMenList.State <> dsBrowse then
    dmMenService.qryMenList.Post;
  SetButtonEnable;
end;

//取消
procedure TfrmMenManager.btnCancelClick(Sender: TObject);
begin
  dmMenService.qryMenList.Cancel;
  SetButtonEnable;
end;

procedure TfrmMenManager.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

//订单评论
procedure TfrmMenManager.btn1Click(Sender: TObject);
begin
  Application.CreateForm(TfrmReviewManager,frmReviewManager);
  try
    frmReviewManager.ShowModal;
  finally
    FreeAndNil(frmReviewManager);
  end;
end;

end.
