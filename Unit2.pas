unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBLookup, Vcl.Buttons, Vcl.Mask;

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
    Panel1: TPanel;
    btnAvan�ada: TBitBtn;
    cboFiltro: TComboBox;
    btnSair: TBitBtn;
    txtAvan�ada: TMaskEdit;
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
  private
    OldCursor: TCursor;
  public
    sFilter, sFilterAdvanced: String;
  end;

var
  frmSubRamo: TfrmSubRamo;

implementation

{$R *.dfm}

uses Unit1, Unit3, Unit4;

procedure LoadcboSubRamo();
begin
  frmSubRamo.ADOQuery3.First;
  while not frmSubRamo.ADOQuery3.Eof do
  begin
    frmSubRamo.cboSubRamo.Items.Add(frmSubRamo.ADOQuery3.FieldByName('Nome').Value);
    frmSubRamo.ADOQuery3.Next;
  end;
  frmSubRamo.cboSubRamo.ItemIndex:= 0;
end;

procedure Search(Filter: String);
begin
  frmSubRamo.ADOQuery1.SQL.Clear;
  frmSubRamo.ADOQuery1.SQL.Add('SELECT * FROM lancamento WHERE (excluido IS NULL OR excluido != 1)' + Filter + ' ORDER BY DataCriacao DESC;');
  frmSubRamo.ADOQuery1.open;
  frmSubRamo.ADOQuery1.Active:= true;
end;

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

procedure TfrmSubRamo.ADOQuery1DataCriacaoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (ADOQuery1.FieldByName('DataCriacao').Value <> NULL) then
    Text:=  FormatDateTime('dd/mm/yyyy', ADOQuery1.FieldByName('DataCriacao').Value);
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

procedure TfrmSubRamo.btnAvan�adaClick(Sender: TObject);
begin
  Panel1.Visible:= True;
end;

procedure TfrmSubRamo.btnSairClick(Sender: TObject);
begin
  txtAvan�ada.Clear;
  cboFiltro.ItemIndex:= -1;
  Panel1.Visible:= False;
  cboRamo.OnChange(frmSubRamo.cboRamo);
  cboRamo.OnChange(frmSubRamo.cboSubRamo);
end;

procedure TfrmSubRamo.CadUsurio2Click(Sender: TObject);
begin
  OldCursor:= Screen.Cursor;
  Screen.Cursor:= crHourGlass;

  frmUsuario.show();
  frmUsuario.LoadUser();
  frmUsuario.DBGrid1.SetFocus;
  Screen.Cursor:= OldCursor;
  frmSubRamo.Close;
end;

procedure TfrmSubRamo.cboFiltroChange(Sender: TObject);
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

procedure TfrmSubRamo.cboRamoChange(Sender: TObject);
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

procedure TfrmSubRamo.cboSubRamoChange(Sender: TObject);
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
  OldCursor:= Screen.Cursor;
  Screen.Cursor:= crHourGlass;

  frmLancamento.Show();
  frmLancamento.LoadLancamento();
  frmLancamento.DBGrid1.SetFocus;
  Screen.Cursor:= OldCursor;
  frmSubRamo.Close;
end;

procedure TfrmSubRamo.txtAvan�adaChange(Sender: TObject);
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
