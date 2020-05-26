object frmEStOPDel: TfrmEStOPDel
  Left = 457
  Top = 308
  BorderStyle = bsDialog
  Caption = #21024#38500#21830#21697
  ClientHeight = 102
  ClientWidth = 316
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
    Top = 66
    Width = 316
    CaptionOk = #30830#23450
    CaptionCancel = #21462#28040
    WidthOk = 50
    WidthCancel = 50
    TabOrder = 0
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 316
    Height = 66
    Align = alClient
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 24
      Top = 8
      Width = 273
      Height = 13
      Caption = #37096#20998#21830#21697#24050#32463#20837#24211#65292#21482#33021#21024#38500#26410#20837#24211#21830#21697#25968#37327#65281
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #40657#20307
      Font.Style = []
      ParentFont = False
    end
    object RzLabel2: TRzLabel
      Left = 24
      Top = 36
      Width = 81
      Height = 13
      Caption = #21487#21024#38500#25968#37327#65306
    end
    object RzLabel3: TRzLabel
      Left = 176
      Top = 36
      Width = 60
      Height = 13
      Caption = #21024#38500#25968#37327#65306
    end
    object RzNumericEdit1: TRzNumericEdit
      Left = 104
      Top = 32
      Width = 65
      Height = 21
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
      DisplayFormat = '0;(0)'
    end
    object RzNumericEdit2: TRzNumericEdit
      Left = 240
      Top = 32
      Width = 65
      Height = 21
      TabOrder = 1
      OnChange = RzNumericEdit2Change
      DisplayFormat = ',0;(,0)'
    end
  end
end
