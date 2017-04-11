unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons;

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
    procedure btnFecharClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
    procedure txtSenhaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    idUsuario:String;
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
    frmLogin.ADOQuery1.SQL.Add('SELECT * FROM usuario WHERE Login = "'+Usuario+'" AND (excluido IS NULL OR excluido != 1);');
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
begin
  if (SearchUser(txtUsuario.Text, txtSenha.Text)) then
  begin
    if (bPermissao) then
      frmSubRamo.MainMenu1.Items[0].Enabled:= True;

    frmSubRamo.Show;
    frmSubRamo.cboRamo.ItemIndex:= 0;
    frmSubRamo.cboRamo.OnChange(frmSubRamo.cboRamo);
    frmSubRamo.cboRamo.OnChange(frmSubRamo.cboSubRamo);
    frmLogin.Visible:= False;
  end
  else
  begin
    Application.MessageBox('Usu�rio ou Senha Inv�lidos!', 'Error!', + MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.txtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    btnEntrar.OnClick(BtnEntrar);
  end;
end;

end.
