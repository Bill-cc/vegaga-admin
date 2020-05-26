unit untCreateROrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, RzPanel, RzSplit, ExtCtrls,
  RzButton, Menus, StdCtrls, Mask, RzEdit, RzDBEdit, RzLabel, DB;

type
  TfrmCreateROrder = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    RzSplitter1: TRzSplitter;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    dgeOPList: TDBGridEh;
    dgeROPList: TDBGridEh;
    pnl4: TPanel;
    pnl5: TPanel;
    btnExit: TRzBitBtn;
    btnOk: TRzBitBtn;
    pmSOopt: TPopupMenu;
    pmROopt: TPopupMenu;
    N1: TMenuItem;
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
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    resVal : Integer;
    procedure InitEdit;
    procedure CloseSet;
    procedure CreateReturnOrder;
    procedure SetPROID;
    procedure AddToROPList(pid,pnum: Integer;psku: string;pprice: Real);
  public
    { Public declarations }
  end;

var
  frmCreateROrder: TfrmCreateROrder;

implementation

uses untMenServiceDM, untCommonUtil, untSetROPNum;

{$R *.dfm}

//创建窗口
procedure TfrmCreateROrder.FormCreate(Sender: TObject);
begin
  dmMenService.qryProductInfo.Open;
  dmMenService.qryROrderInfo.Open;
  dmMenService.qryROPList.Open;
  InitEdit;
  resVal := 2;
end;

//关闭窗口
procedure TfrmCreateROrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CloseSet;
  dmMenService.qryROPList.Close;
  dmMenService.qryROrderInfo.Close;
  dmMenService.qryProductInfo.Close;
  ModalResult := resVal;
end;

//初始化编辑状态
procedure TfrmCreateROrder.InitEdit;
begin
  with dmMenService do
  begin
    qryROrderInfo.ReadOnly := False;
    qryROPList.ReadOnly := False;
    qryROrderInfo.Append;
    qryROrderInfo.FieldByName('so_id').AsInteger := qryOrderInfo.FieldByName('so_id').AsInteger;
    qryROrderInfo.FieldByName('so_no').AsString := qryOrderInfo.FieldByName('so_sn').AsString;
    qryROrderInfo.FieldByName('so_source').AsString := qryOrderInfo.FieldByName('so_source').AsString;
    qryROrderInfo.FieldByName('so_source_no').AsString := qryOrderInfo.FieldByName('source_no').AsString;
    qryROrderInfo.FieldByName('mem_id').AsInteger := qryOrderInfo.FieldByName('m_id').AsInteger;
    qryROrderInfo.FieldByName('return_men').AsString := qryOrderInfo.FieldByName('receiver').AsString;
    qryROrderInfo.FieldByName('return_tel').AsString := qryOrderInfo.FieldByName('tel').AsString;
    qryROrderInfo.FieldByName('return_mobile').AsString := qryOrderInfo.FieldByName('mobile').AsString;
    qryROrderInfo.FieldByName('return_email').AsString := qryOrderInfo.FieldByName('RECEIVE_EMAIL').AsString;
    qryROrderInfo.FieldByName('return_price').AsFloat := 0;
    qryROrderInfo.FieldByName('return_no').AsString := getROrderEncode;
    qryROrderInfo.FieldByName('state').AsInteger := StrToInt(SO_RETURN_ASSESSED);
    qryROrderInfo.FieldByName('sys_state').AsInteger := StrToInt(SYS_EFFECTIVE);
    qryROrderInfo.FieldByName('submit_date').AsDateTime := Date + Time;
  end;
end;

//关闭设置
procedure TfrmCreateROrder.CloseSet;
begin
  if dmMenService.qryROrderInfo.State <> dsBrowse then
    dmMenService.qryROrderInfo.Cancel;
  dmMenService.qryROrderInfo.ReadOnly := True;
  if dmMenService.qryROPList.UpdatesPending then
    dmMenService.qryROPList.CancelUpdates;
  dmMenService.qryROPList.ReadOnly := True;
end;

//取消
procedure TfrmCreateROrder.btnExitClick(Sender: TObject);
begin
  resVal := 2;
  Close;
end;

//生成退货单
procedure TfrmCreateROrder.btnOkClick(Sender: TObject);
begin
  if Application.MessageBox('确定生成退货单？', '提示', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    if dmMenService.qryROPList.RecordCount > 0 then
    begin
      CreateReturnOrder;
      resVal := 1;
    end else
      ShowMessage('无退货商品！');
  end;
end;

//生成退货单
procedure TfrmCreateROrder.CreateReturnOrder;
begin
  try
    dmMenService.qryROrderInfo.Post;
    SetPROID;
    dmMenService.qryROPList.ApplyUpdates;
    dmMenService.qryROPList.CommitUpdates;
    ShowMessage('创建成功！');
    Close;
  except
    ShowMessage('创建退货单失败！');
  end;
end;

//设置退货商品退货单ID
procedure TfrmCreateROrder.SetPROID;
var
  i,id : Integer;
begin
  id := dmMenService.qryROrderInfo.FieldByName('id').AsInteger;
  with dmMenService.qryROPList do
  begin
    DisableControls;
    for i := 0 to RecordCount - 1 do
    begin
      Edit;
      FieldByName('rso_id').AsInteger := id;
      Post;
      Next;
    end;
    EnableControls;
  end;
end;

//添加退货商品按钮
procedure TfrmCreateROrder.N1Click(Sender: TObject);
var
  pid,pnum : Integer;
  pname,psku : string;
  pprice : Real;
begin
  Application.CreateForm(TfrmSetROPNum,frmSetROPNum);
  try
    pid := dmMenService.qryOPList.FieldByName('p_id').AsInteger;
    psku := dmMenService.qryOPList.FieldByName('p_sku').AsString;
    pname := dmMenService.qryOPList.FieldByName('pdt_name').AsString;
    pnum := dmMenService.qryOPList.FieldByName('p_number').AsInteger;
    pprice := dmMenService.qryOPList.FieldByName('sale_price').AsFloat;
    frmSetROPNum.RzNumericEdit1.IntValue := pnum;
    frmSetROPNum.edt1.Text := pname;
    frmSetROPNum.edt2.Text := psku;
    pnum := frmSetROPNum.ShowModal;
  finally
    FreeAndNil(frmSetROPNum);
  end;
  if pnum > 0 then AddToROPList(pid,pnum,psku,pprice);
end;

//添加到
procedure TfrmCreateROrder.AddToROPList(pid,pnum: Integer;psku: string;pprice: Real);
begin
  if dmMenService.qryROPList.Locate('p_sku',psku,[loCaseInsensitive]) then
  begin
    ShowMessage('已添加此商品！');
    Exit;
  end;

  with dmMenService.qryROPList do
  begin
    Append;
    FieldByName('p_id').AsInteger := pid;
    FieldByName('p_sku').AsString := psku;
    FieldByName('p_num').AsInteger := pnum;
    FieldByName('p_price').AsFloat := pprice;
    FieldByName('p_amount').AsFloat := pnum*pprice;
    FieldByName('state').AsInteger := StrToInt(P_RSTATE_RETURNING);
    FieldByName('sys_state').AsInteger := StrToInt(SYS_EFFECTIVE);
    Post;
  end;
end;

//撤销按钮
procedure TfrmCreateROrder.N2Click(Sender: TObject);
begin
  if Application.MessageBox('确定撤销该商品？', '提示', MB_OKCANCEL +
    MB_DEFBUTTON2) = IDOK then
  begin
    dmMenService.qryROPList.Delete;
  end;
end;

end.

