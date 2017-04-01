unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBLookup;

type
  TfrmSubRamo = class(TForm)
    MainMenu1: TMainMenu;
    CadUsurio1: TMenuItem;
    Fechar1: TMenuItem;
    CadUsurio2: TMenuItem;
    Lanamentos1: TMenuItem;
    lblRamo: TLabel;
    lblSubRamo: TLabel;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
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
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    cboRamo: TComboBox;
    cboSubRamo: TComboBox;
    procedure CadUsurio2Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboRamoChange(Sender: TObject);
    procedure ADOQuery1idRamoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery1idSubRamoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSubRamo: TfrmSubRamo;

implementation

{$R *.dfm}

uses Unit1, Unit3, Unit4;

procedure LoadRamo();
begin
  frmSubRamo.ADOQuery2.SQL.Clear;
  frmSubRamo.ADOQuery2.SQL.Add('SELECT * FROM ramo ORDER BY Nome;');
  frmSubRamo.ADOQuery2.open;
  frmSubRamo.ADOQuery2.Active:= true;
end;

Procedure LoadSubRamo();
begin
  if (frmSubRamo.cboRamo.ItemIndex > -1) then
  begin
    frmSubRamo.ADOQuery3.SQL.Clear;
    frmSubRamo.ADOQuery3.SQL.Add('SELECT * FROM sub_ramo WHERE idRamo = ' + IntToStr(frmSubRamo.cboRamo.ItemIndex + 1) + ' ORDER BY Nome;');
    frmSubRamo.ADOQuery3.open;
    frmSubRamo.ADOQuery3.Active:= true;
  end;
end;

procedure TfrmSubRamo.ADOQuery1idRamoGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
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

procedure TfrmSubRamo.ADOQuery1idSubRamoGetText(Sender: TField;
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

procedure TfrmSubRamo.CadUsurio2Click(Sender: TObject);
begin
  frmUsuario.show();
  frmUsuario.DBGrid1.SetFocus;
  frmSubRamo.Close;
end;

procedure TfrmSubRamo.cboRamoChange(Sender: TObject);
begin
  cboSubRamo.Clear;
  cboSubRamo.Items.Add('TODOS');
  LoadSubRamo();
  ADOQuery3.First;
  while not ADOQuery3.Eof do
  begin
    cboSubRamo.Items.Add(ADOQuery3.FieldByName('Nome').Value);
    ADOQuery3.Next;
  end;
  cboSubRamo.ItemIndex:= 0;
end;

procedure TfrmSubRamo.Fechar1Click(Sender: TObject);
begin
  frmLogin.Close;
end;

procedure TfrmSubRamo.FormShow(Sender: TObject);
begin
  cboRamo.Clear;
  ADOQuery2.First;
  while not ADOQuery2.Eof do
  begin
    cboRamo.Items.Add(ADOQuery2.FieldByName('Nome').Value);
    ADOQuery2.Next;
  end;
end;

procedure TfrmSubRamo.Lanamentos1Click(Sender: TObject);
begin
  frmLancamento.Show();
  frmLancamento.DBGrid1.SetFocus;
  frmSubRamo.Close;
end;

end.
