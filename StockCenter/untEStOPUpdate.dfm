object frmEStOPUpdate: TfrmEStOPUpdate
  Left = 460
  Top = 354
  BorderStyle = bsDialog
  Caption = #20462#25913#21830#21697#25968#37327
  ClientHeight = 79
  ClientWidth = 334
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
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 43
    Width = 334
    CaptionOk = #30830#23450
    CaptionCancel = #21462#28040
    WidthOk = 50
    WidthCancel = 50
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 43
    Align = alClient
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 8
      Top = 16
      Width = 96
      Height = 13
      Caption = #21487#20462#25913#26368#20302#25968#37327#65306
    end
    object RzLabel2: TRzLabel
      Left = 192
      Top = 16
      Width = 60
      Height = 13
      Caption = #20462#25913#25968#37327#65306
    end
    object RzNumericEdit1: TRzNumericEdit
      Left = 112
      Top = 12
      Width = 65
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
      DisplayFormat = '0;(0)'
    end
    object RzNumericEdit2: TRzNumericEdit
      Left = 256
      Top = 12
      Width = 65
      Height = 21
      TabOrder = 1
      OnChange = RzNumericEdit2Change
      DisplayFormat = '0;(0)'
    end
  end
end
