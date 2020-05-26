object frmProductEdit: TfrmProductEdit
  Left = 194
  Top = 189
  Width = 943
  Height = 482
  Caption = #21830#21697#32534#36753
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
    Width = 935
    Height = 411
    Align = alClient
    TabOrder = 0
    object pnl2: TPanel
      Left = 1
      Top = 1
      Width = 192
      Height = 409
      Align = alLeft
      TabOrder = 0
      object ltvSCatTree: TRzTreeView
        Left = 1
        Top = 1
        Width = 190
        Height = 407
        SelectionPen.Color = clBtnShadow
        Align = alClient
        HideSelection = False
        Indent = 19
        PopupMenu = pmTreeOpt
        ReadOnly = True
        TabOrder = 0
        OnClick = ltvSCatTreeClick
      end
    end
    object pnl4: TPanel
      Left = 193
      Top = 1
      Width = 741
      Height = 409
      Align = alClient
      TabOrder = 1
      object dgeProductList: TDBGridEh
        Left = 1
        Top = 1
        Width = 739
        Height = 407
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dmPCenter.dsShelfPList
        DrawMemoText = True
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        PopupMenu = pmProductOpt
        RowDetailPanel.Color = clBtnFace
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleBtnClick = dgeProductListTitleBtnClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'p_id'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'chineseN'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'englishN'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'shortname'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'pic_path'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'p_price'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'type'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'bcat_id'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'scat_id'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'keyword'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'brand_id'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'weight'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'factory'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'sale_unit'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'create_by'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'create_date'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'last_update_by'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'last_update_date'
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
              #24453#19978#26550
              #24050#19978#26550
              #24050#19979#26550)
            Title.TitleButton = True
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.TitleButton = True
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'sku'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'sn'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'brand_name'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'spec'
            Footers = <>
            Title.TitleButton = True
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'color'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'p_color'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'p_size'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'ean'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'title'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'brief'
            Footers = <>
            Title.TitleButton = True
            Width = 180
          end
          item
            EditButtons = <>
            FieldName = 'descript'
            Footers = <>
            Title.TitleButton = True
            Width = 180
          end
          item
            EditButtons = <>
            FieldName = 'tag'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'score'
            Footers = <>
            Title.TitleButton = True
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'origin'
            Footers = <>
            Title.TitleButton = True
            Width = 150
          end
          item
            EditButtons = <>
            FieldName = 'execute_std'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'supplier_no'
            Footers = <>
            Visible = False
          end
          item
            EditButtons = <>
            FieldName = 'style_type'
            Footers = <>
            Title.TitleButton = True
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'lining'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'material'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'technics'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'padding'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'padding_weight'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'wash_exp'
            Footers = <>
            Title.TitleButton = True
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'warm_hint'
            Footers = <>
            Title.TitleButton = True
            Width = 120
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
            Title.TitleButton = True
            Width = 60
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  object pnl3: TPanel
    Left = 0
    Top = 411
    Width = 935
    Height = 37
    Align = alBottom
    TabOrder = 1
    object pnl5: TPanel
      Left = 813
      Top = 1
      Width = 121
      Height = 35
      Align = alRight
      TabOrder = 0
      object btnOk: TRzBitBtn
        Left = 24
        Top = 4
        Caption = #30830#23450
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
    end
    object pnl6: TPanel
      Left = 1
      Top = 1
      Width = 812
      Height = 35
      Align = alClient
      TabOrder = 1
    end
  end
  object pmTreeOpt: TPopupMenu
    Left = 81
    Top = 177
    object N3: TMenuItem
      Caption = #28155#21152
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = #21024#38500
      OnClick = N4Click
    end
    object N5: TMenuItem
      Caption = #20462#25913
      OnClick = N5Click
    end
    object N6: TMenuItem
      Caption = #21516#27493#39318#39029#30446#24405
      OnClick = N6Click
    end
  end
  object pmProductOpt: TPopupMenu
    Left = 609
    Top = 177
    object N7: TMenuItem
      Caption = #28155#21152#21830#21697
      OnClick = N7Click
    end
    object N8: TMenuItem
      Caption = #21024#38500#21830#21697
      OnClick = N8Click
    end
    object N9: TMenuItem
      Caption = #20215#26684#35774#32622
      OnClick = N9Click
    end
    object N2: TMenuItem
      Caption = #35774#32622#21830#21697#23646#24615
      OnClick = N2Click
    end
    object N1: TMenuItem
      Caption = #35774#32622#21830#21697#22270#29255
      OnClick = N1Click
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
    Left = 81
    Top = 113
  end
end
