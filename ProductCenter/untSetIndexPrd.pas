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

//创建窗口
procedure TfrmSetIndexPrd.FormCreate(Sender: TObject);
begin
  dmPCenter.qryPdtInfo.Open;
  dmPCenter.qryIndexPList.Open;
end;

//关闭窗口
procedure TfrmSetIndexPrd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPCenter.qryIndexPList.Close;
  dmPCenter.qryPdtInfo.Close;
end;

//添加商品按钮
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

//添加首页商品
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
        ShowMessage('已添加SKU号为 '+addScatPList[i].psku+' 的商品！');
        Continue;
      end;

      if addScatPList[i].pcnum = 0 then
      begin
        ShowMessage('商品 '+addScatPList[i].pname+' 可销售数量为0！');
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

//确认更改
procedure TfrmSetIndexPrd.btnCommitClick(Sender: TObject);
begin
  if dmPCenter.qryIndexPList.State <> dsBrowse then
    dmPCenter.qryIndexPList.Post;
  if dmPCenter.qryIndexPList.UpdatesPending then
  begin
    if Application.MessageBox('确定提交更改？', '提示', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      dmPCenter.qryIndexPList.ApplyUpdates;
      dmPCenter.qryIndexPList.CommitUpdates;
    end;
  end else
    ShowMessage('无更改数据！');
end;

//取消更改
procedure TfrmSetIndexPrd.btnCancelClick(Sender: TObject);
begin
  if dmPCenter.qryIndexPList.State <> dsBrowse then
    dmPCenter.qryIndexPList.Cancel;
  if dmPCenter.qryIndexPList.UpdatesPending then
  begin
    if Application.MessageBox('确定取消更改？', '提示', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      dmPCenter.qryIndexPList.CancelUpdates;
    end;
  end else
    ShowMessage('无更改数据！');
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

//删除商品
procedure TfrmSetIndexPrd.N2Click(Sender: TObject);
begin
  if dmPCenter.qryIndexPList.State <> dsBrowse then
    dmPCenter.qryIndexPList.Post;
  if Application.MessageBox('确定删除记录？', '提示', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    if dmPCenter.qryIndexPList.RecordCount > 0 then
    begin
      dmPCenter.qryIndexPList.Delete;
    end;
  end;
end;

end.
