unit untSOOutDepot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzDBEdit, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls, RzButton, DB,
  DBCtrls;

type
  TfrmSOOutDepot = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    RzLabel1: TRzLabel;
    edtExpNo: TRzEdit;
    pnl4: TPanel;
    btnCancel: TRzBitBtn;
    btnOut: TRzBitBtn;
    pnl5: TPanel;
    RzLabel3: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    RzLabel2: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzLabel4: TRzLabel;
    RzDBMemo1: TRzDBMemo;
    RzLabel5: TRzLabel;
    RzDBEdit3: TRzDBEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtExpNoChange(Sender: TObject);
    procedure btnOutClick(Sender: TObject);
  private
    procedure OrderOutDepot;
  public
    { Public declarations }
  end;

var
  frmSOOutDepot: TfrmSOOutDepot;

implementation

uses untDepotCenterDM, untCommonUtil;

{$R *.dfm}

//���ڴ���
procedure TfrmSOOutDepot.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryExpInfo.Open;
end;

//���ڹر�
procedure TfrmSOOutDepot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDepotCenter.qryExpInfo.Close;
end;

procedure TfrmSOOutDepot.btnCancelClick(Sender: TObject);
begin
  if dmDepotCenter.qrySOOD.State <> dsBrowse then
  begin
    dmDepotCenter.qrySOOD.Cancel;
  end;
  Close;
end;

//���ҵ���
procedure TfrmSOOutDepot.edtExpNoChange(Sender: TObject);
begin
  if Length(Trim(edtExpNo.Text)) > 6 then
  begin
    dmDepotCenter.qrySOOD.DisableControls;
    
    dmDepotCenter.qrySOOD.Close;
    dmDepotCenter.qrySOOD.ParamByName('shipno').AsString := Trim(edtExpNo.Text);
    dmDepotCenter.qrySOOD.Open;     //status

    dmDepotCenter.qrySOOD.EnableControls;
  end;
end;

//���ⰴť
procedure TfrmSOOutDepot.btnOutClick(Sender: TObject);
begin
  if dmDepotCenter.qrySOOD.RecordCount > 0 then
  begin
    case dmDepotCenter.qrySOOD.FieldByName('status').AsInteger of
      3 : begin
            ShowMessage('����δ��������');
            edtExpNo.Text := '';
            dmDepotCenter.qrySOOD.Close;
          end;
      4 : OrderOutDepot;
      9 : begin
            ShowMessage('������ȡ����');
            edtExpNo.Text := '';
            dmDepotCenter.qrySOOD.Close;
          end;
    end;
  end else
  begin
    ShowMessage('����δ�ҵ���');
    edtExpNo.Text := '';
    dmDepotCenter.qrySOOD.Close;
  end;
end;

//��������
procedure TfrmSOOutDepot.OrderOutDepot;
var
  oid,bfs,afs : Integer;
begin
  if dmDepotCenter.qrySOOD.FieldByName('ship_settle_amount').AsCurrency > 0 then
  begin
    if Application.MessageBox('ȷ�����⣿', '��ʾ', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      if dmDepotCenter.qrySOOD.State = dsBrowse then
        dmDepotCenter.qrySOOD.Edit;
      dmDepotCenter.qrySOOD.FieldByName('scan_status').AsInteger := 1;
      dmDepotCenter.qrySOOD.Post;
      //���ö���״̬
      oid := dmDepotCenter.qrySOOD.FieldByName('so_id').AsInteger;
      bfs := dmDepotCenter.qrySOOD.FieldByName('status').AsInteger;
      afs := StrToInt(SO_SHIPMENTSED);
      UpdateOrderState(dmDepotCenter.qrySOOD,'status',afs);
      SetOrderState(oid,bfs,afs);

      dmDepotCenter.qrySOOD.Close;
    end;
  end else
    ShowMessage('�������˷ѣ�');
end;

end.
