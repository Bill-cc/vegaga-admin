object frmSetPicture: TfrmSetPicture
  Left = 291
  Top = 247
  Width = 716
  Height = 340
  Caption = #35774#32622#22270#29255
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
    Width = 708
    Height = 41
    Align = alTop
    TabOrder = 0
    object RzLabel1: TRzLabel
      Left = 8
      Top = 16
      Width = 60
      Height = 13
      Caption = #21830#21697#21517#31216#65306
    end
    object RzLabel2: TRzLabel
      Left = 336
      Top = 16
      Width = 58
      Height = 13
      Caption = #21830#21697'SKU'#65306
    end
    object RzDBEdit1: TRzDBEdit
      Left = 72
      Top = 12
      Width = 257
      Height = 21
      DataSource = dmPCenter.dsShelfPList
      DataField = 'name'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 0
    end
    object RzDBEdit2: TRzDBEdit
      Left = 392
      Top = 12
      Width = 129
      Height = 21
      DataSource = dmPCenter.dsShelfPList
      DataField = 'sku'
      ReadOnly = True
      Color = clInfoBk
      TabOrder = 1
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 73
    Width = 708
    Height = 199
    Align = alClient
    TabOrder = 1
    object pnl6: TPanel
      Left = 1
      Top = 1
      Width = 480
      Height = 197
      Align = alLeft
      TabOrder = 0
      object dgeImageList: TDBGridEh
        Left = 1
        Top = 1
        Width = 478
        Height = 195
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dmPCenter.dsImageList
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        PopupMenu = pmOpt
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = dgeImageListCellClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'obj_id'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'obj_type'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'pic_type'
            Footers = <>
            KeyList.Strings = (
              '1'
              '2'
              '3')
            PickList.Strings = (
              #21830#21697#20027#22270
              #35814#24773#22270#29255
              #24187#28783#22270#29255)
            Width = 80
          end
          item
            EditButtons = <>
            FieldName = 'pic_path'
            Footers = <>
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'pic_explain'
            Footers = <>
            Visible = False
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'pic_m_path'
            Footers = <>
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'pic_s_path'
            Footers = <>
            Width = 150
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
    object pnl7: TPanel
      Left = 481
      Top = 1
      Width = 226
      Height = 197
      Align = alClient
      TabOrder = 1
      object pnl8: TPanel
        Left = 1
        Top = 1
        Width = 224
        Height = 195
        Align = alClient
        TabOrder = 0
        object WebImage1: TWebImage
          Left = 1
          Top = 1
          Width = 222
          Height = 193
          Animate = False
          Async = True
          AutoSize = True
          CheckContentLength = False
          WebPicture.Stretch = False
          WebPicture.Frame = 0
          PicturePosition = bpStretchedWithAspectRatio
          Align = alClient
          Version = '1.2.0.0'
        end
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 272
    Width = 708
    Height = 34
    Align = alBottom
    TabOrder = 2
    object pnl4: TPanel
      Left = 582
      Top = 1
      Width = 125
      Height = 32
      Align = alRight
      TabOrder = 0
      object btnOK: TRzBitBtn
        Left = 24
        Top = 4
        Caption = #30830#23450
        TabOrder = 0
        OnClick = btnOKClick
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
      Width = 581
      Height = 32
      Align = alClient
      TabOrder = 1
      object RzLabel3: TRzLabel
        Left = 16
        Top = 8
        Width = 84
        Height = 13
        Caption = #22270#29255#19978#20256#36335#24452#65306
      end
      object edtPath: TRzEdit
        Left = 112
        Top = 4
        Width = 393
        Height = 21
        Text = 'http://img.vegaga.com/servlet/UploadServlet.do'
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 0
      end
      object btnxiugai: TRzButton
        Left = 512
        Top = 4
        Width = 57
        Height = 21
        Caption = #20462#25913
        TabOrder = 1
        OnClick = btnxiugaiClick
      end
    end
  end
  object pnl10: TPanel
    Left = 0
    Top = 41
    Width = 708
    Height = 32
    Align = alTop
    TabOrder = 3
    object RzLabel4: TRzLabel
      Left = 8
      Top = 8
      Width = 60
      Height = 13
      Caption = #22270#29255#31867#22411#65306
    end
    object RzComboBox1: TRzComboBox
      Left = 72
      Top = 6
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      Text = #21830#21697#20027#22270
      Items.Strings = (
        #21830#21697#20027#22270
        #35814#24773#22270#29255
        #24187#28783#22270#29255)
      ItemIndex = 0
      Values.Strings = (
        '1'
        '2'
        '3')
    end
    object btnUpload: TRzBitBtn
      Left = 200
      Top = 6
      Width = 81
      Height = 21
      Caption = #36873#25321#22270#29255
      TabOrder = 1
      OnClick = btnUploadClick
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
        0000000000000000000000000000000000000000000000000000E8A3A3A3CECE
        CECECECECECECECECECEE8818181ACACACACACACACACACACACACCECEA3A3A3CE
        CECECECECECECECECECEACAC818181ACACACACACACACACACACACCECECE12D9D9
        CE79797979A3CECECE79ACACAC818181AC8181818181ACACAC81CECECE121ED9
        CEA3A4A4A3CECECECECEACACAC81AC81AC81ACAC81ACACACACACCECECE121ED9
        CECEA3A3CECE7979CECEACACAC81AC81ACAC8181ACAC8181ACACCECECE121E1E
        D9CECECECECECECECECEACACAC81ACAC81ACACACACACACACACACCECECE121E3D
        1ED9CECECECECECECECEACACAC81ACACAC81ACACACACACACACAC8962D91E1E12
        1E1E1289898989898989E8AC81ACAC81ACAC81E8E8E8E8E8E8E889121E121ED9
        121E1289898989898989E881AC81AC8181AC81E8E8E8E8E8E8E889121E121ED9
        62126289898989898989E881AC81AC81AC81ACE8E8E8E8E8E8E889121E121ED9
        8989898989CCCCCC8989E881AC81AC81E8E8E8E8E8818181E8E8896212121ED9
        89898989CCD4D4D4CC89E8AC8181AC81E8E8E8E881ACACAC81E8898989121ED9
        89898989CCD4D4D4CC89E8E8E881AC81E8E8E8E881ACACAC81E8898989621262
        89898989CCD4D4D4CC89E8E8E8AC81ACE8E8E8E881ACACAC81E8898989898989
        8989898989CCCCCC8989E8E8E8E8E8E8E8E8E8E8E8818181E8E8898989898989
        89898989898989898989E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object btnSave: TRzBitBtn
      Left = 648
      Top = 6
      Width = 57
      Height = 21
      Caption = #19978#20256
      TabOrder = 2
      OnClick = btnSaveClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000530B0000530B00000001000000000000000000003300
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
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809
        09090909E8E8E8E8E8E8E8E8E8E8E88181818181E8E8E8E8E8E8E8E8E8E8E809
        10101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8E8E809
        10101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8E8E809
        10101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8E8E809
        10101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8E8E809
        10101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E809090909
        10101009090909E8E8E8E8E881818181ACACAC81818181E8E8E8E8E809101010
        10101010101009E8E8E8E8E881ACACACACACACACACAC81E8E8E8E8E809101010
        10101010101009E8E8E8E8E881ACACACACACACACACAC81E8E8E8E8E8E8091010
        101010101009E8E8E8E8E8E8E881ACACACACACACAC81E8E8E8E8E8E8E8E80910
        1010101009E8E8E8E8E8E8E8E8E881ACACACACAC81E8E8E8E8E8E8E8E8E8E809
        10101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8E8E8E8
        091009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8E8E8E8E8E8
        E809E8E8E8E8E8E8E8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
      NumGlyphs = 2
    end
    object edtImageLocalPath: TRzEdit
      Left = 288
      Top = 6
      Width = 353
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 3
    end
  end
  object IdHTTP: TIdHTTP
    MaxLineAction = maException
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 640
    Top = 1
  end
  object pmOpt: TPopupMenu
    Left = 521
    Top = 146
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
  object dlgOpen: TOpenDialog
    Title = #36873#25321#22270#29255
    Left = 610
    Top = 3
  end
end
