unit untSetPrivilege;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzTreeVw, ExtCtrls, ActnList, RzPanel, ImgList,
  RzButton;

type
  TfrmSetPrivilege = class(TForm)
    pnlLeft: TPanel;
    rchtrPrivilegeList: TRzCheckTree;
    il1: TImageList;
    pnlBottom: TPanel;
    btnOk: TRzBitBtn;
    btnCancel: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    procedure InitPrivilegeTree;
    procedure InitOldPrivilege;
    procedure DeleteOldData;
  public
    { Public declarations }
  end;

//var
//  frmSetPrivilege: TfrmSetPrivilege;

implementation

uses MAIN, untSysManagerDM;

var priList : TStringList;

{$R *.dfm}

//��������
procedure TfrmSetPrivilege.FormCreate(Sender: TObject);
begin
  frmSysManagerDM.qrySetPrivilege.Open;
  InitOldPrivilege;
  InitPrivilegeTree;
end;

//�رմ���
procedure TfrmSetPrivilege.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  frmSysManagerDM.qrySetPrivilege.Close;
end;

procedure TfrmSetPrivilege.InitPrivilegeTree;
var
  i,listIndex : Integer;
  action : TAction;
  mainNode,tempNode,currNode : TTreeNode;
begin
  mainNode := rchtrPrivilegeList.Items.AddFirst(nil,'ϵͳȨ��');
  if frmSysManagerDM.qrySetPrivilege.RecordCount > 0 then
  begin
    mainNode.StateIndex := 2;
  end;
  //Category�׽ڵ�
  for i := 0 to MainForm.ActionList.ActionCount - 1 do
  begin
    action := TAction(MainForm.ActionList.Actions[i]);
    if action.Caption = action.Category then
    begin
      currNode := rchtrPrivilegeList.Items.AddChild(mainNode,action.Caption);
      currNode.SelectedIndex := action.Tag;
      if priList.Find(IntToStr(action.Tag),listIndex) then
      begin
        currNode.StateIndex := 2;
      end;
    end;
  end;

  //���ɴνڵ�
  for i := 0 to MainForm.ActionList.ActionCount - 1 do
  begin
    action := TAction(MainForm.ActionList.Actions[i]);
    if action.Caption <> action.Category then
    begin
      tempNode := rchtrPrivilegeList.NodeFromPath('ϵͳȨ��\'+action.Category+'\');
      tempNode.Expanded := True;
      currNode := rchtrPrivilegeList.Items.AddChild(tempNode,action.Caption);
      currNode.SelectedIndex := action.Tag;
      if priList.Find(IntToStr(action.Tag),listIndex) then
      begin
        currNode.StateIndex := 2;
      end;
    end;
  end;
  mainNode.Expanded := True;
end;

//����Ȩ��
procedure TfrmSetPrivilege.btnOkClick(Sender: TObject);
var
  i : Integer;
  currNode : TTreeNode;
begin
  DeleteOldData;
  for i := 0 to rchtrPrivilegeList.Items.Count -1 do
  begin
    currNode := rchtrPrivilegeList.Items.Item[i];
    if ((currNode.StateIndex = 2) or (currNode.StateIndex = 3)) and
       (currNode.AbsoluteIndex <> 0) then
    begin
      frmSysManagerDM.qrySetPrivilege.Append;
      frmSysManagerDM.qrySetPrivilege.FieldByName('pri_id').AsInteger := currNode.SelectedIndex;
      frmSysManagerDM.qrySetPrivilege.FieldByName('sys_status').AsInteger := 1;
      frmSysManagerDM.qrySetPrivilege.Post;
    end;
  end;
  frmSysManagerDM.qrySetPrivilege.ApplyUpdates;
  frmSysManagerDM.qrySetPrivilege.CommitUpdates;

  ShowMessage('���óɹ���');

  Self.Close;
end;

//ɾ������ǰȨ��
procedure TfrmSetPrivilege.DeleteOldData;
var
  i : Integer;
begin
  with frmSysManagerDM.qrySetPrivilege do
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

//�ر�
procedure TfrmSetPrivilege.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

//��ʾ��Ȩ��
procedure TfrmSetPrivilege.InitOldPrivilege;
var
  i : Integer;
begin
  priList := TStringList.Create;
  with frmSysManagerDM.qrySetPrivilege do
  begin
    for i := 0 to RecordCount - 1 do
    begin
      priList.Add(IntToStr(FieldByName('pri_id').AsInteger));
      Next;
    end;
    First;
  end;
  priList.Sort;
end;

end.
