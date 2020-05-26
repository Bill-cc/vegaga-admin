object frmCreateROrder: TfrmCreateROrder
  Left = 336
  Top = 136
  Width = 727
  Height = 598
  Caption = #21019#24314#36864#36135#21333
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
    Width = 719
    Height = 89
    Align = alTop
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 16
      Top = 16
      Width = 60
      Height = 13
      Caption = #35746#21333#32534#21495#65306
    end
    object RzLabel2: TRzLabel
      Left = 248
      Top = 16
      Width = 60
      Height = 13
      Caption = #35746#21333#26469#28304#65306
    end
    object RzLabel3: TRzLabel
      Left = 480
      Top = 16
      Width = 60
      Height = 13
      Caption = #26469#28304#21333#21495#65306
    end
    object RzLabel4: TRzLabel
      Left = 3
      Top = 38
      Width = 72
      Height = 13
      Caption = #36864#36135#21333#32534#21495#65306
    end
    object RzLabel5: TRzLabel
      Left = 260
      Top = 38
      Width = 48
      Height = 13
      Caption = #36864#36135#20154#65306
    end
    object RzLabel6: TRzLabel
      Left = 480
      Top = 38
      Width = 60
      Height = 13
      Caption = #22266#23450#30005#35805#65306
    end
    object RzLabel7: TRzLabel
      Left = 16
      Top = 60
      Width = 60
      Height = 13
      Caption = #31227#21160#30005#35805#65306
    end
    object RzLabel8: TRzLabel
      Left = 248
      Top = 60
      Width = 60
      Height = 13
      Caption = #30005#23376#37038#20214#65306
    end
    object RzLabel9: TRzLabel
      Left = 480
      Top = 60
      Width = 60
      Height = 13
      Caption = #36864#36135#36816#36153#65306
    end
    object RzDBEdit1: TRzDBEdit
      Left = 80
      Top = 12
      Width = 161
      Height = 21
      DataSource = dmMenService.dsROrderInfo
      DataField = 'so_no'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 0
    end
    object RzDBEdit2: TRzDBEdit
      Left = 312
      Top = 12
      Width = 161
      Height = 21
      DataSource = dmMenService.dsROrderInfo
      DataField = 'so_source'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 1
    end
    object RzDBEdit3: TRzDBEdit
      Left = 544
      Top = 12
      Width = 161
      Height = 21
      DataSource = dmMenService.dsROrderInfo
      DataField = 'so_source_no'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 2
    end
    object RzDBEdit4: TRzDBEdit
      Left = 80
      Top = 34
      Width = 161
      Height = 21
      DataSource = dmMenService.dsROrderInfo
      DataField = 'return_no'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 3
    end
    object RzDBEdit5: TRzDBEdit
      Left = 312
      Top = 34
      Width = 161
      Height = 21
      DataSource = dmMenService.dsROrderInfo
      DataField = 'return_men'
      TabOrder = 4
    end
    object RzDBEdit6: TRzDBEdit
      Left = 544
      Top = 34
      Width = 161
      Height = 21
      DataSource = dmMenService.dsROrderInfo
      DataField = 'return_tel'
      TabOrder = 5
    end
    object RzDBEdit7: TRzDBEdit
      Left = 80
      Top = 56
      Width = 161
      Height = 21
      DataSource = dmMenService.dsROrderInfo
      DataField = 'return_mobile'
      TabOrder = 6
    end
    object RzDBEdit8: TRzDBEdit
      Left = 312
      Top = 56
      Width = 161
      Height = 21
      DataSource = dmMenService.dsROrderInfo
      DataField = 'return_email'
      TabOrder = 7
    end
    object RzDBEdit9: TRzDBEdit
      Left = 544
      Top = 56
      Width = 161
      Height = 21
      DataSource = dmMenService.dsROrderInfo
      DataField = 'return_price'
      TabOrder = 8
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 89
    Width = 719
    Height = 439
    Align = alClient
    TabOrder = 1
    object RzSplitter1: TRzSplitter
      Left = 1
      Top = 1
      Width = 717
      Height = 437
      Orientation = orVertical
      Position = 196
      Percent = 45
      Align = alClient
      TabOrder = 0
      BarSize = (
        0
        196
        717
        200)
      UpperLeftControls = (
        RzGroupBox1)
      LowerRightControls = (
        RzGroupBox2)
      object RzGroupBox1: TRzGroupBox
        Left = 0
        Top = 0
        Width = 717
        Height = 196
        Align = alClient
        Caption = #35746#21333#21830#21697
        TabOrder = 0
        object dgeOPList: TDBGridEh
          Left = 1
          Top = 14
          Width = 715
          Height = 181
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dmMenService.dsOPList
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
          PopupMenu = pmSOopt
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
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'pdt_name'
              Footers = <>
              Width = 150
            end
            item
              EditButtons = <>
              FieldName = 'p_sn'
              Footers = <>
              Visible = False
              Width = 120
            end
            item
              EditButtons = <>
              FieldName = 'p_ean'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'p_number'
              Footers = <>
              Width = 60
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
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'sale_amount'
              Footers = <>
              TextEditing = False
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'p_weight'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'source'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'real_out_number'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'sys_status'
              Footers = <>
              KeyList.Strings = (
                '1'
                '2'
                '3'
                '4')
              PickList.Strings = (
                #26377#25928
                #26080#25928
                #21024#38500
                #24402#26723)
              Width = 60
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
      object RzGroupBox2: TRzGroupBox
        Left = 0
        Top = 0
        Width = 717
        Height = 237
        Align = alClient
        Caption = #36864#36135#21830#21697
        TabOrder = 0
        object dgeROPList: TDBGridEh
          Left = 1
          Top = 14
          Width = 715
          Height = 222
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dmMenService.dsROPList
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
          PopupMenu = pmROopt
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
              FieldName = 'p_sku'
              Footers = <>
              Width = 100
            end
            item
              EditButtons = <>
              FieldName = 'p_name'
              Footers = <>
              Width = 150
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
              TextEditing = False
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'real_input_num'
              Footers = <>
              Visible = False
            end
            item
              EditButtons = <>
              FieldName = 'state'
              Footers = <>
              KeyList.Strings = (
                '10'
                '11')
              PickList.Strings = (
                #36864#36135#20013
                #24050#36864#36135)
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'sys_state'
              Footers = <>
              KeyList.Strings = (
                '1'
                '2'
                '3'
                '4')
              PickList.Strings = (
                #26377#25928
                #26080#25928
                #21024#38500
                #24402#26723)
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
    Top = 528
    Width = 719
    Height = 36
    Align = alBottom
    TabOrder = 2
    object pnl4: TPanel
      Left = 548
      Top = 1
      Width = 170
      Height = 34
      Align = alRight
      TabOrder = 0
      object btnExit: TRzBitBtn
        Left = 90
        Top = 4
        Caption = #21462#28040
        TabOrder = 0
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
      object btnOk: TRzBitBtn
        Left = 8
        Top = 4
        Width = 81
        Caption = #30830#35748#29983#25104
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
    end
    object pnl5: TPanel
      Left = 1
      Top = 1
      Width = 547
      Height = 34
      Align = alClient
      TabOrder = 1
    end
  end
  object pmSOopt: TPopupMenu
    Left = 617
    Top = 202
    object N1: TMenuItem
      Caption = #28155#21152#33267#36864#36135#21830#21697
      OnClick = N1Click
    end
  end
  object pmROopt: TPopupMenu
    Left = 625
    Top = 394
    object N2: TMenuItem
      Caption = #25764#38144
      OnClick = N2Click
    end
  end
end
