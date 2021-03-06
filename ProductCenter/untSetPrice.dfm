object frmSetPrice: TfrmSetPrice
  Left = 266
  Top = 143
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #35774#32622#21830#21697#20215#38065
  ClientHeight = 369
  ClientWidth = 798
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 798
    Height = 113
    Align = alTop
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 16
      Top = 16
      Width = 60
      Height = 13
      Caption = #21830#21697#21517#31216#65306
    end
    object RzLabel2: TRzLabel
      Left = 248
      Top = 16
      Width = 58
      Height = 13
      Caption = #21830#21697'SKU'#65306
    end
    object RzLabel3: TRzLabel
      Left = 184
      Top = 64
      Width = 63
      Height = 13
      Caption = #24403#21069'VG'#20215#65306
    end
    object RzLabel4: TRzLabel
      Left = 184
      Top = 88
      Width = 63
      Height = 13
      Caption = #35774#32622'VG'#20215#65306
    end
    object RzLabel5: TRzLabel
      Left = 392
      Top = 38
      Width = 60
      Height = 13
      Caption = #38144#21806#38480#20215#65306
    end
    object RzLabel6: TRzLabel
      Left = 656
      Top = 38
      Width = 60
      Height = 13
      Caption = #37319#36141#21333#20215#65306
    end
    object RzLabel7: TRzLabel
      Left = 16
      Top = 64
      Width = 72
      Height = 13
      Caption = #24403#21069#24066#22330#20215#65306
    end
    object RzLabel8: TRzLabel
      Left = 16
      Top = 88
      Width = 72
      Height = 13
      Caption = #35774#32622#24066#22330#20215#65306
    end
    object RzLabel9: TRzLabel
      Left = 336
      Top = 64
      Width = 72
      Height = 13
      Caption = #24403#21069#38480#21806#20215#65306
    end
    object RzLabel10: TRzLabel
      Left = 336
      Top = 88
      Width = 72
      Height = 13
      Caption = #35774#32622#38480#21806#20215#65306
    end
    object RzLabel11: TRzLabel
      Left = 504
      Top = 64
      Width = 72
      Height = 13
      Caption = #24403#21069#20419#38144#20215#65306
    end
    object RzLabel12: TRzLabel
      Left = 504
      Top = 88
      Width = 72
      Height = 13
      Caption = #35774#32622#20419#38144#20215#65306
    end
    object RzLabel13: TRzLabel
      Left = 528
      Top = 38
      Width = 48
      Height = 13
      Caption = #21514#29260#20215#65306
    end
    object RzLabel14: TRzLabel
      Left = 384
      Top = 16
      Width = 60
      Height = 13
      Caption = #21697#29260#21517#31216#65306
    end
    object RzLabel15: TRzLabel
      Left = 16
      Top = 38
      Width = 60
      Height = 13
      Caption = #21069#21488#39068#33394#65306
    end
    object RzLabel16: TRzLabel
      Left = 200
      Top = 38
      Width = 60
      Height = 13
      Caption = #21830#21697#23610#23544#65306
    end
    object RzLabel17: TRzLabel
      Left = 608
      Top = 16
      Width = 60
      Height = 13
      Caption = #38144#21806#20195#30721#65306
    end
    object RzDBEdit1: TRzDBEdit
      Left = 80
      Top = 12
      Width = 161
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'name'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 0
    end
    object RzDBEdit2: TRzDBEdit
      Left = 304
      Top = 12
      Width = 73
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'product_sku'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 1
    end
    object btnSetOk: TRzButton
      Left = 672
      Top = 64
      Width = 113
      Height = 41
      Caption = #35774#32622
      TabOrder = 2
      OnClick = btnSetOkClick
    end
    object RzNumericEdit1: TRzNumericEdit
      Left = 248
      Top = 86
      Width = 81
      Height = 21
      TabOrder = 3
      IntegersOnly = False
      DisplayFormat = '0.00;(0.00)'
    end
    object RzNumericEdit2: TRzNumericEdit
      Left = 96
      Top = 86
      Width = 81
      Height = 21
      TabOrder = 4
      IntegersOnly = False
      DisplayFormat = '0.00;(0.00)'
    end
    object RzNumericEdit3: TRzNumericEdit
      Left = 416
      Top = 86
      Width = 81
      Height = 21
      TabOrder = 5
      IntegersOnly = False
      DisplayFormat = '0.00;(0.00)'
    end
    object RzNumericEdit4: TRzNumericEdit
      Left = 584
      Top = 86
      Width = 81
      Height = 21
      TabOrder = 6
      IntegersOnly = False
      DisplayFormat = '0.00;(0.00)'
    end
    object RzDBEdit3: TRzDBEdit
      Left = 456
      Top = 34
      Width = 65
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'product_cost'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 7
    end
    object RzDBEdit4: TRzDBEdit
      Left = 720
      Top = 34
      Width = 65
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'product_price'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 8
    end
    object RzDBEdit5: TRzDBEdit
      Left = 96
      Top = 64
      Width = 81
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'market_price'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 9
    end
    object RzDBEdit6: TRzDBEdit
      Left = 248
      Top = 64
      Width = 81
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'sale_price'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 10
    end
    object RzDBEdit7: TRzDBEdit
      Left = 416
      Top = 64
      Width = 81
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'sale_limit_price'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 11
    end
    object RzDBEdit8: TRzDBEdit
      Left = 584
      Top = 64
      Width = 81
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'promotion_price'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 12
    end
    object RzDBEdit9: TRzDBEdit
      Left = 584
      Top = 34
      Width = 65
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'product_tax'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 13
    end
    object RzDBEdit10: TRzDBEdit
      Left = 448
      Top = 12
      Width = 153
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'brand_name'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 14
    end
    object RzDBEdit11: TRzDBEdit
      Left = 80
      Top = 34
      Width = 113
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'p_color'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 15
    end
    object RzDBEdit12: TRzDBEdit
      Left = 264
      Top = 34
      Width = 121
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'p_size'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 16
    end
    object RzDBButtonEdit1: TRzDBButtonEdit
      Left = 672
      Top = 12
      Width = 113
      Height = 21
      DataSource = dmPCenter.dsSetOPdtPrice
      DataField = 'sn'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 17
      ButtonKind = bkFind
      HideButtonsOnReadOnly = False
      OnButtonClick = RzDBButtonEdit1ButtonClick
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 113
    Width = 798
    Height = 215
    Align = alClient
    TabOrder = 1
    object dgePdtList: TDBGridEh
      Left = 1
      Top = 1
      Width = 796
      Height = 213
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = dmPCenter.dsSetOPdtPrice
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
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
          FieldName = 'stkorder_id'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'stkorder_no'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'product_id'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'status'
          Footers = <>
          KeyList.Strings = (
            '201'
            '202'
            '203')
          PickList.Strings = (
            #21457#24067
            #24050#19978#26550
            #24050#19979#26550)
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'product_sku'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'name'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'brand_name'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'spec'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'p_color'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'p_size'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'product_tax'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'product_cost'
          Footers = <>
          Visible = False
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'product_price'
          Footers = <>
          Visible = False
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'market_price'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'sale_price'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'sale_limit_price'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'promotion_price'
          Footers = <>
          Width = 80
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 328
    Width = 798
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnOk: TRzBitBtn
      Left = 296
      Top = 8
      Width = 81
      Caption = #23450#20215#23436#25104
      TabOrder = 0
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
    object btnCancel: TRzBitBtn
      Left = 384
      Top = 8
      Width = 81
      Caption = #21462#28040
      TabOrder = 1
      OnClick = btnCancelClick
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8B46C6C6CE8
        E8E8E8E8B46C6C6CE8E8E8E2DFDFDFE8E8E8E8E8E2DFDFDFE8E8E8B49090906C
        E8E8E8B49090906CE8E8E8E2818181DFE8E8E8E2818181DFE8E8E8E8B4909090
        6CE8B49090906CE8E8E8E8E8E2818181DFE8E2818181DFE8E8E8E8E8E8B49090
        906C9090906CE8E8E8E8E8E8E8E2818181DF818181DFE8E8E8E8E8E8E8E8B490
        909090906CE8E8E8E8E8E8E8E8E8E28181818181DFE8E8E8E8E8E8E8E8E8E8B4
        9090906CE8E8E8E8E8E8E8E8E8E8E8E2818181DFE8E8E8E8E8E8E8E8E8E8B490
        909090906CE8E8E8E8E8E8E8E8E8E28181818181DFE8E8E8E8E8E8E8E8B49090
        906C9090906CE8E8E8E8E8E8E8E2818181DF818181DFE8E8E8E8E8E8B4909090
        6CE8B49090906CE8E8E8E8E8E2818181DFE8E2818181DFE8E8E8E8B49090906C
        E8E8E8B49090906CE8E8E8E2818181DFE8E8E8E2818181DFE8E8E8B4B4B4B4E8
        E8E8E8E8B4B4B4B4E8E8E8E2E2E2E2E8E8E8E8E8E2E2E2E2E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
  end
end
