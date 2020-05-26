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

  //显示多文档窗口
  function ShowMDIForm(aFormClass: TFormClass): TForm;

  //显示模式窗口
  procedure ShowModalForm(aFormClass: TFormClass);

  //显示框架窗体
  function ShowFrame(refFrame: TFrame;aFrame: TFrameClass;aPanel: TPanel): TFrame;

  //排序
  procedure FieldSort(qry: TUniQuery;Column: TColumnEh);

  //获取编码
  function getEncode(field : string): Integer;

  //销售订单编号
  function getSOrderEncode(): string;

  //退货订单编号
  function getROrderEncode(): string;

  //采购订单编码
  function getStockEncode(): string;

  //入库单编码
  function getDepotEncode(): string;

  //配送单编码
  function getSendEncode(): string;

  //商品编码
  function getProductEncode(): string;

  //目录编码
  function getCatalogEncode(): string;

  //SKU编码
  function getSKUEncode(): string;

  //供应商编码
  function getSupplierEncode(): string;

  //会员编码
  function getMemberEncode(): string;

  //品牌编码
  function getBrandEncode(): string;

  //快递公司编号
  function getExpressEncode(): string;

  //库房编码
  function getStoreroomEncode(): string;

  //修改订单状态
  procedure UpdateOrderState(qry: TUniQuery;field: string;state: Integer);

  //销售订单状态修改流水
  procedure SetOrderState(oid,bfState,afState: Integer);

  //退货订单状态修改流水
  procedure SetSBOrderState(sboid,bfState,afState: Integer);

  //采购订单状态修改流水
  procedure SetStkOrderState(stoNo: string;bfState,afState: Integer);

  //商品操作日志
  procedure SetProductOptLog(pid,bfState,afState: Integer;content: string);

  //设置库存商品冻结数量
  procedure SetSkuFreeze(pid,pnum: Integer;psku: string);

  //退货单、取消单、拒收单商品入库
  function RCROProductInDepot(sono,psku,sortno: string): Boolean;

  //根据字符串，拆分字符串
  function SplitString(const Source,ch:string): TStringList;

  //判断流水号是否重复
  function SnIsUniquely(sn: string): Boolean;

  //加密
  function Encrypt(source: string): string;

  //解密
  function Decipher(cryptograph: string): string;

//  procedure updateStockNum;

  //创建目录树方法
//  procedure InitTreeView(tree:TRzTreeView;var codeStr: TArrayString;
//                         treeQuery: TUniQuery;tableName,ParentField,BNodeName:string);
//
  //创建目录
//  procedure CreateTreeView(tree:TRzTreeView;parNode: TTreeNode;level,recCount: Integer;
//                           tableName,ParentField:string;var codeStr: TArrayString;);
//
  //查找子节点
//  procedure FindTreeChildNode(query: TUniQuery;tableName,ParentField: string;
//                              Level: Integer);

var
  CurrentUser: TCurrentUser;

//常量
resourcestring
  //系统状态
  SYS_EFFECTIVE='1'; //有效
  SYS_INVALID='2';   //无效
  SYS_DELETE='3';    //删除
  SYS_ARCHIVE='4';   //归档

  //会员状态
  MS_NORMAL='101'; //正常
  MS_DELETE='102'; //删除
  MS_FREEZE='103'; //冻结

  //商品状态
  PS_RELEASE='201'; //发布
  PS_SHELFUP='202';  //上架
  PS_SHELFDOWN='203'; //下架

  //商品修改状态（采购，销售）
  P_STATE_NEW='1'; //新增
  P_STATE_DELETE='2'; //删除

  //商品退货状态
  P_RSTATE_RETURNING='10'; //未入库
  P_RSTATE_RETURNED='11'; //已入库

  //商品出入库状态（sku流水日志）
  P_DEPOTSTATE_IN='301'; //已入库
  P_DEPOTSTATE_OUT='302'; //已出库
  P_DEPOTSTATE_DESTINE='303'; //已预订

  //采购订单状态
  STO_DRAFT='0';  //草稿
  STO_CREATE='1';  //新单
  STO_EXCEPTION='2'; //异常单
  STO_WAREHOUSING='3'; //已入库
  STO_COMPLETED='4'; //已定价
  STO_AMEND='5'; //已更正

  //销售订单类型
  SO_TYPE_NORMAL='1';  //正常单
  SO_TYPE_RETURN='2';  //退货单

  //销售订单正常流转状态
  SO_PAYMENT_WAIT='1'; //待付款
  SO_NEWORDER='2'; //新单
  SO_ASSESSED='3'; //已审核
  SO_DISPATCHED='4';  //已配货
  SO_SHIPMENTSED='5'; //已发货
  SO_RECEVIED='6'; //已收货
  SO_REJECT='7'; //拒收
  SO_RETURN='8'; //退货中
  SO_CANCEL='9'; //取消
  SO_WAITCASH='10'; //已收货待回款
  SO_CASHED='11'; //已收货已回款
  SO_RETURN_OK='12'; //退货完成

  //销售订单退货单状态
  SO_RETURN_NEW='1';      //新退货单
  SO_RETURN_ASSESSED='2'; //已审核
  SO_RETURN_WAREHOUSING='3'; //已入库
  SO_RETURN_BACKCASH='4';  //已退款
  SO_RETURN_FINISH='5'; //已完成
implementation

uses untCommonDm;

//显示多文档窗口
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

//显示模式窗口
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

//显示框架窗体
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

//获取编码
function getEncode(field : string): Integer;
var
  code : Integer;
begin
  //获取编号
  frmCommonDm.qryGetEncode.Open;
  frmCommonDm.qryGetEncode.Lock;
  code := frmCommonDm.qryGetEncode.FieldByName(field).AsInteger;
  //更新编号
  frmCommonDm.qryGetEncode.Edit;
  frmCommonDm.qryGetEncode.FieldByName(field).AsInteger := code+1;
  frmCommonDm.qryGetEncode.Post;
  frmCommonDm.qryGetEncode.UnLock;
  frmCommonDm.qryGetEncode.Close;
  Result := code;
end;  

//销售订单编号
function getSOrderEncode(): string;
begin
  //获取编号
  Result := IntToStr(getEncode('SOrderEncode'));
end;

//退货订单编号
function getROrderEncode(): string;
begin
  //获取编号
  Result := IntToStr(getEncode('ROrderEncode'));
end;

//采购订单编码
function getStockEncode(): string;
begin
  //获取编号
  Result := IntToStr(getEncode('StockEncode'));
end;

//入库单编码
function getDepotEncode(): string;
begin
  //获取编号
  Result := IntToStr(getEncode('DepotEncode'));
end;

//配送单编码
function getSendEncode(): string;
begin
  //获取编号
  Result := IntToStr(getEncode('SendEncode'));
end;

//商品编码
function getProductEncode(): string;
begin
  //获取编号
  Result := IntToStr(getEncode('ProductEncode'));
end;  

//目录编码
function getCatalogEncode(): string;
begin
  //获取编号
  Result := IntToStr(getEncode('CatalogEncode'));
end;  

//SKU编码
function getSKUEncode(): string;
begin
  //获取编号
  Result := IntToStr(getEncode('SKUEncode'));
end;  

//供应商编码
function getSupplierEncode(): string;
begin
  //获取编号
  Result := IntToStr(getEncode('SupplierEncode'));
end;  

//会员编码
function getMemberEncode(): string;
begin
  //获取编号
  Result := IntToStr(getEncode('MemberEncode'));
end;

//品牌编码
function getBrandEncode(): string;
begin
  //获取编码
  Result := IntToStr(getEncode('BrandEncode'));
end;

//快递公司编号
function getExpressEncode(): string;
begin
  //获取编码
  Result := IntToStr(getEncode('ExpressEncode'));
end;

//库房编码
function getStoreroomEncode(): string;
begin
  //获取编码
  Result := IntToStr(getEncode('StoreroomEncode'));
end;

//修改订单状态
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

//销售订单状态修改
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
    FieldByName('remark').AsString := '后台操作';
    FieldByName('sys_status').AsInteger := StrToInt(SYS_EFFECTIVE);
    Post;
    Close;
  end;
end;

//退货订单状态修改流水
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

//采购订单状态修改
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

//商品操作日志
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

//设置库存商品冻结数量
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

//排序
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

//退货单、取消单、拒收单商品入库
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

//判断流水号是否唯一
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

//根据字符串，拆分字符串
function SplitString(const Source,ch:string): TStringList;
var
  temp:String;
  i:Integer;
begin
  Result:=TStringList.Create;
  //如果是空自符串则返回空列表
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

//加密
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

//解密
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

//创建目录树方法
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

//创建目录
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

//查找子节点
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
