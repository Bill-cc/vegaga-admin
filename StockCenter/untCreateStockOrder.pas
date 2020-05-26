unit untCreateStockOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, DBGridEhGrouping, GridsEh, DBGridEh, Menus,
  ImgList, ActnList, RzButton, StdCtrls, RzLabel, RzDBBnEd, RzCmboBx,
  RzDBCmbo, DBCtrls, Mask, RzEdit, RzDBEdit, DB, RzCommon, RzDBLook,
  RzDBNav, RzLstBox, RzChkLst, RzRadChk;

type
  TfrmCreateStockOrder = class(TForm)
    RzToolbar1: TRzToolbar;
    pnlTop: TPanel;
    pnlBottom: TPanel;
    aclCSOFunction: TActionList;
    ilButtonImage: TImageList;
    pmProductList: TPopupMenu;
    dgeProductList: TDBGridEh;
    actCreate: TAction;
    actUpdate: TAction;
    actDelete: TAction;
    actOk: TAction;
    actCancel: TAction;
    btnCreate: TRzToolButton;
    btnDelete: TRzToolButton;
    btnUpdate: TRzToolButton;
    btnOk: TRzToolButton;
    btnCancel: TRzToolButton;
    btnExit: TRzToolButton;
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
    actAddProduct: TAction;
    actDelProduct: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    cbb1: TRzDBLookupComboBox;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBComboBox1: TRzDBComboBox;
    RzDBComboBox2: TRzDBComboBox;
    RzDBComboBox3: TRzDBComboBox;
    RzDBButtonEdit1: TRzDBButtonEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    rldDepotInfo: TRzDBLookupDialog;
    RzLabel15: TRzLabel;
    RzDBEdit10: TRzDBEdit;
    RzDBNavigator1: TRzDBNavigator;
    btnMake: TRzToolButton;
    actMake: TAction;
    RzLabel16: TRzLabel;
    RzDBEdit11: TRzDBEdit;
    RzCheckBox1: TRzCheckBox;
    RzCheckBox2: TRzCheckBox;
    RzCheckBox3: TRzCheckBox;
    RzLabel17: TRzLabel;
    RzDBEdit12: TRzDBEdit;
    RzLabel18: TRzLabel;
    RzDBEdit13: TRzDBEdit;
    RzLabel19: TRzLabel;
    RzDBEdit14: TRzDBEdit;
    RzDBComboBox4: TRzDBComboBox;
    btnPrint: TRzToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actCreateExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure RzDBButtonEdit1ButtonClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure actAddProductExecute(Sender: TObject);
    procedure actDelProductExecute(Sender: TObject);
    procedure dgeProductListDblClick(Sender: TObject);
    procedure actMakeExecute(Sender: TObject);
    procedure RzCheckBoxClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure RzDBEdit2Exit(Sender: TObject);
  private
    stkOrderNo : string;
    procedure SetButtonEnable;
    procedure AddProduct;
    procedure SetStkOrderId;
    procedure InitStkOrderState;
    procedure CancelFilter;
    procedure SetStkOPN;
    function CreateStockEncode: string;
  public
    { Public declarations }
  end;

//var
//  frmCreateStockOrder: TfrmCreateStockOrder;

implementation

uses untStockCenterDM, untCommonUtil, untAddOrderProduct, untCommonDm;

{$R *.dfm}

//创建
procedure TfrmCreateStockOrder.FormCreate(Sender: TObject);
begin
  dmStockCenter.InitStkOrderInfo;
  InitStkOrderState;
end;

//关闭窗口
procedure TfrmCreateStockOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CancelFilter;
  dmStockCenter.qryCreateStOrder.ReadOnly := True;
  dmStockCenter.qryCreateStOProduct.ReadOnly := True;
  dmStockCenter.CloseStkOrderInfo;
end;

//初始化订单状态
procedure TfrmCreateStockOrder.InitStkOrderState;
begin
  dmStockCenter.qryCreateStOrder.Filter := 'state='+STO_DRAFT;
  dmStockCenter.qryCreateStOrder.Filtered := True;
end;

//取消过滤
procedure TfrmCreateStockOrder.CancelFilter;
begin
  dmStockCenter.qryCreateStOrder.Filtered := False;
  dmStockCenter.qryCreateStOrder.Filter := '';
end;

//创建单据
procedure TfrmCreateStockOrder.actCreateExecute(Sender: TObject);
begin
  SetButtonEnable;
  if dmStockCenter.qryCreateStOrder.State <> dsBrowse then
    dmStockCenter.qryCreateStOrder.Cancel;
  //dmStockCenter.qryCreateStOProduct.Delete;
  dmStockCenter.qryCreateStOrder.Append;
  dmStockCenter.qryCreateStOrder.FieldByName('state').AsInteger := StrToInt(STO_DRAFT);
  dmStockCenter.qryCreateStOrder.FieldByName('sys_state').AsInteger := StrToInt(SYS_EFFECTIVE);
  dmStockCenter.qryCreateStOrder.FieldByName('stk_p_compose').AsString := '货价';
  dmStockCenter.qryCreateStOrder.FieldByName('create_date').AsDateTime := Date;
end;

//修改单据
procedure TfrmCreateStockOrder.actUpdateExecute(Sender: TObject);
begin
  if dmStockCenter.qryCreateStOrder.RecordCount > 0 then
  begin
    SetButtonEnable;
    if dmStockCenter.qryCreateStOrder.State <> dsBrowse then
      dmStockCenter.qryCreateStOrder.Cancel;
    dmStockCenter.qryCreateStOrder.Edit;
  end else
    ShowMessage('没有可修改订单！');
end;

//删除单据
procedure TfrmCreateStockOrder.actDeleteExecute(Sender: TObject);
begin
  if Application.MessageBox('确定删除记录？', '提示', MB_OKCANCEL + 
    MB_DEFBUTTON2) = IDOK then
  begin
    SetButtonEnable;
    if dmStockCenter.qryCreateStOrder.State <> dsBrowse then
      dmStockCenter.qryCreateStOrder.Cancel;
    dmStockCenter.qryCreateStOrder.Delete;
    SetButtonEnable;
  end;
end;

//确定
procedure TfrmCreateStockOrder.actOkExecute(Sender: TObject);
var
  encStr : string;
begin
  if dmStockCenter.qryCreateStOrder.State <> dsBrowse then
  begin
    if dmStockCenter.qryCreateStOrder.FieldByName('supplier_contract').AsString <> '' then
    begin
      if dmStockCenter.qryCreateStOrder.State = dsInsert then
      begin
        encStr := CreateStockEncode;
        while not dmStockCenter.StkOIsUnique(encStr) do
        begin
          stkOrderNo := '';
          encStr := CreateStockEncode;
        end;
        dmStockCenter.qryCreateStOrder.FieldByName('stk_no').AsString := encStr;
      end;
      dmStockCenter.qryCreateStOrder.Post;
      if dmStockCenter.qryCreateStOProduct.State <> dsBrowse then
      begin
        dmStockCenter.qryCreateStOProduct.Post;
      end;
      SetStkOrderId;
      if dmStockCenter.qryCreateStOProduct.UpdatesPending then
      begin
        dmStockCenter.qryCreateStOProduct.ApplyUpdates;
        dmStockCenter.qryCreateStOProduct.CommitUpdates;
      end;
      SetStkOPN;
      SetButtonEnable;
      stkOrderNo := '';
    end else
      ShowMessage('合同号不能为空！');
  end;
end;

//生成订单号
function TfrmCreateStockOrder.CreateStockEncode: string;
var
  scStr,enStr : string;
begin
  scStr := dmStockCenter.qryCreateStOrder.FieldByName('supplier_contract').AsString;
  if stkOrderNo = '' then
  begin
    enStr := getStockEncode;
    stkOrderNo := Copy(enStr,Length(enStr)-3,4);
  end;
  scStr := scStr + '-' + stkOrderNo;
  Result := scStr;
end;

//生成采购单号
procedure TfrmCreateStockOrder.RzDBEdit2Exit(Sender: TObject);
begin
  if dmStockCenter.qryCreateStOrder.State <> dsBrowse then
    dmStockCenter.qryCreateStOrder.FieldByName('stk_no').AsString := CreateStockEncode;
end;

//设置商品采购单ID
procedure TfrmCreateStockOrder.SetStkOrderId;
var
  i,skoid : Integer;
begin
  skoid := dmStockCenter.qryCreateStOrder.FieldByName('id').AsInteger;
  with dmStockCenter.qryCreateStOProduct do
  begin
    DisableControls;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      Edit;
      FieldByName('stkorder_id').AsInteger := skoid;
      Post;
      Next;
    end;
    EnableControls;
  end;
end;

//取消
procedure TfrmCreateStockOrder.actCancelExecute(Sender: TObject);
begin
  if dmStockCenter.qryCreateStOrder.State <> dsBrowse then
  begin
    dmStockCenter.qryCreateStOrder.Cancel;
    if dmStockCenter.qryCreateStOProduct.State <> dsBrowse then
    begin
      dmStockCenter.qryCreateStOProduct.Cancel;
    end;
    dmStockCenter.qryCreateStOProduct.CancelUpdates;
  end;
  SetButtonEnable;
end;

//设置互斥
procedure TfrmCreateStockOrder.SetButtonEnable;
begin
  //按钮互斥
  btnCreate.Enabled := not btnCreate.Enabled;
  btnDelete.Enabled := not btnDelete.Enabled;
  btnUpdate.Enabled := not btnUpdate.Enabled;
  btnOk.Enabled := not btnOk.Enabled;
  btnCancel.Enabled := not btnCancel.Enabled;
  btnMake.Enabled := not btnMake.Enabled;
  btnPrint.Enabled := not btnPrint.Enabled;
  RzDBNavigator1.Enabled := not RzDBNavigator1.Enabled;

  //checkbox
  //RzCheckBox1.Enabled := not RzCheckBox1.Enabled;
  RzCheckBox2.Enabled := not RzCheckBox2.Enabled;
  RzCheckBox3.Enabled := not RzCheckBox3.Enabled;

  //qry
  dmStockCenter.qryCreateStOrder.ReadOnly := not dmStockCenter.qryCreateStOrder.ReadOnly;
  dmStockCenter.qryCreateStOProduct.ReadOnly := not dmStockCenter.qryCreateStOProduct.ReadOnly;
end;

//库房编号
procedure TfrmCreateStockOrder.RzDBButtonEdit1ButtonClick(Sender: TObject);
begin
  dmStockCenter.qryDepotInfo.ReadOnly := False;
  rldDepotInfo.Execute;
  dmStockCenter.qryDepotInfo.ReadOnly := True;
end;

//关闭
procedure TfrmCreateStockOrder.btnExitClick(Sender: TObject);
begin
  Self.Close;
end;

//添加商品
procedure TfrmCreateStockOrder.actAddProductExecute(Sender: TObject);
var
  resVal : Integer;
begin
  if dmStockCenter.qryCreateStOrder.State <> dsBrowse then
  begin
    if dmStockCenter.qryCreateStOrder.FieldByName('supplier_contract').AsString <> '' then
    begin
      resVal := 0;
      //ShowModalForm(TfrmStOAddProduct);
      dmStockCenter.qryStOAddPudt.AddWhere('supplier_no=:spno');
      dmStockCenter.qryStOAddPudt.ParamByName('spno').AsString :=
        dmStockCenter.qryCreateStOrder.FieldByName('supplier_no').AsString;
      Application.CreateForm(TfrmAddOrderProduct,frmAddOrderProduct);
      try
        resVal := frmAddOrderProduct.ShowModal;
        dmStockCenter.qryStOAddPudt.DeleteWhere;
      finally
        FreeAndNil(frmAddOrderProduct);
        if resVal = 1 then AddProduct;
      end;
    end else
      ShowMessage('请输入合同号！');
  end else
    ShowMessage('未处于编辑状态！');
end;

//添加商品
procedure TfrmCreateStockOrder.AddProduct;
var
  i : Integer;
begin
  with dmStockCenter.qryCreateStOProduct do
  begin
    DisableControls;
    for i := Low(addOPList) to High(addOPList) do
    begin
      //IndexFieldNames := 'product_sku';
      if Locate('product_sku',addOPList[i].psku,[loCaseInsensitive]) then
      begin
        ShowMessage('已添加SKU号为 '+addOPList[i].psku+' 的商品！');
        Continue;
      end;

      Append;
      FieldByName('product_id').AsInteger := addOPList[i].pid;
      FieldByName('product_sku').AsString := addOPList[i].psku;
      FieldByName('product_num').AsInteger := 1;
      FieldByName('state').AsInteger := StrToInt(P_STATE_NEW);
      FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
      Post;
    end;
    EnableControls;
  end;
end;

//删除商品
procedure TfrmCreateStockOrder.actDelProductExecute(Sender: TObject);
begin
  if dmStockCenter.qryCreateStOrder.State <> dsBrowse then
  begin
    if Application.MessageBox('确定删除商品？', '提示', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      if dmStockCenter.qryCreateStOProduct.State <> dsBrowse then
      begin
        dmStockCenter.qryCreateStOProduct.Post;
      end;
      dmStockCenter.qryCreateStOProduct.Delete;
    end;
  end else
    ShowMessage('未处于编辑状态！');
end;

//双击确认修改
procedure TfrmCreateStockOrder.dgeProductListDblClick(Sender: TObject);
begin
  if dmStockCenter.qryCreateStOProduct.State <> dsBrowse then
  begin
    dmStockCenter.qryCreateStOProduct.Post;
  end;
end;

//生成新单
procedure TfrmCreateStockOrder.actMakeExecute(Sender: TObject);
var
  oid : string;
  bfs,afs : Integer;
begin
  if dmStockCenter.qryCreateStOrder.RecordCount > 0 then
  begin
    if Application.MessageBox('确定生成新单？', '提示', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      oid := dmStockCenter.qryCreateStOrder.FieldByName('stk_no').AsString;
      bfs := dmStockCenter.qryCreateStOrder.FieldByName('state').AsInteger;
      afs := StrToInt(STO_CREATE);
      UpdateOrderState(dmStockCenter.qryCreateStOrder,'state',afs);
      SetStkOrderState(oid,bfs,afs);
    end;
  end else
    ShowMessage('未找到采购单草稿！');
end;

//进价组成
procedure TfrmCreateStockOrder.RzCheckBoxClick(Sender: TObject);
var
  str : string;
begin
  str := '';
  if dmStockCenter.qryCreateStOrder.State <> dsBrowse then
  begin
    if RzCheckBox1.Checked then str:='货价';
    if RzCheckBox2.Checked then
    begin
      if str <> '' then str:=str+'+';
      str:=str+'税费';
    end;
    if RzCheckBox3.Checked then
    begin
      if str <> '' then str:=str+'+';
      str:=str+'运费';
    end;

    dmStockCenter.qryCreateStOrder.FieldByName('stk_p_compose').AsString := str;
  end else
    ShowMessage('未处于编辑状态！');
end;

//设置订单金额和商品数量
procedure TfrmCreateStockOrder.SetStkOPN;
var
  i : Integer;
  price : Real;
  pnum : Integer;
begin
  price := 0;
  pnum := 0;
  with dmStockCenter.qryCreateStOProduct do
  begin
    DisableControls;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      price := price + FieldByName('product_allprice').AsFloat;
      pnum := pnum + FieldByName('product_num').AsInteger;
      Next;
    end;
    First;
    EnableControls;
  end;
  with dmStockCenter.qryCreateStOrder do
  begin
    Edit;
    FieldByName('stk_price').AsFloat := price;
    FieldByName('stkp_num').AsInteger := pnum;
    Post;
  end;
end;

//打印订单
procedure TfrmCreateStockOrder.btnPrintClick(Sender: TObject);
begin
  try
    frmCommonDm.rptPrint.Clear;
    frmCommonDm.rptPrint.LoadFromFile('./Report/stockOrder.fr3');
    frmCommonDm.rptPrint.ShowReport;
  except
    ShowMessage('加载报表文件错误！请与管理员联系。');
  end;
end;

end.
