object frmExpressManager: TfrmExpressManager
  Left = 110
  Top = 159
  Width = 1091
  Height = 508
  Caption = #24555#36882#20844#21496#31649#29702
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
  object TRzLabel
    Left = 408
    Top = 16
    Width = 72
    Height = 13
    Caption = #21512#21516#32852#31995#20154#65306
  end
  object TRzLabel
    Left = 416
    Top = 40
    Width = 36
    Height = 13
    Caption = #30005#35805#65306
  end
  object TRzLabel
    Left = 416
    Top = 64
    Width = 60
    Height = 13
    Caption = #31227#21160#30005#35805#65306
  end
  object TRzLabel
    Left = 424
    Top = 88
    Width = 60
    Height = 13
    Caption = #30005#23376#37038#20214#65306
  end
  object TRzLabel
    Left = 424
    Top = 104
    Width = 36
    Height = 13
    Caption = #20256#30495#65306
  end
  object TRzLabel
    Left = 424
    Top = 128
    Width = 36
    Height = 13
    Caption = 'MSN'#65306
  end
  object TRzLabel
    Left = 424
    Top = 144
    Width = 28
    Height = 13
    Caption = 'QQ'#65306
  end
  object RzToolbar1: TRzToolbar
    Left = 0
    Top = 0
    Width = 1083
    Height = 44
    Images = il1
    RowHeight = 40
    ButtonLayout = blGlyphTop
    ButtonWidth = 60
    ButtonHeight = 40
    ShowButtonCaptions = True
    TextOptions = ttoShowTextLabels
    BorderInner = fsNone
    BorderOuter = fsGroove
    BorderSides = [sdTop]
    BorderWidth = 0
    TabOrder = 0
    ToolbarControls = (
      btnCreate
      btnDelete
      btnUpdate
      btnOK
      btnCancel
      btnRefresh
      btnExit)
    object btnCreate: TRzToolButton
      Left = 4
      Top = 2
      ImageIndex = 0
      Layout = blGlyphTop
      Action = actCreate
      Caption = #22686#21152
    end
    object btnDelete: TRzToolButton
      Left = 64
      Top = 2
      ImageIndex = 2
      Layout = blGlyphTop
      Action = actDelete
      Caption = #21024#38500
    end
    object btnUpdate: TRzToolButton
      Left = 124
      Top = 2
      ImageIndex = 4
      Layout = blGlyphTop
      Action = actUpdate
      Caption = #20462#25913
    end
    object btnOK: TRzToolButton
      Left = 184
      Top = 2
      ImageIndex = 8
      Layout = blGlyphTop
      Caption = #30830#23450
      Enabled = False
      OnClick = btnOKClick
    end
    object btnCancel: TRzToolButton
      Left = 244
      Top = 2
      ImageIndex = 10
      Layout = blGlyphTop
      Caption = #21462#28040
      Enabled = False
      OnClick = btnCancelClick
    end
    object btnExit: TRzToolButton
      Left = 364
      Top = 2
      ImageIndex = 12
      Layout = blGlyphTop
      Caption = #36864#20986
      OnClick = btnExitClick
    end
    object btnRefresh: TRzToolButton
      Left = 304
      Top = 2
      ImageIndex = 6
      Layout = blGlyphTop
      Action = actRefresh
      Caption = #21047#26032
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 44
    Width = 1083
    Height = 173
    Align = alTop
    TabOrder = 1
    object lbl1: TRzLabel
      Left = 40
      Top = 8
      Width = 36
      Height = 13
      Caption = #32534#21495#65306
    end
    object lbl2: TRzLabel
      Left = 40
      Top = 30
      Width = 36
      Height = 13
      Caption = #21517#31216#65306
    end
    object RzLabel1: TRzLabel
      Left = 40
      Top = 52
      Width = 36
      Height = 13
      Caption = #30005#35805#65306
    end
    object RzLabel2: TRzLabel
      Left = 16
      Top = 74
      Width = 60
      Height = 13
      Caption = #31227#21160#30005#35805#65306
    end
    object RzLabel3: TRzLabel
      Left = 40
      Top = 96
      Width = 36
      Height = 13
      Caption = #20256#30495#65306
    end
    object RzLabel4: TRzLabel
      Left = 16
      Top = 118
      Width = 60
      Height = 13
      Caption = #30005#23376#37038#20214#65306
    end
    object RzLabel5: TRzLabel
      Left = 40
      Top = 140
      Width = 36
      Height = 13
      Caption = #22320#22336#65306
    end
    object RzLabel6: TRzLabel
      Left = 264
      Top = 8
      Width = 36
      Height = 13
      Caption = #37038#32534#65306
    end
    object RzLabel7: TRzLabel
      Left = 264
      Top = 30
      Width = 36
      Height = 13
      Caption = #32593#22336#65306
    end
    object RzLabel8: TRzLabel
      Left = 264
      Top = 52
      Width = 36
      Height = 13
      Caption = 'MSN'#65306
    end
    object RzLabel9: TRzLabel
      Left = 272
      Top = 74
      Width = 28
      Height = 13
      Caption = 'QQ'#65306
    end
    object RzLabel10: TRzLabel
      Left = 240
      Top = 96
      Width = 60
      Height = 13
      Caption = #25104#31435#26085#26399#65306
    end
    object RzLabel11: TRzLabel
      Left = 264
      Top = 118
      Width = 36
      Height = 13
      Caption = #31616#20171#65306
    end
    object RzLabel13: TRzLabel
      Left = 432
      Top = 8
      Width = 72
      Height = 13
      Caption = #21512#21516#32852#31995#20154#65306
    end
    object RzLabel14: TRzLabel
      Left = 477
      Top = 30
      Width = 36
      Height = 13
      Caption = #30005#35805#65306
    end
    object RzLabel15: TRzLabel
      Left = 445
      Top = 52
      Width = 60
      Height = 13
      Caption = #31227#21160#30005#35805#65306
    end
    object RzLabel16: TRzLabel
      Left = 445
      Top = 74
      Width = 60
      Height = 13
      Caption = #30005#23376#37038#20214#65306
    end
    object RzLabel17: TRzLabel
      Left = 477
      Top = 96
      Width = 36
      Height = 13
      Caption = #20256#30495#65306
    end
    object RzLabel18: TRzLabel
      Left = 477
      Top = 118
      Width = 36
      Height = 13
      Caption = 'MSN'#65306
    end
    object RzLabel19: TRzLabel
      Left = 485
      Top = 140
      Width = 28
      Height = 13
      Caption = 'QQ'#65306
    end
    object TRzLabel
      Left = 576
      Top = 24
      Width = 3
      Height = 13
    end
    object RzLabel20: TRzLabel
      Left = 640
      Top = 8
      Width = 72
      Height = 13
      Caption = #19994#21153#32852#31995#20154#65306
    end
    object RzLabel21: TRzLabel
      Left = 676
      Top = 30
      Width = 36
      Height = 13
      Caption = #30005#35805#65306
    end
    object RzLabel22: TRzLabel
      Left = 652
      Top = 52
      Width = 60
      Height = 13
      Caption = #31227#21160#30005#35805#65306
    end
    object RzLabel23: TRzLabel
      Left = 676
      Top = 74
      Width = 36
      Height = 13
      Caption = #20256#30495#65306
    end
    object RzLabel24: TRzLabel
      Left = 652
      Top = 96
      Width = 60
      Height = 13
      Caption = #30005#23376#37038#20214#65306
    end
    object RzLabel25: TRzLabel
      Left = 676
      Top = 118
      Width = 36
      Height = 13
      Caption = 'MSN'#65306
    end
    object RzLabel26: TRzLabel
      Left = 684
      Top = 140
      Width = 28
      Height = 13
      Caption = 'QQ'#65306
    end
    object RzLabel27: TRzLabel
      Left = 856
      Top = 8
      Width = 72
      Height = 13
      Caption = #32467#31639#32852#31995#20154#65306
    end
    object RzLabel28: TRzLabel
      Left = 892
      Top = 30
      Width = 36
      Height = 13
      Caption = #30005#35805#65306
    end
    object RzLabel29: TRzLabel
      Left = 868
      Top = 52
      Width = 60
      Height = 13
      Caption = #31227#21160#30005#35805#65306
    end
    object RzLabel30: TRzLabel
      Left = 892
      Top = 74
      Width = 36
      Height = 13
      Caption = #20256#30495#65306
    end
    object RzLabel31: TRzLabel
      Left = 868
      Top = 96
      Width = 60
      Height = 13
      Caption = #30005#23376#37038#20214#65306
    end
    object RzLabel32: TRzLabel
      Left = 892
      Top = 118
      Width = 36
      Height = 13
      Caption = 'MSN'#65306
    end
    object RzLabel33: TRzLabel
      Left = 900
      Top = 140
      Width = 28
      Height = 13
      Caption = 'QQ'#65306
    end
    object RzDBEdit1: TRzDBEdit
      Left = 80
      Top = 4
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_no'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 0
    end
    object RzDBEdit2: TRzDBEdit
      Left = 80
      Top = 26
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_name'
      TabOrder = 1
    end
    object RzDBEdit3: TRzDBEdit
      Left = 80
      Top = 48
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_tel'
      TabOrder = 2
    end
    object RzDBEdit4: TRzDBEdit
      Left = 80
      Top = 70
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_mobile'
      TabOrder = 3
    end
    object RzDBEdit5: TRzDBEdit
      Left = 80
      Top = 92
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_fax'
      TabOrder = 4
    end
    object RzDBEdit6: TRzDBEdit
      Left = 80
      Top = 114
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'expressex_mail'
      TabOrder = 5
    end
    object RzDBEdit7: TRzDBEdit
      Left = 80
      Top = 136
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_addr'
      TabOrder = 6
    end
    object RzDBEdit8: TRzDBEdit
      Left = 304
      Top = 4
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_post'
      TabOrder = 7
    end
    object RzDBEdit9: TRzDBEdit
      Left = 304
      Top = 26
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_website'
      TabOrder = 8
    end
    object RzDBEdit10: TRzDBEdit
      Left = 304
      Top = 48
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_msn'
      TabOrder = 9
    end
    object RzDBEdit11: TRzDBEdit
      Left = 304
      Top = 70
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_qq'
      TabOrder = 10
    end
    object RzDBEdit15: TRzDBEdit
      Left = 512
      Top = 4
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'contract_linkmen'
      TabOrder = 11
    end
    object RzDBEdit16: TRzDBEdit
      Left = 512
      Top = 26
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'contract_tel'
      TabOrder = 12
    end
    object RzDBEdit17: TRzDBEdit
      Left = 512
      Top = 48
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'contract_mobile'
      TabOrder = 13
    end
    object RzDBEdit18: TRzDBEdit
      Left = 512
      Top = 70
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'contract_email'
      TabOrder = 14
    end
    object RzDBEdit19: TRzDBEdit
      Left = 512
      Top = 92
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'contract_fax'
      TabOrder = 15
    end
    object RzDBEdit20: TRzDBEdit
      Left = 512
      Top = 114
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'contract_msn'
      TabOrder = 16
    end
    object RzDBEdit21: TRzDBEdit
      Left = 512
      Top = 136
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'contract_qq'
      TabOrder = 17
    end
    object RzDBEdit22: TRzDBEdit
      Left = 720
      Top = 4
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'business_linkmen'
      TabOrder = 18
    end
    object RzDBEdit23: TRzDBEdit
      Left = 720
      Top = 26
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'business_tel'
      TabOrder = 19
    end
    object RzDBEdit24: TRzDBEdit
      Left = 720
      Top = 48
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'business_mobile'
      TabOrder = 20
    end
    object RzDBEdit25: TRzDBEdit
      Left = 720
      Top = 70
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'business_fax'
      TabOrder = 21
    end
    object RzDBEdit26: TRzDBEdit
      Left = 720
      Top = 92
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'business_email'
      TabOrder = 22
    end
    object RzDBEdit27: TRzDBEdit
      Left = 720
      Top = 114
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'business_msn'
      TabOrder = 23
    end
    object RzDBEdit28: TRzDBEdit
      Left = 720
      Top = 136
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'business_qq'
      TabOrder = 24
    end
    object RzDBEdit29: TRzDBEdit
      Left = 936
      Top = 4
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'accounts_linkmen'
      TabOrder = 25
    end
    object RzDBEdit30: TRzDBEdit
      Left = 936
      Top = 26
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'accounts_tel'
      TabOrder = 26
    end
    object RzDBEdit31: TRzDBEdit
      Left = 936
      Top = 48
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'accounts_mobile'
      TabOrder = 27
    end
    object RzDBEdit32: TRzDBEdit
      Left = 936
      Top = 70
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'accounts_fax'
      TabOrder = 28
    end
    object RzDBEdit33: TRzDBEdit
      Left = 936
      Top = 92
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'accounts_email'
      TabOrder = 29
    end
    object RzDBEdit34: TRzDBEdit
      Left = 936
      Top = 114
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'accounts_msn'
      TabOrder = 30
    end
    object RzDBEdit35: TRzDBEdit
      Left = 936
      Top = 136
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'accounts_qq'
      TabOrder = 31
    end
    object RzDBDateTimeEdit1: TRzDBDateTimeEdit
      Left = 304
      Top = 92
      Width = 121
      Height = 21
      DataSource = dmExpressManager.dsTdmExpressList
      DataField = 'express_create'
      TabOrder = 32
      EditType = etDate
    end
    object RzDBMemo1: TRzDBMemo
      Left = 304
      Top = 114
      Width = 121
      Height = 21
      DataField = 'express_info'
      DataSource = dmExpressManager.dsTdmExpressList
      TabOrder = 33
    end
    object RzDBCheckBox1: TRzDBCheckBox
      Left = 304
      Top = 144
      Width = 91
      Height = 15
      DataField = 'express_interface'
      DataSource = dmExpressManager.dsTdmExpressList
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = #26159#21542#25903#25345#25509#21475
      TabOrder = 34
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 217
    Width = 1083
    Height = 257
    Align = alClient
    TabOrder = 2
    object dgeExpressList: TDBGridEh
      Left = 1
      Top = 1
      Width = 1081
      Height = 255
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = dmExpressManager.dsTdmExpressList
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
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
          FieldName = 'id'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'express_no'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'express_name'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'express_tel'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'express_mobile'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'express_fax'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'expressex_mail'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'express_addr'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'express_post'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'express_website'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'express_msn'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'express_qq'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'express_create'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'express_info'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'express_interface'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'express_model'
          Footers = <>
          Visible = False
        end
        item
          EditButtons = <>
          FieldName = 'contract_linkmen'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'contract_tel'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'contract_mobile'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'contract_email'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'contract_fax'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'contract_msn'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'contract_qq'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'business_linkmen'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'business_tel'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'business_mobile'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'business_fax'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'business_email'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'business_msn'
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'business_qq'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'accounts_linkmen'
          Footers = <>
          Width = 100
        end
        item
          EditButtons = <>
          FieldName = 'accounts_tel'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'accounts_mobile'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'accounts_email'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'accounts_fax'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'accounts_msn'
          Footers = <>
          Width = 120
        end
        item
          EditButtons = <>
          FieldName = 'accounts_qq'
          Footers = <>
          Width = 120
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object actlst1: TActionList
    Left = 648
    Top = 281
    object actCreate: TAction
      Caption = 'actCreate'
      OnExecute = actCreateExecute
    end
    object actDelete: TAction
      Caption = 'actDelete'
      OnExecute = actDeleteExecute
    end
    object actUpdate: TAction
      Caption = 'actUpdate'
      OnExecute = actUpdateExecute
    end
    object actRefresh: TAction
      Caption = 'actRefresh'
      OnExecute = actRefreshExecute
    end
  end
  object il1: TImageList
    Left = 648
    Top = 329
    Bitmap = {
      494C01010E000F00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2EFF100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E2EFF100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E2EF
      F100E5E5E500CCCCCC00E5E5E500E2EFF1000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E2EF
      F10000000000CCCCCC00E5E5E500E2EFF1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E2EFF100E5E5E500B2B2
      B200CC9999009966660099666600B2B2B200CCCCCC00E5E5E500E2EFF1000000
      00000000000000000000000000000000000000000000E2EFF10000000000B2B2
      B200999999009999990099999900B2B2B200CCCCCC0000000000E2EFF1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000E5E5E500CC99990099666600CC99
      9900CC999900FFFFFF00996666009999990099999900B2B2B200E5E5E5000000
      0000000000000000000000000000000000000000000099999900999999009999
      990099999900FFFFFF00999999009999990099999900B2B2B200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099666600CC999900FFCC9900FFCC
      9900FFCCCC00FFFFFF0099666600336699003366990033669900E2EFF1000000
      0000000000000000000000000000000000009999990099999900C0C0C000C0C0
      C000CCCCCC00FFFFFF0099999900999999009999990099999900E2EFF1000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099666600FFCC9900FFCC9900FFCC
      9900FFCCCC00FFFFFF009966660066CCCC0066CCCC000099CC00FFFFFF00FFCC
      CC000000000000000000000000000000000099999900C0C0C000C0C0C000C0C0
      C000CCCCCC00FFFFFF0099999900C0C0C000C0C0C00099999900FFFFFF00CCCC
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099666600FFCC9900FFCC9900FFCC
      9900FFCCCC00FFFFFF009966660066CCCC0066CCFF003399CC00FFCCCC00CC66
      00000000000000000000000000000000000099999900C0C0C000C0C0C000C0C0
      C000CCCCCC00FFFFFF0099999900C0C0C000CCCCCC0099999900CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099666600FFCC9900CC999900CC99
      6600FFCCCC00FFFFFF009966660099CCCC0099CCFF00B2B2B200FF660000CC66
      00000000000000000000000000000000000099999900C0C0C000999999009999
      9900CCCCCC00FFFFFF0099999900CCCCCC00CCCCCC00B2B2B200999999009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099666600FFCC990099666600FFFF
      FF00FFCCCC00FFFFFF009966660099CCCC00C0C0C000CC660000CC660000CC66
      0000CC660000CC660000CC6600000000000099999900C0C0C00066666600FFFF
      FF00CCCCCC00FFFFFF0099999900CCCCCC00C0C0C00099999900999999009999
      9900999999009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099666600FFCC9900CC9999009966
      6600FFCCCC00FFFFFF009966660000000000CC660000CC660000CC660000CC66
      0000CC660000CC660000CC6600000000000099999900C0C0C000999999006666
      6600CCCCCC00FFFFFF0099999900E5E5E5009999990099999900999999009999
      9900999999009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099666600FFCC9900FFCC9900FFCC
      9900FFCCCC00FFFFFF009966660000000000CC999900CC660000CC660000CC66
      0000CC660000CC660000CC6600000000000099999900C0C0C000C0C0C000C0C0
      C000CCCCCC00FFFFFF0099999900E5E5E5009999990099999900999999009999
      9900999999009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099666600FFCC9900FFCC9900FFCC
      9900FFCCCC00FFFFFF0099666600CCCCCC00E2EFF100CC999900FF660000CC66
      00000000000000000000000000000000000099999900C0C0C000C0C0C000C0C0
      C000CCCCCC00FFFFFF0099999900CCCCCC00E2EFF10099999900999999009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099666600FFCC9900FFCC9900FFCC
      9900FFCCCC00FFFFFF009966660099CCCC000000000099CCCC00FFCC9900CC66
      00000000000000000000000000000000000099999900C0C0C000C0C0C000C0C0
      C000CCCCCC00FFFFFF0099999900CCCCCC00E5E5E500CCCCCC00C0C0C0009999
      9900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099666600CC999900FFCC9900FFCC
      9900FFCCCC00FFFFFF0099666600CCCCCC00000000003399CC0000000000FFCC
      9900000000000000000000000000000000009999990099999900C0C0C000C0C0
      C000CCCCCC00FFFFFF0099999900CCCCCC00E5E5E5009999990000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000CC996600CC99
      9900CCCC9900FFFFFF00996666000099CC000099CC000099CC00000000000000
      00000000000000000000000000000000000000000000C0C0C000999999009999
      9900C0C0C000FFFFFF0099999900999999009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CCCC
      CC00CC9999009966660099666600000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000CCCC
      CC00999999009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000993300009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000999999009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC66000099330000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000993300009933
      0000993300000000000000000000000000000000000000000000993300009933
      0000993300009933000000000000000000000000000099999900999999009999
      9900999999000000000000000000000000000000000000000000999999009999
      990099999900999999000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000993300000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000099330000CC660000CC66
      0000CC660000CC660000CC660000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999990000000000000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000CC660000993300000000000099330000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00999999000000000099999900CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000099330000CC660000CC66
      00009933000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000099999900CCCCCC00CCCC
      CC009999990099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC660000CC660000CC66000099330000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000099330000CC6600009933
      0000000000000000000099330000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000099999900CCCCCC009999
      9900000000000000000099999900CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000099330000993300000000
      000000000000000000000000000099330000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000099999900999999000000
      000000000000000000000000000099999900CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099330000CC660000CC660000CC66
      0000993300000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000099999900CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000009933
      0000CC660000CC660000CC66000099330000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC0099999900CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC6600009933000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00999999000000000000000000000000000000000099330000CC66
      0000CC660000CC660000993300000000000099330000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00999999000000000099999900CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      0000CC6600009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC009999990000000000000000000000000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000099330000CC660000CC66
      0000CC6600009933000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000993300009933000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000999999009999990000000000000000000000000099330000993300009933
      0000993300000000000000000000000000000000000000000000993300009933
      0000993300009933000000000000000000000000000099999900999999009999
      9900999999000000000000000000000000000000000000000000999999009999
      9900999999009999990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC9966009933000099330000CC9966000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2B2B2009999990099999900B2B2B2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      000099330000CC660000CC660000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009999
      990099999900CCCCCC00CCCCCC00999999000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000099999900999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      990099999900999999000000000000000000000000000000000099330000CC66
      0000CC6600009933000099330000CC9966000000000000000000000000000000
      000000000000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC009999990099999900B2B2B2000000000000000000000000000000
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC6600009933000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC0099999900000000000000000000000000CC99660099330000CC66
      000099330000CC99660000000000000000009933000099330000993300009933
      00009933000099330000993300000000000000000000B2B2B20099999900CCCC
      CC0099999900B2B2B20000000000000000009999990099999900999999009999
      990099999900999999009999990000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      000099330000000000000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00999999000000000000000000000000000000000099330000CC6600009933
      0000CC99660000000000000000000000000099330000CC660000CC660000CC66
      0000CC660000CC66000099330000000000000000000099999900CCCCCC009999
      9900B2B2B20000000000000000000000000099999900CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000009933
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC6600009933
      0000000000000000000000000000000000000000000000000000000000009999
      9900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC009999
      9900000000000000000000000000000000000000000099330000CC6600009933
      0000000000000000000000000000000000000000000099330000CC660000CC66
      0000CC660000CC66000099330000000000000000000099999900CCCCCC009999
      9900000000000000000000000000000000000000000099999900CCCCCC00CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      000099330000CC660000CC660000CC660000CC660000CC660000993300000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099999900CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00999999000000
      0000000000000000000000000000000000000000000099330000CC6600009933
      0000CC99660000000000000000000000000000000000CC99660099330000CC66
      0000CC660000CC66000099330000000000000000000099999900CCCCCC009999
      9900B2B2B20000000000000000000000000000000000B2B2B20099999900CCCC
      CC00CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      00000000000099330000CC660000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000099999900CCCCCC00CCCCCC00CCCCCC0099999900000000000000
      00000000000000000000000000000000000000000000CC99660099330000CC66
      000099330000CC99660000000000CC9966009933000099330000CC6600009933
      0000CC660000CC660000993300000000000000000000B2B2B20099999900CCCC
      CC0099999900B2B2B20000000000B2B2B2009999990099999900CCCCCC009999
      9900CCCCCC00CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000099330000CC6600009933000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC009999990000000000000000000000
      000000000000000000000000000000000000000000000000000099330000CC66
      0000CC660000993300009933000099330000CC660000CC66000099330000CC99
      660099330000CC6600009933000000000000000000000000000099999900CCCC
      CC00CCCCCC00999999009999990099999900CCCCCC00CCCCCC0099999900B2B2
      B20099999900CCCCCC0099999900000000000000000000000000000000000000
      0000000000000000000000000000993300000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000999999000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009933
      000099330000CC660000CC660000CC6600009933000099330000000000000000
      0000000000009933000099330000000000000000000000000000000000009999
      990099999900CCCCCC00CCCCCC00CCCCCC009999990099999900000000000000
      0000000000009999990099999900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CC996600993300009933000099330000CC99660000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000B2B2B200999999009999990099999900B2B2B20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900999999009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000993300009933
      0000993300009933000099330000CC660000CC66000099330000993300009933
      0000993300009933000000000000000000000000000000000000999999009999
      9900999999009999990099999900CCCCCC00CCCCCC0099999900999999009999
      9900999999009999990000000000000000000000000000000000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      990099999900999999000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000993300000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00999999000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000993300000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00999999000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000993300000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00999999000000000000000000000000000000000099330000CC66
      0000CC660000CC660000CC660000CC660000CC660000CC660000CC660000CC66
      0000CC660000993300000000000000000000000000000000000099999900CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC009999990000000000000000000000000000000000993300009933
      0000993300009933000099330000CC660000CC66000099330000993300009933
      0000993300009933000000000000000000000000000000000000999999009999
      9900999999009999990099999900CCCCCC00CCCCCC0099999900999999009999
      9900999999009999990000000000000000000000000000000000993300009933
      0000993300009933000099330000993300009933000099330000993300009933
      0000993300009933000000000000000000000000000000000000999999009999
      9900999999009999990099999900999999009999990099999900999999009999
      9900999999009999990000000000000000000000000000000000000000000000
      0000000000000000000099330000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000CC660000CC66000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900CCCCCC00CCCCCC0099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099330000993300009933000099330000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000099999900999999009999990099999900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FDFFFDFF00000000E0FFE8FF00000000
      801FA05F00000000001F803F00000000001F001F00000000000F000F00000000
      000F000F00000000000F000F0000000000010001000000000101000100000000
      0101000100000000000F000F00000000008F000F0000000000AF002F00000000
      803F803F00000000E1FFE1FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      F3FFF3FFFFFFFFFFE1FFE1FF87C387C3C0FFC0FF83838383807F807FC107C107
      803F803FE00FE00F8C1F8C1FF01FF01F9E0F9E0FF83FF83FFF07FF07F01FF01F
      FF83FF83E00FE00FFFC3FFC3C107C107FFE3FFE383838383FFF3FFF387C387C3
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF0FFF0FFFFFFFFFFE0FFE0FF80038003C0FFC0FF8003800383018301
      C007C00787018701E00FE00F8F818F81F01FF01F87818781F83FF83F82018201
      FC7FFC7FC001C001FEFFFEFFE039E039FFFFFFFFF07FF07FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FC3FFC3FFFFFFFFFFC3FFC3FFFFFFFFFFC3FFC3FFFFFFFFFFC3FFC3FFFFFFFFF
      C003C003C003C003C003C003C003C003C003C003C003C003C003C003C003C003
      FC3FFC3FFFFFFFFFFC3FFC3FFFFFFFFFFC3FFC3FFFFFFFFFFC3FFC3FFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object pm1: TPopupMenu
    Left = 648
    Top = 369
    object actRefresh1: TMenuItem
      Action = actRefresh
      Caption = #21047#26032
    end
    object actCreate1: TMenuItem
      Action = actCreate
      Caption = #22686#21152
    end
    object actDelete1: TMenuItem
      Action = actDelete
      Caption = #21024#38500
    end
    object actUpdate1: TMenuItem
      Action = actUpdate
      Caption = #20462#25913
    end
  end
end
