unit untSupplierManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, 
  GridsEh, DBGridEh, Menus, ActnList, ImgList, RzButton, StdCtrls, RzLabel,
  Mask, RzEdit, RzDBEdit, DB, DBGridEhGrouping, RzCmboBx, RzDBCmbo;

type
  TfrmSupplierManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    ilSupplierToolbar: TImageList;
    actlstSupplierManager: TActionList;
    pmSupplierList: TPopupMenu;
    btnCreate: TRzToolButton;
    btnDelete: TRzToolButton;
    btnUpdate: TRzToolButton;
    btnOK: TRzToolButton;
    btnCancel: TRzToolButton;
    btnExit: TRzToolButton;
    lblEncode: TRzLabel;
    lbl1: TRzLabel;
    lbl2: TRzLabel;
    lbl3: TRzLabel;
    lbl4: TRzLabel;
    lbl5: TRzLabel;
    lbl6: TRzLabel;
    lbl7: TRzLabel;
    lbl8: TRzLabel;
    lbl9: TRzLabel;
    lbl10: TRzLabel;
    actCreate: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    N1: TMenuItem;
    actDelete1: TMenuItem;
    actUpdate1: TMenuItem;
    RzLabel1: TRzLabel;
    dgeSList: TDBGridEh;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBComboBox1: TRzDBComboBox;
    RzDBComboBox2: TRzDBComboBox;
    RzDBComboBox3: TRzDBComboBox;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    procedure actCreateExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure dgeSListTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    procedure SetButtonEnable;
  public
    { Public declarations }
  end;

//var
//  frmSupplierManager: TfrmSupplierManager;

implementation

uses untStockCenterDM, untCommonUtil;

{$R *.dfm}

//创建窗口
procedure TfrmSupplierManager.FormCreate(Sender: TObject);
begin
  dmStockCenter.qrySupplierList.Open;
end;

//关闭窗口
procedure TfrmSupplierManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qrySupplierList.ReadOnly := True;
  dmStockCenter.qrySupplierList.Close;
end;

//设置互斥
procedure TfrmSupplierManager.SetButtonEnable;
begin
  //按钮互斥
  btnCreate.Enabled := not btnCreate.Enabled;
  btnDelete.Enabled := not btnDelete.Enabled;
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOK.Enabled := not btnOK.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;

  //编辑框互斥
  dmStockCenter.qrySupplierList.ReadOnly := not dmStockCenter.qrySupplierList.ReadOnly;

  //列表互斥
  dgeSList.Enabled := not dgeSList.Enabled;
end;

//增加
procedure TfrmSupplierManager.actCreateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmStockCenter.qrySupplierList.State <> dsBrowse then
  begin
    dmStockCenter.qrySupplierList.Cancel;
  end;
  dmStockCenter.qrySupplierList.Append;
  dmStockCenter.qrySupplierList.FieldByName('sn').AsString := getSupplierEncode;
end;

//删除
procedure TfrmSupplierManager.actDeleteExecute(Sender: TObject);
begin
  if Application.MessageBox('确定删除记录？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    SetButtonEnable;
    if dmStockCenter.qrySupplierList.State <> dsBrowse then
    begin
      dmStockCenter.qrySupplierList.Cancel;
    end;
    dmStockCenter.qrySupplierList.Delete;
    SetButtonEnable;
  end;
end;

//更新
procedure TfrmSupplierManager.actUpdateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmStockCenter.qrySupplierList.State <> dsBrowse then
  begin
    dmStockCenter.qrySupplierList.Cancel;
  end;
  dmStockCenter.qrySupplierList.Edit;
end;

//确定
procedure TfrmSupplierManager.btnOKClick(Sender: TObject);
begin
  if dmStockCenter.qrySupplierList.State in [dsEdit,dsInsert] then
  begin
    dmStockCenter.qrySupplierList.Post;
  end;
  SetButtonEnable;
end;

//取消
procedure TfrmSupplierManager.btnCancelClick(Sender: TObject);
begin
  if dmStockCenter.qrySupplierList.State in [dsEdit,dsInsert] then
  begin
    dmStockCenter.qrySupplierList.Cancel;
  end;
  SetButtonEnable;
end;

procedure TfrmSupplierManager.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmSupplierManager.dgeSListTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  FieldSort(dmStockCenter.qrySupplierList,Column);
end;

end.
