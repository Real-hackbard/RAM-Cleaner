object Form1: TForm1
  Left = 839
  Top = 113
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Memory Cleaner'
  ClientHeight = 731
  ClientWidth = 394
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 7
    Top = 7
    Width = 378
    Height = 698
    ActivePage = TabSheet1
    TabOrder = 0
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = 'Cleaner'
      object Label8: TLabel
        Left = 8
        Top = 598
        Width = 67
        Height = 13
        Caption = 'Progress : 0 %'
      end
      object Label3: TLabel
        Left = 8
        Top = 430
        Width = 105
        Height = 13
        Caption = 'Memory Leak Report :'
      end
      object Panel1: TPanel
        Left = 7
        Top = 6
        Width = 354
        Height = 411
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -11
        Font.Name = 'Lucida Console'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object Label1: TLabel
          Left = 11
          Top = 8
          Width = 138
          Height = 17
          Caption = 'Memory Information :'
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clSilver
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold, fsUnderline]
          ParentColor = False
          ParentFont = False
        end
        object Label5: TLabel
          Left = 12
          Top = 48
          Width = 105
          Height = 11
          Caption = 'Available RAM :'
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label2: TLabel
          Left = 11
          Top = 32
          Width = 84
          Height = 11
          Caption = 'Total RAM : '
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label9: TLabel
          Left = 11
          Top = 64
          Width = 112
          Height = 11
          Caption = 'Total Pagefile :'
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label11: TLabel
          Left = 11
          Top = 80
          Width = 140
          Height = 11
          Caption = 'Available Pagefile :'
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label12: TLabel
          Left = 11
          Top = 96
          Width = 112
          Height = 11
          Caption = 'Total Virtuell :'
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label13: TLabel
          Left = 11
          Top = 112
          Width = 133
          Height = 11
          Caption = 'Available Virtuel :'
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label15: TLabel
          Left = 11
          Top = 143
          Width = 126
          Height = 11
          Caption = 'Memory Leak Size :'
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label14: TLabel
          Left = 11
          Top = 127
          Width = 133
          Height = 11
          Caption = 'Memory Leak Count :'
          Color = clBtnFace
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label16: TLabel
          Left = 11
          Top = 368
          Width = 98
          Height = 11
          Caption = 'Usage Memory :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clSilver
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label17: TLabel
          Left = 11
          Top = 160
          Width = 112
          Height = 11
          Caption = 'Data Structure :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label4: TLabel
          Left = 11
          Top = 176
          Width = 119
          Height = 11
          Caption = 'Current Process :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label18: TLabel
          Left = 171
          Top = 192
          Width = 91
          Height = 11
          Caption = 'Memory Loss :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label21: TLabel
          Left = 10
          Top = 208
          Width = 112
          Height = 11
          Caption = 'Virtual Commit :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label22: TLabel
          Left = 10
          Top = 224
          Width = 119
          Height = 11
          Caption = 'Virtual Reserve :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label23: TLabel
          Left = 10
          Top = 240
          Width = 126
          Height = 11
          Caption = 'Virtual Decommit :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label24: TLabel
          Left = 10
          Top = 256
          Width = 119
          Height = 11
          Caption = 'Virtual Release :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label25: TLabel
          Left = 10
          Top = 272
          Width = 98
          Height = 11
          Caption = 'Virtual Free :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label26: TLabel
          Left = 10
          Top = 288
          Width = 119
          Height = 11
          Caption = 'Virtual Private :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label27: TLabel
          Left = 10
          Top = 304
          Width = 112
          Height = 11
          Caption = 'Virtual Mapped :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label28: TLabel
          Left = 10
          Top = 320
          Width = 105
          Height = 11
          Caption = 'Virtual Reset :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label29: TLabel
          Left = 10
          Top = 336
          Width = 126
          Height = 11
          Caption = 'Virtual Top Down :'
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
        end
        object Label30: TLabel
          Left = 10
          Top = 192
          Width = 154
          Height = 11
          Caption = 'Memory Loss          :'
          Font.Charset = ANSI_CHARSET
          Font.Color = clLime
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          ParentFont = False
        end
        object ProgressBar2: TProgressBar
          Left = 8
          Top = 384
          Width = 337
          Height = 17
          TabOrder = 0
        end
      end
      object ProgressBar1: TProgressBar
        Left = 7
        Top = 616
        Width = 354
        Height = 17
        TabOrder = 1
      end
      object BitBtn1: TBitBtn
        Left = 5
        Top = 642
        Width = 106
        Height = 23
        Caption = '&Clean'
        NumGlyphs = 2
        TabOrder = 2
        TabStop = False
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 275
        Top = 642
        Width = 85
        Height = 23
        Caption = '&Abort'
        NumGlyphs = 2
        TabOrder = 3
        TabStop = False
        OnClick = BitBtn2Click
      end
      object Memo1: TMemo
        Left = 8
        Top = 448
        Width = 353
        Height = 137
        TabStop = False
        ScrollBars = ssBoth
        TabOrder = 4
      end
      object Button2: TButton
        Left = 120
        Top = 427
        Width = 48
        Height = 18
        Caption = 'Refresh'
        TabOrder = 5
        TabStop = False
        OnClick = Button2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Options'
      ImageIndex = 1
      object Label6: TLabel
        Left = 20
        Top = 56
        Width = 80
        Height = 14
        Caption = 'Try to free (MB):'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 12
        Top = 96
        Width = 90
        Height = 14
        Caption = 'Elapsed time (min):'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 180
        Top = 59
        Width = 66
        Height = 13
        Caption = 'Free memory: '
      end
      object SpinEdit2: TSpinEdit
        Left = 107
        Top = 53
        Width = 66
        Height = 22
        TabStop = False
        Increment = 5
        MaxLength = 3
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
      object SpinEdit3: TSpinEdit
        Left = 107
        Top = 93
        Width = 66
        Height = 22
        TabStop = False
        Increment = 5
        MaxLength = 4
        MaxValue = 3600
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object CheckBox1: TCheckBox
        Left = 16
        Top = 165
        Width = 113
        Height = 18
        TabStop = False
        Caption = 'Auto Defrag (slow)'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 16
        Top = 196
        Width = 85
        Height = 17
        TabStop = False
        Caption = 'Zero Memory'
        TabOrder = 3
      end
      object CheckBox3: TCheckBox
        Left = 200
        Top = 164
        Width = 92
        Height = 17
        TabStop = False
        Caption = 'Available RAM'
        TabOrder = 4
        OnClick = CheckBox3Click
      end
      object CheckBox4: TCheckBox
        Left = 200
        Top = 196
        Width = 89
        Height = 17
        TabStop = False
        Caption = 'Total Pagefile'
        TabOrder = 5
        OnClick = CheckBox4Click
      end
      object CheckBox5: TCheckBox
        Left = 200
        Top = 228
        Width = 109
        Height = 17
        TabStop = False
        Caption = 'Availlable Pagefile'
        TabOrder = 6
        OnClick = CheckBox5Click
      end
      object CheckBox6: TCheckBox
        Left = 200
        Top = 260
        Width = 81
        Height = 17
        TabStop = False
        Caption = 'Total Virtuell'
        TabOrder = 7
        OnClick = CheckBox6Click
      end
      object CheckBox7: TCheckBox
        Left = 200
        Top = 292
        Width = 98
        Height = 17
        TabStop = False
        Caption = 'Available Virtuel'
        TabOrder = 8
        OnClick = CheckBox7Click
      end
      object CheckBox8: TCheckBox
        Left = 16
        Top = 228
        Width = 129
        Height = 17
        TabStop = False
        Caption = 'Process Memory Leak'
        TabOrder = 9
        OnClick = CheckBox8Click
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 504
        Width = 337
        Height = 145
        Caption = ' Speed :'
        TabOrder = 10
        object Label19: TLabel
          Left = 16
          Top = 32
          Width = 71
          Height = 13
          Caption = 'Memory Scan :'
        end
        object Label20: TLabel
          Left = 16
          Top = 88
          Width = 73
          Height = 13
          Caption = 'Debug Process'
        end
        object ScrollBar1: TScrollBar
          Left = 32
          Top = 56
          Width = 281
          Height = 17
          Max = 1000
          Min = 1
          PageSize = 0
          Position = 1
          TabOrder = 0
          TabStop = False
          OnChange = ScrollBar1Change
        end
        object ScrollBar2: TScrollBar
          Left = 32
          Top = 112
          Width = 281
          Height = 17
          Max = 1000
          Min = 1
          PageSize = 0
          Position = 1
          TabOrder = 1
          TabStop = False
          OnChange = ScrollBar2Change
        end
      end
      object CheckBox9: TCheckBox
        Left = 16
        Top = 260
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'Virtual Extended'
        TabOrder = 11
        OnClick = CheckBox9Click
      end
      object CheckBox10: TCheckBox
        Left = 16
        Top = 292
        Width = 95
        Height = 17
        Caption = 'Debug Process'
        TabOrder = 12
        OnClick = CheckBox10Click
      end
      object RadioGroup1: TRadioGroup
        Left = 16
        Top = 365
        Width = 337
        Height = 105
        Caption = ' Buffer '
        Columns = 2
        ItemIndex = 2
        Items.Strings = (
          '1024 (slow)'
          '2048 (normal)'
          '4096 (fast)'
          '8192 (very gfast)')
        TabOrder = 13
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 712
    Width = 394
    Height = 19
    Panels = <
      item
        Text = 'ready.'
        Width = 100
      end
      item
        Text = 'Memory Address :'
        Width = 170
      end
      item
        Width = 50
      end>
    ExplicitTop = 711
    ExplicitWidth = 390
  end
  object Timer1: TTimer
    Interval = 300
    OnTimer = Timer1Timer
    Left = 334
    Top = 49
  end
  object Timer2: TTimer
    Interval = 500
    OnTimer = Timer2Timer
    Left = 257
    Top = 137
  end
  object PopupMenu1: TPopupMenu
    Left = 259
    Top = 54
    object DefragmentMem1: TMenuItem
      Caption = 'DefragmentMem'
      OnClick = DefragmentMem1Click
    end
    object Minimize1: TMenuItem
      Caption = 'Minimize'
    end
    object Maximize1: TMenuItem
      Caption = 'Maximize'
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Close1: TMenuItem
      Tag = 10
      Caption = 'Close'
      OnClick = Close1Click
    end
  end
  object jsMaxMem1: TjsMaxMem
    OnProgress = jsMaxMem1Progress
    Left = 249
    Top = 289
  end
end
