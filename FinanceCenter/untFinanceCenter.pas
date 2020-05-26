unit untFinanceCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, RzBmpBtn;

type
  TfrmFinanceCenter = class(TFrame)
    btnFinanceOrderManager: TRzBmpButton;
    btnFinanceSendBackManager: TRzBmpButton;
    btnFinanceStat: TRzBmpButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses MAIN;

{$R *.dfm}

end.
