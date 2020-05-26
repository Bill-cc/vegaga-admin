unit untProductCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBmpBtn, RzLine;

type
  TfrmProductCenter = class(TFrame)
    btnPriceEdit: TRzBmpButton;
    btnProductEdit: TRzBmpButton;
    btnShelfManager: TRzBmpButton;
    rzln1: TRzLine;
    rzln2: TRzLine;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses MAIN;

{$R *.dfm}

end.
