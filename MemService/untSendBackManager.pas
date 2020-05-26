unit untSendBackManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DBGridEhGrouping, GridsEh, DBGridEh, Buttons,
  RzButton, Menus, ImgList, ActnList;

type
  TfrmSendBackManager = class(TForm)
    RzToolbar1: TRzToolbar;
    RzMenuToolbarButton1: TRzMenuToolbarButton;
    pmState: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    btnExit: TRzToolButton;
    pmOpt: TPopupMenu;
    aclOpt: TActionList;
    ilList: TImageList;
    N6: TMenuItem;
    dgeSBOList: TDBGridEh;
    actAssess: TAction;
    actRefresh: TAction;
    btnAssess: TRzToolButton;
    btnRefresh: TRzToolButton;
    N7: TMenuItem;
    N8: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure actAssessExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
  private
    procedure SetSBOFilter(state: string);
  public
    { Public declarations }
  end;

//var
//  frmSendBackManager: TfrmSendBackManager;

implementation

uses untMenServiceDM, untCommonUtil, untSBOInfo;

{$R *.dfm}

//创建窗口
procedure TfrmSendBackManager.FormCreate(Sender: TObject);
begin
  dmMenService.qrySBOrderList.Open;
end;

//关闭窗口
procedure TfrmSendBackManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmMenService.qrySBOrderList.Close;
end;

//查看订单详情
procedure TfrmSendBackManager.actAssessExecute(Sender: TObject);
begin
  if dmMenService.qrySBOrderList.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmSBOInfo,frmSBOInfo);
    try
      frmSBOInfo.ShowModal;
    finally
      FreeAndNil(frmSBOInfo);

      dmMenService.qrySBOrderList.Refresh;
    end;
  end else
    ShowMessage('无可查看订单！');
end;

//退出
procedure TfrmSendBackManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//设置退货订单状态
procedure TfrmSendBackManager.SetSBOFilter(state: string);
begin
  dmMenService.qrySBOrderList.Filtered := False;
  dmMenService.qrySBOrderList.Filter := 'state='+state;
  dmMenService.qrySBOrderList.Filtered := True;
end;

//全部
procedure TfrmSendBackManager.N1Click(Sender: TObject);
begin
  dmMenService.qrySBOrderList.Filtered := False;
end;

//新单
procedure TfrmSendBackManager.N6Click(Sender: TObject);
begin
  SetSBOFilter(SO_RETURN_NEW);
end;

//已审核
procedure TfrmSendBackManager.N2Click(Sender: TObject);
begin
  SetSBOFilter(SO_RETURN_ASSESSED);
end;

//已入库
procedure TfrmSendBackManager.N3Click(Sender: TObject);
begin
  SetSBOFilter(SO_RETURN_WAREHOUSING);
end;

//已退款
procedure TfrmSendBackManager.N4Click(Sender: TObject);
begin
  SetSBOFilter(SO_RETURN_BACKCASH);
end;

//已完成
procedure TfrmSendBackManager.N5Click(Sender: TObject);
begin
  SetSBOFilter(SO_RETURN_FINISH);
end;

//刷新
procedure TfrmSendBackManager.actRefreshExecute(Sender: TObject);
begin
  dmMenService.qrySBOrderList.Refresh;
end;

end.
