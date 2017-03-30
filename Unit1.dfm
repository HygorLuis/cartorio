object frmLogin: TfrmLogin
  Left = 541
  Top = 295
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Login'
  ClientHeight = 147
  ClientWidth = 193
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 35
    Top = 13
    Width = 121
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 35
    Top = 59
    Width = 121
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Senha'
  end
  object txtUsuario: TEdit
    Left = 35
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object txtSenha: TEdit
    Left = 35
    Top = 75
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object btnEntrar: TBitBtn
    Left = 112
    Top = 112
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Entrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnEntrarClick
  end
  object btnFechar: TBitBtn
    Left = 8
    Top = 112
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Fechar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnFecharClick
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=carto' +
      'rio'
    LoginPrompt = False
    Left = 16
    Top = 144
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM usuario WHERE (excluido IS NULL OR excluido != 1);')
    Left = 48
    Top = 144
  end
end
