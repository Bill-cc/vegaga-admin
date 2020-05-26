unit untLogisticsCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, RzBmpBtn, RzLine;

type
  TfrmLogisticsCenter = class(TFrame)
    btnExpressManager: TRzBmpButton;
    btnOrderDispatchingQuery: TRzBmpButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
                     
implementation

uses MAIN;

{$R *.dfm}

end.
