object frmExpressInfo: TfrmExpressInfo
  Left = 361
  Top = 233
  BorderStyle = bsDialog
  Caption = #24555#36882#20449#24687
  ClientHeight = 277
  ClientWidth = 656
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 656
    Height = 241
    Align = alClient
    TabOrder = 0
    object dgeEList: TDBGridEh
      Left = 1
      Top = 1
      Width = 654
      Height = 239
      Align = alClient
      DataGrouping.GroupLevels = <>
      DataSource = dmDepotCenter.dsExpInfo
      DrawMemoText = True
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
          FieldName = 'express_no'
          Footers = <>
          Width = 150
        end
        item
          EditButtons = <>
          FieldName = 'express_name'
          Footers = <>
          Width = 180
        end
        item
          EditButtons = <>
          FieldName = 'express_info'
          Footers = <>
          Width = 280
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 241
    Width = 656
    CaptionOk = #30830#23450
    CaptionCancel = #21462#28040
    OnClickOk = RzDialogButtons1ClickOk
    OnClickCancel = RzDialogButtons1ClickCancel
    TabOrder = 1
  end
end
