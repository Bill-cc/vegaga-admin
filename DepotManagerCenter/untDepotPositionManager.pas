unit untDepotPositionManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ActnList, ExtCtrls, RzPanel, 
  GridsEh, DBGridEh, RzButton, RzDBEdit, StdCtrls, Mask, RzEdit, RzCmboBx,
  RzDBCmbo, RzLabel, DB, DBGridEhGrouping;

type
  TfrmDepotPositionManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    acldpFunction: TActionList;
    ilDpImage: TImageList;
    pmDpList: TPopupMenu;
    actCreate: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    actRefresh: TAction;
    actOk: TAction;
    actCancel: TAction;
    btnCreate: TRzToolButton;
    btnDelete: TRzToolButton;
    btnUpdate: TRzToolButton;
    btnOk: TRzToolButton;
    btnCancel: TRzToolButton;
    btnRefresh: TRzToolButton;
    btnExit: TRzToolButton;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzDBComboBox1: TRzDBComboBox;
    RzDBComboBox2: TRzDBComboBox;
    RzDBComboBox3: TRzDBComboBox;
    RzDBComboBox4: TRzDBComboBox;
    RzDBComboBox5: TRzDBComboBox;
    RzDBEdit1: TRzDBEdit;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzDBNumericEdit3: TRzDBNumericEdit;
    actChange: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    dgeDpList: TDBGridEh;
    RzLabel10: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    btnStockStat: TRzToolButton;
    actStockStat: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCreateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure actChangeExecute(Sender: TObject);
    procedure actStockStatExecute(Sender: TObject);
    procedure dgeDpListTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    procedure SetButtonEnable;
    procedure SetDpNum;
    procedure SetRemnant;
  public
    { Public declarations }
  end;

//var
//  frmDepotPositionManager: TfrmDepotPositionManager;

implementation

uses untDepotCenterDM, untStockStat, untCommonUtil;

{$R *.dfm}

//创建窗口
procedure TfrmDepotPositionManager.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryDpList.Open;
end;

//关闭窗口
procedure TfrmDepotPositionManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDepotCenter.qryDpList.ReadOnly := True;
  dmDepotCenter.qryDpList.Close;
end;

//设置互斥
procedure TfrmDepotPositionManager.SetButtonEnable;
begin
  //按钮呼哧
  btnCreate.Enabled := not btnCreate.Enabled;
  btnDelete.Enabled := not btnDelete.Enabled;
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOk.Enabled := not btnOk.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;
  btnRefresh.Enabled := not btnRefresh.Enabled;

  //qry
  dmDepotCenter.qryDpList.ReadOnly := not dmDepotCenter.qryDpList.ReadOnly;

  //eh
  dgeDpList.Enabled := not dgeDpList.Enabled;
end;

//增加
procedure TfrmDepotPositionManager.actCreateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmDepotCenter.qryDpList.State <> dsBrowse then
  begin
    dmDepotCenter.qryDpList.Cancel;
  end;
  dmDepotCenter.qryDpList.Append;
end;

//删除
procedure TfrmDepotPositionManager.actDeleteExecute(Sender: TObject);
begin
  if Application.MessageBox('确定删除记录？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    SetButtonEnable;
    if dmDepotCenter.qryDpList.State <> dsBrowse then
    begin
      dmDepotCenter.qryDpList.Cancel;
    end;
    dmDepotCenter.qryDpList.Delete;
    SetButtonEnable;
  end;
end;

//修改
procedure TfrmDepotPositionManager.actUpdateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmDepotCenter.qryDpList.State <> dsBrowse then
  begin
    dmDepotCenter.qryDpList.Cancel;
  end;
  dmDepotCenter.qryDpList.Edit;
end;

//刷新
procedure TfrmDepotPositionManager.actRefreshExecute(Sender: TObject);
begin
  if dmDepotCenter.qryDpList.State = dsBrowse then
    dmDepotCenter.qryDpList.Refresh
  else
    ShowMessage('请先保存数据！');
end;

//确定
procedure TfrmDepotPositionManager.actOkExecute(Sender: TObject);
begin
  if dmDepotCenter.qryDpList.State <> dsBrowse then
  begin
    SetRemnant;
    dmDepotCenter.qryDpList.Post;
  end;
  SetButtonEnable;
end;

procedure TfrmDepotPositionManager.actCancelExecute(Sender: TObject);
begin
  if dmDepotCenter.qryDpList.State <> dsBrowse then
  begin
    dmDepotCenter.qryDpList.Cancel;
  end;
  SetButtonEnable;
end;

procedure TfrmDepotPositionManager.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmDepotPositionManager.SetDpNum;
var
  dtype,dcol,dnum,dlayer,dposition,dpnum : string;
begin
  dtype := RzDBComboBox1.Text;
  dcol := RzDBComboBox2.Text;
  dnum := RzDBComboBox3.Text;
  dlayer := RzDBComboBox4.Text;
  dposition := RzDBComboBox5.Text;
  dpnum := dtype+dcol+dnum+dlayer+dposition;
  if dmDepotCenter.qryDpList.State <> dsBrowse then
  begin
    dmDepotCenter.qryDpList.FieldByName('dp_dpnum').AsString := dpnum;
  end;
end;

procedure TfrmDepotPositionManager.actChangeExecute(Sender: TObject);
begin
  SetDpNum;
end;

//同步剩余量
procedure TfrmDepotPositionManager.SetRemnant;
var
  rating,dpuse : Integer;
begin
  rating := RzDBNumericEdit1.IntValue;
  dpuse := RzDBNumericEdit2.IntValue;
  if dmDepotCenter.qryDpList.State <> dsBrowse then
    dmDepotCenter.qryDpList.FieldByName('dp_remnant').AsInteger := rating - dpuse;
end;

//库存统计
procedure TfrmDepotPositionManager.actStockStatExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmStockStat,frmStockStat);
  try
    frmStockStat.ShowModal;
  finally
    FreeAndNil(frmStockStat);
  end;  
end;

procedure TfrmDepotPositionManager.dgeDpListTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  FieldSort(dmDepotCenter.qryDpList,Column);
end;

end.
