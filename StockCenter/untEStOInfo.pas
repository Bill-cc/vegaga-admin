unit untEStOInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPanel, ExtCtrls, DBGridEhGrouping, GridsEh, DBGridEh, DB,
  Menus, RzButton, StdCtrls, Mask, RzEdit, RzDBEdit, RzLabel;

type
  TfrmEStOInfo = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    dgePList: TDBGridEh;
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
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel15: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit13: TRzDBEdit;
    RzDBEdit14: TRzDBEdit;
    pmOpt: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    pnl5: TPanel;
    btnExit: TRzBitBtn;
    btnPrint: TRzBitBtn;
    pnl6: TPanel;
    btnSubmit: TRzBitBtn;
    btnCancel: TRzBitBtn;
    RzLabel11: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel19: TRzLabel;
    RzDBEdit15: TRzDBEdit;
    RzDBEdit16: TRzDBEdit;
    RzDBEdit17: TRzDBEdit;
    RzDBEdit18: TRzDBEdit;
    btneoPrint: TRzBitBtn;
    procedure btnPrintClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btneoPrintClick(Sender: TObject);
    procedure dgePListDblClick(Sender: TObject);
    procedure dgePListCellClick(Column: TColumnEh);
  private
    procedure AddNewPrduct;
    procedure DelProduct;
    procedure UpdateProduct;
    procedure UpdateButtonState;
    procedure UpdateEStkOPN;
  public
    { Public declarations }
  end;

var
  frmEStOInfo: TfrmEStOInfo;

implementation

uses untStockCenterDM, untCommonUtil, untAddOrderProduct, untEStOPDel,
  untEStOPUpdate, untCommonDm;

{$R *.dfm}

//确认更改
procedure TfrmEStOInfo.btnPrintClick(Sender: TObject);
var
  oid : string;
  bfs,afs : Integer;
begin
  if not dmStockCenter.qryEStOPList.UpdatesPending then
  begin
    if Application.MessageBox('确定更改完成？', '提示', MB_OKCANCEL +
      MB_DEFBUTTON2) = IDOK then
    begin
      oid := dmStockCenter.qryEStOrder.FieldByName('stk_no').AsString;
      bfs := dmStockCenter.qryEStOrder.FieldByName('state').AsInteger;
      afs := StrToInt(STO_AMEND);
      UpdateOrderState(dmStockCenter.qryEStOrder,'state',afs);
      SetStkOrderState(oid,bfs,afs);
      Close;
    end;
  end else
    ShowMessage('修改未提交！');
end;

//退出
procedure TfrmEStOInfo.btnExitClick(Sender: TObject);
begin
  Close;
end;

//添加商品
procedure TfrmEStOInfo.N1Click(Sender: TObject);
begin
  dmStockCenter.qryStOAddPudt.AddWhere('supplier_no=:spno');
  dmStockCenter.qryStOAddPudt.ParamByName('spno').AsString :=
    dmStockCenter.qryEStOrder.FieldByName('supplier_no').AsString;
  Application.CreateForm(TfrmAddOrderProduct,frmAddOrderProduct);
  try
    frmAddOrderProduct.ShowModal;
    dmStockCenter.qryStOAddPudt.DeleteWhere;
  finally
    FreeAndNil(frmAddOrderProduct);
    AddNewPrduct;
  end;  
end;

//添加商品
procedure TfrmEStOInfo.AddNewPrduct;
var
  i : Integer;
begin
  with dmStockCenter.qryEStOPList do
  begin
    DisableControls;
    for i := Low(addOPList) to High(addOPList) do
    begin
      if Locate('product_sku',addOPList[i].psku,[loCaseInsensitive]) then
      begin
        ShowMessage('已添加SKU号为 '+addOPList[i].psku+' 的商品！');
        Continue;
      end;

      Append;
      FieldByName('product_id').AsInteger := addOPList[i].pid;
      FieldByName('product_sku').AsString := addOPList[i].psku;
      FieldByName('product_cost').AsFloat := addOPList[i].pprice;
      FieldByName('state').AsInteger := StrToInt(P_STATE_NEW);
      FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
      FieldByName('memo').AsString := '新增';
      Post;
      UpdateProduct;
    end;
    EnableControls;
  end;
  UpdateButtonState;
end;

//修改商品
procedure TfrmEStOInfo.N3Click(Sender: TObject);
begin
  UpdateProduct;
  UpdateButtonState;
end;

//修改商品
procedure TfrmEStOInfo.UpdateProduct;
var
  inum,udnum,flag : Integer;
begin
  with dmStockCenter.qryEStOPList do
  begin
    if RecordCount > 0 then
    begin
      inum := FieldByName('product_indepotnum').AsInteger;

      Application.CreateForm(TfrmEStOPUpdate,frmEStOPUpdate);
      frmEStOPUpdate.RzNumericEdit1.Text := IntToStr(inum);
      frmEStOPUpdate.RzNumericEdit2.Text := IntToStr(inum);
      try
        flag := frmEStOPUpdate.ShowModal;
      finally
        if flag = 1 then
        begin
          udnum := StrToInt(frmEStOPUpdate.RzNumericEdit2.Text);
          FreeAndNil(frmEStOPUpdate);
          if udnum > 0 then
          begin
            if udnum >= inum then
            begin
              Edit;
              FieldByName('product_num').AsInteger := udnum;
              Post;
            end;
          end else
          begin
            if Application.MessageBox('设置商品数为0，确认删除该商品？', '提示', MB_OKCANCEL +
              MB_DEFBUTTON2) = IDOK then
            begin
              Delete;
            end;
          end;
        end;
      end;
    end;
  end;
end;

//删除商品
procedure TfrmEStOInfo.N2Click(Sender: TObject);
begin
  DelProduct;
  UpdateButtonState;
end;

//删除商品
procedure TfrmEStOInfo.DelProduct;
var
  pnum,inum,delnum,flag : Integer;
begin
  with dmStockCenter.qryEStOPList do
  begin
    if RecordCount > 0 then
    begin
      if FieldByName('product_indepotnum').AsInteger > 0 then
      begin
        pnum := FieldByName('product_num').AsInteger;
        inum := FieldByName('product_indepotnum').AsInteger;

        Application.CreateForm(TfrmEStOPDel,frmEStOPDel);
        frmEStOPDel.RzNumericEdit1.Text := IntToStr(pnum - inum);
        try
          flag := frmEStOPDel.ShowModal;
        finally
          if flag = 1 then
          begin
            delnum := StrToInt(frmEStOPDel.RzNumericEdit2.Text);
            FreeAndNil(frmEStOPDel);

            if delnum <= (pnum - inum) then
            begin
              Edit;
              FieldByName('product_num').AsInteger := pnum - delnum;
              Post;
            end;
          end;
        end;
      end else
      begin
        if Application.MessageBox('确定删除该商品？', '提示', MB_OKCANCEL +
          MB_DEFBUTTON2) = IDOK then
        begin
          Delete;
        end;
      end;
    end;
  end;
end;

//提交修改
procedure TfrmEStOInfo.btnSubmitClick(Sender: TObject);
begin
  if dmStockCenter.qryEStOPList.UpdatesPending then
  begin
    dmStockCenter.qryEStOPList.ApplyUpdates;
    dmStockCenter.qryEStOPList.CommitUpdates;
  end;
  UpdateEStkOPN;
  UpdateButtonState;
end;

//取消修改
procedure TfrmEStOInfo.btnCancelClick(Sender: TObject);
begin
  if dmStockCenter.qryEStOPList.UpdatesPending then
  begin
    dmStockCenter.qryEStOPList.CancelUpdates;
  end;
  UpdateButtonState;
end;

//更新修改按钮状态
procedure TfrmEStOInfo.UpdateButtonState;
begin
  if dmStockCenter.qryEStOPList.UpdatesPending then
  begin
    btnSubmit.Enabled := True;
    btnCancel.Enabled := True;
  end else
  begin
    btnSubmit.Enabled := False;
    btnCancel.Enabled := False;
  end;
end;

procedure TfrmEStOInfo.btneoPrintClick(Sender: TObject);
begin
  if not dmStockCenter.qryEStOPList.UpdatesPending then
  begin
    try
      frmCommonDm.rptPrint.Clear;
      frmCommonDm.rptPrint.LoadFromFile('./Report/eStockOrder.fr3');
      frmCommonDm.rptPrint.ShowReport;
    except
      ShowMessage('加载报表文件错误！请与管理员联系。');
    end;
  end else
    ShowMessage('未提交修改！');
end;

//双击更改
procedure TfrmEStOInfo.dgePListDblClick(Sender: TObject);
begin
  if dmStockCenter.qryEStOPList.State <> dsBrowse then
  begin
    dmStockCenter.qryEStOPList.Post;
  end;
end;

//更新异常采购单金额和商品数量
procedure TfrmEStOInfo.UpdateEStkOPN;
var
  i : Integer;
  price : Real;
  pnum : Integer;
begin
  price := 0;
  pnum := 0;
  with dmStockCenter.qryEStOPList do
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
  with dmStockCenter.qryEStOrder do
  begin
    ReadOnly := False;
    Edit;
    FieldByName('stk_price').AsFloat := price;
    FieldByName('stkp_num').AsInteger := pnum;
    Post;
    ReadOnly := True;
  end;
end;

procedure TfrmEStOInfo.dgePListCellClick(Column: TColumnEh);
begin
  UpdateButtonState;
end;

end.
