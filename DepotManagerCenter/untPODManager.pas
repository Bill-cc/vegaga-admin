unit untPODManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, RzSplit, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh,
  StdCtrls, RzLabel, RzButton, Mask, RzEdit, RzDBEdit, Menus, DB, RzDBBnEd;

type
  TfrmPODManager = class(TForm)
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
    RzLabel2: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    pnl4: TPanel;
    btnExit: TRzBitBtn;
    btnOk: TRzBitBtn;
    btnPrint: TRzBitBtn;
    pnl5: TPanel;
    RzLabel3: TRzLabel;
    RzDBButtonEdit1: TRzDBButtonEdit;
    procedure btnExitClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure dgeStOPOptDblClick(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure RzDBEdit2Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzDBButtonEdit1ButtonClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    function CheckComplete: Boolean;
  public
    { Public declarations }
  end;

var
  frmPODManager: TfrmPODManager;

implementation

uses untDepotCenterDM, untCommonUtil, untPODOpt, untCommonDm, untExpressInfo;

{$R *.dfm}

//��������
procedure TfrmPODManager.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryProductInfo.Open;
  dmDepotCenter.qryExpInfo.Open;
  dmDepotCenter.qrySOPOutDepot.Open;
  dmDepotCenter.qrySkuOutLog.Open;
end;

//�رմ���
procedure TfrmPODManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDepotCenter.qrySkuOutLog.Close;
  dmDepotCenter.qrySOPOutDepot.Close;
  dmDepotCenter.qryExpInfo.Close;
  dmDepotCenter.qryProductInfo.Close;
end;

//�ر�
procedure TfrmPODManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//�����ѡ
procedure TfrmPODManager.N3Click(Sender: TObject);
begin
  dgeStOPList.Selection.Clear;
end;

//����
procedure TfrmPODManager.N1Click(Sender: TObject);
begin
  if dmDepotCenter.qrySOPOutDepot.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmPODOpt,frmPODOpt);
    try
      frmPODOpt.ShowModal;
    finally
      FreeAndNil(frmPODOpt);

      dmDepotCenter.qrySOPOutDepot.Refresh;
    end;
  end else
    ShowMessage('�޿ɳ�����Ʒ��');
end;

//˫���ύ�޸�
procedure TfrmPODManager.dgeStOPOptDblClick(Sender: TObject);
begin
  if dmDepotCenter.qrySkuLog.State = dsEdit then
  begin
    dmDepotCenter.qrySkuLog.Post;
  end;
end;

//����
procedure TfrmPODManager.N5Click(Sender: TObject);
var
  pid,outNum : Integer;
  so,sku : string;
  bfState : Boolean;
begin
  if dmDepotCenter.qrySkuOutLog.RecordCount > 0 then
  begin
    if Application.MessageBox('ȷ��������', '��ʾ', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      frmCommonDm.Connection.StartTransaction;
      try
        //ɾ�������¼
        with dmDepotCenter.qrySkuOutLog do
        begin
          pid := FieldByName('p_id').AsInteger;
          sku := FieldByName('p_sku').AsString;
          so := FieldByName('so_no').AsString;
          //ɾ�������¼
          bfState := ReadOnly;
          if bfState then ReadOnly := False;
          Edit;
          FieldByName('so_no').AsString := '';
          FieldByName('is_sales').AsInteger := StrToInt(P_DEPOTSTATE_IN);
          Post;
          ReadOnly := bfState;
          //ApplyUpdates;
          //CommitUpdates;
        end;
        //������Ʒ��������
        with dmDepotCenter.qrySOPOutDepot do
        begin
          DisableControls;
          outNum := FieldByName('real_out_number').AsInteger;
          Filter := 'p_id='+ IntToStr(pid);
          Filtered := True;
          bfState := ReadOnly;
          if bfState then ReadOnly := False;
          Edit;
          FieldByName('real_out_number').AsInteger := outNum - 1;
          Post;
          ReadOnly := bfState;
  //        ApplyUpdates;
  //        CommitUpdates;
          Filter := '';
          Filtered := False;
          EnableControls;
        end;
        //����Ʒ�������
        dmDepotCenter.SetProductReserves(pid,1,sku);
        frmCommonDm.Connection.Commit;
      except
        frmCommonDm.Connection.Rollback;
      end;
    end;
  end else
    ShowMessage('��ѡ����Ҫ��������Ʒ��');
end;

//��ɳ���
procedure TfrmPODManager.btnOkClick(Sender: TObject);
var
  oid,bfs,afs : Integer;
begin
  if CheckComplete then
  begin
    if (dmDepotCenter.qrySOOutDepot.FieldByName('ship_order_number').AsString <> '') and
       (Length(dmDepotCenter.qrySOOutDepot.FieldByName('ship_order_number').AsString) > 7) and
       (dmDepotCenter.qrySOOutDepot.FieldByName('express_name').AsString <> '') then
    begin
      if Application.MessageBox('�Ƿ��ӡ���ⵥ��', '��ʾ', MB_OKCANCEL + 
        MB_DEFBUTTON2) = IDOK then
      begin
        try
          frmCommonDm.rptPrint.Clear;
          frmCommonDm.rptPrint.LoadFromFile('./Report/outStock.fr3');
          frmCommonDm.rptPrint.ShowReport;
        except
          ShowMessage('���ر����ļ������������Ա��ϵ��');
        end;
      end;
      if Application.MessageBox('ȷ����������', '��ʾ', MB_OKCANCEL +
        MB_DEFBUTTON2) = IDOK then
      begin
        oid := dmDepotCenter.qrySOOutDepot.FieldByName('so_id').AsInteger;
        bfs := dmDepotCenter.qrySOOutDepot.FieldByName('status').AsInteger;
        afs := StrToInt(SO_DISPATCHED);
        UpdateOrderState(dmDepotCenter.qrySOOutDepot,'status',afs);
        SetOrderState(oid,bfs,afs);
        Close;
      end;
    end else
      ShowMessage('��ѡ���ݹ�˾�����뵥�ţ����Ŵ���7λ����');
  end else
    ShowMessage('������Ʒδ���⣡');
end;

//procedure TfrmPODManager.btnExceptionClick(Sender: TObject);
//var
//  oid,bfs,afs : Integer;
//begin
//  if Application.MessageBox('ȷ�������쳣����', '��ʾ', MB_OKCANCEL +
//    MB_DEFBUTTON2) = IDOK then
//  begin
//    oid := dmDepotCenter.qryStOInDepot.FieldByName('id').AsInteger;
//    bfs := dmDepotCenter.qryStOInDepot.FieldByName('state').AsInteger;
//    afs := StrToInt(STO_EXCEPTION);
//    UpdateOrderState(dmDepotCenter.qryStOInDepot,'state',afs);
//    SetStkOrderState(oid,bfs,afs);
//  end;
//end;

//�����Ʒ�Ƿ�������
function TfrmPODManager.CheckComplete: Boolean;
var
  i,num,outNum : Integer;
begin
  Result := True;
  with dmDepotCenter.qrySOPOutDepot do
  begin
    DisableControls;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      num := FieldByName('p_number').AsInteger;
      outNum := FieldByName('real_out_number').AsInteger;
      if num > outNum then
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

//�����ݵ���
procedure TfrmPODManager.RzDBEdit2Exit(Sender: TObject);
begin
  if dmDepotCenter.qrySOOutDepot.State <> dsBrowse then
    dmDepotCenter.qrySOOutDepot.Post;
end;

//ѡ����
procedure TfrmPODManager.RzDBButtonEdit1ButtonClick(Sender: TObject);
var
  resVal : Integer;
begin
  resVal := 0;
  Application.CreateForm(TfrmExpressInfo,frmExpressInfo);
  try
    resVal := frmExpressInfo.ShowModal;
  finally
    FreeAndNil(frmExpressInfo);

    if resVal = 1 then
    begin
      dmDepotCenter.qrySOOutDepot.Edit;
      dmDepotCenter.qrySOOutDepot.FieldByName('express_id').AsInteger := expressId;
      dmDepotCenter.qrySOOutDepot.Post;
    end;
  end;
end;

//���ⵥ��ӡ
procedure TfrmPODManager.btnPrintClick(Sender: TObject);
begin
  try
    frmCommonDm.rptPrint.Clear;
    frmCommonDm.rptPrint.LoadFromFile('./Report/outStock.fr3');
    frmCommonDm.rptPrint.ShowReport;
  except
    ShowMessage('���ر����ļ������������Ա��ϵ��');
  end;
end;

end.
