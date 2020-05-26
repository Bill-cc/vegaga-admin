unit untPriceEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel, RzButton,
  ActnList, ImgList, Menus;

type
  TfrmPriceEdit = class(TForm)
    RzToolbar1: TRzToolbar;
    pnl1: TPanel;
    dgeStoList: TDBGridEh;
    btnSetPrice: TRzToolButton;
    aclOpt: TActionList;
    pmOpt: TPopupMenu;
    ilImage: TImageList;
    actSetPrice: TAction;
    btnExit: TRzToolButton;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actSetPriceExecute(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

//var
//  frmPriceEdit: TfrmPriceEdit;

implementation

uses untPCenterDM, untSetPrice;

{$R *.dfm}

//����
procedure TfrmPriceEdit.FormCreate(Sender: TObject);
begin
  dmPCenter.qrySetOPrice.Open;
  dmPCenter.qrySetOPdtPrice.Open;
end;

//�ر�
procedure TfrmPriceEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmPCenter.qrySetOPdtPrice.Close;
  dmPCenter.qrySetOPrice.Close;
end;

//����
procedure TfrmPriceEdit.actSetPriceExecute(Sender: TObject);
begin
  if dmPCenter.qrySetOPrice.RecordCount > 0 then
  begin
    Application.CreateForm(TfrmSetPrice,frmSetPrice);
    try
      frmSetPrice.ShowModal;
    finally
      FreeAndNil(frmSetPrice);

      dmPCenter.qrySetOPrice.Refresh;
    end;
  end else
    ShowMessage('�޿ɶ��۲ɹ�����');
end;

procedure TfrmPriceEdit.btnExitClick(Sender: TObject);
begin
  Close;
end;

end.
