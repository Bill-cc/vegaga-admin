unit untFinanceStat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzTabs, DBGridEhGrouping, GridsEh, DBGridEh,
  RzPanel, ImgList, Menus, ComObj;

type
  TfrmFinanceStat = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    btn1: TRzBitBtn;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    pnl5: TPanel;
    pnl7: TPanel;
    dge1: TDBGridEh;
    rztlbr1: TRzToolbar;
    btn2: TRzToolButton;
    ilList: TImageList;
    pmOpt: TPopupMenu;
    N1: TMenuItem;
    dlgSave: TSaveDialog;
    TabSheet2: TRzTabSheet;
    rztlbr2: TRzToolbar;
    pnl6: TPanel;
    dge2: TDBGridEh;
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinanceStat: TfrmFinanceStat;

implementation

uses untFCenterDM, DBGridEHImpExp;

{$R *.dfm}

//��������
procedure TfrmFinanceStat.FormCreate(Sender: TObject);
begin
  dmFCenter.qryDepotStat.Open;
end;

//�رմ���
procedure TfrmFinanceStat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dmFCenter.qryDepotStat.Close;
end;

//�˳�
procedure TfrmFinanceStat.btn1Click(Sender: TObject);
begin
  Close;
end;

//ˢ��
procedure TfrmFinanceStat.btn2Click(Sender: TObject);
begin
  dmFCenter.qryDepotStat.Refresh;
end;

//����EXCEL
procedure TfrmFinanceStat.N1Click(Sender: TObject);
var
  ExcelApp : Variant;
  i : Integer;
begin
//  if dlgSave.Execute then
//  begin
  try
    //SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,dge1,dlgSave.FileName,true);
    if dmFCenter.qryDepotStat.RecordCount > 0 then
    begin
      //����EXCEL����
      ExcelApp := CreateOleObject('Excel.Application');
      ExcelApp.Caption := 'ͳ����Ϣ';
      ExcelApp.WorkBooks.Add;
      ExcelApp.WorkSheets[1].Activate;
      ExcelApp.Cells[1,1].Value := '��ƷSKU';
      ExcelApp.Cells[1,2].Value := '��Ʒ����';
      ExcelApp.Cells[1,3].Value := 'Ʒ������';
      ExcelApp.Cells[1,4].Value := '��Ʒ����';
      ExcelApp.Cells[1,5].Value := '��Ʒ���';
      ExcelApp.Cells[1,6].Value := '��Ʒ��ɫ';
      ExcelApp.Cells[1,7].Value := '���ô��ߴ�';
      ExcelApp.Cells[1,8].Value := '��Ӧ������';
      ExcelApp.Cells[1,9].Value := '�����';
      ExcelApp.Cells[1,10].Value := '��λ��';
      ExcelApp.Cells[1,11].Value := '��ˮ��';
      ExcelApp.Cells[1,12].Value := '�ɹ���';
      ExcelApp.Cells[1,13].Value := '�������';
      ExcelApp.Cells[1,14].Value := '�ɹ������';
      ExcelApp.Cells[1,15].Value := '�ɹ���ͬ��';

      dmFCenter.qryDepotStat.DisableControls;
      for i := 0 to dmFCenter.qryDepotStat.RecordCount - 1 do
      begin
        ExcelApp.Cells[i+2,1].Value := dmFCenter.qryDepotStat.FieldByName('sku').AsString;
        ExcelApp.Cells[i+2,2].Value := dmFCenter.qryDepotStat.FieldByName('name').AsString;
        ExcelApp.Cells[i+2,3].Value := dmFCenter.qryDepotStat.FieldByName('brand_name').AsString;
        ExcelApp.Cells[i+2,4].Value := dmFCenter.qryDepotStat.FieldByName('ean').AsString;
        ExcelApp.Cells[i+2,5].Value := dmFCenter.qryDepotStat.FieldByName('spec').AsString;
        ExcelApp.Cells[i+2,6].Value := dmFCenter.qryDepotStat.FieldByName('color').AsString;
        ExcelApp.Cells[i+2,7].Value := dmFCenter.qryDepotStat.FieldByName('p_size').AsString;
        ExcelApp.Cells[i+2,8].Value := dmFCenter.qryDepotStat.FieldByName('s_name').AsString;
        ExcelApp.Cells[i+2,9].Value := '1';//dmFCenter.qryDepotStat.FieldByName('stock').AsInteger;
        ExcelApp.Cells[i+2,10].Value := dmFCenter.qryDepotStat.FieldByName('dp_dpnum').AsString;
        ExcelApp.Cells[i+2,11].Value := dmFCenter.qryDepotStat.FieldByName('sort_n').AsString;
        ExcelApp.Cells[i+2,12].Value := FloatToCurr(dmFCenter.qryDepotStat.FieldByName('product_price').AsFloat/100);
        ExcelApp.Cells[i+2,13].Value := dmFCenter.qryDepotStat.FieldByName('so_no').AsString;
        ExcelApp.Cells[i+2,14].Value := dmFCenter.qryDepotStat.FieldByName('sto_no').AsString;
        ExcelApp.Cells[i+2,15].Value := dmFCenter.qryDepotStat.FieldByName('supplier_contract').AsString;
        dmFCenter.qryDepotStat.Next;
      end;
      dmFCenter.qryDepotStat.EnableControls;

      ExcelApp.Visible := True;
    end else
      showMessage('�޼�¼��');
  except
    showMessage('����Excel����');
    Exit;
  end;
//  end;
end;

end.
