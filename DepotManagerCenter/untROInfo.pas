unit untROInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGridEhGrouping, RzButton, GridsEh, DBGridEh, DB,
  Menus, RzPanel, RzSplit, StdCtrls, Mask, RzEdit, RzDBEdit, RzLabel;

type
  TfrmROInfo = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    btnPrint: TRzBitBtn;
    btnAssess: TRzBitBtn;
    btnExit: TRzBitBtn;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    RzDBEdit4: TRzDBEdit;
    RzDBEdit5: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzSplitter1: TRzSplitter;
    RzGroupBox1: TRzGroupBox;
    dgeROPList: TDBGridEh;
    RzGroupBox2: TRzGroupBox;
    dge1: TDBGridEh;
    pmOpt: TPopupMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAssessClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure RzDBEdit9Enter(Sender: TObject);
    procedure RzDBEdit9Exit(Sender: TObject);
  private
    procedure AssessPass;
    procedure ProductInDepot;
    function IsInDepoted: Boolean;
    function IsAllIn: Boolean;
    procedure UpdateRealNum;
  public
    { Public declarations }
  end;

var
  frmROInfo: TfrmROInfo;

implementation

uses untDepotCenterDM, untCommonUtil;

{$R *.dfm}

//创建窗口
procedure TfrmROInfo.FormCreate(Sender: TObject);
begin
  dmDepotCenter.qryProductInfo.Open;
  dmDepotCenter.qryROProductList.Open;
  dmDepotCenter.qryROPSkuLogList.Open;
end;

//关闭窗口
procedure TfrmROInfo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dmDepotCenter.qryROPSkuLogList.Close;
  dmDepotCenter.qryROProductList.Close;
  dmDepotCenter.qryProductInfo.Close;
end;

//确认入库
procedure TfrmROInfo.btnAssessClick(Sender: TObject);
begin
  case dmDepotCenter.qryROrderList.FieldByName('state').AsInteger of
    1 : ShowMessage('退货订单未审核！');
    2 : begin
          if IsAllIn then
          begin
            if Application.MessageBox('确定完成入库？', '提示', MB_OKCANCEL +
              MB_DEFBUTTON2) = IDOK then
            begin
              AssessPass;
              ShowMessage('成功入库！');
              Close;
            end;
          end else
            ShowMessage('还有未入库商品！');
        end;  
    3 : ShowMessage('退货订单商品已入库！');
    4 : ShowMessage('退货订单已退款！');
    5 : ShowMessage('退货订单已完成！');
  end;
end;

//入库完成
procedure TfrmROInfo.AssessPass;
var
  sboid,af,bf : Integer;
begin
  if dmDepotCenter.qryROrderList.State = dsEdit then
  begin
    dmDepotCenter.qryROrderList.Post;
  end;
  sboid := dmDepotCenter.qryROrderList.FieldByName('id').AsInteger;
  bf := dmDepotCenter.qryROrderList.FieldByName('state').AsInteger;
  af := StrToInt(SO_RETURN_WAREHOUSING);
  UpdateOrderState(dmDepotCenter.qryROrderList,'state',af);
  SetSBOrderState(sboid,bf,af);
  Close;
end;

//商品入库
procedure TfrmROInfo.ProductInDepot;
var
  pid : Integer;
  sono,psku,sortno : string;
begin
  sono := dmDepotCenter.qryROPSkuLogList.FieldByName('so_no').AsString;
  pid := dmDepotCenter.qryROPSkuLogList.FieldByName('p_id').AsInteger;
  psku := dmDepotCenter.qryROPSkuLogList.FieldByName('p_sku').AsString;
  sortno := dmDepotCenter.qryROPSkuLogList.FieldByName('sort_n').AsString;

  RCROProductInDepot(sono,psku,sortno);
  dmDepotCenter.SetProductReserves(pid,1,psku);
  UpdateRealNum;

  dmDepotCenter.qryROProductList.Refresh;
  dmDepotCenter.qryROPSkuLogList.Refresh;
end;

//更新实际入库数量
procedure TfrmROInfo.UpdateRealNum;
var
  realNum : Integer;
  rflag : Boolean;
begin
  with dmDepotCenter.qryROProductList do
  begin
    realNum := FieldByName('real_input_num').AsInteger + 1;
    rflag := ReadOnly;
    ReadOnly := False;
    Edit;
    FieldByName('real_input_num').AsInteger := realNum;
    Post;
    ReadOnly := rflag;
  end;
end;

//退货单打印
procedure TfrmROInfo.btnPrintClick(Sender: TObject);
begin
  //asdf
end;

//关闭
procedure TfrmROInfo.btnExitClick(Sender: TObject);
begin
  Close;
end;

//选择入库
procedure TfrmROInfo.N1Click(Sender: TObject);
var
  roid : Integer;
begin
  if Application.MessageBox('确定选择此流水号入库？', '提示', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    if dmDepotCenter.qryROPSkuLogList.RecordCount > 0 then
    begin
      roid := dmDepotCenter.qryROPSkuLogList.FieldByName('ro_id').AsInteger;
      if not IsInDepoted then
      begin
        ProductInDepot;
      end else
      begin
        dmDepotCenter.UpdateROPState(roid,StrToInt(P_RSTATE_RETURNED));
        ShowMessage('此商品以全部入库');
      end;
    end else
      ShowMessage('无可入库商品！');
  end;
end;

//判断商品是否全部入库
function TfrmROInfo.IsInDepoted: Boolean;
var
  pnum,rinum : Integer;
begin
  Result := True;
  with dmDepotCenter.qryROProductList do
  begin
    pnum := FieldByName('p_num').AsInteger;
    rinum := FieldByName('real_input_num').AsInteger;

    if pnum > rinum then Result := False;
  end;
end;

//是否全部入库
function TfrmROInfo.IsAllIn: Boolean;
var
  i,pnum,rinum : Integer;
begin
  Result := True;
  with dmDepotCenter.qryROProductList do
  begin
    DisableControls;
    First;
    for i := 0 to RecordCount - 1 do
    begin
      pnum := FieldByName('p_num').AsInteger;
      rinum := FieldByName('real_input_num').AsInteger;
      if pnum > rinum then
      begin
        Result := False;
        Break;
      end;
      Next;
    end;
    EnableControls;
  end;
end;

//进入
procedure TfrmROInfo.RzDBEdit9Enter(Sender: TObject);
begin
  dmDepotCenter.qryROrderList.ReadOnly := False;
  dmDepotCenter.qryROrderList.Edit;
end;

//离开
procedure TfrmROInfo.RzDBEdit9Exit(Sender: TObject);
begin
  dmDepotCenter.qryROrderList.Post;
  dmDepotCenter.qryROrderList.ReadOnly := True;
end;

end.
