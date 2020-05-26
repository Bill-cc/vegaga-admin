unit untCommonUtil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Uni, RzTreeVw, ComCtrls, DBGridEh;

type
  TArrayString = array of string;

  TFrameClass = class of TFrame;

  TCurrentUser = record
    Id   : Integer;
    Name : string;
    RealName : string;
    Email : string;
    Status : Integer;
    CreateDate : string;
    CreateBy : string;
    LastLoginDate : string;
    SysStatus : Integer;
    RoleList : TStringList;
    server : string;
  end;

  //��ʾ���ĵ�����
  function ShowMDIForm(aFormClass: TFormClass): TForm;

  //��ʾģʽ����
  procedure ShowModalForm(aFormClass: TFormClass);

  //��ʾ��ܴ���
  function ShowFrame(refFrame: TFrame;aFrame: TFrameClass;aPanel: TPanel): TFrame;

  //����
  procedure FieldSort(qry: TUniQuery;Column: TColumnEh);

  //��ȡ����
  function getEncode(field : string): Integer;

  //���۶������
  function getSOrderEncode(): string;

  //�˻��������
  function getROrderEncode(): string;

  //�ɹ���������
  function getStockEncode(): string;

  //��ⵥ����
  function getDepotEncode(): string;

  //���͵�����
  function getSendEncode(): string;

  //��Ʒ����
  function getProductEncode(): string;

  //Ŀ¼����
  function getCatalogEncode(): string;

  //SKU����
  function getSKUEncode(): string;

  //��Ӧ�̱���
  function getSupplierEncode(): string;

  //��Ա����
  function getMemberEncode(): string;

  //Ʒ�Ʊ���
  function getBrandEncode(): string;

  //��ݹ�˾���
  function getExpressEncode(): string;

  //�ⷿ����
  function getStoreroomEncode(): string;

  //�޸Ķ���״̬
  procedure UpdateOrderState(qry: TUniQuery;field: string;state: Integer);

  //���۶���״̬�޸���ˮ
  procedure SetOrderState(oid,bfState,afState: Integer);

  //�˻�����״̬�޸���ˮ
  procedure SetSBOrderState(sboid,bfState,afState: Integer);

  //�ɹ�����״̬�޸���ˮ
  procedure SetStkOrderState(stoNo: string;bfState,afState: Integer);

  //��Ʒ������־
  procedure SetProductOptLog(pid,bfState,afState: Integer;content: string);

  //���ÿ����Ʒ��������
  procedure SetSkuFreeze(pid,pnum: Integer;psku: string);

  //�˻�����ȡ���������յ���Ʒ���
  function RCROProductInDepot(sono,psku,sortno: string): Boolean;

  //�����ַ���������ַ���
  function SplitString(const Source,ch:string): TStringList;

  //�ж���ˮ���Ƿ��ظ�
  function SnIsUniquely(sn: string): Boolean;

  //����
  function Encrypt(source: string): string;

  //����
  function Decipher(cryptograph: string): string;

//  procedure updateStockNum;

  //����Ŀ¼������
//  procedure InitTreeView(tree:TRzTreeView;var codeStr: TArrayString;
//                         treeQuery: TUniQuery;tableName,ParentField,BNodeName:string);
//
  //����Ŀ¼
//  procedure CreateTreeView(tree:TRzTreeView;parNode: TTreeNode;level,recCount: Integer;
//                           tableName,ParentField:string;var codeStr: TArrayString;);
//
  //�����ӽڵ�
//  procedure FindTreeChildNode(query: TUniQuery;tableName,ParentField: string;
//                              Level: Integer);

var
  CurrentUser: TCurrentUser;

//����
resourcestring
  //ϵͳ״̬
  SYS_EFFECTIVE='1'; //��Ч
  SYS_INVALID='2';   //��Ч
  SYS_DELETE='3';    //ɾ��
  SYS_ARCHIVE='4';   //�鵵

  //��Ա״̬
  MS_NORMAL='101'; //����
  MS_DELETE='102'; //ɾ��
  MS_FREEZE='103'; //����

  //��Ʒ״̬
  PS_RELEASE='201'; //����
  PS_SHELFUP='202';  //�ϼ�
  PS_SHELFDOWN='203'; //�¼�

  //��Ʒ�޸�״̬���ɹ������ۣ�
  P_STATE_NEW='1'; //����
  P_STATE_DELETE='2'; //ɾ��

  //��Ʒ�˻�״̬
  P_RSTATE_RETURNING='10'; //δ���
  P_RSTATE_RETURNED='11'; //�����

  //��Ʒ�����״̬��sku��ˮ��־��
  P_DEPOTSTATE_IN='301'; //�����
  P_DEPOTSTATE_OUT='302'; //�ѳ���
  P_DEPOTSTATE_DESTINE='303'; //��Ԥ��

  //�ɹ�����״̬
  STO_DRAFT='0';  //�ݸ�
  STO_CREATE='1';  //�µ�
  STO_EXCEPTION='2'; //�쳣��
  STO_WAREHOUSING='3'; //�����
  STO_COMPLETED='4'; //�Ѷ���
  STO_AMEND='5'; //�Ѹ���

  //���۶�������
  SO_TYPE_NORMAL='1';  //������
  SO_TYPE_RETURN='2';  //�˻���

  //���۶���������ת״̬
  SO_PAYMENT_WAIT='1'; //������
  SO_NEWORDER='2'; //�µ�
  SO_ASSESSED='3'; //�����
  SO_DISPATCHED='4';  //�����
  SO_SHIPMENTSED='5'; //�ѷ���
  SO_RECEVIED='6'; //���ջ�
  SO_REJECT='7'; //����
  SO_RETURN='8'; //�˻���
  SO_CANCEL='9'; //ȡ��
  SO_WAITCASH='10'; //���ջ����ؿ�
  SO_CASHED='11'; //���ջ��ѻؿ�
  SO_RETURN_OK='12'; //�˻����

  //���۶����˻���״̬
  SO_RETURN_NEW='1';      //���˻���
  SO_RETURN_ASSESSED='2'; //�����
  SO_RETURN_WAREHOUSING='3'; //�����
  SO_RETURN_BACKCASH='4';  //���˿�
  SO_RETURN_FINISH='5'; //�����
implementation

uses untCommonDm;

//��ʾ���ĵ�����
function showMDIForm(aFormClass: TFormClass): TForm;
begin
  screen.Cursor := crHourGlass;
  //lockwindowupdate(frmMain.handle);
  result := aFormClass.Create(Application);
  with result do
  begin
    //WindowState := wsMaximized;
    show;
    //lockwindowupdate(0);
    screen.Cursor := crDefault;        
  end;
end;

//��ʾģʽ����
procedure ShowModalForm(aFormClass: TFormClass);
begin
  screen.Cursor := crHourGlass;
  with aFormClass.Create(Application) do
  begin
    screen.Cursor := crDefault;
    try
      showModal;
    finally
      Free;
    end;
  end;
end;

//��ʾ��ܴ���
function ShowFrame(refFrame: TFrame;aFrame: TFrameClass;aPanel: TPanel): TFrame;
begin
  if Assigned(refFrame) then
  begin
    refFrame.Parent := nil;
    FreeAndNil(refFrame);
  end;
  Result := aFrame.Create(Application);
  with Result do
  begin
    Parent := aPanel;
    Align := alClient;
    Show;
  end;
end;

//��ȡ����
function getEncode(field : string): Integer;
var
  code : Integer;
begin
  //��ȡ���
  frmCommonDm.qryGetEncode.Open;
  frmCommonDm.qryGetEncode.Lock;
  code := frmCommonDm.qryGetEncode.FieldByName(field).AsInteger;
  //���±��
  frmCommonDm.qryGetEncode.Edit;
  frmCommonDm.qryGetEncode.FieldByName(field).AsInteger := code+1;
  frmCommonDm.qryGetEncode.Post;
  frmCommonDm.qryGetEncode.UnLock;
  frmCommonDm.qryGetEncode.Close;
  Result := code;
end;  

//���۶������
function getSOrderEncode(): string;
begin
  //��ȡ���
  Result := IntToStr(getEncode('SOrderEncode'));
end;

//�˻��������
function getROrderEncode(): string;
begin
  //��ȡ���
  Result := IntToStr(getEncode('ROrderEncode'));
end;

//�ɹ���������
function getStockEncode(): string;
begin
  //��ȡ���
  Result := IntToStr(getEncode('StockEncode'));
end;

//��ⵥ����
function getDepotEncode(): string;
begin
  //��ȡ���
  Result := IntToStr(getEncode('DepotEncode'));
end;

//���͵�����
function getSendEncode(): string;
begin
  //��ȡ���
  Result := IntToStr(getEncode('SendEncode'));
end;

//��Ʒ����
function getProductEncode(): string;
begin
  //��ȡ���
  Result := IntToStr(getEncode('ProductEncode'));
end;  

//Ŀ¼����
function getCatalogEncode(): string;
begin
  //��ȡ���
  Result := IntToStr(getEncode('CatalogEncode'));
end;  

//SKU����
function getSKUEncode(): string;
begin
  //��ȡ���
  Result := IntToStr(getEncode('SKUEncode'));
end;  

//��Ӧ�̱���
function getSupplierEncode(): string;
begin
  //��ȡ���
  Result := IntToStr(getEncode('SupplierEncode'));
end;  

//��Ա����
function getMemberEncode(): string;
begin
  //��ȡ���
  Result := IntToStr(getEncode('MemberEncode'));
end;

//Ʒ�Ʊ���
function getBrandEncode(): string;
begin
  //��ȡ����
  Result := IntToStr(getEncode('BrandEncode'));
end;

//��ݹ�˾���
function getExpressEncode(): string;
begin
  //��ȡ����
  Result := IntToStr(getEncode('ExpressEncode'));
end;

//�ⷿ����
function getStoreroomEncode(): string;
begin
  //��ȡ����
  Result := IntToStr(getEncode('StoreroomEncode'));
end;

//�޸Ķ���״̬
procedure UpdateOrderState(qry: TUniQuery;field: string;state: Integer);
var
  flag : Boolean;
begin
  if qry.Active then
  begin
    flag := qry.ReadOnly;
    qry.ReadOnly := False;
    qry.Edit;
    qry.FieldByName(field).AsInteger := state;
    qry.Post;
    qry.ReadOnly := flag;
  end;
end;

//���۶���״̬�޸�
procedure SetOrderState(oid,bfState,afState: Integer);
begin
  with frmCommonDm.qryUpateOrderState do
  begin
    Open;
    Append;
    FieldByName('so_id').AsInteger := oid;
    FieldByName('opt_by').AsInteger := CurrentUser.Id;
    FieldByName('so_b_status').AsInteger := bfState;
    FieldByName('so_a_status').AsInteger := afState;
    FieldByName('opt_date').AsDateTime := Date;
    FieldByName('remark').AsString := '��̨����';
    FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
    Post;
    Close;
  end;
end;

//�˻�����״̬�޸���ˮ
procedure SetSBOrderState(sboid,bfState,afState: Integer);
begin
  with frmCommonDm.qryUpdateSBOState do
  begin
    Open;
    Append;
    FieldByName('rso_id').AsInteger := sboid;
    FieldByName('opt_by').AsInteger := CurrentUser.Id;
    FieldByName('opt_date').AsDateTime := Date+Time;
    FieldByName('bf_state').AsInteger := bfState;
    FieldByName('af_state').AsInteger := afState;
    FieldByName('sys_state').AsInteger := StrToInt(SYS_EFFECTIVE);
    Post;
    Close;
  end;
end;

//�ɹ�����״̬�޸�
procedure SetStkOrderState(stoNo: string;bfState,afState: Integer);
begin
  with frmCommonDm.qryUpdateStkOrderState do
  begin
    Open;
    Append;
    FieldByName('stkorder_no').AsString := stoNo;
    FieldByName('modificationby').AsInteger := CurrentUser.Id;
    FieldByName('modification_date').AsDateTime := Date+Time;
    FieldByName('opt_before').AsInteger := bfState;
    FieldByName('opt_after').AsInteger := afState;
    FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
    Post;
    Close;
  end;
end;

//��Ʒ������־
procedure SetProductOptLog(pid,bfState,afState: Integer;content: string);
begin
  with frmCommonDm.qryProductOptLog do
  begin
    Open;
    Append;
    FieldByName('p_id').AsInteger := pid;
    FieldByName('b_p_status').AsInteger := bfState;
    FieldByName('a_p_status').AsInteger := afState;
    FieldByName('opt_desc').AsString := content;
    FieldByName('opt_by').AsString := CurrentUser.RealName;
    FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
    Post;
    Close;
  end;
end;

//���ÿ����Ʒ��������
procedure SetSkuFreeze(pid,pnum: Integer;psku: string);
var
  skuQry : TUniQuery;
  num,fnum : Integer;
begin
  skuQry := TUniQuery.Create(nil);
  skuQry.Connection := frmCommonDm.Connection;

  with skuQry do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select sku_id,sn,p_id,stock,can_sale_stock,freeze_stock '
                  +'from t_p_sku_vegaga where sn=:psku'); //and p_id=:pid
    ParamByName('psku').AsString := psku;
    //ParamByName('pid').AsInteger := pid;
    Open;

    if RecordCount > 0 then
    begin
      num := FieldByName('stock').AsInteger;
      fnum := FieldByName('freeze_stock').AsInteger + pnum;
      Edit;
      FieldByName('can_sale_stock').AsInteger := num - fnum;
      FieldByName('freeze_stock').AsInteger := fnum;
      Post;
    end;
  end;

  FreeAndNil(skuQry);
end;

//����
procedure FieldSort(qry: TUniQuery;Column: TColumnEh);
var
  sortstring : string;
begin
  with Column do
  begin
   if FieldName = '' then Exit;
   case Title.SortMarker of
     smNoneEh: sortstring := Column.FieldName + ' ASC';
     smDownEh: sortstring := Column.FieldName + ' ASC';
     smUpEh: sortstring := Column.FieldName + ' DESC';
   end;
  end;
  qry.IndexFieldNames := sortstring;
end;

//�˻�����ȡ���������յ���Ʒ���
function RCROProductInDepot(sono,psku,sortno: string): Boolean;
var
  depotQry : TUniQuery;
  i : Integer;
begin
  Result := False;
  depotQry := TUniQuery.Create(nil);
  depotQry.Connection := frmCommonDm.Connection;

  if sortno <> '' then
  begin
    depotQry.Close;
    depotQry.SQL.Clear;
    depotQry.SQL.Add('select * from t_p_sku_log_vegaga');
    depotQry.AddWhere('so_no=:sono and p_sku=:psku and sort_n=:sortno');
    depotQry.ParamByName('sono').AsString := sono;
    depotQry.ParamByName('psku').AsString := psku;
    depotQry.ParamByName('sortno').AsString := sortno;
    depotQry.Open;

    if depotQry.RecordCount > 0 then
    begin
      depotQry.Edit;
      depotQry.FieldByName('so_no').AsString := '';
      depotQry.FieldByName('is_sales').AsInteger := StrToInt(P_DEPOTSTATE_IN);
      depotQry.Post;
      Result := True;
    end;

    depotQry.Close;
  end else
  begin
    depotQry.Close;
    depotQry.SQL.Clear;
    depotQry.SQL.Add('select * from t_p_sku_log_vegaga');
    depotQry.AddWhere('so_no=:sono and p_sku=:psku');
    depotQry.ParamByName('sono').AsString := sono;
    depotQry.ParamByName('psku').AsString := psku;
    depotQry.Open;

    for i := 0 to depotQry.RecordCount - 1 do
    begin
      depotQry.Edit;
      depotQry.FieldByName('so_no').AsString := '';
      depotQry.FieldByName('is_sales').AsInteger := StrToInt(P_DEPOTSTATE_IN);
      depotQry.Post;
      depotQry.Next;
      Result := True;
    end;
    depotQry.Close;
  end;
  FreeAndNil(depotQry);
end;

//�ж���ˮ���Ƿ�Ψһ
function SnIsUniquely(sn: string): Boolean;
var
  qry : TUniQuery;
begin
  Result := True;
  qry := TUniQuery.Create(nil);
  qry.Connection := frmCommonDm.Connection;

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select p_sku from t_p_sku_log_vegaga where sort_n=:sn');
  qry.ParamByName('sn').AsString := sn;
  qry.Open;

  if qry.RecordCount > 0 then Result := False;

  qry.Close;
  FreeAndNil(qry);
end;

//�����ַ���������ַ���
function SplitString(const Source,ch:string): TStringList;
var
  temp:String;
  i:Integer;
begin
  Result:=TStringList.Create;
  //����ǿ��Է����򷵻ؿ��б�
  if Source='' then exit;
  temp:=Source;
  i:=pos(ch,Source);
  while i <> 0 do
  begin
    Result.add(copy(temp,0,i-1));
    Delete(temp,1,i);
    i:=pos(ch,temp);
  end;
  Result.add(temp);
end;

//����
function Encrypt(source: string): string;
var
  strm,cstr,max,min,maxMin,ReturnStr : string;
  x,t,i,itemp : Integer;
begin
  strm := source;
  ReturnStr := '';
  max := '0'; //0
  min := '9'; //9
  i := 1;

  while i <= Length(strm) do
  begin
    maxMin := Copy(strm,i,1);
    if maxMin > max then
      max := maxMin;
    if maxMin < min then
      min := maxMin;
    i := i + 1;
  end;
  t := (Ord(max[1]) - Ord(min[1])) mod 10;

  i := 1;
  while i <= Length(strm) do
  begin
    cstr := Copy(strm,i,1);
    itemp := Ord(cstr[1]);
    x := (i mod 4) * 5 + (t mod i) - 1;
    itemp := itemp + x;
    ReturnStr := ReturnStr + chr(itemp);
    i := i + 1;
  end;

  Result := IntToStr(t)+ReturnStr;
end;

//����
function Decipher(cryptograph: string): string;
var
  i,j,t,len,x,itemp : Integer;
  estr,mstr,cstr,ReturnStr : string;
begin
  ReturnStr := '';
  estr := cryptograph;
  len := Length(estr) - 1;
  mstr := Copy(estr,2,len);
  t := StrToInt(Copy(estr,1,1));
  i := len;
  j := 1;

  while j <= i do
  begin
    cstr := Copy(mstr,j,1);
    itemp := Ord(cstr[1]);
    x := (j mod 4) * 5 + (t mod j) - 1;
    itemp := itemp - x;
    ReturnStr := ReturnStr + chr(itemp);
    j := j + 1;
  end;
  Result := ReturnStr;
end;

//����Ŀ¼������
//procedure InitTreeView(tree:TRzTreeView;var codeStr: TArrayString;
//                       treeQuery: TUniQuery;tableName,ParentField,BNodeName:string);
//var
//  parNode : TTreeNode;
//begin
//  SetLength(codeStr,treeQuery.RecordCount);
//  tree.Items.Clear;
//  parNode := tree.Items.AddFirst(nil,BNodeName);
//  parNode.SelectedIndex := 0;
//  CreateTreeView(tree,parNode,0,0,tableName,ParentField,codeStr);
//  tree.AutoExpand := True;
//end;

//����Ŀ¼
//procedure CreateTreeView(tree:TRzTreeView;parNode: TTreeNode;level,recCount: Integer;
//                         tableName,ParentField:string;var codeStr: TArrayString;);
//var
//  node : TTreeNode;
//  parQuery: TUniQuery;
//  i : Integer;
//  pStr : ^string;
//begin
//  parQuery := TUniQuery.Create(nil);
//  parQuery.Connection := frmCommonDm.Connection;
//  FindTreeChildNode(parQuery,tableName,ParentField,level);
//  if parQuery.RecordCount > 0 then
//  begin
//    for i := 1 to parQuery.RecordCount do
//    begin
//      if i = 1 then
//      begin
//        node := tree.Items.AddChildFirst(
//          parNode,parQuery.FieldByName('name').AsString);
//      end else
//      begin
//        node := tree.Items.AddChild(
//          parNode,parQuery.FieldByName('name').AsString);
//      end;
//      node.SelectedIndex := parQuery.FieldByName('bcat_id').AsInteger;
//      codeStr[CodeDataCount] := parQuery.FieldByName('code').AsString;
//      pStr := @CodeData[CodeDataCount];
//      node.Data := pStr;
//      Inc(CodeDataCount);
//      CreateCatalogTree(node,node.SelectedIndex,CodeDataCount);
//      parQuery.Next;
//    end;
//    parNode.Expanded := True;
//  end;
//  parQuery.Close;
//end;

//�����ӽڵ�
//procedure FindTreeChildNode(query: TUniQuery;tableName,ParentField: string;
//                            Level: Integer);
//begin
//  query.Close;
//  query.SQL.Clear;
//  query.SQL.Add('select * from '+tableName);
//  query.AddWhere(ParentField+'=:parent');
//  query.ParamByName('parent').AsInteger := Level;
//  query.Open;
//end;

//procedure updateStockNum;
//var
//  qry : TUniQuery;
//  delQry,inQry : TUniSQL;
//  i : Integer;
//begin
//  qry := TUniQuery.Create(nil);
//  inQry := TUniSQL.Create(nil);
//  delQry := TUniSQL.Create(nil);
//  qry.Connection := frmCommonDm.Connection;
//  inQry.Connection := frmCommonDm.Connection;
//  delQry.Connection := frmCommonDm.Connection;
//
//  qry.Close;
//  qry.SQL.Clear;
//  qry.SQL.Add('SELECT sn,p_id,SUM(stock) as pnum FROM t_p_sku_vegaga a1 where sn in (SELECT sn from t_p_sku_vegaga a2 where a1.sn=a2.sn and a1.sku_id!=a2.sku_id) GROUP BY sn');
//  qry.Open;
//
//  inQry.SQL.Clear;
//  inQry.SQL.Add('insert into t_p_sku_vegaga (sn,p_id,stock,can_sale_stock,freeze_stock,sys_status) values (:sku,:pid,:sk,:csk,:fsk,:ss)');
//
//  delQry.SQL.Clear;
//  delQry.SQL.Add('delete from t_p_sku_vegaga where sn=:sku');
//
//  for i := 0 to qry.RecordCount - 1 do
//  begin
//    delQry.ParamByName('sku').AsString := qry.FieldByName('sn').AsString;
//    delQry.Execute;
//
//    inQry.ParamByName('sku').AsString := qry.FieldByName('sn').AsString;
//    inQry.ParamByName('pid').AsInteger := qry.FieldByName('p_id').AsInteger;
//    inQry.ParamByName('sk').AsInteger := qry.FieldByName('pnum').AsInteger;
//    inQry.ParamByName('csk').AsInteger := qry.FieldByName('pnum').AsInteger;
//    inQry.ParamByName('fsk').AsInteger := 0;
//    inQry.ParamByName('ss').AsInteger := 1;
//    inQry.Execute;
//    
//    qry.Next;
//  end;
//
//  qry.Close;
//  FreeAndNil(qry);
//  FreeAndNil(inQry);
//  FreeAndNil(delQry);
//end;

end.
