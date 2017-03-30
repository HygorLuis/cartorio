unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.DBCtrls,
  Vcl.Mask, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.Menus;

type
  TfrmLancamento = class(TForm)
    btnIncluir: TBitBtn;
    btnAlterar: TBitBtn;
    btnGravar: TBitBtn;
    btnCancelar: TBitBtn;
    btnExcluir: TBitBtn;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery1idlancamento: TAutoIncField;
    ADOQuery1idRamo: TStringField;
    ADOQuery1idSubRamo: TStringField;
    ADOQuery1Especie: TStringField;
    ADOQuery1Comarca: TStringField;
    ADOQuery1Fonte: TStringField;
    ADOQuery1Numero: TStringField;
    ADOQuery1Ementa: TStringField;
    ADOQuery1UsuarioCriacao: TStringField;
    ADOQuery1DataCriacao: TDateTimeField;
    ADOQuery1UsuarioAlteracao: TStringField;
    ADOQuery1DataAlteracao: TDateTimeField;
    ADOQuery1Excluido: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    lblEspecie: TLabel;
    txtEspecie: TDBEdit;
    lblComarca: TLabel;
    txtComarca: TDBEdit;
    lblFonte: TLabel;
    txtFonte: TDBEdit;
    lblNumero: TLabel;
    txtNumero: TDBEdit;
    lblRamo: TLabel;
    lblSubRamo: TLabel;
    reEmenta: TDBRichEdit;
    MainMenu1: TMainMenu;
    Voltar1: TMenuItem;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    cboRamo: TDBLookupComboBox;
    cboSubRamo: TDBLookupComboBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Voltar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    bUpdate: Boolean;
    iID: integer;
  end;

var
  frmLancamento: TfrmLancamento;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit3;

procedure LoadLancamento();
begin
  frmLancamento.ADOQuery1.SQL.Clear;
  frmLancamento.ADOQuery1.SQL.Add('SELECT * FROM lancamento WHERE (excluido IS NULL OR excluido != 1);');
  frmLancamento.ADOQuery1.open;
  frmLancamento.ADOQuery1.Active:= true;
end;

procedure EnabledFields(bEnabled: Boolean);
begin
  frmLancamento.DBGrid1.Enabled:= not bEnabled;

  frmLancamento.cboRamo.Enabled:= bEnabled;
  frmLancamento.cboSubRamo.Enabled:= bEnabled;
  frmLancamento.txtEspecie.Enabled:= bEnabled;
  frmLancamento.txtComarca.Enabled:= bEnabled;
  frmLancamento.txtFonte.Enabled:= bEnabled;
  frmLancamento.txtNumero.Enabled:= bEnabled;
  frmLancamento.reEmenta.Enabled:= bEnabled;

  frmLancamento.btnIncluir.Enabled:= not bEnabled;
  frmLancamento.btnAlterar.Enabled:= not bEnabled;
  frmLancamento.btnGravar.Enabled:= bEnabled;
  frmLancamento.btnCancelar.Enabled:= bEnabled;
  frmLancamento.btnExcluir.Enabled:= not bEnabled;
end;

procedure TfrmLancamento.btnAlterarClick(Sender: TObject);
begin
  bUpdate:= true;
  EnabledFields(true);
end;

procedure TfrmLancamento.btnCancelarClick(Sender: TObject);
begin
  ADOQuery1.Cancel;
  //cboPermissao.ItemIndex:= StrToInt(ADOQuery1.FieldByName('Adm').Value);
  EnabledFields(false);
  DBGrid1.SetFocus;
end;

procedure TfrmLancamento.btnExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja excluir o lançameto?', 'Confirmção!', + MB_YESNO + MB_ICONQUESTION) = IDYES) then
  begin
    iID:= DBGrid1.SelectedField.Value;
    ADOQuery1.SQL.Clear;
    {ADOQuery1.SQL.Add('UPDATE usuario SET excluido = 1, UsuarioAlteracao = "' + frmLogin.idUsuario +
                                                    '", DataAlteracao = "' + FormatDateTime('yyyy/mm/dd HH:MM:SS', Now) +
                      '" WHERE idusuario = "' + IntToStr(iID) + '";');
    ADOQuery1.ExecSQL; }
    LoadLancamento();
    DBGrid1.SetFocus;
  end;
end;

procedure TfrmLancamento.btnIncluirClick(Sender: TObject);
begin
  bUpdate:= false;
  EnabledFields(true);
  ADOQuery1.Insert;
end;

procedure TfrmLancamento.Voltar1Click(Sender: TObject);
begin
  frmSubRamo.Show;
  frmLancamento.Close;
end;

end.
