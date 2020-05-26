unit untSelectProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzButton,
  StdCtrls, RzLabel, Mask, RzEdit;

type
  TfrmSelectProduct = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    dgePrdList: TDBGridEh;
    pnl4: TPanel;
    pnl5: TPanel;
    btnOk: TRzBitBtn;
    btnCancel: TRzBitBtn;
    edtsn: TRzEdit;
    RzLabel1: TRzLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure edtsnChange(Sender: TObject);
  private
    returnVal : Integer;
    procedure FindProduct(sn : string);
    procedure SetPdtInfo;
  public
    { Public declarations }
  end;

type
  TSelectProduct = record
    pid : Integer;
    psn : string;
    psku : string;
    pname : string;
    supplierno : string;
    brandid : Integer;
    pean : string;
    psize : string;
    pcolor : string;
    pbrief : string;
    pscore : Integer;
    pspec : string;
    porigin : string;
    pexe : string;
  end;

var
  frmSelectProduct: TfrmSelectProduct;
  SelPdt : TSelectProduct;

implementation

uses untStockCenterDM;

{$R *.dfm}

//��������
procedure TfrmSelectProduct.FormCreate(Sender: TObject);
begin
  returnVal := 2;
  //dmStockCenter.qryBrandList.Open;
  //dmStockCenter.qrySupplierInfo.Open;
  dmStockCenter.qrySelectProduct.Open;
end;

//�رմ���
procedure TfrmSelectProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qrySelectProduct.Close;
  //dmStockCenter.qryBrandList.Close;
  //dmStockCenter.qrySupplierInfo.Close;
  ModalResult := returnVal;
end;

//ȷ��
procedure TfrmSelectProduct.btnOkClick(Sender: TObject);
begin
  returnVal := 1;
  SetPdtInfo;
  Close;
end;

//ȡ��
procedure TfrmSelectProduct.btnCancelClick(Sender: TObject);
begin
  returnVal := 2;
  Close;
end;

//������Ʒ
procedure TfrmSelectProduct.FindProduct(sn: string);
var
  findStr : string;
begin
  if sn = '' then
    findStr := '%'
  else
    findStr := '%'+sn+'%';
  with dmStockCenter.qrySelectProduct do
  begin
    Filter := 'sn like '+QuotedStr(findStr);
    Filtered := True;
  end;
end;

//������Ʒ��Ϣ
procedure TfrmSelectProduct.SetPdtInfo;
begin
  with dmStockCenter.qrySelectProduct do
  begin
    if RecordCount > 0 then
    begin
      SelPdt.pid := FieldByName('p_id').AsInteger;
      SelPdt.psn := FieldByName('sn').AsString;
      SelPdt.pname := FieldByName('name').AsString;
      SelPdt.supplierno := FieldByName('supplier_no').AsString;
      SelPdt.brandid := FieldByName('brand_id').AsInteger;
      SelPdt.pean := FieldByName('ean').AsString;
      SelPdt.psize := FieldByName('p_size').AsString;
      SelPdt.pcolor := FieldByName('color').AsString;
      SelPdt.pbrief := FieldByName('brief').AsString;
      SelPdt.pscore := FieldByName('score').AsInteger;
      SelPdt.pspec := FieldByName('spec').AsString;
      SelPdt.porigin := FieldByName('origin').AsString;
      SelPdt.pexe := FieldByName('execute_std').AsString;
    end;
  end;
end;

procedure TfrmSelectProduct.edtsnChange(Sender: TObject);
begin
  FindProduct(Trim(edtsn.Text));
end;

end.
