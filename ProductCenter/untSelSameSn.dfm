object frmSelSameSn: TfrmSelSameSn
  Left = 245
  Top = 289
  BorderStyle = bsDialog
  Caption = #30456#21516#38144#21806#20195#30721#20135#21697
  ClientHeight = 404
  ClientWidth = 801
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
    Width = 801
    Height = 121
    Align = alTop
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 24
      Top = 16
      Width = 60
      Height = 13
      Caption = #21830#21697#21517#31216#65306
    end
    object RzLabel2: TRzLabel
      Left = 400
      Top = 16
      Width = 58
      Height = 13
      Caption = #21830#21697'SKU'#65306
    end
    object RzLabel3: TRzLabel
      Left = 24
      Top = 38
      Width = 60
      Height = 13
      Caption = #21697#29260#21517#31216#65306
    end
    object RzLabel4: TRzLabel
      Left = 608
      Top = 16
      Width = 60
      Height = 13
      Caption = #38144#21806#20195#30721#65306
    end
    object RzLabel5: TRzLabel
      Left = 400
      Top = 38
      Width = 60
      Height = 13
      Caption = #21069#21488#39068#33394#65306
    end
    object RzLabel6: TRzLabel
      Left = 608
      Top = 38
      Width = 60
      Height = 13
      Caption = #21830#21697#23610#23544#65306
    end
    object RzLabel10: TRzLabel
      Left = 24
      Top = 72
      Width = 72
      Height = 13
      Caption = #24403#21069#24066#22330#20215#65306
    end
    object RzLabel11: TRzLabel
      Left = 184
      Top = 72
      Width = 63
      Height = 13
      Caption = #24403#21069'VG'#20215#65306
    end
    object RzLabel12: TRzLabel
      Left = 344
      Top = 72
      Width = 72
      Height = 13
      Caption = #24403#21069#38480#21806#20215#65306
    end
    object RzLabel13: TRzLabel
      Left = 512
      Top = 72
      Width = 72
      Height = 13
      Caption = #24403#21069#20419#38144#20215#65306
    end
    object RzLabel14: TRzLabel
      Left = 24
      Top = 96
      Width = 72
      Height = 13
      Caption = #35774#32622#24066#22330#20215#65306
    end
    object RzLabel15: TRzLabel
      Left = 184
      Top = 96
      Width = 63
      Height = 13
      Caption = #35774#32622'VG'#20215#65306
    end
    object RzLabel16: TRzLabel
      Left = 344
      Top = 96
      Width = 72
      Height = 13
      Caption = #35774#32622#38480#21806#20215#65306
    end
    object RzLabel17: TRzLabel
      Left = 512
      Top = 96
      Width = 72
      Height = 13
      Caption = #35774#32622#20419#38144#20215#65306
    end
    object RzDBEdit1: TRzDBEdit
      Left = 80
      Top = 12
      Width = 313
      Height = 21
      DataSource = dmPCenter.dsSameSnList
      DataField = 'name'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 0
    end
    object RzDBEdit2: TRzDBEdit
      Left = 456
      Top = 12
      Width = 145
      Height = 21
      DataSource = dmPCenter.dsSameSnList
      DataField = 'sku'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 1
    end
    object RzDBEdit3: TRzDBEdit
      Left = 80
      Top = 34
      Width = 313
      Height = 21
      DataSource = dmPCenter.dsSameSnList
      DataField = 'brand_name'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 2
    end
    object RzDBEdit4: TRzDBEdit
      Left = 664
      Top = 12
      Width = 121
      Height = 21
      DataSource = dmPCenter.dsSameSnList
      DataField = 'sn'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 3
    end
    object RzDBEdit5: TRzDBEdit
      Left = 456
      Top = 34
      Width = 145
      Height = 21
      DataSource = dmPCenter.dsSameSnList
      DataField = 'p_color'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 4
    end
    object RzDBEdit6: TRzDBEdit
      Left = 664
      Top = 34
      Width = 121
      Height = 21
      DataSource = dmPCenter.dsSameSnList
      DataField = 'p_size'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 5
    end
    object RzDBEdit10: TRzDBEdit
      Left = 96
      Top = 68
      Width = 81
      Height = 21
      DataSource = dmPCenter.dsSameSnList
      DataField = 'market_price'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 6
    end
    object RzDBEdit11: TRzDBEdit
      Left = 248
      Top = 68
      Width = 81
      Height = 21
      DataSource = dmPCenter.dsSameSnList
      DataField = 'sale_price'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 7
    end
    object RzDBEdit12: TRzDBEdit
      Left = 416
      Top = 68
      Width = 81
      Height = 21
      DataSource = dmPCenter.dsSameSnList
      DataField = 'sale_limit_price'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 8
    end
    object RzDBEdit13: TRzDBEdit
      Left = 584
      Top = 68
      Width = 81
      Height = 21
      DataSource = dmPCenter.dsSameSnList
      DataField = 'promotion_price'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 9
    end
    object RzNumericEdit1: TRzNumericEdit
      Left = 96
      Top = 92
      Width = 81
      Height = 21
      TabOrder = 10
      DisplayFormat = '0.00;(0.00)'
    end
    object RzNumericEdit2: TRzNumericEdit
      Left = 248
      Top = 92
      Width = 81
      Height = 21
      TabOrder = 11
      DisplayFormat = '0.00;(0.00)'
    end
    object RzNumericEdit3: TRzNumericEdit
      Left = 416
      Top = 92
      Width = 81
      Height = 21
      TabOrder = 12
      DisplayFormat = '0.00;(0.00)'
    end
    object RzNumericEdit4: TRzNumericEdit
      Left = 584
      Top = 92
      Width = 81
      Height = 21
      TabOrder = 13
      DisplayFormat = '0.00;(0.00)'
    end
    object btn2: TRzButton
      Left = 680
      Top = 64
      Width = 105
      Height = 49
      Caption = #35774#32622
      TabOrder = 14
      OnClick = btn2Click
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 368
    Width = 801
    Height = 36
    Align = alBottom
    TabOrder = 1
    object pnl4: TPanel
      Left = 704
      Top = 1
      Width = 96
      Height = 34
      Align = alRight
      TabOrder = 0
      object btn1: TRzBitBtn
        Left = 8
        Top = 4
        Caption = #36864#20986
        TabOrder = 0
        OnClick = btn1Click
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
    end
    object pnl5: TPanel
      Left = 1
      Top = 1
      Width = 703
      Height = 34
      Align = alClient
      TabOrder = 1
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 121
    Width = 801
    Height = 247
    Align = alClient
    TabOrder = 2
    object dgeSameSnList: TDBGridEh
      Left = 1
      Top = 1
      Width = 799
      Height = 245
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = dmPCenter.dsSameSnList
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
          FieldName = 'sku_id'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'status'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'sn'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'sku'
          Footers = <>
          Width = 100
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
          Width = 150
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
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'p_size'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'market_price'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'sale_price'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'sale_limit_price'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'promotion_price'
          Footers = <>
          Width = 60
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
end
