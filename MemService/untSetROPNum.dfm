object frmSetROPNum: TfrmSetROPNum
  Left = 425
  Top = 287
  BorderStyle = bsDialog
  Caption = #35774#32622#36864#36135#25968#37327
  ClientHeight = 107
  ClientWidth = 352
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
  object RzDialogButtons1: TRzDialogButtons
    Left = 0
    Top = 71
    Width = 352
    CaptionOk = #30830#23450
    CaptionCancel = #21462#28040
    OnClickOk = RzDialogButtons1ClickOk
    OnClickCancel = RzDialogButtons1ClickCancel
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 352
    Height = 71
    Align = alClient
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 8
      Top = 16
      Width = 60
      Height = 13
      Caption = #21830#21697#21517#31216#65306
    end
    object RzLabel2: TRzLabel
      Left = 208
      Top = 16
      Width = 58
      Height = 13
      Caption = #21830#21697'SKU'#65306
    end
    object RzLabel3: TRzLabel
      Left = 8
      Top = 45
      Width = 72
      Height = 13
      Caption = #21487#36864#36135#25968#37327#65306
    end
    object RzLabel4: TRzLabel
      Left = 160
      Top = 45
      Width = 60
      Height = 13
      Caption = #36864#36135#25968#37327#65306
    end
    object edt1: TRzEdit
      Left = 64
      Top = 12
      Width = 137
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
    object edt2: TRzEdit
      Left = 264
      Top = 12
      Width = 73
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 1
    end
    object RzNumericEdit1: TRzNumericEdit
      Left = 80
      Top = 42
      Width = 65
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 2
      DisplayFormat = ',0;(,0)'
    end
    object RzNumericEdit2: TRzNumericEdit
      Left = 224
      Top = 42
      Width = 65
      Height = 21
      TabOrder = 3
      OnChange = RzNumericEdit2Change
      Max = 1.000000000000000000
      Min = 1.000000000000000000
      Value = 1.000000000000000000
      DisplayFormat = ',0;(,0)'
    end
  end
end
