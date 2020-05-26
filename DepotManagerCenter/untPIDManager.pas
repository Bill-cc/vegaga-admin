unit untPIDManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzSplit, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh,
  StdCtrls, RzLabel, RzButton, Mask, RzEdit, RzDBEdit, Menus, DB;

type
  TfrmPIDManager = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    RzSplitter: TRzSplitter;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    RzGroupBox3: TRzGroupBox;
    dgeStOPList: TDBGridEh;
    dgeStOPOpt: TDBGridEh;
    RzLabel1: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    pmStOPList: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    pmSkuLog: TPopupMenu;
    N5: TMenuItem;
    pnl4: TPanel;
    btnExit: TRzBitBtn;
    btnOk: TRzBitBtn;
    btnException: TRzBitBtn;
    btnPrint: TRzBitBtn;
    pnl5: TPanel;
    procedure btnExitClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure dgeStOPOptDblClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnExceptionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrintClick(Sender: TObject);
  private
    function CheckComplete: Boolean;
    procedure PrintInDepotOrder;
    procedure InitStatus;
    procedure SetButtonStatus(b1,b2,b3,b4,b5: Boolean);
  public
    { Public declarations }
  end;

var
  frmPIDManager: TfrmPIDManager;

implementation

uses untDepotCenterDM, untPIDOpt, untCommonUtil, untCommonDm;

{$R *.dfm}

//��������
procedure TfrmPIDManager.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryProductInfo.Open;
  dmDepotCenter.qryStOPInDepot.Open;
  dmDepotCenter.qrySkuLog.Open;
  InitStatus;
end;

//�رմ���
procedure TfrmPIDManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDepotCenter.qrySkuLog.Close;
  dmDepotCenter.qryStOPInDepot.Close;
  dmDepotCenter.qryProductInfo.Close;
end;

//��ʼ����ť״̬
procedure TfrmPIDManager.InitStatus;
begin
  case dmDepotCenter.qryStOInDepot.FieldByName('state').AsInteger of
    1 : SetButtonStatus(True,True,True,True,True);
    3 : SetButtonStatus(False,False,False,False,False);
    4 : SetButtonStatus(False,False,False,False,False);
    5 : SetButtonStatus(True,True,True,True,True);
  end;
end;

//���ð�ť״̬
procedure TfrmPIDManager.SetButtonStatus(b1, b2, b3, b4, b5: Boolean);
begin
  N1.Enabled := b1;
  N3.Enabled := b2;
  N5.Enabled := b3;
  btnOk.Enabled := b4;
  btnException.Enabled := b5;
end;

//�ر�
procedure TfrmPIDManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//�����ѡ
procedure TfrmPIDManager.N3Click(Sender: TObject);
begin
  dgeStOPList.Selection.Clear;
end;

//���
procedure TfrmPIDManager.N1Click(Sender: TObject);
begin
  if dgeStOPList.SelectedRows.Count > 0 then
  begin
    Application.CreateForm(TfrmPIDOpt,frmPIDOpt);
    try
      frmPIDOpt.ShowModal;
    finally
      FreeAndNil(frmPIDOpt);
    end;
  end else
    ShowMessage('��ѡ��������Ʒ��');
end;

//˫���ύ�޸�
procedure TfrmPIDManager.dgeStOPOptDblClick(Sender: TObject);
begin
  if dmDepotCenter.qrySkuLog.State = dsEdit then
  begin
    dmDepotCenter.qrySkuLog.Post;
  end;
end;

//����
procedure TfrmPIDManager.N5Click(Sender: TObject);
var
  pid,inNum : Integer;
  sto,sku,swn : string;
begin
  if dmDepotCenter.qrySkuLog.RecordCount > 0 then
  begin
    if dmDepotCenter.qrySkuLog.FieldByName('is_sales').AsInteger = 301 then
    begin
      if Application.MessageBox('ȷ��������', '��ʾ', MB_OKCANCEL +
        MB_DEFBUTTON2) = IDOK then
      begin
        frmCommonDm.Connection.StartTransaction;
        try
          with dmDepotCenter.qrySkuLog do
          begin
            pid := FieldByName('p_id').AsInteger;
            sku := FieldByName('p_sku').AsString;
            sto := FieldByName('sto_no').AsString;
            swn := FieldByName('wh_n').AsString;
            //ɾ�������ˮ��־
            Delete;
            //ApplyUpdates;
            //CommitUpdates;
          end;
          //����Ʒ�������
          with dmDepotCenter.qryStOPInDepot do
          begin
            DisableControls;
            Filter := 'product_id='+ IntToStr(pid);
            Filtered := True;
            inNum := FieldByName('product_indepotnum').AsInteger - 1;
            if inNum < 0 then inNum := 0;
            Edit;
            FieldByName('product_indepotnum').AsInteger := inNum;
            Post;
            //ApplyUpdates;
            //CommitUpdates;
            Filter := '';
            Filtered := False;
            EnableControls;
          end;
          //����Ʒ�������
          dmDepotCenter.SetProductReserves(pid,-1,sku);
          //���²�λ��Ϣ
          dmDepotCenter.SetDpositionInfo(swn,sku,'OUT');
          frmCommonDm.Connection.Commit;
        except
          ShowMessage('��������');
          frmCommonDm.Connection.Rollback;
        end;
      end;
    end else
      ShowMessage('��Ʒ�Ѿ������޷�������');
  end else
    ShowMessage('��ѡ����Ҫ��������Ʒ��');
end;

//������
procedure TfrmPIDManager.btnOkClick(Sender: TObject);
var
  oid : string;
  bfs,afs : Integer;
begin
  if CheckComplete then
  begin
    if Application.MessageBox('�Ƿ��ӡ��ⵥ��', '��ʾ', MB_OKCANCEL + 
      MB_DEFBUTTON2) = IDOK then
    begin
      PrintInDepotOrder;
    end;
    if Application.MessageBox('ȷ�������⣿', '��ʾ', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      oid := dmDepotCenter.qryStOInDepot.FieldByName('stk_no').AsString;
      bfs := dmDepotCenter.qryStOInDepot.FieldByName('state').AsInteger;
      afs := StrToInt(STO_WAREHOUSING);
      UpdateOrderState(dmDepotCenter.qryStOInDepot,'state',afs);
      SetStkOrderState(oid,bfs,afs);
      Close;
    end;
  end else
    ShowMessage('������Ʒδ��⣡');
end;

//�쳣��
procedure TfrmPIDManager.btnExceptionClick(Sender: TObject);
var
  oid : string;
  bfs,afs : Integer;
begin
  if Application.MessageBox('ȷ�������쳣����', '��ʾ', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    oid := dmDepotCenter.qryStOInDepot.FieldByName('stk_no').AsString;
    bfs := dmDepotCenter.qryStOInDepot.FieldByName('state').AsInteger;
    afs := StrToInt(STO_EXCEPTION);
    UpdateOrderState(dmDepotCenter.qryStOInDepot,'state',afs);
    SetStkOrderState(oid,bfs,afs);
    Close;
  end;
end;

//�����Ʒ�Ƿ�������
function TfrmPIDManager.CheckComplete: Boolean;
var
  i,num,inNum : Integer;
begin
  Result := True;
  with dmDepotCenter.qryStOPInDepot do
  begin
    DisableControls;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      num := FieldByName('product_num').AsInteger;
      inNum := FieldByName('product_indepotnum').AsInteger;
      if num > inNum then
      begin
        Result := False;
        First;
        Break;
      end;
      Next;
    end;
    EnableControls;
  end;
end;

//��ⵥ��ӡ
procedure TfrmPIDManager.btnPrintClick(Sender: TObject);
begin
  if CheckComplete then
  begin
    PrintInDepotOrder;
  end else
    ShowMessage('����δ�����Ʒ��');
end;

//��ӡ��ⵥ
procedure TfrmPIDManager.PrintInDepotOrder;
begin
  try
    frmCommonDm.rptPrint.Clear;
    frmCommonDm.rptPrint.LoadFromFile('./Report/inStock.fr3');
    frmCommonDm.rptPrint.ShowReport;
  except
    ShowMessage('���ر����ļ������������Ա��ϵ��');
  end;
end;

end.
