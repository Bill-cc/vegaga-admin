object frmPODManager: TfrmPODManager
  Left = 287
  Top = 143
  Width = 687
  Height = 586
  Caption = #35746#21333#37197#36135#25805#20316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 679
    Height = 49
    Align = alTop
    TabOrder = 0
    object RzGroupBox1: TRzGroupBox
      Left = 1
      Top = 1
      Width = 677
      Height = 47
      Align = alClient
      Caption = #37319#36141#21333#20449#24687
      TabOrder = 0
      object RzLabel1: TRzLabel
        Left = 16
        Top = 24
        Width = 72
        Height = 13
        Caption = #38144#21806#21333#32534#21495#65306
      end
      object RzLabel2: TRzLabel
        Left = 488
        Top = 24
        Width = 60
        Height = 13
        Caption = #24555#36882#21333#21495#65306
      end
      object RzLabel3: TRzLabel
        Left = 248
        Top = 24
        Width = 60
        Height = 13
        Caption = #24555#36882#20844#21496#65306
      end
      object RzDBEdit1: TRzDBEdit
        Left = 96
        Top = 20
        Width = 145
        Height = 21
        DataSource = dmDepotCenter.dsSOOutDepot
        DataField = 'so_sn'
        ReadOnly = True
        Color = clInfoBk
        TabOrder = 0
      end
      object RzDBEdit2: TRzDBEdit
        Left = 552
        Top = 20
        Width = 121
        Height = 21
        DataSource = dmDepotCenter.dsSOOutDepot
        DataField = 'ship_order_number'
        TabOrder = 1
        OnExit = RzDBEdit2Exit
      end
      object RzDBButtonEdit1: TRzDBButtonEdit
        Left = 312
        Top = 20
        Width = 169
        Height = 21
        DataSource = dmDepotCenter.dsSOOutDepot
        DataField = 'express_name'
        TabOrder = 2
        OnButtonClick = RzDBButtonEdit1ButtonClick
      end
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 49
    Width = 679
    Height = 463
    Align = alClient
    TabOrder = 1
    object RzSplitter: TRzSplitter
      Left = 1
      Top = 1
      Width = 677
      Height = 461
      Orientation = orVertical
      Position = 236
      Percent = 52
      SplitterStyle = ssBump
      SplitterWidth = 6
      Align = alClient
      TabOrder = 0
      BarSize = (
        0
        236
        677
        242)
      UpperLeftControls = (
        RzGroupBox2)
      LowerRightControls = (
        RzGroupBox3)
      object RzGroupBox2: TRzGroupBox
        Left = 0
        Top = 0
        Width = 677
        Height = 236
        Align = alClient
        Caption = #38144#21806#35746#21333#21830#21697
        TabOrder = 0
        object dgeStOPList: TDBGridEh
          Left = 1
          Top = 14
          Width = 675
          Height = 221
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dmDepotCenter.dsSOPOutDepot
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
          PopupMenu = pmStOPList
          RowDetailPanel.Color = clBtnFace
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              EditButtons = <>
              FieldName = 'so_item_id'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'so_id'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'so_no'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'sku_id'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'p_id'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'p_sku'
              Footers = <>
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'p_sn'
              Footers = <>
              Visible = False
              Width = 150
            end
            item
              EditButtons = <>
              FieldName = 'p_ean'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'pdt_name'
              Footers = <>
              Width = 240
            end
            item
              EditButtons = <>
              FieldName = 'p_number'
              Footers = <>
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'real_out_number'
              Footers = <>
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'p_cost_price'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'tax'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'sale_price'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'sale_amount'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'p_weight'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'source'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'sys_status'
              Footers = <>
              Visible = False
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object RzGroupBox3: TRzGroupBox
        Left = 0
        Top = 0
        Width = 677
        Height = 219
        Align = alClient
        Caption = #24050#20986#24211#21830#21697
        TabOrder = 0
        object dgeStOPOpt: TDBGridEh
          Left = 1
          Top = 14
          Width = 675
          Height = 204
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dmDepotCenter.dsSkuOutLog
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
          PopupMenu = pmSkuLog
          RowDetailPanel.Color = clBtnFace
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = dgeStOPOptDblClick
          Columns = <
            item
              EditButtons = <>
              FieldName = 'ID'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'is_sales'
              Footers = <>
              KeyList.Strings = (
                '301'
                '302')
              PickList.Strings = (
                #24050#20837#24211
                #24050#20986#24211)
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'sto_no'
              Footers = <>
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'so_no'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'lot_id'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'p_id'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'productName'
              Footers = <>
              Width = 150
            end
            item
              EditButtons = <>
              FieldName = 'p_sku'
              Footers = <>
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'sort_n'
              Footers = <>
              TextEditing = False
              Width = 80
            end
            item
              EditButtons = <>
              FieldName = 'wh_n'
              Footers = <>
              TextEditing = False
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'entrance_date'
              Footers = <>
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'exit_date'
              Footers = <>
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'opt_by'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'opt_date'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'opt_ip'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'remark'
              Footers = <>
              TextEditing = False
              Width = 180
            end
            item
              EditButtons = <>
              FieldName = 'sys_status'
              Footers = <>
              Width = 60
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 512
    Width = 679
    Height = 40
    Align = alBottom
    TabOrder = 2
    object pnl4: TPanel
      Left = 392
      Top = 1
      Width = 286
      Height = 38
      Align = alRight
      TabOrder = 0
      object btnExit: TRzBitBtn
        Left = 204
        Top = 8
        Caption = #20851#38381
        TabOrder = 0
        OnClick = btnExitClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000730B0000730B00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
          000000808000800000008000800080800000C0C0C00080808000191919004C4C
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
          E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
          57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
          578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
          57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
          57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
          57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
          57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
          57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
          57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
          57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
          57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
          57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
          57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
          57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
          57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object btnOk: TRzBitBtn
        Left = 114
        Top = 8
        Width = 89
        Caption = #37197#36135#23436#25104
        TabOrder = 1
        OnClick = btnOkClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000630B0000630B00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
          000000808000800000008000800080800000C0C0C00080808000191919004C4C
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8180C
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8E8E8E8E8E8181212
          0CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8E8E8E818121212
          120CE8E8E8E8E8E8E8E8E8E8E281818181DFE8E8E8E8E8E8E8E8E81812121212
          12120CE8E8E8E8E8E8E8E8E2818181818181DFE8E8E8E8E8E8E8E81812120C18
          1212120CE8E8E8E8E8E8E8E28181DFE2818181DFE8E8E8E8E8E8E818120CE8E8
          181212120CE8E8E8E8E8E8E281DFE8E8E2818181DFE8E8E8E8E8E8180CE8E8E8
          E8181212120CE8E8E8E8E8E2DFE8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8
          E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8
          E8E8E8181212120CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8
          E8E8E8E81812120CE8E8E8E8E8E8E8E8E8E8E8E8E28181DFE8E8E8E8E8E8E8E8
          E8E8E8E8E818120CE8E8E8E8E8E8E8E8E8E8E8E8E8E281DFE8E8E8E8E8E8E8E8
          E8E8E8E8E8E8180CE8E8E8E8E8E8E8E8E8E8E8E8E8E8E2DFE8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object btnPrint: TRzBitBtn
        Left = 8
        Top = 8
        Width = 105
        Caption = #20986#24211#21333#25171#21360
        TabOrder = 2
        OnClick = btnPrintClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000730E0000730E00000001000000000000000000003300
          00006600000099000000CC000000FF0000000033000033330000663300009933
          0000CC330000FF33000000660000336600006666000099660000CC660000FF66
          000000990000339900006699000099990000CC990000FF99000000CC000033CC
          000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
          0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
          330000333300333333006633330099333300CC333300FF333300006633003366
          33006666330099663300CC663300FF6633000099330033993300669933009999
          3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
          330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
          66006600660099006600CC006600FF0066000033660033336600663366009933
          6600CC336600FF33660000666600336666006666660099666600CC666600FF66
          660000996600339966006699660099996600CC996600FF99660000CC660033CC
          660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
          6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
          990000339900333399006633990099339900CC339900FF339900006699003366
          99006666990099669900CC669900FF6699000099990033999900669999009999
          9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
          990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
          CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
          CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
          CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
          CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
          CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
          FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
          FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
          FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
          FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
          000000808000800000008000800080800000C0C0C00080808000191919004C4C
          4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
          6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
          09090909090909E8E8E8E8E88181818181818181818181E8E8E8E85E89898989
          89898989895E5E09E8E8E8E2ACACACACACACACACACE2E281E8E85E5E5E5E5E5E
          5E5E5E5E5E5E095E09E8E2E2E2E2E2E2E2E2E2E2E2E281E281E85ED789898989
          8989898989895E0909E8E2E8ACACACACACACACACACACE28181E85ED789898989
          181289B490895E5E09E8E2E8ACACACACE281ACE281ACE2E281E85ED7D7D7D7D7
          D7D7D7D7D7D75E5E5E09E2E8E8E8E8E8E8E8E8E8E8E8E2E2E2815ED789898989
          8989898989895E5E5E09E2E8ACACACACACACACACACACE2E2E281E85E5E5E5E5E
          5E5E5E5E5E89895E5E09E8E2E2E2E2E2E2E2E2E2E2ACACE2E281E8E85ED7D7D7
          D7D7D7D7D75E89895E09E8E8E2E8E8E8E8E8E8E8E8E2ACACE281E8E8E85ED7E3
          E3E3E3E3D75E5E5E09E8E8E8E8E2E8ACACACACACE8E2E2E281E8E8E8E85ED7D7
          D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85ED7
          E3E3E3E3E3D75EE8E8E8E8E8E8E8E2E8ACACACACACE8E2E8E8E8E8E8E8E85ED7
          D7D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85E
          5E5E5E5E5E5E5E5EE8E8E8E8E8E8E8E2E2E2E2E2E2E2E2E2E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
    end
    object pnl5: TPanel
      Left = 1
      Top = 1
      Width = 391
      Height = 38
      Align = alClient
      TabOrder = 1
    end
  end
  object pmStOPList: TPopupMenu
    Left = 569
    Top = 130
    object N1: TMenuItem
      Caption = #20986#24211
      OnClick = N1Click
    end
    object N3: TMenuItem
      Caption = #28165#31354#25152#36873
      Visible = False
      OnClick = N3Click
    end
  end
  object pmSkuLog: TPopupMenu
    Left = 561
    Top = 372
    object N5: TMenuItem
      Caption = #25764#38144
      OnClick = N5Click
    end
  end
end
