object frmSBOInfo: TfrmSBOInfo
  Left = 285
  Top = 212
  Width = 740
  Height = 419
  Caption = #36864#36135#21333#20449#24687
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
    Width = 732
    Height = 89
    Align = alTop
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 16
      Top = 16
      Width = 72
      Height = 13
      Caption = #36864#36135#21333#32534#21495#65306
    end
    object RzLabel2: TRzLabel
      Left = 256
      Top = 16
      Width = 60
      Height = 13
      Caption = #35746#21333#32534#21495#65306
    end
    object RzLabel3: TRzLabel
      Left = 488
      Top = 16
      Width = 60
      Height = 13
      Caption = #35746#21333#26469#28304#65306
    end
    object RzLabel4: TRzLabel
      Left = 28
      Top = 38
      Width = 60
      Height = 13
      Caption = #26469#28304#21333#21495#65306
    end
    object RzLabel5: TRzLabel
      Left = 268
      Top = 38
      Width = 48
      Height = 13
      Caption = #36864#36135#20154#65306
    end
    object RzLabel6: TRzLabel
      Left = 488
      Top = 38
      Width = 60
      Height = 13
      Caption = #22266#23450#30005#35805#65306
    end
    object RzLabel7: TRzLabel
      Left = 28
      Top = 60
      Width = 60
      Height = 13
      Caption = #31227#21160#30005#35805#65306
    end
    object RzLabel8: TRzLabel
      Left = 256
      Top = 60
      Width = 60
      Height = 13
      Caption = #30005#23376#37038#20214#65306
    end
    object RzLabel9: TRzLabel
      Left = 488
      Top = 60
      Width = 60
      Height = 13
      Caption = #36864#36135#36816#36153#65306
    end
    object RzDBEdit1: TRzDBEdit
      Left = 88
      Top = 12
      Width = 161
      Height = 21
      DataSource = dmMenService.dsSBOrderList
      DataField = 'return_no'
      TabOrder = 0
    end
    object RzDBEdit2: TRzDBEdit
      Left = 320
      Top = 12
      Width = 161
      Height = 21
      DataSource = dmMenService.dsSBOrderList
      DataField = 'so_no'
      TabOrder = 1
    end
    object RzDBEdit3: TRzDBEdit
      Left = 552
      Top = 12
      Width = 161
      Height = 21
      DataSource = dmMenService.dsSBOrderList
      DataField = 'so_source'
      TabOrder = 2
    end
    object RzDBEdit4: TRzDBEdit
      Left = 88
      Top = 34
      Width = 161
      Height = 21
      DataSource = dmMenService.dsSBOrderList
      DataField = 'so_source_no'
      TabOrder = 3
    end
    object RzDBEdit5: TRzDBEdit
      Left = 320
      Top = 34
      Width = 161
      Height = 21
      DataSource = dmMenService.dsSBOrderList
      DataField = 'return_men'
      TabOrder = 4
    end
    object RzDBEdit6: TRzDBEdit
      Left = 552
      Top = 34
      Width = 161
      Height = 21
      DataSource = dmMenService.dsSBOrderList
      DataField = 'return_tel'
      TabOrder = 5
    end
    object RzDBEdit7: TRzDBEdit
      Left = 88
      Top = 56
      Width = 161
      Height = 21
      DataSource = dmMenService.dsSBOrderList
      DataField = 'return_mobile'
      TabOrder = 6
    end
    object RzDBEdit8: TRzDBEdit
      Left = 320
      Top = 56
      Width = 161
      Height = 21
      DataSource = dmMenService.dsSBOrderList
      DataField = 'return_email'
      TabOrder = 7
    end
    object RzDBEdit9: TRzDBEdit
      Left = 552
      Top = 56
      Width = 161
      Height = 21
      DataSource = dmMenService.dsSBOrderList
      DataField = 'return_price'
      TabOrder = 8
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 89
    Width = 732
    Height = 260
    Align = alClient
    TabOrder = 1
    object dgeSBOPList: TDBGridEh
      Left = 1
      Top = 1
      Width = 730
      Height = 258
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = dmMenService.dsSBOPList
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
          FieldName = 'id'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'rso_id'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'rso_no'
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
          FieldName = 'p_name'
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
          FieldName = 'p_num'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'p_price'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'p_amount'
          Footers = <>
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'real_input_num'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'state'
          Footers = <>
          KeyList.Strings = (
            '10'
            '11')
          PickList.Strings = (
            #26410#20837#24211
            #24050#20837#24211)
          Width = 60
        end
        item
          EditButtons = <>
          FieldName = 'sys_state'
          Footers = <>
          Visible = False
          Width = 60
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 349
    Width = 732
    Height = 36
    Align = alBottom
    TabOrder = 2
    object pnl4: TPanel
      Left = 455
      Top = 1
      Width = 276
      Height = 34
      Align = alRight
      TabOrder = 0
      object btnPrint: TRzBitBtn
        Left = 8
        Top = 4
        Width = 97
        Caption = #36864#36135#21333#25171#21360
        TabOrder = 0
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
      object btnAssess: TRzBitBtn
        Left = 106
        Top = 4
        Width = 85
        Caption = #23457#26680#36890#36807
        TabOrder = 1
        OnClick = btnAssessClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000330B0000330B00000001000000000000000000003300
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E80909
          E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8091010
          09E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E809101010
          1009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E80910101010
          101009E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E8E80910100909
          10101009E8E8E8E8E8E8E881ACAC8181ACACAC81E8E8E8E8E8E8E8091009E8E8
          0910101009E8E8E8E8E8E881AC81E8E881ACACAC81E8E8E8E8E8E80909E8E8E8
          E80910101009E8E8E8E8E88181E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8E8
          E8E80910101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8
          E8E8E80910101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8
          E8E8E8E809101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8
          E8E8E8E8E8091009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8
          E8E8E8E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object btnExit: TRzBitBtn
        Left = 192
        Top = 4
        Caption = #20851#38381
        TabOrder = 2
        OnClick = btnExitClick
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
    object pnl5: TPanel
      Left = 1
      Top = 1
      Width = 454
      Height = 34
      Align = alClient
      TabOrder = 1
    end
  end
end
