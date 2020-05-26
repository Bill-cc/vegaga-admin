unit untSetRole;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ComCtrls, RzTreeVw, ExtCtrls;

type
  TfrmSetRole = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    rctRoleList: TRzCheckTree;
    btnOk: TRzBitBtn;
    btnCancel: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    procedure InitRoleTree;
    procedure InitOldRoleList;
    procedure DeleteOldRoles;
    procedure SetSelectRoles;
  public
    { Public declarations }
  end;

//var
//  frmSetRole: TfrmSetRole;

implementation

uses untSysManagerDM;

var OldRoleList : TStringList;

{$R *.dfm}

//��������
procedure TfrmSetRole.FormCreate(Sender: TObject);
begin
  frmSysManagerDM.qrySetRole.Open;
  frmSysManagerDM.qryRoleTree.Open;
  InitOldRoleList;
  InitRoleTree;
end;

//�رմ���
procedure TfrmSetRole.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmSysManagerDM.qryRoleTree.Close;
  frmSysManagerDM.qrySetRole.Close;
end;

//��ʼ����ɫ�б�
procedure TfrmSetRole.InitRoleTree;
var
  i,listIndex : Integer;
  mainNode,currNode : TTreeNode;
begin
  mainNode := rctRoleList.Items.AddFirst(nil,'ϵͳ��ɫ');
  if frmSysManagerDM.qrySetRole.RecordCount > 0 then
  begin
    mainNode.StateIndex := 2;
  end;

  //������ɫ��
  for i := 0 to frmSysManagerDM.qryRoleTree.RecordCount - 1 do
  begin
    currNode := rctRoleList.Items.AddChild(
      mainNode,frmSysManagerDM.qryRoleTree.FieldByName('name').AsString);
    currNode.SelectedIndex := frmSysManagerDM.qryRoleTree.FieldByName('role_id').AsInteger;
    if OldRoleList.Find(IntToStr(currNode.SelectedIndex),listIndex) then
    begin
      currNode.StateIndex := 2;
    end;
    frmSysManagerDM.qryRoleTree.Next;
  end;
  frmSysManagerDM.qryRoleTree.First;
  mainNode.Expanded := True;
end;

//��ʼ����ɫ�б�
procedure TfrmSetRole.InitOldRoleList;
var
  i : Integer;
begin
  OldRoleList := TStringList.Create;
  with frmSysManagerDM.qrySetRole do
  begin
    for i := 0 to RecordCount - 1 do
    begin
      OldRoleList.Add(IntToStr(FieldByName('role_id').AsInteger));
      Next;
    end;
    First;
  end;
end;

//����ѡ���ɫ
procedure TfrmSetRole.SetSelectRoles;
var
  i : Integer;
  currNode : TTreeNode;
begin
  DeleteOldRoles;
  for i := 0 to rctRoleList.Items.Count - 1 do
  begin
    currNode := rctRoleList.Items.Item[i];
    if ((currNode.StateIndex = 2) or (currNode.StateIndex = 3)) and
       (currNode.AbsoluteIndex <> 0) then
    begin
      frmSysManagerDM.qrySetRole.Append;
      frmSysManagerDM.qrySetRole.FieldByName('role_id').AsInteger := currNode.SelectedIndex;
      frmSysManagerDM.qrySetRole.FieldByName('create_date').AsDateTime := Date;
      frmSysManagerDM.qrySetRole.FieldByName('sys_status').AsInteger := 1;
      frmSysManagerDM.qrySetRole.Post;
    end;
  end;
  frmSysManagerDM.qrySetRole.ApplyUpdates;
  frmSysManagerDM.qrySetRole.CommitUpdates;

  ShowMessage('���óɹ���');

  Self.Close;
end;

//ɾ���ɽ�ɫ
procedure TfrmSetRole.DeleteOldRoles;
var
  i : Integer;
begin
  with frmSysManagerDM.qrySetRole do
  begin
    for i := 0 to RecordCount - 1 do
    begin
      Delete;
      Next;
    end;
    ApplyUpdates;
    CommitUpdates;
  end;
end;

//�˳�
procedure TfrmSetRole.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

//ȷ��
procedure TfrmSetRole.btnOkClick(Sender: TObject);
begin
  SetSelectRoles;
end;

end.
