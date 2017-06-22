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
    Label1: TLabel;
    txtUsuarioCriacao: TDBEdit;
    Label2: TLabel;
    txtDataCriacao: TDBEdit;
    ADOQuery1idlancamento: TAutoIncField;
    ADOQuery1idRamo: TStringField;
    ADOQuery1idSubRamo: TStringField;
    ADOQuery1Especie: TStringField;
    ADOQuery1Comarca: TStringField;
    ADOQuery1Fonte: TStringField;
    ADOQuery1Numero: TStringField;
    ADOQuery1Ementa: TMemoField;
    ADOQuery1UsuarioCriacao: TStringField;
    ADOQuery1DataCriacao: TDateTimeField;
    ADOQuery1UsuarioAlteracao: TStringField;
    ADOQuery1DataAlteracao: TDateTimeField;
    ADOQuery1Excluido: TStringField;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Voltar1Click(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure ADOQuery1idRamoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery1idSubRamoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cboRamoClick(Sender: TObject);
    procedure LoadLancamento();
  private
    OldCursor: TCursor;
  public
    bUpdate: Boolean;
    iID, iIndex: integer;
  end;

var
  frmLancamento: TfrmLancamento;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit3;

procedure LoadRamo();
begin
  frmLancamento.ADOQuery2.SQL.Clear;
  frmLancamento.ADOQuery2.SQL.Add('SELECT * FROM ramo ORDER BY Nome;');
  frmLancamento.ADOQuery2.open;
  frmLancamento.ADOQuery2.Active:= true;
end;

Procedure LoadSubRamo();
begin
  if (frmLancamento.cboRamo.KeyValue <> null) then
  begin
    frmLancamento.ADOQuery3.SQL.Clear;
    frmLancamento.ADOQuery3.SQL.Add('SELECT * FROM sub_ramo WHERE idRamo = ' + IntToStr(frmLancamento.cboRamo.KeyValue)+ ' ORDER BY Nome;');
    frmLancamento.ADOQuery3.open;
    frmLancamento.ADOQuery3.Active:= true;
  end;
end;

function VerifyComponents(): Boolean;
begin
   if (frmLancamento.cboRamo.Text = '') or
      (frmLancamento.cboSubRamo.Text = '') or
      (frmLancamento.txtEspecie.Text = '') or
      (frmLancamento.txtComarca.Text = '') or
      (frmLancamento.txtFonte.Text = '') or
      (frmLancamento.txtNumero.Text = '') or
      (frmLancamento.reEmenta.Text = '') then
    Result:= true
   else
    Result:= false;
end;

procedure TfrmLancamento.LoadLancamento();
begin
  frmLancamento.ADOQuery1.SQL.Clear;
  frmLancamento.ADOQuery1.SQL.Add('SELECT * FROM lancamento WHERE (excluido IS NULL OR excluido != 1) ORDER BY DataCriacao DESC;');
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
  frmLancamento.reEmenta.ReadOnly:= not bEnabled;

  frmLancamento.btnIncluir.Enabled:= not bEnabled;
  frmLancamento.btnAlterar.Enabled:= not bEnabled;
  frmLancamento.btnGravar.Enabled:= bEnabled;
  frmLancamento.btnCancelar.Enabled:= bEnabled;
  frmLancamento.btnExcluir.Enabled:= not bEnabled;

  frmLancamento.MainMenu1.Items[0].Enabled:= not bEnabled;
end;

procedure TfrmLancamento.ADOQuery1idRamoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (Sender.value <> null) then
  begin
    ADOQuery2.SQL.Clear;
    ADOQuery2.SQL.Add('SELECT * FROM ramo WHERE idRamo = ' + Sender.value + ';');
    ADOQuery2.open;
    ADOQuery2.Active:= true;
    Text:=  ADOQuery2.FieldByName('Nome').Value;

    LoadRamo();
  end;
end;

procedure TfrmLancamento.ADOQuery1idSubRamoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (Sender.value <> null) then
  begin
    ADOQuery3.SQL.Clear;
    ADOQuery3.SQL.Add('SELECT * FROM sub_ramo WHERE idSubRamo = ' + Sender.value + ';');
    ADOQuery3.open;
    ADOQuery3.Active:= true;
    Text:=  ADOQuery3.FieldByName('Nome').Value;

    LoadSubRamo();
  end;
end;

procedure TfrmLancamento.btnAlterarClick(Sender: TObject);
begin
  iIndex:= DBGrid1.DataSource.DataSet.RecNo;
  bUpdate:= true;
  EnabledFields(true);
end;

procedure TfrmLancamento.btnCancelarClick(Sender: TObject);
begin
  ADOQuery1.Cancel;
  EnabledFields(false);
  DBGrid1.SetFocus;
end;

procedure TfrmLancamento.btnExcluirClick(Sender: TObject);
begin
  if (Application.MessageBox('Deseja excluir o lançameto?', 'Confirmção!', + MB_YESNO + MB_ICONQUESTION) = IDYES) then
  begin
    OldCursor:= Screen.Cursor;
    Screen.Cursor:= crHourglass;
    iID:= DBGrid1.SelectedField.Value;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('UPDATE lancamento SET excluido = 1, UsuarioAlteracao = "' + frmLogin.idUsuario +
                                                    '", DataAlteracao = "' + FormatDateTime('yyyy/mm/dd HH:MM:SS', Now) +
                      '" WHERE idlancamento = "' + IntToStr(iID) + '";');
    ADOQuery1.ExecSQL;
    LoadLancamento();
    DBGrid1.SetFocus;
    Screen.Cursor:= OldCursor;
  end;
end;

procedure TfrmLancamento.btnGravarClick(Sender: TObject);
var sEspecie, sComarca, sFonte, sNumero, sEmenta, sIndexRamo, sIndexSubRamo: String;
begin
  if (VerifyComponents()) then
  begin
    Application.MessageBox('Alguns campos estão em branco!', 'Atenção!', + MB_OK + MB_ICONEXCLAMATION);
  end
  else
  begin
    OldCursor:= Screen.Cursor;
    Screen.Cursor:= crHourglass;

    if (bUpdate) then
    begin
      iID:= DBGrid1.SelectedField.Value;
      sIndexRamo:= IntToStr(cboRamo.KeyValue);
      sIndexSubRamo:= IntToStr(cboSubRamo.KeyValue);
      sEspecie:= txtEspecie.Text;
      sComarca:= txtComarca.Text;
      sFonte:= txtFonte.Text;
      sNumero:= txtNumero.Text;
      sEmenta:= StringReplace(reEmenta.Text, '"', Chr(39)+Chr(39), [rfReplaceAll]);

      ADOQuery1.SQL.Clear;
      ADOQuery1.SQL.Add('UPDATE lancamento SET idRamo = "' + sIndexRamo +
                                           '", idSubRamo = "' + sIndexSubRamo +
                                           '", Especie = "' + sEspecie +
                                           '", Comarca = "' + sComarca +
                                           '", Fonte = "' + sFonte +
                                           '", Numero = "' + sNumero +
                                           '", Ementa = "' + sEmenta +
                                           '", UsuarioAlteracao = "' + frmLogin.idUsuario +
                                           '", DataAlteracao = "' + FormatDateTime('yyyy/mm/dd HH:MM:SS', Now) +
                        '" WHERE idlancamento = "' + IntToStr(iID) + '";');
      ADOQuery1.ExecSQL;
      LoadLancamento();
      EnabledFields(false);
      DBGrid1.DataSource.DataSet.MoveBy(iIndex-1);
      DBGrid1.SetFocus;
    end
    else
    begin
      txtUsuarioCriacao.Text:= frmLogin.idUsuario;
      txtDataCriacao.Text:= DateTimeToStr(Now);
      sEmenta:= reEmenta.Text;
      ADOQuery1.Post;
      EnabledFields(false);
      DBGrid1.SetFocus;
    end;
    Screen.Cursor:= OldCursor;
  end;
end;

procedure TfrmLancamento.btnIncluirClick(Sender: TObject);
begin
  bUpdate:= false;
  EnabledFields(true);
  ADOQuery1.Insert;
  //cboRamo.KeyValue:= 1;
end;

procedure TfrmLancamento.cboRamoClick(Sender: TObject);
begin
  ADOQuery3.SQL.Clear;
  ADOQuery3.SQL.Add('SELECT * FROM sub_ramo WHERE idRamo = ' + IntToStr(cboRamo.KeyValue) + ' ORDER BY Nome;');
  ADOQuery3.Open;
  ADOQuery3.Active:= true;
end;

procedure TfrmLancamento.Voltar1Click(Sender: TObject);
begin
  frmConsulta.Show;
  frmConsulta.cboRamo.ItemIndex:= 0;
  frmConsulta.cboRamo.OnChange(frmConsulta.cboRamo);
  frmConsulta.cboRamo.OnChange(frmConsulta.cboSubRamo);
  frmConsulta.DBGrid1.Columns[0];
  frmLancamento.Close;
end;

end.
