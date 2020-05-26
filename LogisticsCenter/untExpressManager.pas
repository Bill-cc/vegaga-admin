unit untExpressManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ActnList, ExtCtrls, RzPanel, DB, 
  GridsEh, DBGridEh, RzButton, StdCtrls, RzLabel, DBGridEhGrouping, Mask,
  RzEdit, RzDBEdit, RzRadChk, RzDBChk, DBCtrls;

type
  TfrmExpressManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnl1: TPanel;
    pnl2: TPanel;
    actlst1: TActionList;
    il1: TImageList;
    pm1: TPopupMenu;
    dgeExpressList: TDBGridEh;
    btnCreate: TRzToolButton;
    btnDelete: TRzToolButton;
    btnUpdate: TRzToolButton;
    btnOK: TRzToolButton;
    btnCancel: TRzToolButton;
    btnExit: TRzToolButton;
    btnRefresh: TRzToolButton;
    actCreate: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    actRefresh: TAction;
    lbl1: TRzLabel;
    lbl2: TRzLabel;
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
    RzLabel13: TRzLabel;
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
    RzLabel25: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel28: TRzLabel;
    RzLabel29: TRzLabel;
    RzLabel30: TRzLabel;
    RzLabel31: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
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
    RzDBEdit15: TRzDBEdit;
    RzDBEdit16: TRzDBEdit;
    RzDBEdit17: TRzDBEdit;
    RzDBEdit18: TRzDBEdit;
    RzDBEdit19: TRzDBEdit;
    RzDBEdit20: TRzDBEdit;
    RzDBEdit21: TRzDBEdit;
    RzDBEdit22: TRzDBEdit;
    RzDBEdit23: TRzDBEdit;
    RzDBEdit24: TRzDBEdit;
    RzDBEdit25: TRzDBEdit;
    RzDBEdit26: TRzDBEdit;
    RzDBEdit27: TRzDBEdit;
    RzDBEdit28: TRzDBEdit;
    RzDBEdit29: TRzDBEdit;
    RzDBEdit30: TRzDBEdit;
    RzDBEdit31: TRzDBEdit;
    RzDBEdit32: TRzDBEdit;
    RzDBEdit33: TRzDBEdit;
    RzDBEdit34: TRzDBEdit;
    RzDBEdit35: TRzDBEdit;
    RzDBDateTimeEdit1: TRzDBDateTimeEdit;
    RzDBMemo1: TRzDBMemo;
    RzDBCheckBox1: TRzDBCheckBox;
    actCreate1: TMenuItem;
    actDelete1: TMenuItem;
    actUpdate1: TMenuItem;
    actRefresh1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCreateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    procedure SetButtonEnable;
  public
    { Public declarations }
  end;

//var
//  frmExpressManager: TfrmExpressManager;

implementation

uses untExpressManagerDM, untCommonUtil;

{$R *.dfm}

{ TfrmExpressManager }

//设置互斥
procedure TfrmExpressManager.SetButtonEnable;
begin
  //设置按钮互斥
  btnCreate.Enabled := not btnCreate.Enabled;
  btnDelete.Enabled := not btnDelete.Enabled;
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOK.Enabled := not btnOK.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;
  btnRefresh.Enabled := not btnCancel.Enabled;

  //qry
  dmExpressManager.qryTdmExpressList.ReadOnly := not dmExpressManager.qryTdmExpressList.ReadOnly;

  //eh
  dgeExpressList.Enabled := not dgeExpressList.Enabled;
end;

//创建
procedure TfrmExpressManager.FormCreate(Sender: TObject);
begin
  dmExpressManager.qryTdmExpressList.Open;
end;

//关闭
procedure TfrmExpressManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmExpressManager.qryTdmExpressList.ReadOnly := True;
  dmExpressManager.qryTdmExpressList.Close;
end;

//增加
procedure TfrmExpressManager.actCreateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmExpressManager.qryTdmExpressList.State <> dsBrowse then
  begin
    dmExpressManager.qryTdmExpressList.Cancel;
  end;
  dmExpressManager.qryTdmExpressList.Append;
  dmExpressManager.qryTdmExpressList.FieldByName('express_no').AsString := getExpressEncode;
end;

//删除
procedure TfrmExpressManager.actDeleteExecute(Sender: TObject);
begin
  if Application.MessageBox('确定删除记录？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    SetButtonEnable;
    if dmExpressManager.qryTdmExpressList.State <> dsBrowse then
    begin
      dmExpressManager.qryTdmExpressList.Cancel;
    end;
    dmExpressManager.qryTdmExpressList.Delete;
    SetButtonEnable;
  end;
end;

//修改
procedure TfrmExpressManager.actUpdateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmExpressManager.qryTdmExpressList.State <> dsBrowse then
  begin
    dmExpressManager.qryTdmExpressList.Cancel;
  end;
  dmExpressManager.qryTdmExpressList.Edit;
end;

//刷新
procedure TfrmExpressManager.actRefreshExecute(Sender: TObject);
begin
  dmExpressManager.qryTdmExpressList.Refresh;
end;

//确定
procedure TfrmExpressManager.btnOKClick(Sender: TObject);
begin
  if dmExpressManager.qryTdmExpressList.State <> dsBrowse then
  begin
    dmExpressManager.qryTdmExpressList.Post;
  end;
  SetButtonEnable;
end;

//取消
procedure TfrmExpressManager.btnCancelClick(Sender: TObject);
begin
  if dmExpressManager.qryTdmExpressList.State <> dsBrowse then
  begin
    dmExpressManager.qryTdmExpressList.Cancel;
  end;
  SetButtonEnable;
end;

procedure TfrmExpressManager.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

end.
