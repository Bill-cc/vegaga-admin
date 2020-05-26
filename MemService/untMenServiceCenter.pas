unit untMenServiceCenter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, RzBmpBtn, RzLine;

type
  TfrmMenServiceCenter = class(TFrame)
    btnMenManager: TRzBmpButton;
    btnCreateOrder: TRzBmpButton;
    btnOrderManager: TRzBmpButton;
    RzLine1: TRzLine;
    btnSendBackManager: TRzBmpButton;
    RzLine2: TRzLine;
    rzln1: TRzLine;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmMenServiceCenter : TfrmMenServiceCenter;

implementation

uses MAIN;

{$R *.dfm}

end.
