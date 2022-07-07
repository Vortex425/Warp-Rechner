object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Warp-Rechner'
  ClientHeight = 631
  ClientWidth = 681
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ImgBackground: TImage
    Left = 0
    Top = 0
    Width = 681
    Height = 631
    Align = alClient
    AutoSize = True
    Center = True
    Proportional = True
    Stretch = True
    ExplicitTop = 8
  end
  object LblGeschwKM: TLabel
    Left = 179
    Top = 359
    Width = 342
    Height = 39
    Caption = 'Geschwindigkeit in km/s'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblGeschwLY: TLabel
    Left = 179
    Top = 304
    Width = 332
    Height = 39
    Caption = 'Geschwindigkeit in LJ/h'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblGschwCochrane: TLabel
    Left = 179
    Top = 253
    Width = 406
    Height = 39
    Caption = 'Geschwindigkeit in Cochrane'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblWF: TLabel
    Left = 179
    Top = 198
    Width = 178
    Height = 39
    Caption = 'Warp-Faktor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblTitel: TLabel
    Left = 96
    Top = 21
    Width = 686
    Height = 77
    Alignment = taCenter
    Caption = 'Star Trek Warp-Rechner'
    Color = 16448255
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
  end
  object EdtWarpF: TEdit
    Left = 32
    Top = 198
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object EdtLJdieH: TEdit
    Left = 32
    Top = 304
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object EdtKMdieS: TEdit
    Left = 32
    Top = 359
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object EdtCochrane: TEdit
    Left = 32
    Top = 253
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object BtnBerechnung: TButton
    Left = 32
    Top = 416
    Width = 113
    Height = 49
    Caption = 'Berechnung'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = BtnBerechnungClick
  end
  object BtnNostalgie: TButton
    Left = 590
    Top = 590
    Width = 75
    Height = 25
    Caption = 'Nostalgie'
    TabOrder = 0
    OnClick = BtnNostalgieClick
  end
  object BtnCloseVid: TButton
    Left = 590
    Top = 551
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 2
    Visible = False
    OnClick = BtnCloseVidClick
  end
  object WindowsMediaPlayer1: TWindowsMediaPlayer
    Left = 32
    Top = 104
    Width = 633
    Height = 441
    TabOrder = 1
    Visible = False
    ControlData = {
      0003000008000200000000000500000000000000F03F03000000000005000000
      00000000000008000200000000000300010000000B00FFFF0300000000000B00
      FFFF08000200000000000300150000000B00000008000A0000006E006F006E00
      650000000B0000000B0000000B00FFFF0B00FFFF0B0000000800020000000000
      0800020000000000080002000000000008000200000000000B0000006C410000
      942D0000}
  end
end
