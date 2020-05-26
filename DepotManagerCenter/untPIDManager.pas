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

//创建窗口
procedure TfrmPIDManager.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryProductInfo.Open;
  dmDepotCenter.qryStOPInDepot.Open;
  dmDepotCenter.qrySkuLog.Open;
  InitStatus;
end;

//关闭窗口
procedure TfrmPIDManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDepotCenter.qrySkuLog.Close;
  dmDepotCenter.qryStOPInDepot.Close;
  dmDepotCenter.qryProductInfo.Close;
end;

//初始化按钮状态
procedure TfrmPIDManager.InitStatus;
begin
  case dmDepotCenter.qryStOInDepot.FieldByName('state').AsInteger of
    1 : SetButtonStatus(True,True,True,True,True);
    3 : SetButtonStatus(False,False,False,False,False);
    4 : SetButtonStatus(False,False,False,False,False);
    5 : SetButtonStatus(True,True,True,True,True);
  end;
end;

//设置按钮状态
procedure TfrmPIDManager.SetButtonStatus(b1, b2, b3, b4, b5: Boolean);
begin
  N1.Enabled := b1;
  N3.Enabled := b2;
  N5.Enabled := b3;
  btnOk.Enabled := b4;
  btnException.Enabled := b5;
end;

//关闭
procedure TfrmPIDManager.btnExitClick(Sender: TObject);
begin
  Close;
end;

//清空所选
procedure TfrmPIDManager.N3Click(Sender: TObject);
begin
  dgeStOPList.Selection.Clear;
end;

//入库
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
    ShowMessage('请选择待入库商品！');
end;

//双击提交修改
procedure TfrmPIDManager.dgeStOPOptDblClick(Sender: TObject);
begin
  if dmDepotCenter.qrySkuLog.State = dsEdit then
  begin
    dmDepotCenter.qrySkuLog.Post;
  end;
end;

//撤销
procedure TfrmPIDManager.N5Click(Sender: TObject);
var
  pid,inNum : Integer;
  sto,sku,swn : string;
begin
  if dmDepotCenter.qrySkuLog.RecordCount > 0 then
  begin
    if dmDepotCenter.qrySkuLog.FieldByName('is_sales').AsInteger = 301 then
    begin
      if Application.MessageBox('确定撤销？', '提示', MB_OKCANCEL +
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
            //删除入库流水日志
            Delete;
            //ApplyUpdates;
            //CommitUpdates;
          end;
          //减商品入库数量
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
          //减商品库存数量
          dmDepotCenter.SetProductReserves(pid,-1,sku);
          //更新仓位信息
          dmDepotCenter.SetDpositionInfo(swn,sku,'OUT');
          frmCommonDm.Connection.Commit;
        except
          ShowMessage('撤销出错！');
          frmCommonDm.Connection.Rollback;
        end;
      end;
    end else
      ShowMessage('商品已经出库无法撤销！');
  end else
    ShowMessage('请选择需要撤销的商品！');
end;

//完成入库
procedure TfrmPIDManager.btnOkClick(Sender: TObject);
var
  oid : string;
  bfs,afs : Integer;
begin
  if CheckComplete then
  begin
    if Application.MessageBox('是否打印入库单？', '提示', MB_OKCANCEL + 
      MB_DEFBUTTON2) = IDOK then
    begin
      PrintInDepotOrder;
    end;
    if Application.MessageBox('确定完成入库？', '提示', MB_OKCANCEL +
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
    ShowMessage('还有商品未入库！');
end;

//异常单
procedure TfrmPIDManager.btnExceptionClick(Sender: TObject);
var
  oid : string;
  bfs,afs : Integer;
begin
  if Application.MessageBox('确定生成异常单？', '提示', MB_OKCANCEL +
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

//检查商品是否入库完成
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

//入库单打印
procedure TfrmPIDManager.btnPrintClick(Sender: TObject);
begin
  if CheckComplete then
  begin
    PrintInDepotOrder;
  end else
    ShowMessage('还有未入库商品！');
end;

//打印入库单
procedure TfrmPIDManager.PrintInDepotOrder;
begin
  try
    frmCommonDm.rptPrint.Clear;
    frmCommonDm.rptPrint.LoadFromFile('./Report/inStock.fr3');
    frmCommonDm.rptPrint.ShowReport;
  except
    ShowMessage('加载报表文件错误！请与管理员联系。');
  end;
end;

end.
