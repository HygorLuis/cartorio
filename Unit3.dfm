object frmUsuario: TfrmUsuario
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 506
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 423
    Top = 229
    Width = 43
    Height = 13
    Caption = 'idusuario'
    FocusControl = txtID
    Visible = False
  end
  object lblNome: TLabel
    Left = 32
    Top = 232
    Width = 134
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nome'
    FocusControl = txtNome
  end
  object lblSenha: TLabel
    Left = 534
    Top = 37
    Width = 99
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Senha'
    FocusControl = txtSenha
  end
  object lblUsuario: TLabel
    Left = 414
    Top = 40
    Width = 99
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Usu'#225'rio'
    FocusControl = txtUsuario
  end
  object lblPermissao: TLabel
    Left = 473
    Top = 101
    Width = 100
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Permiss'#227'o'
    FocusControl = txtPermissao
  end
  object lblRua: TLabel
    Left = 32
    Top = 323
    Width = 134
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Rua'
    FocusControl = txtRua
  end
  object Label7: TLabel
    Left = 192
    Top = 323
    Width = 134
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Complemento'
    FocusControl = txtComp
  end
  object lblNumero: TLabel
    Left = 352
    Top = 323
    Width = 49
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Numero'
    FocusControl = txtNumero
  end
  object lblCEP: TLabel
    Left = 192
    Top = 373
    Width = 81
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'CEP'
    FocusControl = txtCEP
  end
  object lblCidade: TLabel
    Left = 32
    Top = 435
    Width = 134
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Cidade'
    FocusControl = txtCidade
  end
  object lblUf: TLabel
    Left = 192
    Top = 435
    Width = 33
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'UF'
    FocusControl = txtUF
  end
  object Label6: TLabel
    Left = 32
    Top = 376
    Width = 134
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Bairro'
    FocusControl = txtBairro
  end
  object lblDD1: TLabel
    Left = 489
    Top = 323
    Width = 33
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'DD'
    FocusControl = txtDD1
  end
  object lblTelefone1: TLabel
    Left = 545
    Top = 323
    Width = 78
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Telefone 1'
    FocusControl = txtTel1
  end
  object lblDD2: TLabel
    Left = 489
    Top = 376
    Width = 33
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'DD'
    FocusControl = txtDD2
  end
  object lblTel2: TLabel
    Left = 545
    Top = 376
    Width = 78
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Telefone 2'
    FocusControl = txtTel2
  end
  object lblCPF: TLabel
    Left = 192
    Top = 232
    Width = 134
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'CPF'
    FocusControl = txtCPF
  end
  object Label2: TLabel
    Left = 489
    Top = 232
    Width = 72
    Height = 13
    Caption = 'UsuarioCriacao'
    FocusControl = txtUsuarioCriacao
    Visible = False
  end
  object Label3: TLabel
    Left = 571
    Top = 232
    Width = 59
    Height = 13
    Caption = 'DataCriacao'
    FocusControl = txtDataCriacao
    Visible = False
  end
  object GroupBox4: TGroupBox
    Left = 24
    Top = 215
    Width = 313
    Height = 74
    Caption = 'Usu'#225'rio'
    TabOrder = 27
  end
  object GroupBox3: TGroupBox
    Left = 473
    Top = 302
    Width = 171
    Height = 129
    Caption = 'Fone(s)'
    TabOrder = 26
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 302
    Width = 393
    Height = 196
    Caption = 'Endere'#231'o'
    TabOrder = 25
  end
  object GroupBox1: TGroupBox
    Left = 399
    Top = 16
    Width = 245
    Height = 133
    Caption = 'Login'
    TabOrder = 24
    object chkSenha: TCheckBox
      Left = 152
      Top = 62
      Width = 97
      Height = 17
      Caption = 'Mostrar Senha'
      Enabled = False
      TabOrder = 0
      OnClick = chkSenhaClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 16
    Width = 361
    Height = 133
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgCancelOnExit, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'idusuario'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Login'
        Title.Alignment = taCenter
        Title.Caption = 'Usu'#225'rio'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Adm'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object txtID: TDBEdit
    Left = 423
    Top = 248
    Width = 43
    Height = 21
    DataField = 'idusuario'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 22
    Visible = False
  end
  object txtNome: TDBEdit
    Left = 32
    Top = 248
    Width = 134
    Height = 21
    DataField = 'Nome'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 6
  end
  object txtSenha: TDBEdit
    Left = 534
    Top = 56
    Width = 99
    Height = 21
    DataField = 'Senha'
    DataSource = DataSource1
    Enabled = False
    PasswordChar = '*'
    TabOrder = 20
  end
  object txtUsuario: TDBEdit
    Left = 414
    Top = 56
    Width = 99
    Height = 21
    DataField = 'Login'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 19
  end
  object txtPermissao: TDBEdit
    Left = 473
    Top = 128
    Width = 100
    Height = 21
    DataField = 'Adm'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 23
    Visible = False
    OnChange = txtPermissaoChange
  end
  object txtRua: TDBEdit
    Left = 32
    Top = 339
    Width = 134
    Height = 21
    DataField = 'Endereco'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 8
  end
  object txtComp: TDBEdit
    Left = 192
    Top = 339
    Width = 134
    Height = 21
    DataField = 'Complemento'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 9
  end
  object txtNumero: TDBEdit
    Left = 352
    Top = 339
    Width = 49
    Height = 21
    DataField = 'Numero'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 10
  end
  object txtCEP: TDBEdit
    Left = 192
    Top = 392
    Width = 81
    Height = 21
    DataField = 'CEP'
    DataSource = DataSource1
    Enabled = False
    MaxLength = 9
    TabOrder = 12
  end
  object txtCidade: TDBEdit
    Left = 32
    Top = 451
    Width = 134
    Height = 21
    DataField = 'Cidade'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 13
  end
  object txtUF: TDBEdit
    Left = 192
    Top = 451
    Width = 33
    Height = 21
    DataField = 'Estado'
    DataSource = DataSource1
    Enabled = False
    MaxLength = 2
    TabOrder = 14
  end
  object txtBairro: TDBEdit
    Left = 32
    Top = 392
    Width = 134
    Height = 21
    DataField = 'Bairro'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 11
  end
  object btnIncluir: TBitBtn
    Left = 78
    Top = 168
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Incluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSkyBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnIncluirClick
  end
  object btnAlterar: TBitBtn
    Left = 190
    Top = 168
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Alterar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clSkyBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnAlterarClick
  end
  object btnGravar: TBitBtn
    Left = 302
    Top = 168
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Gravar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object btnCancelar: TBitBtn
    Left = 409
    Top = 168
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Cancelar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object txtDD1: TDBEdit
    Left = 489
    Top = 339
    Width = 33
    Height = 21
    DataField = 'DD1'
    DataSource = DataSource1
    Enabled = False
    MaxLength = 2
    TabOrder = 15
  end
  object txtTel1: TDBEdit
    Left = 545
    Top = 339
    Width = 78
    Height = 21
    DataField = 'Telefone1'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 16
  end
  object txtDD2: TDBEdit
    Left = 489
    Top = 395
    Width = 33
    Height = 21
    DataField = 'DD2'
    DataSource = DataSource1
    Enabled = False
    MaxLength = 2
    TabOrder = 17
  end
  object txtTel2: TDBEdit
    Left = 545
    Top = 392
    Width = 78
    Height = 21
    DataField = 'Telefone2'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 18
  end
  object cboPermissao: TComboBox
    Left = 500
    Top = 120
    Width = 48
    Height = 21
    Enabled = False
    TabOrder = 21
    OnChange = cboPermissaoChange
    Items.Strings = (
      'N'#227'o'
      'Sim')
  end
  object btnExcluir: TBitBtn
    Left = 513
    Top = 168
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = btnExcluirClick
  end
  object txtCPF: TDBEdit
    Left = 192
    Top = 248
    Width = 134
    Height = 21
    DataField = 'Cpf'
    DataSource = DataSource1
    Enabled = False
    TabOrder = 7
  end
  object txtUsuarioCriacao: TDBEdit
    Left = 489
    Top = 248
    Width = 72
    Height = 21
    DataField = 'UsuarioCriacao'
    DataSource = DataSource1
    TabOrder = 28
    Visible = False
  end
  object txtDataCriacao: TDBEdit
    Left = 571
    Top = 248
    Width = 72
    Height = 21
    DataField = 'DataCriacao'
    DataSource = DataSource1
    TabOrder = 29
    Visible = False
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 544
    Top = 473
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = frmLogin.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT *  FROM usuario WHERE (excluido IS NULL OR excluido != 1)' +
        ';')
    Left = 640
    Top = 472
    object ADOQuery1idusuario: TAutoIncField
      FieldName = 'idusuario'
      ReadOnly = True
    end
    object ADOQuery1Nome: TStringField
      FieldName = 'Nome'
      Size = 45
    end
    object ADOQuery1Senha: TStringField
      FieldName = 'Senha'
      Size = 45
    end
    object ADOQuery1Login: TStringField
      FieldName = 'Login'
      Size = 40
    end
    object ADOQuery1Adm: TStringField
      FieldName = 'Adm'
      OnGetText = ADOQuery1AdmGetText
      Size = 10
    end
    object ADOQuery1Endereco: TStringField
      FieldName = 'Endereco'
      Size = 50
    end
    object ADOQuery1Complemento: TStringField
      FieldName = 'Complemento'
      Size = 50
    end
    object ADOQuery1Numero: TStringField
      FieldName = 'Numero'
      Size = 10
    end
    object ADOQuery1CEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object ADOQuery1Cidade: TStringField
      FieldName = 'Cidade'
      Size = 50
    end
    object ADOQuery1Estado: TStringField
      FieldName = 'Estado'
      Size = 10
    end
    object ADOQuery1Bairro: TStringField
      FieldName = 'Bairro'
      Size = 50
    end
    object ADOQuery1DD1: TStringField
      FieldName = 'DD1'
      Size = 10
    end
    object ADOQuery1Telefone1: TStringField
      FieldName = 'Telefone1'
      Size = 10
    end
    object ADOQuery1DD2: TStringField
      FieldName = 'DD2'
      Size = 10
    end
    object ADOQuery1Telefone2: TStringField
      FieldName = 'Telefone2'
      Size = 10
    end
    object ADOQuery1excluido: TStringField
      FieldName = 'excluido'
      Size = 10
    end
    object ADOQuery1Cpf: TStringField
      FieldName = 'Cpf'
      Size = 15
    end
    object ADOQuery1UsuarioCriacao: TStringField
      FieldName = 'UsuarioCriacao'
      Size = 10
    end
    object ADOQuery1DataCriacao: TDateTimeField
      FieldName = 'DataCriacao'
    end
    object ADOQuery1UsuarioAlteracao: TStringField
      FieldName = 'UsuarioAlteracao'
      Size = 10
    end
    object ADOQuery1DataAlteracao: TDateTimeField
      FieldName = 'DataAlteracao'
    end
  end
  object MainMenu1: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 592
    Top = 473
    object Voltar1: TMenuItem
      Bitmap.Data = {
        361B0000424D361B000000000000360000002800000030000000300000000100
        180000000000001B0000130B0000130B00000000000000000001FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF8F8F8F1F1F1EEEEEFEBEBEBEAEAEBEB
        EBEBEBEBEBEAEAEAE9E9EAEDEDEDF0F0F0F7F7F7FDFDFDFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEF5F5F5ECECEDECECED
        F2F2F2F8F8F8FDFCFDFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFCFBFCF7F6
        F7EFEFEFE9E9E9EAEAEAF3F3F3FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFE
        FEF2F2F2ECECECF4F4F4FDFCFDFFFFFFFFFFFFFFFFFFF9FDFAF5FCF8EFFAF5E3
        F6ECE3F6ECEFFAF5F5FCF9FAFDFBFFFFFFFFFFFFFFFFFFFBFAFBF0F0F0E7E7E8
        F0F0F0FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF4F4F4ECECECF7F7F7FFFFFFFFFFFFFFFFFFE4F6ED
        C0EBD6A4E2C68CDBB67FD8AF7DD7AF77D5AB77D5AB7DD7AF7FD8AF8BDBB6A4E2
        C5C1EBD6E4F6ECFFFFFFFFFFFFFFFEFFF2F2F2E5E5E6F2F2F2FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDEDEDEDF4F4F4FFFF
        FFFFFFFFF8FDFAC8EDDA96DEBB75D4A763CF9D53CB9348C78D3EC58837C38434
        C28234C28237C3833EC58748C78C53CA9263CE9C75D4A696DDBAC8EDDAF9FDFA
        FFFFFFFEFDFDEDEDEDE7E7E7FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFF8F8F8ECECECFBFBFBFFFFFFFFFFFFC7ECD989D9B168CF9D51C9913BC485
        2AC07E23BF7D21BF7E21C08022C18123C18223C18222C18121C08021BF7E23BF
        7C2ABF7D3BC38451C98F68CF9C88D8B1C7ECD9FFFFFFFFFFFFF6F5F6E5E5E5F7
        F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6EEEEEEFEFEFEFFFFFFE7F7EF96DC
        B969CE9D4EC88E31C18022BF7D21C08124C28425C28425C28425C28425C28425
        C28425C28425C28425C28425C28425C28424C28422C08022BE7B31C07D4EC78C
        69CE9C96DCB8E7F7EEFFFFFFFAFAFAE5E5E5F4F4F4FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6EF
        EFEFFFFFFFFFFFFFCDEEDC7AD3A659CA9336C28221BF7D23C18225C28425C284
        25C28425C28425C28425C28425C28425C28425C28425C28425C28425C28425C2
        8425C28425C28425C28423C18122BE7A36C17F59C99179D2A3CDEEDAFFFFFFFC
        FCFCE5E5E6F3F3F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFF8F8F8EEEEEEFFFFFFFFFFFFC0E9D26ACC964DC78C28C0
        7E22C08125C28425C28425C28425C28425C28425C28425C28425C28425C2841D
        C07F1EC28425C38725C28425C28425C28425C28425C28425C28425C28425C284
        22C07F29BF7A4DC58868CB93C0E9D0FFFFFFFCFCFCE4E4E4F6F6F6FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFDECECECFEFEFEFF
        FFFFBFE8CF62C88D45C48523BF7D23C28325C28425C28425C28425C28425C284
        25C28425C28425C28425C28419BF7D5BD3A652C0771FB86A25C48A25C28425C2
        8425C28425C28425C28425C28425C28425C28424C18224BE7A45C38161C789BF
        E7CDFFFFFFF9F9F9E2E2E2FCFCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFECECECFBFBFBFFFFFFCBECD761C58743C38222BF7E24C28425C2
        8425C28425C28425C28425C28425C28425C28425C28425C28417BE7C5CD2A3F6
        FEFDEBEED554AA3D1DB96D24C48A25C28425C28425C28425C28425C28425C284
        25C28425C28424C28323BE7A43C17D60C484CBEBD6FFFFFFF4F4F4E4E4E5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4F4F4F4F4F5FFFFFFE7F6EC6A
        C78A45C07D23C07E24C28425C28425C28425C28425C28425C28425C28425C284
        25C28425C28417BE7C5CD2A3F2FCF8FFFFFFFFFFFFE6EED455AB3D1DB96E24C4
        8A25C28425C28425C28425C28425C28425C28425C28425C28424C18325BE7A45
        BF7968C687E7F6ECFFFFFFE8E8E9F1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FDFDFDEBEBECFFFFFFFEFEFE85D09D49BE7628C07E24C28425C28425C28425C2
        8425C28425C28425C28425C28425C28425C28417BE7C5CD1A3F3FCF8FFFFFFFF
        FFFFFFFFFFFFFFFFE6EED554AA3C1DB96D25C48A25C28425C28425C28425C284
        25C28425C28425C28425C28424C18329BE7948BC7284CF9BFEFFFFFBFBFBE0E0
        E1FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2F8F7F8FFFFFFBFE7CC4EBB7031
        BF7A23C18325C28425C28425C28425C28425C28425C28425C28425C28425C284
        17BE7C5BD1A2F1FBF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7EED65DAF
        4624B96E24C38725C28425C28425C28425C28425C28425C28425C28425C28423
        C18032BD754CBA6DBFE7CAFFFFFFEDEDEDEDEDEDFFFFFFFFFFFFFFFFFFFEFEFE
        EBEBEBFFFFFFF8FCF96DC6843CBB7123C08025C28425C28425C28425C28425C2
        8425C28425C28425C28425C28417BE7C5AD1A2F1FBF7FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF96BF6825AD4C23C48A25C28425C28425C284
        25C28425C28425C28425C28425C28425C28425BF7B3CBA6C6BC582F8FDF9FCFB
        FCE0E0E0FEFEFEFFFFFFFFFFFFF5F5F5F4F4F5FFFFFFBBE5C644B7642DBE7A23
        C28425C28425C28425C28425C28425C28425C28425C28425C28417BE7C5AD1A2
        F2FBF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1C87E2AAB
        4623C38825C28425C28425C28425C28425C28425C28425C28425C28425C28425
        C28424C1822EBD7442B660BAE4C5FFFFFFE8E8E9F1F1F1FFFFFFFFFFFFECECEC
        FDFDFDFFFFFF75C98837B86624C18025C28425C28425C28425C28425C28425C2
        8425C28425C28418BE7D5AD1A2F1FBF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFA2C97E26A94121C48925C28525C28425C28425C28425C284
        25C28425C28425C28425C28425C28425C28425C28425BF7B36B66274C886FFFF
        FFF6F6F6E3E3E4FFFFFFFDFDFDECECECFFFFFFDFF3E447B76134BE7634C78E24
        C28325C28425C28425C28425C28425C28425C28417BE7C5AD1A2F1FBF7FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0C87E29A94121C38825C2
        8525C28425C28425C28425C28425C28425C28425C28425C28425C28425C28425
        C28424C28435C68B35BC7045B65EDFF3E3FFFEFFDFDFE0FDFDFDF7F7F7F2F2F2
        FFFFFFACDFB832B25438C3854DCE9C29C38624C28325C28425C28425C28425C2
        8417BE7C5AD1A2F1FBF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFA2C87F3DAD4A3AC89230C48923C18320C18223C28325C28425C28425C284
        25C28425C28425C28425C28425C28424C28329C3864DCE9B39C27F30B051ABDE
        B6FFFFFFE5E5E6F4F4F4F0F0F1F8F8F8FFFFFF7ECC8D2AB2573EC88F54D0A03C
        C99123C18325C28425C28425C28416BE7C67D5AAF5FDFAFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF9FCF698C5784CB04E68D2A567D09F60CD9A50C9
        9339C58A25C1821ABF7D18BE7D19BE7D19BE7D19BE7D19BE7D19BE7D1CC18223
        C3883CC89154D0A03FC68A29B1537DCC8CFFFFFFEEEDEEEBEBEBEEEEEEFEFCFD
        FAFDFB59BE6D2AB66145CC9752D09F4FCE9C2FC58923C18325C28416BE7C67D5
        A9F9FDFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFEDD296
        CA86ACE4C7ADE3C5ADE2C3AEE2C3B0E3C4B0E2C4A7E1C092DDB884DAB283DAB2
        84DAB284DAB284DAB285DBB366C98B2FB7654ED09F52D09F47CA932AB45C58BD
        6AFAFDFBF6F4F6E5E5E6EAEAEAFFFFFFF2F9F444B5582CB96A4ACE9B51CF9E52
        CF9E48CD9828C38615BE7B67D5A9F8FDFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC4D7A03D
        A73751D2A651D09E4BCD982CB76442B455F3FAF4FBF8FADFDFE0EBEBEBFFFFFF
        EAF6EB3DB14E2CBB6E4ECF9D51CF9E50CF9D52D09E36C88E68D6AAF8FDFBFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBBD69E3DA93C51D2A551CF9E4ECE9A2EB9693DB0
        4BEAF7EBFDFBFDE0E0E0EBEBEBFFFFFFDAEFDD36AD442DBC714FCF9E50CF9D50
        CF9D49CD9988DFBDFCFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBD69E3D
        A93C51D2A550CF9E50CE9C2FBA6B37AB41DBF0DDFFFCFFDFDFDFEBEBEBFFFFFF
        DAEFDC37AA3F2EBB6F4FCF9E50CF9D50CF9D48CD9A8ADEBBFEFEFDFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFBBD69E3DA93C51D2A550CF9E4FCE9C2FB96A37A9
        3CDBF0DCFFFCFFDFDFDFEAEAEAFFFFFFEAF5EA3EAA3E2CB9694DCF9E51CF9E50
        CF9E50CF9C59C47E99D7A7FBFEFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBD69E3D
        A93D51D2A551CF9E4ECE9B2EB7633EA83BEBF6EAFDFAFDDFDFE0E9E9E9FFFFFF
        F2F9F244A93D2BB45E4ACE9C51CF9E4FD09F5AC78465C2765EC17498D8A7FBFE
        FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFC1D7A13EA53051D2A451D09E4BCD992CB25844A8
        3AF3FAF3FAF8FADEDEDFECECEDFDFCFDFAFDFB57B04A27AD4B46CC9951D1A154
        C98A5DBF6E60C27462C2785CC07396D7A6FBFEFCFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFE0EDD491C77D9CD9AD9DD8AC9CD7AA9BD7A99BD7
        A99DD8AAA3DAADAADCB3ABDDB4AADCB2A8DCB1A6DBAEA5DBADA4DBAB85C98251
        B24D55C98C51D1A247CB9429AB4557AF48FAFEFBF4F2F4E4E4E4F0F0F0F6F6F7
        FFFFFF7ABF6B24A3303EC99154CE995BBD695CBD695CC06F5FC17462C2765BBF
        7195D6A4F8FDF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FCF798
        C5773AA32F4FBD7252BD7155BD725BC07661C27B65C37D66C37D64C37B61C277
        5EC0745BBF7158BE6E55BD6A57BD6B5DBE6B5CBC6754CE993FC78C25A22B7BBE
        69FFFFFFEBEBEBEAEAEAF6F6F6EFEFEFFFFFFFA9D59E279B1835C38359C2795E
        B75B5CBB645CBD695CBF6D5EC07161C27559BF6F8AD29AF6FBF7FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA1C97F52AC4170C98A71C8876FC7
        856EC7836BC68169C57F67C47C64C37962C27660C2745DC0705CBE6C5CBC675D
        BA625EB65959C17736C17D279912A9D59BFFFFFFE1E1E2F3F3F4FDFDFDE8E8E9
        FFFFFFDEEFD9379C122FB04E58B4555EB5575DB85E5DBA625CBC675CBE6B5CBF
        6F5EC17257BE6D88D198F5FBF7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFA0C97F50AB3F6AC78369C57F67C47C65C37A63C27862C27660C174
        5EC0715CBF6E5CBD695CBB655DB9615DB75C5EB55558B35230AE47379B0BDEF0
        D8FEFDFEDCDCDCFDFDFDFFFFFFE9E9EAFCFBFCFFFFFF66B2422A96064DA83560
        B4535DB4555DB75B5DB9605DBB645CBD685CBE6B5CBF6F55BD6986D196F5FBF6
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0C97F4BAA3A62C4
        7C62C27760C1755FC1735DC0715CBF6D5CBD6A5CBC665DBA635DB85E5DB65A5D
        B45460B3514DA7302A940366B241FFFFFFF2F2F3E0E0E1FFFFFFFFFFFFF4F4F4
        F0F0F0FFFFFFB4DAA52A91003C9D0F5DB0445FB34F5DB4535DB6585DB75D5DBA
        615CBB645CBC675CBE6A52BB6484CF92F5FBF7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9FC87E4CAB3B5EC1745CBF6E5CBE6C5CBD695CBC66
        5DBA635DB95F5DB75B5DB5565EB4525FB24D5DAF3F3C9C0A2A9000B4DAA6FFFF
        FFE2E2E3F0F0F0FFFFFFFFFFFFFEFEFEE6E6E7FEFEFEF8FCF854A72B2D92004C
        A51F60B1445EB14B5EB3505DB4555DB6595DB75D5DB9605DBA635CBC6552B85E
        84CD8EF5FBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF92C0
        6A49AA3A5DBE6B5CBB645DBA625DB85F5DB75B5DB5575EB4535EB24F5EB04860
        AF3F4CA41D2D910055A62BF8FCF8F9F8F9DBDBDCFEFEFEFFFFFFFFFFFFFFFFFF
        EFEFF0F2F2F3FFFFFFB7DAA92C8F0038980358AA2C5FAF3C5EB0445EB14C5EB3
        505EB4545DB5585DB75B5DB85E5DB96053B55985CB8AF5FBF6FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFE4EFD967AD4054B24F5DB9615DB85D5DB65A5DB556
        5EB4535EB34F5EB14A5EAF415FAE3858A92B3997032C8E00B7DAAAFFFFFFE6E6
        E6EAEAEBFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDE5E5E6FDFDFDFFFFFF6DB14B29
        8B00429B0E5EAC325FAE355EAE3B5EB0445EB14B5EB34F5DB4525DB4555DB558
        5DB65953B35286C985F6FBF6FFFFFFFFFFFFFFFFFFFFFFFFE3EED75FA83551AE
        475FB75D5DB5565DB4535EB3515EB24D5EB0485EAF405EAE385FAD345EAC3242
        9B0E298A006DB04BFFFFFFF7F6F7D9D9DAFDFDFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFF2F2F2EDEDEDFFFFFFE4F1E04498192F8C00489D1760AB345FAC335EAD
        345EAE395EAF405EB1465EB24B5EB24E5EB3505EB35153AF4986C77FF6FBF5FF
        FFFFFFFFFFE3EED85FA83351AC3F5FB5565EB24F5EB24D5EB1495EB0435EAE3D
        5EAE365EAD335FAC3360AB34489D172F8B00449819E4F1E0FFFEFFDFDFE0EFEF
        EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6E6E7F6F6F6FFFFFFC1
        DEB6328D05328C004B9D1960AA345FAB345EAC325EAD335EAD355EAE395EAF3D
        5EB0415EB0455EB14854AC3E87C477FAFDFAE6F0DC5FA73152A93660B24A5EB0
        435EB0405EAE3B5EAD375EAD335EAD325EAC325FAB3460A9344B9C19328C0032
        8D05C1DEB6FFFFFFEBEBECDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFCFCFCE4E4E4FAFAFAFFFFFFAFD49F2E8A00328B00499A165FA7
        3361A9355FAA335EAB335EAC325EAC325EAD335EAD345EAE355EAE3655AA2E87
        C36B72B54A52A62560AF395EAD345EAD335EAD325EAC325EAB325EAB335FA933
        61A9355FA733499916328B002E8A00AFD49EFFFFFFF2F2F3DADADAFCFCFCFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7F7F7E5E5E6FC
        FCFCFFFFFFAFD49F328B052F880042950E59A32C61A83660A8345FA8335FA933
        5FAA335FAA335FAB335EAB325EAB3358A82B5BAA2F5FAC345EAB325FAA335FAA
        335FAA335FA9335FA83360A73461A73659A32C42950E2F8800328B05AFD39FFF
        FFFFF6F5F6D9D9DAF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF4F4F4E5E5E6FCFCFCFFFFFFC0DDB444941C2983
        003A8E034D9B1D5EA53261A73660A7345FA6335FA7335FA7335FA7335FA8335F
        A8335FA8335FA7335FA7335FA7335FA7335FA63360A73461A7365EA4324D9B1D
        3A8E0329830044931BC0DDB4FFFFFFF6F5F6DADADAF1F1F1FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3
        F3F4E3E3E4F9F9F9FFFFFFE2F0DE6CAB4E2C84002E85003D8F084E9A1D5AA22E
        60A63561A63661A63560A63460A6345FA6345FA63460A63460A63461A63561A6
        3660A6355AA22E4E9A1D3D8E082E84002C83006CAB4EE3F0DEFFFFFFF2F2F2DA
        DADBF1F1F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6E2E2E2F3F3F4FFFFFFFFFF
        FFB4D6A7559D2F2B82002B8200388A0043920F4D981D559D275AA02C5DA2305E
        A3325EA3325DA1305AA02C559C274D971D43920F388A002B82002B8200559D2F
        B4D6A7FFFFFFFFFFFFEBEBECDADADAF5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFCFCFCE4E4E5E8E8E9FBFBFCFFFFFFF9FDF9B4D5A667A747388A08
        2A80002A80003084003587003889013A8A043A8A043889013587003084002A80
        002A8000388A0867A747B5D5A6F9FDF9FFFFFFF6F6F7E0E0E0DFDFE0FCFCFCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F1F1E1E1
        E1ECECEDFDFCFDFFFFFFFFFFFFDCECD7A8CE997BB25C579E31459115408C0C39
        8905398905408C0C459115579D317BB25BA9CE99DCECD7FFFFFFFFFFFFF9F8FA
        E6E6E6DADADBEEEEEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEEDEDEDE0E0E1E8E8E8F6F5F6FFFFFF
        FFFFFFFFFFFFFBFEFDF3F9F1EBF4E7DBEBD6DBEBD6EBF4E7F3F9F1FBFEFDFFFF
        FFFFFFFFFFFDFFF2F1F2E2E2E3DBDBDCEBEBEBFEFEFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFEFEFEF1F1F1E4E4E4E0E0E0E5E5E5EEEDEEF5F4F6FBF9FCFDFBFFFF
        FDFFFFFDFFFDFBFEFAF8FBF4F2F4EBEBEBE1E1E2DCDCDDE1E1E1F0F0F0FEFEFE
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD
        F5F5F5EBEBEBE6E6E6E0E0E1E0E0E0DFDFDFDFDFDFDFDFE0DFDFDFE4E4E5EAEA
        EAF4F4F4FDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = '&Voltar'
      Hint = 'Voltar para a tela inicial'
      OnClick = Voltar1Click
    end
  end
end
