unit untCreateOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel, ImgList,
  Menus, ActnList, StdCtrls, RzLabel, RzButton, RzDBNav, DBCtrls, RzDBCmbo,
  RzCmboBx, Mask, RzEdit, RzDBEdit, DB, RzDBBnEd, RzBtnEdt;

type
  TfrmCreateOrder = class(TForm)
    RzToolbar1: TRzToolbar;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    dgeOrderList: TDBGridEh;
    aclCreateOrder: TActionList;
    pmOPList: TPopupMenu;
    ilOPTool: TImageList;
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
    RzLabel14: TRzLabel;
    btnCreate: TRzToolButton;
    actCreate: TAction;
    actUpdate: TAction;
    actOk: TAction;
    actCancel: TAction;
    btnUpdate: TRzToolButton;
    btnOk: TRzToolButton;
    btnCancel: TRzToolButton;
    RzDBNavigator1: TRzDBNavigator;
    N1: TMenuItem;
    N2: TMenuItem;
    actAddProduct: TAction;
    actDelProduct: TAction;
    RzDBEdit1: TRzDBEdit;
    RzDBComboBox1: TRzDBComboBox;
    RzDBEdit2: TRzDBEdit;
    RzDBComboBox2: TRzDBComboBox;
    RzDBComboBox3: TRzDBComboBox;
    RzDBEdit3: TRzDBEdit;
    RzDBLookupComboBox1: TRzDBLookupComboBox;
    RzDBLookupComboBox2: TRzDBLookupComboBox;
    RzDBLookupComboBox3: TRzDBLookupComboBox;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBMemo1: TRzDBMemo;
    btnRefresh: TRzToolButton;
    actRefresh: TAction;
    btnExit: TRzToolButton;
    actExit: TAction;
    RzLabel15: TRzLabel;
    RzDBEdit8: TRzDBEdit;
    RzLabel16: TRzLabel;
    RzDBButtonEdit1: TRzDBButtonEdit;
    RzLabel17: TRzLabel;
    RzLabel19: TRzLabel;
    RzLabel20: TRzLabel;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBButtonEdit2: TRzDBButtonEdit;
    RzLabel18: TRzLabel;
    RzDBEdit10: TRzDBEdit;
    RzLabel21: TRzLabel;
    RzDBEdit12: TRzDBEdit;
    procedure actAddProductExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actExitExecute(Sender: TObject);
    procedure actCreateExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actDelProductExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure RzDBButtonEdit1ButtonClick(Sender: TObject);
    procedure RzDBButtonEdit2ButtonClick(Sender: TObject);
  private
    procedure InitDate;
    procedure SetButtonEnable;
    procedure AddProduct;
    procedure SetOrderId;
    procedure FilterNewOrder;
    procedure SetOrderPrice;
    function GetProductNum(pname,psku: string;pcnum: Integer): Integer;
  public
    { Public declarations }
  end;

//var
//  frmCreateOrder: TfrmCreateOrder;

implementation

uses untAddOrderProduct, untMenServiceDM, untCommonUtil, untSetCOPNum, untCInvoice,
     untSelectMem;

{$R *.dfm}

//��������
procedure TfrmCreateOrder.FormCreate(Sender: TObject);
begin
  InitDate;
end;

//��ʼ������
procedure TfrmCreateOrder.InitDate;
begin
  dmMenService.InitOrderInfo;
  FilterNewOrder;
end;

//ֻ��ʾ�¶���
procedure TfrmCreateOrder.FilterNewOrder;
begin
  dmMenService.qryOrderInfo.Filtered := False;
  dmMenService.qryOrderInfo.Filter := 'status='+SO_NEWORDER;
  dmMenService.qryOrderInfo.Filtered := True;

  dmMenService.qryOrderInfo.IndexFieldNames := 'so_id desc';
  dmMenService.qryOrderInfo.First;
end;

//�رմ���
procedure TfrmCreateOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmMenService.qryOrderInfo.ReadOnly := True;
  dmMenService.qryOPList.ReadOnly := True;
  dmMenService.CloseOrderInfo;
end;

//�����Ʒ
procedure TfrmCreateOrder.actAddProductExecute(Sender: TObject);
var
  resVal : Integer;
begin
  resVal := 0;
  if dmMenService.qryOrderInfo.State <> dsBrowse then
  begin
    Application.CreateForm(TfrmAddOrderProduct,frmAddOrderProduct);
    try
      resVal := frmAddOrderProduct.ShowModal;
    finally
      FreeAndNil(frmAddOrderProduct);
      
      if resVal = 1 then AddProduct;
    end;
  end else
    ShowMessage('δ���ڱ༭״̬��');
end;

//�����Ʒ
procedure TfrmCreateOrder.AddProduct;
var
  i : Integer;
begin
  with dmMenService.qryOPList do
  begin
    DisableControls;
    for i := Low(addOPList) to High(addOPList) do
    begin
      if Locate('p_sku',addOPList[i].psku,[loCaseInsensitive]) then
      begin
        ShowMessage('�����SKU��Ϊ '+addOPList[i].psku+' ����Ʒ��');
        Continue;
      end;

      if addOPList[i].pcnum = 0 then
      begin
        ShowMessage('��Ʒ '+addOPList[i].pname+' ����������Ϊ0��');
        Continue;
      end;

      Append;
      FieldByName('p_id').AsInteger := addOPList[i].pid;
      FieldByName('p_sku').AsString := addOPList[i].psku;
      FieldByName('p_number').AsInteger := GetProductNum(addOPList[i].pname,
                                                         addOPList[i].psku,
                                                         addOPList[i].pcnum);
      FieldByName('sale_price').AsFloat := addOPList[i].pprice;
      FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
      Post;
    end;
    EnableControls;
  end;
end;

//��ȡ��Ʒ����
function TfrmCreateOrder.GetProductNum(pname,psku: string;pcnum: Integer): Integer;
begin
  Application.CreateForm(TfrmSetCOPNum,frmSetCOPNum);
  try
    frmSetCOPNum.edt1.Text := pname;
    frmSetCOPNum.edt2.Text := psku;
    frmSetCOPNum.RzNumericEdit1.IntValue := pcnum;
    frmSetCOPNum.RzNumericEdit2.Max := pcnum;
    Result := frmSetCOPNum.ShowModal;
  finally
    FreeAndNil(frmSetCOPNum);
  end;  
end;

//����
procedure TfrmCreateOrder.SetButtonEnable;
begin
  //��ť����
  btnCreate.Enabled := not btnCreate.Enabled;
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOk.Enabled := not btnOk.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;
  btnRefresh.Enabled := not btnRefresh.Enabled;
  RzDBNavigator1.Enabled := not RzDBNavigator1.Enabled;

  //qry
  dmMenService.qryOrderInfo.ReadOnly := not dmMenService.qryOrderInfo.ReadOnly;
  dmMenService.qryOPList.ReadOnly := not dmMenService.qryOPList.ReadOnly;
end;

//�˳�
procedure TfrmCreateOrder.actExitExecute(Sender: TObject);
begin
  Close;
end;

//����
procedure TfrmCreateOrder.actCreateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmMenService.qryOrderInfo.State <> dsBrowse then
  begin
    dmMenService.qryOrderInfo.Cancel;
  end;
  dmMenService.qryOrderInfo.Append;
  dmMenService.qryOrderInfo.FieldByName('so_sn').AsString := getSOrderEncode;
  dmMenService.qryOrderInfo.FieldByName('status').AsInteger := StrToInt(SO_NEWORDER);
  dmMenService.qryOrderInfo.FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
  dmMenService.qryOrderInfo.FieldByName('sub_date').AsDateTime := Date;
end;

//�޸�
procedure TfrmCreateOrder.actUpdateExecute(Sender: TObject);
begin
  if dmMenService.qryOrderInfo.RecordCount > 0 then
  begin
    SetButtonEnable;
    if dmMenService.qryOrderInfo.State <> dsBrowse then
    begin
      dmMenService.qryOrderInfo.Cancel;
    end;
    dmMenService.qryOrderInfo.Edit;
  end else
    ShowMessage('û�п��޸Ķ�����');
end;

//ˢ��
procedure TfrmCreateOrder.actRefreshExecute(Sender: TObject);
begin
  dmMenService.qryOrderInfo.Refresh;
end;

//ȷ��
procedure TfrmCreateOrder.actOkExecute(Sender: TObject);
begin
  if dmMenService.qryOrderInfo.State <> dsBrowse then
  begin
    dmMenService.qryOrderInfo.Post;
    if dmMenService.qryOPList.State <> dsBrowse then
    begin
      dmMenService.qryOPList.Post;
    end;
    SetOrderId;
    if dmMenService.qryOPList.UpdatesPending then
    begin
      dmMenService.qryOPList.ApplyUpdates;
      dmMenService.qryOPList.CommitUpdates;
    end;
    SetOrderPrice;
  end;
  SetButtonEnable;
end;

//���ö����ܼ�
procedure TfrmCreateOrder.SetOrderPrice;
var
  sp,pp,ptp : Real;
  i : Integer;
begin
  sp := dmMenService.qryOrderInfo.FieldByName('ship_amount').AsCurrency;
  ptp := dmMenService.qryOrderInfo.FieldByName('preferential_price').AsCurrency;
  pp := 0;
  with dmMenService.qryOPList do
  begin
    DisableControls;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      pp := pp + FieldByName('sale_amount').AsCurrency;
      Next;
    end;
    First;
    EnableControls;
  end;
  dmMenService.qryOrderInfo.Edit;
  dmMenService.qryOrderInfo.FieldByName('p_amount').AsCurrency := pp;
  dmMenService.qryOrderInfo.FieldByName('amount').AsCurrency := pp;
  dmMenService.qryOrderInfo.FieldByName('final_amount').AsCurrency := pp + sp-ptp;
  dmMenService.qryOrderInfo.Post;
end;

//���ö���ID
procedure TfrmCreateOrder.SetOrderId;
var
  i,oid : Integer;
begin
  oid := dmMenService.qryOrderInfo.FieldByName('so_id').AsInteger;
  dmMenService.qryOPList.DisableControls;
  dmMenService.qryOPList.First;
  for i := 0 to dmMenService.qryOPList.RecordCount - 1 do
  begin
    dmMenService.qryOPList.Edit;
    dmMenService.qryOPList.FieldByName('so_id').AsInteger := oid;
    dmMenService.qryOPList.Post;
    dmMenService.qryOPList.Next;
  end;
  dmMenService.qryOPList.EnableControls;
end;

//ȡ��
procedure TfrmCreateOrder.actCancelExecute(Sender: TObject);
begin
  if dmMenService.qryOrderInfo.State <> dsBrowse then
  begin
    dmMenService.qryOrderInfo.Cancel;
    dmMenService.qryOPList.CancelUpdates;
  end;
  SetButtonEnable;
end;

//ɾ����Ʒ
procedure TfrmCreateOrder.actDelProductExecute(Sender: TObject);
begin
  if dmMenService.qryOrderInfo.State <> dsBrowse then
  begin
    if Application.MessageBox('ȷ��ɾ������Ʒ��', '��ʾ', MB_OKCANCEL + 
      MB_DEFBUTTON2) = IDOK then
    begin
      if dmMenService.qryOPList.State <> dsBrowse then
      begin
        dmMenService.qryOPList.Post;
      end;
      if dmMenService.qryOPList.RecordCount > 0 then
        dmMenService.qryOPList.Delete;
    end;
  end else
    ShowMessage('δ���ڱ༭״̬!');
end;

//������Ʊ
procedure TfrmCreateOrder.RzDBButtonEdit1ButtonClick(Sender: TObject);
begin
  if dmMenService.qryOrderInfo.State <> dsBrowse then
  begin
    Application.CreateForm(TfrmCInvoice,frmCInvoice);
    try
      frmCInvoice.ShowModal;
    finally
      FreeAndNil(frmCInvoice);
    end;
  end else
    ShowMessage('δ���ڱ༭״̬��');
end;

//ѡ���Ա
procedure TfrmCreateOrder.RzDBButtonEdit2ButtonClick(Sender: TObject);
var
  resVal : Integer;
begin
  if dmMenService.qryOrderInfo.State <> dsBrowse then
  begin
    Application.CreateForm(TfrmSelectMem,frmSelectMem);
    try
      resVal := frmSelectMem.ShowModal;
    finally
      FreeAndNil(frmSelectMem);

      if resVal = 1 then
        dmMenService.qryOrderInfo.FieldByName('m_id').AsInteger := selMemberId;
    end;
  end else
    ShowMessage('δ���ڱ༭״̬��');
end;

end.
