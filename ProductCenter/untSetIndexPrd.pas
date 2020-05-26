unit untSetIndexPrd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, Menus, RzButton,DB;

type
  TfrmSetIndexPrd = class(TForm)
    pnl2: TPanel;
    pnl3: TPanel;
    dgeIndexPList: TDBGridEh;
    pnl4: TPanel;
    pnl5: TPanel;
    pmOpt: TPopupMenu;
    N1: TMenuItem;
    btnCommit: TRzBitBtn;
    btnCancel: TRzBitBtn;
    btnClose: TRzBitBtn;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure btnCommitClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dgeIndexPListDblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    procedure AddIndexProduct;
  public
    { Public declarations }
  end;

var
  frmSetIndexPrd: TfrmSetIndexPrd;

implementation

uses untPCenterDM, untScatProductList, untCommonUtil;

{$R *.dfm}

//��������
procedure TfrmSetIndexPrd.FormCreate(Sender: TObject);
begin
  dmPCenter.qryPdtInfo.Open;
  dmPCenter.qryIndexPList.Open;
end;

//�رմ���
procedure TfrmSetIndexPrd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPCenter.qryIndexPList.Close;
  dmPCenter.qryPdtInfo.Close;
end;

//�����Ʒ��ť
procedure TfrmSetIndexPrd.N1Click(Sender: TObject);
var
  resVal : Integer;
begin
  resVal := 0;
  Application.CreateForm(TfrmScatProductList,frmScatProductList);
  try
    resVal := frmScatProductList.ShowModal;
  finally
    FreeAndNil(frmScatProductList);

    if resVal = 1 then AddIndexProduct;
  end;
end;

//�����ҳ��Ʒ
procedure TfrmSetIndexPrd.AddIndexProduct;
var
  i : Integer;
begin
  with dmPCenter.qryIndexPList do
  begin
    DisableControls;
    for i := Low(addScatPList) to High(addScatPList) do
    begin
      if Locate('sku',addScatPList[i].psku,[loCaseInsensitive]) then
      begin
        ShowMessage('�����SKU��Ϊ '+addScatPList[i].psku+' ����Ʒ��');
        Continue;
      end;

      if addScatPList[i].pcnum = 0 then
      begin
        ShowMessage('��Ʒ '+addScatPList[i].pname+' ����������Ϊ0��');
        Continue;
      end;

      Append;
      FieldByName('sku').AsString := addScatPList[i].psku;
      FieldByName('scat_code').AsString := addScatPList[i].pscat;
      FieldByName('dt_submit').AsDateTime := Date+Time;
      FieldByName('submiter').AsString := CurrentUser.RealName;
      Post;
    end;
    EnableControls;
  end;
end;

//ȷ�ϸ���
procedure TfrmSetIndexPrd.btnCommitClick(Sender: TObject);
begin
  if dmPCenter.qryIndexPList.State <> dsBrowse then
    dmPCenter.qryIndexPList.Post;
  if dmPCenter.qryIndexPList.UpdatesPending then
  begin
    if Application.MessageBox('ȷ���ύ���ģ�', '��ʾ', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      dmPCenter.qryIndexPList.ApplyUpdates;
      dmPCenter.qryIndexPList.CommitUpdates;
    end;
  end else
    ShowMessage('�޸������ݣ�');
end;

//ȡ������
procedure TfrmSetIndexPrd.btnCancelClick(Sender: TObject);
begin
  if dmPCenter.qryIndexPList.State <> dsBrowse then
    dmPCenter.qryIndexPList.Cancel;
  if dmPCenter.qryIndexPList.UpdatesPending then
  begin
    if Application.MessageBox('ȷ��ȡ�����ģ�', '��ʾ', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      dmPCenter.qryIndexPList.CancelUpdates;
    end;
  end else
    ShowMessage('�޸������ݣ�');
end;

procedure TfrmSetIndexPrd.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetIndexPrd.dgeIndexPListDblClick(Sender: TObject);
begin
  if dmPCenter.qryIndexPList.State <> dsBrowse then
    dmPCenter.qryIndexPList.Post;
end;

//ɾ����Ʒ
procedure TfrmSetIndexPrd.N2Click(Sender: TObject);
begin
  if dmPCenter.qryIndexPList.State <> dsBrowse then
    dmPCenter.qryIndexPList.Post;
  if Application.MessageBox('ȷ��ɾ����¼��', '��ʾ', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    if dmPCenter.qryIndexPList.RecordCount > 0 then
    begin
      dmPCenter.qryIndexPList.Delete;
    end;
  end;
end;

end.
