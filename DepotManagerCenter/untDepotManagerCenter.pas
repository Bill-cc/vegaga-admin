unit untDepotManagerCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, RzBmpBtn, RzLine;

type
  TfrmDepotManagerCenter = class(TFrame)
    btnProductIntoDepot: TRzBmpButton;
    btnDepotPositionManager: TRzBmpButton;
    btnCreateExceptStockOrder: TRzBmpButton;
    btnOrderDispatchingManager: TRzBmpButton;
    btnOrderSendBackManager: TRzBmpButton;
    rzln1: TRzLine;
    rzln2: TRzLine;
    rzln3: TRzLine;
    rzln4: TRzLine;
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
