unit untODpManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel, Menus,
  ImgList, ActnList, Buttons, RzButton, ComObj;

type
  TfrmODpManager = class(TForm)
    RzToolbar1: TRzToolbar;
    pnl1: TPanel;
    dgeSOList: TDBGridEh;
    btnPrint: TRzToolButton;
    RzMenuToolbarButton1: TRzMenuToolbarButton;
    pmOpt: TPopupMenu;
    pmStateList: TPopupMenu;
    aclOpt: TActionList;
    ilImgList: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    btnOut: TRzToolButton;
    btnExit: TRzToolButton;
    actPrint: TAction;
    actOrderOpt: TAction;
    btnOrderOut: TRzToolButton;
    actOrderOut: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    btnExportSend: TRzToolButton;
    actExportSend: TAction;
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure actOrderOptExecute(Sender: TObject);
    procedure actOrderOutExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure dgeSOListTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure actExportSendExecute(Sender: TObject);
  private
    procedure OrderOutDepot;
    function GetSOrderIds: string;
  public
    { Public declarations }
  end;

//var
//  frmODpManager: TfrmODpManager;

implementation

uses untDepotCenterDM, untPODManager, untCommonUtil, untSOOutDepot,
     untAllocatePrint;

{$R *.dfm}

//�˳�
procedure TfrmODpManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//���ڴ���
procedure TfrmODpManager.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryAreaInfo.Open;
  dmDepotCenter.qrySOOutDepot.Open;
  dmDepotCenter.qrySOOutDepot.Filtered := True;
end;

//���ڹر�
procedure TfrmODpManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDepotCenter.qrySOOutDepot.Close;
  dmDepotCenter.qryAreaInfo.Close;
end;

//�鿴ȫ��
procedure TfrmODpManager.N3Click(Sender: TObject);
begin
  dmDepotCenter.qrySOOutDepot.Filter := '';
end;

//�����
procedure TfrmODpManager.N1Click(Sender: TObject);
begin
  dmDepotCenter.qrySOOutDepot.Filter := 'status='+SO_ASSESSED;
end;

//�����
procedure TfrmODpManager.N2Click(Sender: TObject);
begin
  dmDepotCenter.qrySOOutDepot.Filter := 'status='+SO_DISPATCHED;
end;

//�ѷ���
procedure TfrmODpManager.N4Click(Sender: TObject);
begin
  dmDepotCenter.qrySOOutDepot.Filter := 'status='+SO_SHIPMENTSED;
end;

//ȡ����
procedure TfrmODpManager.N8Click(Sender: TObject);
begin
  dmDepotCenter.qrySOOutDepot.Filter := 'status='+SO_CANCEL;
end;

//�������
procedure TfrmODpManager.actOrderOptExecute(Sender: TObject);
begin
  if dmDepotCenter.qrySOOutDepot.RecordCount > 0 then
  begin
    case dmDepotCenter.qrySOOutDepot.FieldByName('status').AsInteger of
      3 : OrderOutDepot;
      4 : ShowMessage('�����������');
      5 : ShowMessage('�����ѷ�����');
    end;
  end else
    ShowMessage('�޿���ⶩ����');
end;

//�������
procedure TfrmODpManager.OrderOutDepot;
begin
  Application.CreateForm(TfrmPODManager,frmPODManager);
  try
    frmPODManager.ShowModal;
  except
    FreeAndNil(frmPODManager);
  end;  
end;

//��������
procedure TfrmODpManager.actOrderOutExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmSOOutDepot,frmSOOutDepot);
  try
    frmSOOutDepot.ShowModal;
  finally
    FreeAndNil(frmSOOutDepot);

    dmDepotCenter.qrySOOutDepot.Refresh;
  end;  
end;

//��ӡ�����
procedure TfrmODpManager.actPrintExecute(Sender: TObject);
var
  ids : string;
begin
  ids := GetSOrderIds;
  if ids <> '' then
  begin
    SOrderIds := ids;
    Application.CreateForm(TfrmAllocatePrint,frmAllocatePrint);
    try
      frmAllocatePrint.ShowModal;
    finally
      FreeAndNil(frmAllocatePrint);
    end;
  end else
    ShowMessage('��ѡ�������������');
end;

//��ȡID
function TfrmODpManager.GetSOrderIds: string;
var
  i : Integer;
  ids : string;
  procedure AddId(oid: string);
  begin
    if ids = '' then
    begin
      ids := oid;
    end else
    begin
      ids := ids + ',' + oid;
    end;
  end;
begin
  ids := '';
  dmDepotCenter.qrySOOutDepot.DisableControls;
  for i := 0 to dgeSOList.SelectedRows.Count - 1 do
  begin
    dmDepotCenter.qrySOOutDepot.GotoBookmark(Pointer(dgeSOList.SelectedRows.Items[i]));
    if dmDepotCenter.qrySOOutDepot.FieldByName('status').AsInteger = StrToInt(SO_ASSESSED) then
      AddId(dmDepotCenter.qrySOOutDepot.FieldByName('so_id').AsString);
  end;
  dmDepotCenter.qrySOOutDepot.EnableControls;
  Result := ids;
end;

procedure TfrmODpManager.dgeSOListTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  FieldSort(dmDepotCenter.qrySOOutDepot,Column);
end;

//��ݵ���
procedure TfrmODpManager.actExportSendExecute(Sender: TObject);
var
  ExcelApp : Variant;
  i : Integer;
begin
  if dgeSOList.SelectedRows.Count > 0 then
  begin
    //����EXCEL����
    ExcelApp := CreateOleObject('Excel.Application');
    ExcelApp.Caption := '�����Ϣ';
    ExcelApp.WorkBooks.Add;
    ExcelApp.WorkSheets[1].Activate;
    ExcelApp.Cells[1,1].Value := '����';
    ExcelApp.Cells[1,2].Value := '�ֻ�';
    ExcelApp.Cells[1,3].Value := '�绰';
    ExcelApp.Cells[1,4].Value := '��ַ';
    ExcelApp.Cells[1,5].Value := 'ʼ����';
    ExcelApp.Cells[1,6].Value := '���ջ���';
    ExcelApp.Cells[1,7].Value := '�ʱ�';
    ExcelApp.Cells[1,8].Value := 'Ŀ�ĵ�';
    ExcelApp.Cells[1,9].Value := '��';
    ExcelApp.Cells[1,10].Value := '��';
    ExcelApp.Cells[1,11].Value := '��ݷ�';
    ExcelApp.Cells[1,12].Value := '�������';

    dmDepotCenter.qrySOOutDepot.DisableControls;
    for i := 0 to dgeSOList.SelectedRows.Count - 1 do
    begin
      dmDepotCenter.qrySOOutDepot.GotoBookmark(Pointer(dgeSOList.SelectedRows.Items[i]));
      ExcelApp.Cells[i+2,1].Value := dmDepotCenter.qrySOOutDepot.FieldByName('receiver').AsString;
      ExcelApp.Cells[i+2,2].Value := dmDepotCenter.qrySOOutDepot.FieldByName('mobile').AsString;
      ExcelApp.Cells[i+2,3].Value := dmDepotCenter.qrySOOutDepot.FieldByName('tel').AsString;
      ExcelApp.Cells[i+2,4].Value := dmDepotCenter.qrySOOutDepot.FieldByName('province_name').AsString
                                   + dmDepotCenter.qrySOOutDepot.FieldByName('city_name').AsString
                                   + dmDepotCenter.qrySOOutDepot.FieldByName('district_name').AsString
                                   + dmDepotCenter.qrySOOutDepot.FieldByName('addr').AsString;
      ExcelApp.Cells[i+2,5].Value := '����';
      ExcelApp.Cells[i+2,6].Value := '';
      ExcelApp.Cells[i+2,7].Value := dmDepotCenter.qrySOOutDepot.FieldByName('post_code').AsString;
      ExcelApp.Cells[i+2,8].Value := dmDepotCenter.qrySOOutDepot.FieldByName('province_name').AsString
                                   + dmDepotCenter.qrySOOutDepot.FieldByName('city_name').AsString
                                   + dmDepotCenter.qrySOOutDepot.FieldByName('district_name').AsString;
      ExcelApp.Cells[i+2,9].Value := FormatDateTime('MM',Date);
      ExcelApp.Cells[i+2,10].Value := FormatDateTime('dd',Date);
      ExcelApp.Cells[i+2,11].Value := FloatToCurr(dmDepotCenter.qrySOOutDepot.FieldByName('ship_settle_amount').AsFloat/100);
      ExcelApp.Cells[i+2,12].Value := FloatToCurr(dmDepotCenter.qrySOOutDepot.FieldByName('final_amount').AsFloat/100);
    end;
    dmDepotCenter.qrySOOutDepot.EnableControls;

    ExcelApp.Visible := True;
  end else
    ShowMessage('��ѡ�񶩵���');
end;

end.
