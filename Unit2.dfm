object frmSubRamo: TfrmSubRamo
  Left = 0
  Top = 0
  Caption = 'Sub - Ramos'
  ClientHeight = 368
  ClientWidth = 718
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 36
    Width = 702
    Height = 324
    Caption = 'Panel1'
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 8
      Top = 8
      Width = 685
      Height = 120
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object cboSubRamo: TComboBox
    Left = 296
    Top = 9
    Width = 145
    Height = 21
    TabOrder = 1
    OnChange = cboSubRamoChange
    Items.Strings = (
      '1'
      '2'
      '3')
  end
  object Panel2: TPanel
    Left = 8
    Top = 36
    Width = 702
    Height = 324
    Caption = 'Panel2'
    TabOrder = 2
    Visible = False
    object DBGrid2: TDBGrid
      Left = 8
      Top = 8
      Width = 685
      Height = 120
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 36
    Width = 702
    Height = 324
    Caption = 'Panel3'
    TabOrder = 3
    Visible = False
    object DBGrid3: TDBGrid
      Left = 8
      Top = 8
      Width = 685
      Height = 120
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object MainMenu1: TMainMenu
    Left = 688
    object CadUsurio1: TMenuItem
      Caption = 'Menu'
      Enabled = False
      object CadUsurio2: TMenuItem
        Caption = 'Cad. Usu'#225'rio'
        OnClick = CadUsurio2Click
      end
      object Lanamentos1: TMenuItem
        Caption = 'Lan'#231'amentos'
      end
    end
    object Fechar1: TMenuItem
      Caption = 'Fechar'
      OnClick = Fechar1Click
    end
  end
end
