unit untSysManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, RzBmpBtn, RzLine;

type
  TfrmSysManager = class(TFrame)
    btnUserManager: TRzBmpButton;
    RzBmpButton1: TRzBmpButton;
    RzLine1: TRzLine;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmSysManager : TfrmSysManager;

implementation

uses MAIN;

{$R *.dfm}

end.
