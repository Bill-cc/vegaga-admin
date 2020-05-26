unit untStockCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, RzBmpBtn, RzLine;

type
  TfrmStockCenter = class(TFrame)
    btnProviderManager: TRzBmpButton;
    btnBrandManager: TRzBmpButton;
    btnProductManager: TRzBmpButton;
    btnCatalogManager: TRzBmpButton;
    btnCreateStockOrder: TRzBmpButton;
    btnStockOrderManager: TRzBmpButton;
    btnExceptStockOrder: TRzBmpButton;
    rzln3: TRzLine;
    rzln4: TRzLine;
    rzln6: TRzLine;
    rzln1: TRzLine;
    rzln2: TRzLine;
    rzln5: TRzLine;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses MAIN;

{$R *.dfm}

end.
