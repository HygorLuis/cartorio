unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.DBLookup,
  Vcl.ComCtrls, Registry;

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
    lblConexao: TLabel;
    cboConexao: TComboBox;
    procedure btnFecharClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure txtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure cboConexaoChange(Sender: TObject);
  private

  public
    idUsuario: String;
    bPermissao: Boolean;
    bBackup: Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses Unit2, Unit3, Unit4, ShellApi;
function CriarConexao(sBackup: String): Boolean;
var Sh: TShellExecuteInfo;
    CodigoSaida: DWORD;
begin
  FillChar(Sh, SizeOf(Sh), 0) ;
  Sh.cbSize:= SizeOf(TShellExecuteInfo) ;
  with Sh do
  begin
    fMask:= SEE_MASK_NOCLOSEPROCESS;
    Wnd:= Application.Handle;
    lpVerb:= nil;
    lpFile:= PChar(sBackup);
    //nShow:= SW_SHOWNORMAL;
    nShow:= SW_HIDE;
  end;
  if ShellExecuteEx(@Sh) then
  begin
    repeat
    Application.ProcessMessages;
    GetExitCodeProcess(Sh.hProcess, CodigoSaida) ;
    until not(CodigoSaida = STILL_ACTIVE);
    Result:= True;
  end
  else
    Result:= False;
end;

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
    sCommand: String;
    tfFile: TextFile;
begin
case cboConexao.ItemIndex of
  0:
  begin
    frmConsulta.ADOQuery1.Active:= True;
    frmConsulta.ADOQuery2.Active:= True;
    frmConsulta.ADOQuery3.Active:= True;
    frmConsulta.ADOQuery4.Active:= True;
    frmLancamento.ADOQuery1.Active:= True;
    frmLancamento.ADOQuery2.Active:= True;
    frmLancamento.ADOQuery3.Active:= True;
    frmUsuario.ADOQuery1.Active:= True;

    if (btnEntrar.Caption = 'Entrar') then
    begin
      if (SearchUser(txtUsuario.Text, txtSenha.Text)) then
      begin
        with frmConsulta.ADOQuery4 do
        begin
          SQL.Clear;
          SQL.Add('SELECT Nome as Backup, DataCriacao ' +
                  'FROM backup ' +
                  'WHERE (excluido IS NULL OR excluido != 1) ORDER BY DataCriacao DESC LIMIT 1;');
          open;
          Active:= true;
        end;

        if (bPermissao) then
        begin
          frmConsulta.MainMenu1.Items[0].Enabled:= True;

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
            if (Abs(iDiferenca) > 7) then
            begin
              Application.MessageBox(Pchar('Faz 7 dias que não é realizado uma cópia de segurança!' + chr(13) +
                                           'Você será direcionado para a tela de backup!'),
                                           'Atenção!', + MB_OK + MB_ICONINFORMATION);
              bBackup:= True;
            end;
          end;
        end;

        if (not frmConsulta.ADOQuery4.Eof) then
        begin
          sCommand:= '"C:\Program Files (x86)\MySQL\MySQL Server 5.1\bin\mysql" -h localhost -u root -proot < "F:\DB_Backups\' + frmConsulta.ADOQuery4.FieldByName('Backup').Value + '"';
          AssignFile(tfFile, ExtractFilePath(Application.ExeName) + 'Restore.bat');
          Rewrite(tfFile);
          Writeln(tfFile, sCommand);
          CloseFile(tfFile);
          //DEBUG
          //WinExec('C:\Projetos\cartorio\Win32\Debug\Restore.bat', SW_HIDE);
          WinExec('C:\Cartório\Restore.bat', SW_HIDE);
        end;

        frmConsulta.Show;
        frmConsulta.cboRamo.ItemIndex:= 0;
        frmConsulta.cboRamo.OnChange(frmConsulta.cboRamo);
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

  1:
  begin
    Application.MessageBox('Sistema disponível somente para consulta!', 'Atenção!', + MB_OK + MB_ICONINFORMATION);

    frmConsulta.ADOQuery1.Active:= True;
    frmConsulta.ADOQuery2.Active:= True;
    frmConsulta.ADOQuery3.Active:= True;
    frmConsulta.ADOQuery4.Active:= True;

    frmConsulta.Show;
    frmConsulta.cboRamo.ItemIndex:= 0;
    frmConsulta.cboRamo.OnChange(frmConsulta.cboRamo);
    frmConsulta.DBGrid1.Columns[0];
    frmLogin.Visible:= False;
  end;
end;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.cboConexaoChange(Sender: TObject);
begin
  try
    ADOConnection1.Close;
    case cboConexao.ItemIndex of
      0:  ADOConnection1.ConnectionString:= 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=' + cboConexao.Text + ';';
      1:  ADOConnection1.ConnectionString:= 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=' + cboConexao.Text + ';';
    end;

    ADOConnection1.Connected:= True;
  except
    Application.MessageBox(Pchar('Falha na conexão com o servidor: ' + cboConexao.Text + chr(13) +
                                 'Você será conectado ao servidor local!'), 'Atenção!', + MB_OK + MB_ICONERROR);
    cboConexao.ItemIndex:= 1;
    cboConexaoChange(cboConexao);
  end;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  try
    ADOQuery1.Connection:= ADOConnection1;
    CriarConexao(ExtractFilePath(Application.ExeName) + 'CreateConnection.bat');
    ADOConnection1.ConnectionString:= 'Provider=MSDASQL.1;Persist Security Info=False;Data Source=' + cboConexao.Text + ';';
    ADOConnection1.Connected:= True;

    with ADOQuery1 do
    begin
      SQL.Clear;
      SQL.Add('SELECT idUsuario FROM usuario WHERE (excluido IS NULL OR excluido != 1);');
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
  except
    Application.MessageBox(Pchar('Falha na conexão com o servidor: ' + cboConexao.Text + chr(13) +
                                 'Você será conectado ao servidor local!'), 'Atenção!', + MB_OK + MB_ICONERROR);
    cboConexao.ItemIndex:= 1;
    cboConexaoChange(cboConexao);
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
