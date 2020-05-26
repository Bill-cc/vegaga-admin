object frmFOrderInfo: TfrmFOrderInfo
  Left = 279
  Top = 130
  Width = 798
  Height = 616
  Caption = #35746#21333#35814#24773
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
  object pnlBaseInfo: TPanel
    Left = 0
    Top = 0
    Width = 790
    Height = 541
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 788
      Height = 100
      Align = alTop
      TabOrder = 0
      object RzGroupBox1: TRzGroupBox
        Left = 1
        Top = 1
        Width = 786
        Height = 98
        Align = alClient
        Caption = #22522#30784#20449#24687
        TabOrder = 0
        object RzLabel1: TRzLabel
          Left = 8
          Top = 24
          Width = 60
          Height = 13
          Caption = #35746#21333#32534#21495#65306
        end
        object RzLabel2: TRzLabel
          Left = 200
          Top = 24
          Width = 60
          Height = 13
          Caption = #35746#21333#26469#28304#65306
        end
        object RzLabel3: TRzLabel
          Left = 392
          Top = 24
          Width = 60
          Height = 13
          Caption = #26469#28304#21333#21495#65306
        end
        object RzLabel4: TRzLabel
          Left = 592
          Top = 24
          Width = 60
          Height = 13
          Caption = #35746#21333#26085#26399#65306
        end
        object RzLabel20: TRzLabel
          Left = 8
          Top = 48
          Width = 60
          Height = 13
          Caption = #24555#36882#20844#21496#65306
        end
        object RzLabel21: TRzLabel
          Left = 640
          Top = 72
          Width = 60
          Height = 13
          Caption = #26368#32456#37329#39069#65306
        end
        object RzLabel22: TRzLabel
          Left = 174
          Top = 72
          Width = 48
          Height = 13
          Caption = #24555#36882#36153#65306
        end
        object RzLabel23: TRzLabel
          Left = 8
          Top = 72
          Width = 72
          Height = 13
          Caption = #24555#36882#36153#32467#31639#65306
        end
        object RzLabel18: TRzLabel
          Left = 312
          Top = 48
          Width = 60
          Height = 13
          Caption = #24555#36882#21333#21495#65306
        end
        object RzLabel24: TRzLabel
          Left = 496
          Top = 72
          Width = 60
          Height = 13
          Caption = #20248#24800#37329#39069#65306
        end
        object RzLabel25: TRzLabel
          Left = 320
          Top = 72
          Width = 72
          Height = 13
          Caption = #31036#21697#21345#37329#39069#65306
        end
        object RzDBEdit1: TRzDBEdit
          Left = 264
          Top = 20
          Width = 121
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'so_source'
          TabOrder = 0
        end
        object RzDBEdit2: TRzDBEdit
          Left = 456
          Top = 20
          Width = 121
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'source_no'
          TabOrder = 1
        end
        object RzDBDateTimeEdit1: TRzDBDateTimeEdit
          Left = 656
          Top = 20
          Width = 121
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'sub_date'
          TabOrder = 2
          EditType = etDate
        end
        object RzDBEdit13: TRzDBEdit
          Left = 72
          Top = 20
          Width = 121
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'so_sn'
          TabOrder = 3
        end
        object RzDBEdit15: TRzDBEdit
          Left = 696
          Top = 70
          Width = 81
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'final_amount'
          TabOrder = 4
        end
        object RzDBEdit16: TRzDBEdit
          Left = 72
          Top = 46
          Width = 233
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'exp_name'
          TabOrder = 5
        end
        object RzDBEdit17: TRzDBEdit
          Left = 224
          Top = 70
          Width = 89
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'ship_amount'
          TabOrder = 6
        end
        object RzDBEdit18: TRzDBEdit
          Left = 80
          Top = 70
          Width = 89
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'ship_settle_amount'
          TabOrder = 7
        end
        object RzDBEdit10: TRzDBEdit
          Left = 376
          Top = 46
          Width = 241
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'ship_order_number'
          TabOrder = 8
        end
        object RzDBEdit19: TRzDBEdit
          Left = 552
          Top = 70
          Width = 81
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'preferential_price'
          TabOrder = 9
        end
        object RzDBEdit20: TRzDBEdit
          Left = 392
          Top = 70
          Width = 97
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'coupon_price'
          TabOrder = 10
        end
      end
    end
    object pnl3: TPanel
      Left = 1
      Top = 101
      Width = 788
      Height = 96
      Align = alTop
      TabOrder = 1
      object RzGroupBox2: TRzGroupBox
        Left = 1
        Top = 1
        Width = 786
        Height = 94
        Align = alClient
        Caption = #25910#36135#20154#20449#24687
        TabOrder = 0
        object RzLabel5: TRzLabel
          Left = 16
          Top = 24
          Width = 36
          Height = 13
          Caption = #22995#21517#65306
        end
        object RzLabel6: TRzLabel
          Left = 152
          Top = 24
          Width = 24
          Height = 13
          Caption = #30465#65306
        end
        object RzLabel7: TRzLabel
          Left = 248
          Top = 24
          Width = 24
          Height = 13
          Caption = #24066#65306
        end
        object RzLabel8: TRzLabel
          Left = 344
          Top = 24
          Width = 24
          Height = 13
          Caption = #21306#65306
        end
        object RzLabel9: TRzLabel
          Left = 432
          Top = 24
          Width = 36
          Height = 13
          Caption = #22320#22336#65306
        end
        object RzLabel10: TRzLabel
          Left = 672
          Top = 24
          Width = 36
          Height = 13
          Caption = #37038#32534#65306
        end
        object RzLabel11: TRzLabel
          Left = 16
          Top = 46
          Width = 60
          Height = 13
          Caption = #30005#23376#37038#31665#65306
        end
        object RzLabel12: TRzLabel
          Left = 208
          Top = 46
          Width = 60
          Height = 13
          Caption = #22266#23450#30005#35805#65306
        end
        object RzLabel13: TRzLabel
          Left = 392
          Top = 46
          Width = 60
          Height = 13
          Caption = #31227#21160#30005#35805#65306
        end
        object RzLabel14: TRzLabel
          Left = 224
          Top = 68
          Width = 60
          Height = 13
          Caption = #29305#27530#30041#35328#65306
        end
        object RzLabel15: TRzLabel
          Left = 592
          Top = 46
          Width = 60
          Height = 13
          Caption = #36865#36135#26041#24335#65306
        end
        object RzLabel16: TRzLabel
          Left = 16
          Top = 68
          Width = 60
          Height = 13
          Caption = #25903#20184#26041#24335#65306
        end
        object RzDBEdit3: TRzDBEdit
          Left = 48
          Top = 20
          Width = 89
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'receiver'
          TabOrder = 0
        end
        object RzDBLookupComboBox1: TRzDBLookupComboBox
          Left = 176
          Top = 20
          Width = 65
          Height = 21
          DataField = 'province'
          DataSource = dmFCenter.dsFOrderInfo
          KeyField = 'STATESID'
          ListField = 'ADDRESSNAME'
          ListSource = dmFCenter.dsProvince
          TabOrder = 1
        end
        object RzDBLookupComboBox2: TRzDBLookupComboBox
          Left = 272
          Top = 20
          Width = 65
          Height = 21
          DataField = 'city'
          DataSource = dmFCenter.dsFOrderInfo
          KeyField = 'CITYID'
          ListField = 'ADDRESSNAME'
          ListSource = dmFCenter.dsCity
          TabOrder = 2
        end
        object RzDBLookupComboBox3: TRzDBLookupComboBox
          Left = 368
          Top = 20
          Width = 65
          Height = 21
          DataField = 'district'
          DataSource = dmFCenter.dsFOrderInfo
          KeyField = 'POSTCODE'
          ListField = 'ADDRESSNAME'
          ListSource = dmFCenter.dsDistrict
          TabOrder = 3
        end
        object RzDBEdit4: TRzDBEdit
          Left = 464
          Top = 20
          Width = 209
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'addr'
          TabOrder = 4
        end
        object RzDBEdit5: TRzDBEdit
          Left = 704
          Top = 20
          Width = 73
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'post_code'
          TabOrder = 5
        end
        object RzDBEdit6: TRzDBEdit
          Left = 80
          Top = 42
          Width = 121
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'RECEIVE_EMAIL'
          TabOrder = 6
        end
        object RzDBEdit7: TRzDBEdit
          Left = 272
          Top = 42
          Width = 113
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'tel'
          TabOrder = 7
        end
        object RzDBEdit8: TRzDBEdit
          Left = 456
          Top = 42
          Width = 129
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'mobile'
          TabOrder = 8
        end
        object RzDBEdit9: TRzDBEdit
          Left = 288
          Top = 64
          Width = 489
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'so_remark'
          TabOrder = 9
        end
        object RzDBComboBox2: TRzDBComboBox
          Left = 80
          Top = 64
          Width = 137
          Height = 21
          DataField = 'payment_type'
          DataSource = dmFCenter.dsFOrderInfo
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 10
          Items.Strings = (
            #32593#19978#25903#20184
            #36135#21040#20184#27454)
          Values.Strings = (
            '1'
            '2')
        end
        object RzDBEdit14: TRzDBEdit
          Left = 656
          Top = 42
          Width = 121
          Height = 21
          DataSource = dmFCenter.dsFOrderInfo
          DataField = 'send_type'
          TabOrder = 11
        end
      end
    end
    object pnl4: TPanel
      Left = 1
      Top = 197
      Width = 788
      Height = 56
      Align = alTop
      TabOrder = 2
      object RzGroupBox3: TRzGroupBox
        Left = 1
        Top = 1
        Width = 786
        Height = 54
        Align = alClient
        Caption = #20250#21592#20449#24687
        TabOrder = 0
        object RzLabel17: TRzLabel
          Left = 16
          Top = 24
          Width = 36
          Height = 13
          Caption = #22995#21517#65306
        end
        object RzLabel19: TRzLabel
          Left = 208
          Top = 24
          Width = 72
          Height = 13
          Caption = #20250#21592#25163#26426#21495#65306
        end
        object RzDBEdit11: TRzDBEdit
          Left = 56
          Top = 20
          Width = 145
          Height = 21
          DataSource = dmFCenter.dsMemInfo
          TabOrder = 0
        end
        object RzDBEdit12: TRzDBEdit
          Left = 288
          Top = 20
          Width = 137
          Height = 21
          TabOrder = 1
        end
      end
    end
    object pnl5: TPanel
      Left = 1
      Top = 253
      Width = 788
      Height = 287
      Align = alClient
      TabOrder = 3
      object RzGroupBox4: TRzGroupBox
        Left = 1
        Top = 1
        Width = 786
        Height = 285
        Align = alClient
        Caption = #21830#21697#20449#24687
        TabOrder = 0
        object dgeProductList: TDBGridEh
          Left = 1
          Top = 14
          Width = 784
          Height = 270
          Align = alClient
          DataGrouping.GroupLevels = <>
          DataSource = dmFCenter.dsFOPList
          Flat = False
          FooterColor = clWindow
          FooterFont.Charset = DEFAULT_CHARSET
          FooterFont.Color = clWindowText
          FooterFont.Height = -11
          FooterFont.Name = 'MS Sans Serif'
          FooterFont.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
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
              FieldName = 'pdt_name'
              Footers = <>
              Width = 300
            end
            item
              EditButtons = <>
              FieldName = 'p_sku'
              Footers = <>
              Width = 150
            end
            item
              EditButtons = <>
              FieldName = 'p_sn'
              Footers = <>
              Visible = False
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
            end
            item
              EditButtons = <>
              FieldName = 'sale_price'
              Footers = <>
            end
            item
              EditButtons = <>
              FieldName = 'sale_amount'
              Footers = <>
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
              Visible = False
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 541
    Width = 790
    Height = 41
    Align = alBottom
    TabOrder = 1
    object pnl6: TPanel
      Left = 528
      Top = 1
      Width = 261
      Height = 39
      Align = alRight
      TabOrder = 0
      object btnExit: TRzBitBtn
        Left = 182
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
      object btnPrint: TRzBitBtn
        Left = 10
        Top = 8
        Width = 81
        Caption = #25171#21360#35746#21333
        TabOrder = 1
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
        Left = 92
        Top = 8
        Width = 89
        Caption = #23457#26680#36890#36807
        TabOrder = 2
        OnClick = btnAssessClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000930E0000930E00000001000000000000000000003300
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E85E5E5E5E
          5E5E5E5E5E5E5E5EE8E8E8E8818181818181818181818181E8E8E8E85ED7D7D7
          D7D7D7D7D7D7D75EE8E8E8E881ACACACACACACACACACAC81E8E8E8E85ED7D7D7
          09D7D7D7D7D7D75EE8E8E8E881ACACAC81ACACACACACAC81E8E8E8E85ED7D709
          0909D7D7D7D7D75EE8E8E8E881ACAC818181ACACACACAC81E8E8E8E85ED70909
          090909D7D7D7D75EE8E8E8E881AC8181818181ACACACAC81E8E8E8E85ED70909
          D7090909D7D7D75EE8E8E8E881AC8181AC818181ACACAC81E8E8E8E85ED709D7
          D7D7090909D7D75EE8E8E8E881AC81ACACAC818181ACAC81E8E8E8E85ED7D7D7
          D7D7D70909D7D75EE8E8E8E881ACACACACACAC8181ACAC81E8E8E8E85ED7D7D7
          D7D7D7D709D7D75EE8E8E8E881ACACACACACACAC81ACAC81E8E8E8E85ED7D7D7
          D7D7D7D7D7D7D75EE8E8E8E881ACACACACACACACACACAC81E8E8E8E85ED7D7D7
          D7D7D7D75E5E5E5EE8E8E8E881ACACACACACACAC81818181E8E8E8E85ED7D7D7
          D7D7D7D75EE35EE8E8E8E8E881ACACACACACACAC81AC81E8E8E8E8E85ED7D7D7
          D7D7D7D75E5EE8E8E8E8E8E881ACACACACACACAC8181E8E8E8E8E8E85E5E5E5E
          5E5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
    end
    object pnl7: TPanel
      Left = 1
      Top = 1
      Width = 527
      Height = 39
      Align = alClient
      TabOrder = 1
    end
  end
end
