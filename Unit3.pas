unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Imaging.pngimage;

type
  TfrmUsuario = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    ADOQuery1idusuario: TAutoIncField;
    ADOQuery1Nome: TStringField;
    ADOQuery1Senha: TStringField;
    ADOQuery1Login: TStringField;
    ADOQuery1Adm: TStringField;
    ADOQuery1Endereco: TStringField;
    ADOQuery1Complemento: TStringField;
    ADOQuery1Numero: TStringField;
    ADOQuery1CEP: TStringField;
    ADOQuery1Cidade: TStringField;
    ADOQuery1Estado: TStringField;
    Label1: TLabel;
    txtID: TDBEdit;
    GroupBox1: TGroupBox;
    ADOQuery1Bairro: TStringField;
    GroupBox2: TGroupBox;
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    ADOQuery1DD1: TStringField;
    ADOQuery1Telefone1: TStringField;
    ADOQuery1DD2: TStringField;
    ADOQuery1Telefone2: TStringField;
    GroupBox3: TGroupBox;
    btnExcluir: TBitBtn;
    chkSenha: TCheckBox;
    MainMenu1: TMainMenu;
    Voltar1: TMenuItem;
    ADOQuery1excluido: TStringField;
    ADOQuery1Cpf: TStringField;
    GroupBox4: TGroupBox;
    ADOQuery1UsuarioCriacao: TStringField;
    Label2: TLabel;
    txtUsuarioCriacao: TDBEdit;
    ADOQuery1DataCriacao: TDateTimeField;
    ADOQuery1UsuarioAlteracao: TStringField;
    ADOQuery1DataAlteracao: TDateTimeField;
    Label3: TLabel;
    txtDataCriacao: TDBEdit;
    lblNome: TLabel;
    lblCPF: TLabel;
    txtNome: TDBEdit;
    txtCPF: TDBEdit;
    lblSenha: TLabel;
    lblUsuario: TLabel;
    lblPermissao: TLabel;
    txtSenha: TDBEdit;
    txtUsuario: TDBEdit;
    txtPermissao: TDBEdit;
    cboPermissao: TComboBox;
    lblRua: TLabel;
    Label7: TLabel;
    lblNumero: TLabel;
    txtRua: TDBEdit;
    txtComp: TDBEdit;
    txtNumero: TDBEdit;
    lblCidade: TLabel;
    lblUf: TLabel;
    txtCidade: TDBEdit;
    txtUF: TDBEdit;
    lblCEP: TLabel;
    Label6: TLabel;
    txtCEP: TDBEdit;
    txtBairro: TDBEdit;
    Panel1: TPanel;
    Image1: TImage;
    lblDD1: TLabel;
    lblTelefone1: TLabel;
    lblDD2: TLabel;
    lblTel2: TLabel;
    txtDD1: TDBEdit;
    txtTel1: TDBEdit;
    txtDD2: TDBEdit;
    txtTel2: TDBEdit;
    procedure ADOQuery1AdmGetText(Sender: TField; var Text: string;
    DisplayText: Boolean);
    procedure txtPermissaoChange(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure cboPermissaoChange(Sender: TObject);
    procedure chkSenhaClick(Sender: TObject);
    procedure Voltar1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure LoadUser();
  private
    OldCursor: TCursor;
  public
    bUpdate: Boolean;
    iID, iIndex: integer;
  end;

var
  frmUsuario: TfrmUsuario;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit4;

procedure TfrmUsuario.LoadUser();
begin
  frmUsuario.ADOQuery1.SQL.Clear;
  frmUsuario.ADOQuery1.SQL.Add('SELECT * FROM usuario WHERE (excluido IS NULL OR excluido != 1);');
  frmUsuario.ADOQuery1.open;
  frmUsuario.ADOQuery1.Active:= true;
end;

procedure EnabledFields(bEnabled: Boolean);
begin
  frmUsuario.cboPermissao.Enabled:= bEnabled;
  frmUsuario.DBGrid1.Enabled:= not bEnabled;
  frmUsuario.chkSenha.Enabled:= bEnabled;
  frmUsuario.txtNome.Enabled:= bEnabled;
  frmUsuario.txtCPF.Enabled:= bEnabled;
  frmUsuario.txtUsuario.Enabled:= bEnabled;
  frmUsuario.txtSenha.Enabled:= bEnabled;
  frmUsuario.txtRua.Enabled:= bEnabled;
  frmUsuario.txtComp.Enabled:= bEnabled;
  frmUsuario.txtNumero.Enabled:= bEnabled;
  frmUsuario.txtCEP.Enabled:= bEnabled;
  frmUsuario.txtCidade.Enabled:= bEnabled;
  frmUsuario.txtUF.Enabled:= bEnabled;
  frmUsuario.txtBairro.Enabled:= bEnabled;
  frmUsuario.txtDD1.Enabled:= bEnabled;
  frmUsuario.txtTel1.Enabled:= bEnabled;
  frmUsuario.txtDD2.Enabled:= bEnabled;
  frmUsuario.txtTel2.Enabled:= bEnabled;

  frmUsuario.btnGravar.Enabled:= bEnabled;
  frmUsuario.btnCancelar.Enabled:= bEnabled;
  frmUsuario.btnAlterar.Enabled:= not bEnabled;
  frmUsuario.btnIncluir.Enabled:= not bEnabled;
  frmUsuario.btnExcluir.Enabled:= not bEnabled;

  frmUsuario.MainMenu1.Items[0].Enabled:= not bEnabled;
end;

function VerifyUser(Usuario:String): Boolean;
begin
    frmLogin.ADOQuery1.SQL.Clear;
    frmLogin.ADOQuery1.SQL.Add('SELECT * FROM usuario WHERE Login = "' + Usuario + '" AND (excluido IS NULL OR excluido != 1);');
    frmLogin.ADOQuery1.open;
    frmLogin.ADOQuery1.Active:= true;

    if (frmLogin.ADOQuery1.FieldByName('Login').IsNull) then
      result:= true
    else
      result:= false;
end;

procedure TfrmUsuario.ADOQuery1AdmGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if (Sender.value = '1') then
    Text:= 'Sim'
  else
    Text := 'Não';
end;

procedure TfrmUsuario.btnAlterarClick(Sender: TObject);
begin
  iIndex:= DBGrid1.DataSource.DataSet.RecNo;
  bUpdate:= true;
  EnabledFields(true);
end;

procedure TfrmUsuario.btnCancelarClick(Sender: TObject);
begin
  ADOQuery1.Cancel;
  cboPermissao.ItemIndex:= StrToInt(ADOQuery1.FieldByName('Adm').Value);
  EnabledFields(false);
  DBGrid1.SetFocus;
end;

procedure TfrmUsuario.btnExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja excluir o usuário?', 'Confirmção!', + MB_YESNO + MB_ICONQUESTION) = IDYES) then
  begin
    OldCursor:= Screen.Cursor;
    Screen.Cursor:= crHourglass;

    iID:= DBGrid1.SelectedField.Value;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('UPDATE usuario SET excluido = 1, UsuarioAlteracao = "' + frmLogin.idUsuario +
                                                    '", DataAlteracao = "' + FormatDateTime('yyyy/mm/dd HH:MM:SS', Now) +
                      '" WHERE idusuario = "' + IntToStr(iID) + '";');
    ADOQuery1.ExecSQL;
    LoadUser();
    DBGrid1.SetFocus;
    DBGrid1.DataSource.DataSet.MoveBy(iIndex-1);
    Screen.Cursor:= OldCursor;
  end;
end;

procedure TfrmUsuario.btnGravarClick(Sender: TObject);
var icboIndex: integer;
    sNome, sCPF, sLogin, sSenha, sEndereco, sComplemento, sNumero, sCEP, sCidade, sUF,
    sBairro, sDD1, sTel1, sDD2, sTel2: String;
begin
  if (txtNome.Text = '') or (txtUsuario.Text = '') or (txtSenha.Text = '') then
  begin
    Application.MessageBox('Nome, Usuário ou Senha estão em brancos!', 'Atenção!', + MB_OK + MB_ICONEXCLAMATION);
    txtUsuario.SetFocus;
  end
  else
  begin
    OldCursor:= Screen.Cursor;
    Screen.Cursor:= crHourglass;

    if (bUpdate) then
    begin
      icboIndex:= cboPermissao.ItemIndex;
      iID:= DBGrid1.SelectedField.Value;
      sNome:= txtNome.Text;
      sCPF:= txtCPF.Text;
      sLogin:= txtUsuario.Text;
      sSenha:= txtSenha.Text;
      sEndereco:= txtRua.Text;
      sComplemento:= txtComp.Text;
      sNumero:= txtNumero.Text;
      sCEP:= txtCEP.Text;
      sCidade:= txtCidade.Text;
      sUF:= txtUF.Text;
      sBairro:= txtBairro.Text;
      sDD1:= txtDD1.Text;
      sTel1:= txtTel1.Text;
      sDD2:= txtDD2.Text;
      sTel2:= txtTel2.Text;

      //ADOQuery1.Close;
      //ADOQuery1.Open;
      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('UPDATE usuario SET Nome = "' + sNome +
                                        '", Cpf = "' + sCPF +
                                        '", Login = "' + sLogin +
                                        '", Senha = "' + sSenha +
                                        '", Adm = "' + IntToStr(icboIndex) +
                                        '", Endereco = "' + sEndereco +
                                        '", Complemento = "' + sComplemento +
                                        '", Numero = "' + sNumero +
                                        '", CEP = "' + sCEP +
                                        '", Cidade = "' + sCidade +
                                        '", Estado = "' + sUF +
                                        '", Bairro = "' + sBairro +
                                        '", DD1 = "' + sDD1 +
                                        '", Telefone1 = "' + sTel1 +
                                        '", DD2 = "' + sDD2 +
                                        '", Telefone2 = "' + sTel2 +
                                        '", UsuarioAlteracao = "' + frmLogin.idUsuario +
                                        '", DataAlteracao = "' + FormatDateTime('yyyy/mm/dd HH:MM:SS', Now) +
                        '" WHERE idusuario = "' + IntToStr(iID) + '";');
      ADOQuery1.ExecSQL;
      LoadUser();
      EnabledFields(false);
      DBGrid1.DataSource.DataSet.MoveBy(iIndex-1);
      DBGrid1.SetFocus;
    end
    else
    begin
      if (VerifyUser(txtUsuario.Text)) then
      begin
        if (cboPermissao.ItemIndex = 1) then
          txtPermissao.Text:= '1'
        else
          if (cboPermissao.ItemIndex = 0) then
            txtPermissao.Text:= '0';

        txtUsuarioCriacao.Text:= frmLogin.idUsuario;
        txtDataCriacao.Text:= DateTimeToStr(Now);
        ADOQuery1.Post;
        EnabledFields(false);
        DBGrid1.SetFocus;

        if (MainMenu1.Items[0].Visible = False) then
        begin
          Application.MessageBox('Agora você será redirecionado para a tela de login!', 'Atenção!', + MB_OK + MB_ICONINFORMATION);
          MainMenu1.Items[0].Visible:= True;
          cboPermissao.Enabled:= False;
          frmLogin.btnEntrar.Font.Color:= clGreen;
          frmLogin.btnEntrar.Caption:= 'Entrar';
          frmLogin.Show;
          frmLogin.txtUsuario.SetFocus;
          frmUsuario.Visible:= False;
        end;
      end
      else
      begin
        Screen.Cursor:= OldCursor;
        Application.MessageBox('Login já casdatrado!' + chr(13) + 'Favor inserir um novo nome de usuário.', 'Erro!', + MB_OK + MB_ICONERROR);
        txtUsuario.SetFocus;
      end;
    end;
  end;
  Screen.Cursor:= OldCursor;
end;

procedure TfrmUsuario.btnIncluirClick(Sender: TObject);
begin
  bUpdate:= false;
  EnabledFields(true);

  if (MainMenu1.Items[0].Visible = False) then
  begin
    cboPermissao.ItemIndex:= 1;
    cboPermissao.Enabled:= False;
  end;

  ADOQuery1.Insert;
end;

procedure TfrmUsuario.cboPermissaoChange(Sender: TObject);
begin
  {if (cboPermissao.ItemIndex = 1) then
    txtPermissao.Text:= '1'
  else
    if (cboPermissao.ItemIndex = 0) then
      txtPermissao.Text:= '0';}
end;

procedure TfrmUsuario.chkSenhaClick(Sender: TObject);
begin
  if (chkSenha.Checked) then
    txtSenha.PasswordChar:= #0
  else
    txtSenha.PasswordChar:= '*';
end;

procedure TfrmUsuario.Fechar1Click(Sender: TObject);
begin
  frmLogin.Close;
end;

procedure TfrmUsuario.txtPermissaoChange(Sender: TObject);
begin
  if (txtPermissao.Text = 'Sim') then
    cboPermissao.ItemIndex:= 1
  else
    if (txtPermissao.Text = 'Não') then
      cboPermissao.ItemIndex:= 0;
end;

procedure TfrmUsuario.Voltar1Click(Sender: TObject);
begin
  frmConsulta.Show;
  frmConsulta.cboRamo.ItemIndex:= 0;
  frmConsulta.cboRamo.OnChange(frmConsulta.cboRamo);
  frmConsulta.cboRamo.OnChange(frmConsulta.cboSubRamo);
  frmConsulta.DBGrid1.Columns[0];
  frmUsuario.Close;
end;

end.
