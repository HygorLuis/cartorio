unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    txtUsuario: TEdit;
    txtSenha: TEdit;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    btnEntrar: TBitBtn;
    btnFechar: TBitBtn;
    Image1: TImage;
    Panel1: TPanel;
    procedure btnFecharClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure txtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private

  public
    idUsuario: String;
    bPermissao: Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4;
function SearchUser(Usuario:String; Senha:String): Boolean;
begin
    frmLogin.ADOQuery1.SQL.Clear;
    frmLogin.ADOQuery1.SQL.Add('SELECT idUsuario, Login, Senha, Adm  FROM usuario WHERE Login = "'+Usuario+'" AND (excluido IS NULL OR excluido != 1);');
    frmLogin.ADOQuery1.open;
    frmLogin.ADOQuery1.Active := true;

    if (Senha = frmLogin.ADOQuery1.FieldByName('Senha').Value) then
    begin
      frmLogin.idUsuario:= frmLogin.ADOQuery1.FieldByName('idUsuario').Value;
      frmLogin.bPermissao:= StrToBool (frmLogin.ADOQuery1.FieldByName('Adm').Value);
      result:= true;
    end;
end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
var iDiferenca: Integer;
    bBackup: Boolean;
begin
  if (btnEntrar.Caption = 'Entrar') then
  begin
    if (SearchUser(txtUsuario.Text, txtSenha.Text)) then
    begin
      if (bPermissao) then
      begin
        frmConsulta.MainMenu1.Items[0].Enabled:= True;

        with frmConsulta.ADOQuery4 do
        begin
          SQL.Clear;
          SQL.Add('SELECT DataCriacao FROM backup WHERE (Excluido IS NULL OR Excluido != 1) ORDER BY DataCriacao DESC LIMIT 1;');
          open;
          Active:= true;
        end;

        if (frmConsulta.ADOQuery4.Eof) then
        begin
          Application.MessageBox(Pchar('Sua base não possui nenhuma cópia de segurança!' + chr(13) +
                                       'Você será direcionado para a tela de backup!'),
                                       'Atenção!', + MB_OK + MB_ICONINFORMATION);
          bBackup:= True;
        end
        else
        begin
          iDiferenca:= StrToInt(FormatDateTime('DD', Now())) - StrToInt(FormatDateTime('DD', frmConsulta.ADOQuery4.FieldByName('DataCriacao').Value));
          if (iDiferenca > 7) then
          begin
            Application.MessageBox(Pchar('Faz 7 dias que não é realizado uma cópia de segurança!' + chr(13) +
                                         'Você será direcionado para a tela de backup!'),
                                         'Atenção!', + MB_OK + MB_ICONINFORMATION);
            bBackup:= True;
          end;
        end;
      end;

      frmConsulta.Show;
      frmConsulta.cboRamo.ItemIndex:= 0;
      frmConsulta.cboRamo.OnChange(frmConsulta.cboRamo);
      frmConsulta.cboRamo.OnChange(frmConsulta.cboSubRamo);
      frmConsulta.DBGrid1.Columns[0];

      if (bBackup) then
        frmConsulta.Gerar1Click(frmConsulta.Gerar1);

      frmLogin.Visible:= False;
    end
    else
    begin
      Application.MessageBox('Usuário ou Senha Inválidos!', 'Error!', + MB_OK + MB_ICONERROR);
    end;
  end
  else
  begin
    frmUsuario.MainMenu1.Items[0].Visible:= False;
    frmUsuario.Visible:= True;
    frmLogin.Visible:= False;
  end;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  with ADOQuery1 do
  begin
    SQL.Clear;
    SQL.Add('SELECT idUsuario  FROM usuario WHERE (excluido IS NULL OR excluido != 1);');
    open;
    Active:= true;
  end;

  if ADOQuery1.Eof then
  begin
    btnEntrar.Font.Color:= clBlue;
    btnEntrar.Caption:= 'Criar';
    Application.MessageBox(Pchar('Sua base não possui nenhum usuário cadastrado.' + chr(13) +
                                 'Click no botão "Criar", para cadastrar.'), 'Atenção!', + MB_OK + MB_ICONQUESTION);
  end;
end;

procedure TfrmLogin.txtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    btnEntrar.OnClick(BtnEntrar);
  end;
end;

end.
