unit untBrandManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, GridsEh, DBGridEh, Menus,
  ActnList, ImgList, RzButton, StdCtrls, Mask, RzEdit,
  RzDBEdit, RzLabel, WebImage, DB, DBCtrls, EhlibBDE, DBGridEhGrouping,
  RzDBCmbo, RzCmboBx;

type
  TfrmBrandManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnlTop: TPanel;
    pnlCenter: TPanel;
    dgeBrandList: TDBGridEh;
    btnCreate: TRzToolButton;
    ilBrandManager: TImageList;
    actlstBrandManager: TActionList;
    pmBrandList: TPopupMenu;
    btnDelete: TRzToolButton;
    btnUpdate: TRzToolButton;
    btnOK: TRzToolButton;
    btnCancel: TRzToolButton;
    btnExit: TRzToolButton;
    lbl1: TRzLabel;
    lbl2: TRzLabel;
    lbl3: TRzLabel;
    lbl4: TRzLabel;
    lbl5: TRzLabel;
    edtNo: TRzDBEdit;
    edtName: TRzDBEdit;
    edt2: TRzDBEdit;
    edt3: TRzDBEdit;
    actCreate: TAction;
    actDelete: TAction;
    actUpdate: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    RzDBMemo1: TRzDBMemo;
    N4: TMenuItem;
    RzLabel1: TRzLabel;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzDBComboBox1: TRzDBComboBox;
    RzDBComboBox2: TRzDBComboBox;
    N5: TMenuItem;
    btn1: TRzToolButton;
    RzLabel4: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    procedure actCreateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure dgeBrandListTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure pmBrandListPopup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    procedure SetButtonEnable;
  public
    { Public declarations }
  end;

//var
//  frmBrandManager: TfrmBrandManager;

implementation

uses untStockCenterDM, untCommonUtil, untSetBPicture;

{$R *.dfm}

//��������
procedure TfrmBrandManager.FormCreate(Sender: TObject);
begin
  dmStockCenter.qrySupplierInfo.Open;
  dmStockCenter.qryBrandList.Open;
end;

//�رմ���
procedure TfrmBrandManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dmStockCenter.qryBrandList.State <> dsBrowse then
    dmStockCenter.qryBrandList.Cancel;
  dmStockCenter.qryBrandList.ReadOnly := True;
  dmStockCenter.qryBrandList.Close;
  dmStockCenter.qrySupplierInfo.Close;
end;

//����
procedure TfrmBrandManager.SetButtonEnable;
begin
  //��ť����
  btnCreate.Enabled := not btnCreate.Enabled;
  btnDelete.Enabled := not btnDelete.Enabled;
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOK.Enabled := not btnOK.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;

  //qry����
  dmStockCenter.qryBrandList.ReadOnly := not dmStockCenter.qryBrandList.ReadOnly;

  //eh����
  dgeBrandList.Enabled := not dgeBrandList.Enabled;
end;

//����
procedure TfrmBrandManager.actCreateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmStockCenter.qryBrandList.State <> dsBrowse then
  begin
    dmStockCenter.qryBrandList.Cancel;
  end;
  dmStockCenter.qryBrandList.Append;
  dmStockCenter.qryBrandList.FieldByName('brand_no').AsString := getBrandEncode;
  dmStockCenter.qryBrandList.FieldByName('sys_status').AsInteger := 1;
end;

//ɾ��
procedure TfrmBrandManager.actDeleteExecute(Sender: TObject);
begin
  if Application.MessageBox('ȷ��ɾ����¼��', '��ʾ', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    SetButtonEnable;
    if dmStockCenter.qryBrandList.State <> dsBrowse then
    begin
      dmStockCenter.qryBrandList.Cancel;
    end;
    dmStockCenter.qryBrandList.Delete;
    SetButtonEnable;
  end;
end;

//�޸�
procedure TfrmBrandManager.actUpdateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmStockCenter.qryBrandList.State <> dsBrowse then
  begin
    dmStockCenter.qryBrandList.Cancel;
  end;
  dmStockCenter.qryBrandList.Edit;
end;

//ȷ��
procedure TfrmBrandManager.btnOKClick(Sender: TObject);
begin
  if dmStockCenter.qryBrandList.State <> dsBrowse then
  begin
    dmStockCenter.qryBrandList.Post;
  end;
  SetButtonEnable;
end;

//ȡ��
procedure TfrmBrandManager.btnCancelClick(Sender: TObject);
begin
  if dmStockCenter.qryBrandList.State <> dsBrowse then
  begin
    dmStockCenter.qryBrandList.Cancel;
  end;
  SetButtonEnable;
end;

//�ر�
procedure TfrmBrandManager.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

//�ϴ�ͼƬ
procedure TfrmBrandManager.N4Click(Sender: TObject);
begin
  if dmStockCenter.qryBrandList.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmSetBPicture,frmSetBPicture);
    try
      frmSetBPicture.ShowModal;
    finally
      FreeAndNil(frmSetBPicture);
    end;  
  end else
    ShowMessage('δѡ��Ʒ�ƣ�');
end;

procedure TfrmBrandManager.dgeBrandListTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  FieldSort(dmStockCenter.qryBrandList,Column);
end;

//����
procedure TfrmBrandManager.pmBrandListPopup(Sender: TObject);
begin
  if dmStockCenter.qryBrandList.FieldByName('sys_status').AsInteger = 1 then
    N5.Caption := '������Ч'
  else
    N5.Caption := '������Ч';
end;

//������Ч
procedure TfrmBrandManager.N5Click(Sender: TObject);
var
  flag : Boolean;
  state : Integer;
begin
  state := dmStockCenter.qryBrandList.FieldByName('sys_status').AsInteger;
  flag := dmStockCenter.qryBrandList.ReadOnly;
  dmStockCenter.qryBrandList.ReadOnly := False;
  dmStockCenter.qryBrandList.Edit;
  if state = 1 then
  begin
    dmStockCenter.qryBrandList.FieldByName('sys_status').AsInteger := 2;
  end else
  if state = 2 then
  begin
    dmStockCenter.qryBrandList.FieldByName('sys_status').AsInteger := 1;
  end;
  dmStockCenter.qryBrandList.Post;
  dmStockCenter.qryBrandList.ReadOnly := flag;
  ShowMessage('���óɹ���');
  dmStockCenter.qryBrandList.Refresh;
end;

procedure TfrmBrandManager.btn1Click(Sender: TObject);
begin
  dmStockCenter.qryBrandList.Refresh;
end;

end.
