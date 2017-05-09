unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBLookup, Vcl.Buttons, Vcl.Mask, frxClass, frxDBSet, frxPreview;

type
  TfrmConsulta = class(TForm)
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
    Panel1: TPanel;
    btnAvan�ada: TBitBtn;
    cboFiltro: TComboBox;
    btnSair: TBitBtn;
    txtAvan�ada: TMaskEdit;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPreview1: TfrxPreview;
    procedure CadUsurio2Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cboRamoChange(Sender: TObject);
    procedure ADOQuery1idRamoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure ADOQuery1idSubRamoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cboSubRamoChange(Sender: TObject);
    procedure btnAvan�adaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure ADOQuery1DataCriacaoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cboFiltroChange(Sender: TObject);
    procedure txtAvan�adaChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    OldCursor: TCursor;
  public
    sFilter, sFilterAdvanced: String;
  end;

var
  frmConsulta: TfrmConsulta;

implementation

{$R *.dfm}

uses Unit1, Unit3, Unit4;

procedure LoadcboSubRamo();
begin
  frmConsulta.ADOQuery3.First;
  while not frmConsulta.ADOQuery3.Eof do
  begin
    frmConsulta.cboSubRamo.Items.Add(frmConsulta.ADOQuery3.FieldByName('Nome').Value);
    frmConsulta.ADOQuery3.Next;
  end;
  frmConsulta.cboSubRamo.ItemIndex:= 0;
end;

procedure Search(Filter: String);
begin
  frmConsulta.ADOQuery1.SQL.Clear;
  frmConsulta.ADOQuery1.SQL.Add('SELECT * FROM lancamento WHERE (excluido IS NULL OR excluido != 1)' + Filter + ' ORDER BY DataCriacao DESC;');
  frmConsulta.ADOQuery1.open;
  frmConsulta.ADOQuery1.Active:= true;
end;

procedure LoadRamo();
begin
  frmConsulta.ADOQuery2.SQL.Clear;
  frmConsulta.ADOQuery2.SQL.Add('SELECT * FROM ramo ORDER BY Nome;');
  frmConsulta.ADOQuery2.open;
  frmConsulta.ADOQuery2.Active:= true;
end;

Procedure LoadSubRamo();
begin
  if (frmConsulta.cboRamo.ItemIndex > -1) then
  begin
    frmConsulta.ADOQuery3.SQL.Clear;
    frmConsulta.ADOQuery3.SQL.Add('SELECT * FROM sub_ramo WHERE idRamo = ' + IntToStr(frmConsulta.cboRamo.ItemIndex + 1) + ' ORDER BY Nome;');
    frmConsulta.ADOQuery3.open;
    frmConsulta.ADOQuery3.Active:= true;
  end;
end;

procedure TfrmConsulta.ADOQuery1DataCriacaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (ADOQuery1.FieldByName('DataCriacao').Value <> NULL) then
    Text:=  FormatDateTime('dd/mm/yyyy', ADOQuery1.FieldByName('DataCriacao').Value);
end;

procedure TfrmConsulta.ADOQuery1idRamoGetText(Sender: TField; var Text: string;
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

procedure TfrmConsulta.ADOQuery1idSubRamoGetText(Sender: TField;
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

procedure TfrmConsulta.btnAvan�adaClick(Sender: TObject);
begin
  Panel1.Visible:= True;
end;

procedure TfrmConsulta.btnSairClick(Sender: TObject);
begin
  txtAvan�ada.Clear;
  cboFiltro.ItemIndex:= -1;
  Panel1.Visible:= False;
  cboRamo.OnChange(frmConsulta.cboRamo);
  cboRamo.OnChange(frmConsulta.cboSubRamo);
end;

procedure TfrmConsulta.CadUsurio2Click(Sender: TObject);
begin
  OldCursor:= Screen.Cursor;
  Screen.Cursor:= crHourGlass;

  frmUsuario.show();
  frmUsuario.LoadUser();
  frmUsuario.DBGrid1.SetFocus;
  Screen.Cursor:= OldCursor;
  frmConsulta.Close;
end;

procedure TfrmConsulta.cboFiltroChange(Sender: TObject);
begin
  txtAvan�ada.Text:= '';
  case cboFiltro.ItemIndex of
    0: txtAvan�ada.EditMask:= '';
    1: txtAvan�ada.EditMask:= '';
    2: txtAvan�ada.EditMask:= '';
    3: txtAvan�ada.EditMask:= '';
    4: txtAvan�ada.EditMask:= '';
  end;
  txtAvan�ada.SetFocus;
end;

procedure TfrmConsulta.cboRamoChange(Sender: TObject);
begin
  OldCursor:= Screen.Cursor;
  Screen.Cursor:= crHourGlass;
  sFilter:= ' AND idRamo = ' + IntToStr(cboRamo.ItemIndex+1);
  cboSubRamo.Clear;
  cboSubRamo.Items.Add('TODOS');
  LoadSubRamo();
  LoadcboSubRamo();
  Search(sFilter);
  Screen.Cursor:= OldCursor;
end;

procedure TfrmConsulta.cboSubRamoChange(Sender: TObject);
begin
  OldCursor:= Screen.Cursor;
  Screen.Cursor:= crHourGlass;
  case cboSubRamo.ItemIndex of
    0: sFilter:= ' AND idRamo = ' + IntToStr(cboRamo.ItemIndex+1);
    1: sFilter:= ' AND idRamo = ' + IntToStr(cboRamo.ItemIndex+1) + ' AND idSubRamo = ' + IntToStr(cboSubRamo.ItemIndex);
    2: sFilter:= ' AND idRamo = ' + IntToStr(cboRamo.ItemIndex+1) + ' AND idSubRamo = ' + IntToStr(cboSubRamo.ItemIndex);
    3: sFilter:= ' AND idRamo = ' + IntToStr(cboRamo.ItemIndex+1) + ' AND idSubRamo = ' + IntToStr(cboSubRamo.ItemIndex);
  end;
  Search(sFilter);
  DBGrid1.SetFocus;
  Screen.Cursor:= OldCursor;
end;

procedure TfrmConsulta.DBGrid1CellClick(Column: TColumn);
var sCaminho: string;
begin
  sCaminho:= ExtractFilePath(Application.ExeName);

  frxReport1.LoadFromFile(sCaminho + 'relEmenta.fr3');
  frxReport1.Preview:= frxPreview1;
  frxReport1.ShowReport();
end;

procedure TfrmConsulta.DBGrid1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var sCaminho: string;
begin
  sCaminho:= ExtractFilePath(Application.ExeName);

  frxReport1.LoadFromFile(sCaminho + 'relEmenta.fr3');
  frxReport1.Preview:= frxPreview1;
  frxReport1.ShowReport();
end;

procedure TfrmConsulta.Fechar1Click(Sender: TObject);
begin
  frmLogin.Close;
end;

procedure TfrmConsulta.FormShow(Sender: TObject);
begin
  cboRamo.Clear;
  ADOQuery2.First;
  while not ADOQuery2.Eof do
  begin
    cboRamo.Items.Add(ADOQuery2.FieldByName('Nome').Value);
    ADOQuery2.Next;
  end;
end;

procedure TfrmConsulta.Lanamentos1Click(Sender: TObject);
begin
  OldCursor:= Screen.Cursor;
  Screen.Cursor:= crHourGlass;

  frmLancamento.Show();
  frmLancamento.LoadLancamento();
  frmLancamento.DBGrid1.SetFocus;
  Screen.Cursor:= OldCursor;
  frmConsulta.Close;
end;

procedure TfrmConsulta.txtAvan�adaChange(Sender: TObject);
begin
  if (cboFiltro.ItemIndex < 0) then
  begin
    Application.MessageBox('Favor selecionar um filtro!', 'Aten��o!', + MB_OK + MB_ICONWARNING);
  end
  else
  begin
    if (Length(txtAvan�ada.Text) <> 0) then
    begin
      sFilterAdvanced:= '';
      case cboFiltro.ItemIndex of
        0: sFilterAdvanced:= ' AND Especie LIKE "%' + txtAvan�ada.Text + '%"';
        1: sFilterAdvanced:= ' AND Comarca LIKE "%' + txtAvan�ada.Text + '%"';
        2: sFilterAdvanced:= ' AND Fonte LIKE "%' + txtAvan�ada.Text + '%"';
        3: sFilterAdvanced:= ' AND Numero LIKE "%' + txtAvan�ada.Text + '%"';
        4: sFilterAdvanced:= ' AND Ementa LIKE "%' + txtAvan�ada.Text + '%"';
      end;
      Search(sFilter + sFilterAdvanced);
    end
    else
      begin
        Search(sFilter);
      end;
  end;
end;

end.
