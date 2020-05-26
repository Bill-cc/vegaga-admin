unit untProductIntoDepot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, RzPanel,
  ActnList, ImgList, Menus, RzButton, Buttons;

type
  TfrmProductIntoDepot = class(TForm)
    RzToolbar1: TRzToolbar;
    dgeStkOrderList: TDBGridEh;
    btnInDepot: TRzToolButton;
    pmOpt: TPopupMenu;
    il1: TImageList;
    aclOpt: TActionList;
    actInDepot: TAction;
    RzMenuToolbarButton1: TRzMenuToolbarButton;
    pmState: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    btnExit: TRzToolButton;
    N7: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actInDepotExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure dgeStkOrderListTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    procedure ShowInDepotForm;
    procedure SetOState(state: string);
    procedure ShowAll;
  public
    { Public declarations }
  end;

//var
//  frmProductIntoDepot: TfrmProductIntoDepot;

implementation

uses untDepotCenterDM, untPIDManager, untCommonUtil;

{$R *.dfm}

//��������
procedure TfrmProductIntoDepot.FormCreate(Sender: TObject);
begin
  ShowAll;
  dmDepotCenter.qryStOInDepot.Open;
end;

//�رմ���
procedure TfrmProductIntoDepot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmDepotCenter.qryStOInDepot.Close;
end;

//������
procedure TfrmProductIntoDepot.actInDepotExecute(Sender: TObject);
begin
  if dmDepotCenter.qryStOInDepot.RecordCount > 0 then
  begin
    case dmDepotCenter.qryStOInDepot.FieldByName('state').AsInteger of
      1 : ShowInDepotForm;
      2 : ShowMessage('�˲ɹ���Ϊ�쳣����');
      3 : ShowInDepotForm;//ShowMessage('�ɹ�������⣡');
      4 : ShowInDepotForm;//ShowMessage('�ɹ����Ѷ��ۣ�');
      5 : ShowInDepotForm;
    end;
  end else
    ShowMessage('δ�ҵ��ɹ�����');
end;

//����������
procedure TfrmProductIntoDepot.ShowInDepotForm;
begin
  Application.CreateForm(TfrmPIDManager,frmPIDManager);
  try
    frmPIDManager.ShowModal;
  except
    FreeAndNil(frmPIDManager);
  end;
end;

//���ö�������
procedure TfrmProductIntoDepot.SetOState(state: string);
begin
  dmDepotCenter.qryStOInDepot.Filtered := False;
  dmDepotCenter.qryStOInDepot.Filter := 'state='+state;
  dmDepotCenter.qryStOInDepot.Filtered := True;
end;

//��ʾȫ������
procedure TfrmProductIntoDepot.ShowAll;
begin
  dmDepotCenter.qryStOInDepot.Filtered := False;
  dmDepotCenter.qryStOInDepot.Filter := 'state=1 or state=3 or state=5';
  dmDepotCenter.qryStOInDepot.Filtered := True;
end;

//ȫ��
procedure TfrmProductIntoDepot.N1Click(Sender: TObject);
begin
  ShowAll;
end;

//�µ�
procedure TfrmProductIntoDepot.N2Click(Sender: TObject);
begin
  SetOState(STO_CREATE);
end;

//�����
procedure TfrmProductIntoDepot.N3Click(Sender: TObject);
begin
  SetOState(STO_WAREHOUSING);
end;

//�쳣��
procedure TfrmProductIntoDepot.N6Click(Sender: TObject);
begin
  SetOState(STO_EXCEPTION);
end;

//���޸�
procedure TfrmProductIntoDepot.N7Click(Sender: TObject);
begin
  SetOState(STO_AMEND);
end;

//�Ѷ���
procedure TfrmProductIntoDepot.N4Click(Sender: TObject);
begin
  SetOState(STO_COMPLETED);
end;

procedure TfrmProductIntoDepot.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmProductIntoDepot.dgeStkOrderListTitleBtnClick(
  Sender: TObject; ACol: Integer; Column: TColumnEh);
begin
  FieldSort(dmDepotCenter.qryStOInDepot,Column);
end;

end.
