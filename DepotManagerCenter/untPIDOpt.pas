unit untPIDOpt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, RzEdit, RzCmboBx, RzButton, RzDBEdit, Mask,
  RzLabel, RzBckgnd;

type
  TProductInfo = record
    pid : Integer;
    sku : string;
    sn : string;
    wn : string;
    remark : string;
  end;

type
  TfrmPIDOpt = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzDBEdit1: TRzDBEdit;
    RzDBNumericEdit1: TRzDBNumericEdit;
    RzDBNumericEdit2: TRzDBNumericEdit;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    btnNext: TRzBitBtn;
    btnExit: TRzBitBtn;
    edtSn: TRzEdit;
    RzComboBox1: TRzComboBox;
    RzMemo1: TRzMemo;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    RzDBEdit2: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    rsptr1: TRzSeparator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExitClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
  private
    currRow : Integer;
    currProduct : TProductInfo;
    okFlag : Boolean;
    procedure InitDposition;
    procedure SelectIDP;
    function GetInDepotInfo : Boolean;
    procedure ClearInDepotInfo;
  public
    { Public declarations }
  end;

var
  frmPIDOpt: TfrmPIDOpt;

implementation

uses untDepotCenterDM, untPIDManager, untCommonDm, untCommonUtil;

{$R *.dfm}

{ TfrmPIDOpt }

//仓位初始化
procedure TfrmPIDOpt.InitDposition;
var
  i : Integer;
  psku : string;
begin
  RzComboBox1.Clear;
  psku := dmDepotCenter.qryStOPInDepot.FieldByName('product_sku').AsString;
  with dmDepotCenter.qryDpositionInfo do
  begin
    Open;
    for i := 0 to RecordCount - 1 do
    begin
      RzComboBox1.Items.Append(FieldByName('dpinfo').AsString+'--'
                              +FieldByName('dp_dpuse').AsString+'--'
                              +FieldByName('dp_rating').AsString);
      Next;
    end;
    Filter := 'dp_sku='+psku;
    Filtered := True;
    First;
    if RecordCount > 0 then
    begin
      RzComboBox1.ForceText(FieldByName('dpinfo').AsString+'--'
                          + FieldByName('dp_dpuse').AsString+'--'
                          + FieldByName('dp_rating').AsString);
      RzComboBox1.ReadOnly := True;
    end else
      RzComboBox1.ReadOnly := False;
    Close;
    Filter := '';
    Filtered := False;
  end;
end;

//创建窗口
procedure TfrmPIDOpt.FormCreate(Sender: TObject);
begin
  InitDposition;
  currRow := 0;
  okFlag := False;
  SelectIDP;
end;

//关闭窗口
procedure TfrmPIDOpt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //InDepotCommitUpdate;
end;

//退出
procedure TfrmPIDOpt.btnExitClick(Sender: TObject);
begin
  Close;
end;

//入库
procedure TfrmPIDOpt.btnNextClick(Sender: TObject);
begin
  if not okFlag then
  begin
    if GetInDepotInfo then
    begin
      //frmCommonDm.Connection.StartTransaction;
      try
        dmDepotCenter.SetSTOIndepotNum(1);
        dmDepotCenter.SetOptLog(currProduct.pid,
                                currProduct.sku,
                                currProduct.sn,
                                currProduct.wn,
                                currProduct.remark);
        dmDepotCenter.SetProductReserves(currProduct.pid,1,currProduct.sku);
        dmDepotCenter.SetDpositionInfo(currProduct.wn,currProduct.sku,'IN');
        //frmCommonDm.Connection.Commit;
        ClearInDepotInfo;
        SelectIDP;
        InitDposition;
      except
        //frmCommonDm.Connection.Rollback;
        ShowMessage('入库出错！');
      end;
    end;
  end else
  begin
    ShowMessage('商品以全部入库！');
    Close;
  end;
end;

//选择入库商品
procedure TfrmPIDOpt.SelectIDP;
var
  i,maxRow,pnum,innum : Integer;
begin
  with dmDepotCenter.qryStOPInDepot do
  begin
    maxRow := frmPIDManager.dgeStOPList.SelectedRows.Count - 1;
    for i := currRow to maxRow do
    begin
      GotoBookmark(Pointer(frmPIDManager.dgeStOPList.SelectedRows.Items[i]));
      pnum := FieldByName('product_num').AsInteger;
      innum := FieldByName('product_indepotnum').AsInteger;

      if pnum = innum then
      begin
        if maxRow = currRow then
        begin
          okFlag := True;
          Break;
        end;
        Continue;
      end else
      begin
        currRow := i;
        currProduct.pid := FieldByName('product_id').AsInteger;
        currProduct.sku := FieldByName('product_sku').AsString;
        Break;
      end;
    end;
  end;
end;

function TfrmPIDOpt.GetInDepotInfo: Boolean;
var
  strList : TStringList;
begin
  Result := False;
  if (Trim(edtSn.Text) <> '') and
     (Length(Trim(edtSn.Text)) > 7) and
     (Trim(RzComboBox1.Text) <> '') then
  begin
    if SnIsUniquely(Trim(edtSn.Text)) then
    begin
      currProduct.sn := Trim(edtSn.Text);
      strList := SplitString(Trim(RzComboBox1.Text),'--');
      currProduct.wn := strList.Strings[0];
      currProduct.remark := Trim(RzMemo1.Text);
      Result := True;
    end else
      ShowMessage('流水号重复！');
  end else
    ShowMessage('请填写流水号（至少8位）和仓位号！');
end;

//清楚信息
procedure TfrmPIDOpt.ClearInDepotInfo;
begin
  currProduct.pid := 0;
  currProduct.sku := '';
  currProduct.sn := '';
  currProduct.wn := '';
  currProduct.remark := '';

  edtSn.Text := '';
  RzComboBox1.Text := '';
  RzMemo1.Text := '';
end;

end.
