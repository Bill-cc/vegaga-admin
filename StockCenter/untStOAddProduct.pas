unit untStOAddProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel, ImgList,
  RzButton, Menus,
  EhlibADO,EhlibBDE,EhlibMTE,PropFilerEh;

type
  TfrmStOAddProduct = class(TForm)
    RzToolbar1: TRzToolbar;
    dgeProductList: TDBGridEh;
    btnClear: TRzToolButton;
    ilimage: TImageList;
    btnOk: TRzToolButton;
    btnCancel: TRzToolButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    procedure btnClearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    procedure AddProduct;
  public
    { Public declarations }
  end;

 type TProductInfo = record
    pid : Integer;
    psku : string;
    pprice : Real;
  end;

var
  productlist : array of TProductInfo;
//  frmStOAddProduct: TfrmStOAddProduct;

implementation

uses untStockCenterDM;

{$R *.dfm}

//创建窗口
procedure TfrmStOAddProduct.FormCreate(Sender: TObject);
begin
  dmStockCenter.qryStOAddPudt.Open;
  dmStockCenter.qryBrandInfo.Open;
end;

//关闭
procedure TfrmStOAddProduct.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmStockCenter.qryBrandInfo.Close;
  dmStockCenter.qryStOAddPudt.Close;
end;

//刷新
procedure TfrmStOAddProduct.btnClearClick(Sender: TObject);
begin
  dmStockCenter.qryStOAddPudt.Refresh;
end;

//退出
procedure TfrmStOAddProduct.btnCancelClick(Sender: TObject);
begin
  Self.Close;
end;

//确定
procedure TfrmStOAddProduct.btnOkClick(Sender: TObject);
begin
  AddProduct;
end;

//添加商品
procedure TfrmStOAddProduct.AddProduct;
var
  i : Integer;
begin
  SetLength(productlist,dgeProductList.SelectedRows.Count);
  for i := 0 to dgeProductList.SelectedRows.Count - 1 do
  begin
    dgeProductList.DataSource.DataSet.GotoBookmark(Pointer(dgeProductList.SelectedRows.Items[i]));
    productlist[i].pid := dmStockCenter.qryStOAddPudt.FieldByName('p_id').AsInteger;
    productlist[i].psku := dmStockCenter.qryStOAddPudt.FieldByName('sku').AsString;
    productlist[i].pprice := dmStockCenter.qryStOAddPudt.FieldByName('p_price').AsFloat;
  end;
  Self.Close;
end;

//清空所选
procedure TfrmStOAddProduct.N1Click(Sender: TObject);
begin
  dgeProductList.Selection.Clear;
end;

initialization
DBGridEhCenter.FilterEditCloseUpApplyFilter := True;
end.
