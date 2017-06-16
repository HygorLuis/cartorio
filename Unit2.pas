unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Data.DB, Data.Win.ADODB,
  Vcl.DBLookup, Vcl.Buttons, Vcl.Mask, frxClass, frxDBSet, frxPreview,
  IBServices, Vcl.Imaging.pngimage, Vcl.ButtonGroup;

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
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    cboRamo: TComboBox;
    cboSubRamo: TComboBox;
    Panel1: TPanel;
    btnAvançada: TBitBtn;
    cboFiltro: TComboBox;
    btnSair: TBitBtn;
    txtAvançada: TMaskEdit;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPreview1: TfrxPreview;
    Backup1: TMenuItem;
    pnlBackup: TPanel;
    btnSairBackup: TBitBtn;
    ProgressBar1: TProgressBar;
    btnIniciarBackup: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    lblUltimoBackup: TLabel;
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
    ADOQuery4: TADOQuery;
    Image1: TImage;
    Timer1: TTimer;
    Label4: TLabel;
    lblDuracao: TLabel;
    Label6: TLabel;
    lblUsuarioCri: TLabel;
    Gerar1: TMenuItem;
    Excluir1: TMenuItem;
    pnlExcluirBackup: TPanel;
    ln1: TLabel;
    ln2: TLabel;
    ln3: TLabel;
    ln4: TLabel;
    ln5: TLabel;
    ln6: TLabel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    ButtonGroup1: TButtonGroup;
    GroupBox1: TGroupBox;
    DataSource2: TDataSource;
    lvBackup: TListView;
    btnExcluir: TBitBtn;
    ProgressBar2: TProgressBar;
    lblProgress: TLabel;
    pnlSenha: TPanel;
    txtSenha: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
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
    procedure btnAvançadaClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure ADOQuery1DataCriacaoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cboFiltroChange(Sender: TObject);
    procedure txtAvançadaChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure btnIniciarBackupClick(Sender: TObject);
    procedure btnSairBackupClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Gerar1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure txtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure lvBackupItemChecked(Sender: TObject; Item: TListItem);
  private
    OldCursor: TCursor;
    sCaminho: string;
    TimeOld: TDateTime;
    iCount: integer;
  public
    sFilter, sFilterAdvanced: String;
  end;

var
  frmConsulta: TfrmConsulta;

implementation

{$R *.dfm}

uses Unit1, Unit3, Unit4, ShellApi;

function VerifySenha(idUsuario:String; Senha:String): Boolean;
begin
    frmLogin.ADOQuery1.SQL.Clear;
    frmLogin.ADOQuery1.SQL.Add('SELECT Senha FROM usuario WHERE idusuario = "' + idUsuario + '" AND Adm = "1" AND (excluido IS NULL OR excluido != 1);');
    frmLogin.ADOQuery1.open;
    frmLogin.ADOQuery1.Active := true;

    if (Senha = frmLogin.ADOQuery1.FieldByName('Senha').Value) then
    begin
      result:= true;
    end;
end;

procedure LoadLvBackup();
var ListItem: TListItem;
    Count: integer;
begin
  Count:= 1;
  frmConsulta.lvBackup.Clear;

  with frmConsulta.ADOQuery4 do
  begin
    SQL.Clear;
    SQL.Add('SELECT u.Nome as Usuario, b.Nome as Backup ' +
            'FROM backup b ' +
            'INNER JOIN usuario u ON u.idusuario = b.UsuarioCriacao ' +
            'WHERE (b.excluido IS NULL OR b.excluido != 1) ORDER BY b.DataCriacao DESC;');
    open;
    Active:= true;
  end;

    while not frmConsulta.ADOQuery4.Eof do
      begin
        if Count > 5 then
        begin
          ListItem:= frmConsulta.lvBackup.Items.Add;
          ListItem.SubItems.Add(frmConsulta.ADOQuery4.FieldByName('Usuario').Value);
          ListItem.SubItems.Add(frmConsulta.ADOQuery4.FieldByName('Backup').Value);
        end;
        Count:= Count + 1;
        frmConsulta.ADOQuery4.Next;
      end;
end;

function GetFileList(const Path: string): TStringList;
 var
   I: Integer;
   SearchRec: TSearchRec;
 begin
   Result := TStringList.Create;
   try
     I := FindFirst(Path, 0, SearchRec);
     while I = 0 do
     begin
       Result.Add(SearchRec.Name);
       I := FindNext(SearchRec);
     end;
   except
     Result.Free;
     raise;
   end;
end;

procedure VisibleFields(bVisible: Boolean);
begin
  frmConsulta.ln1.Visible:= bVisible;
  frmConsulta.ln2.Visible:= bVisible;
  frmConsulta.ln3.Visible:= bVisible;
  frmConsulta.ln4.Visible:= bVisible;
  frmConsulta.ln5.Visible:= bVisible;
  frmConsulta.ln6.Visible:= bVisible;
  frmConsulta.GroupBox1.Visible:= bVisible;

  frmConsulta.btnConfirmar.Visible:= bVisible;
  frmConsulta.btnExcluir.Visible:= not bVisible;
  frmConsulta.lvBackup.Visible:= not bVisible;
  frmConsulta.lblProgress.Visible:= not bVisible;
  frmConsulta.ProgressBar2.Visible:= not bVisible;
end;

procedure LoadBackup();
begin
  with frmConsulta.ADOQuery4 do
  begin
    SQL.Clear;
    SQL.Add('SELECT u.Nome as Usuario, b.Nome as Backup, b.DataCriacao ' +
            'FROM backup b ' +
            'INNER JOIN usuario u ON u.idusuario = b.UsuarioCriacao ' +
            'WHERE (b.excluido IS NULL OR b.excluido != 1) ORDER BY b.DataCriacao DESC LIMIT 1;');
    open;
    Active:= true;
  end;

  if (frmConsulta.ADOQuery4.Eof) then
  begin
    frmConsulta.lblUltimoBackup.Font.Color:= clRed;
    frmConsulta.lblUsuarioCri.Font.Color:= clRed;
    frmConsulta.lblUltimoBackup.Caption:= 'NUNCA';
    frmConsulta.lblUsuarioCri.Caption:= 'N/A';
  end
  else
  begin
    frmConsulta.lblUltimoBackup.Font.Color:= clWindowText;
    frmConsulta.lblUsuarioCri.Font.Color:= clWindowText;
    frmConsulta.lblUltimoBackup.Caption:= frmConsulta.ADOQuery4.FieldByName('DataCriacao').Value;
    frmConsulta.lblUsuarioCri.Caption:= frmConsulta.ADOQuery4.FieldByName('Usuario').Value;
  end;
end;

procedure EnabledFields(bEnabled: Boolean);
begin
  frmConsulta.DBGrid1.Enabled:= bEnabled;
  frmConsulta.MainMenu1.Items[0].Enabled:= bEnabled;
  frmConsulta.MainMenu1.Items[1].Enabled:= bEnabled;
  frmConsulta.cboRamo.Enabled:= bEnabled;
  frmConsulta.cboSubRamo.Enabled:= bEnabled;
  frmConsulta.btnAvançada.Enabled:= bEnabled;
  frmConsulta.frxPreview1.Enabled:= bEnabled;
end;

procedure EnabledFieldsBackup(bEnabled: Boolean);
begin
  frmConsulta.btnIniciarBackup.Enabled:= bEnabled;
  frmConsulta.btnSairBackup.Enabled:= bEnabled;
end;

function Backup(sBackup: String): Boolean;
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
  frmConsulta.DBGrid1.OnCellClick(frmConsulta.DBGrid1.Columns[0]);
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

procedure TfrmConsulta.btnConfirmarClick(Sender: TObject);
begin
  pnlExcluirBackup.Enabled:= False;
  pnlSenha.Visible:= True;
  txtSenha.SetFocus;
end;

procedure TfrmConsulta.btnExcluirClick(Sender: TObject);
var i: integer;
    dProgress: double;
begin
  if (Application.MessageBox('Deseja excluir os backup(s) selecionado(s)?', 'Confirmção!', + MB_YESNO + MB_ICONQUESTION) = IDYES) then
  begin
    dProgress:= 0;
    dProgress:= ProgressBar2.Max / iCount;

    for i:= 0 to lvBackup.Items.Count-1 do
      if (lvBackup.Items[i].Checked) then
      begin
        with ADOQuery4 do
        begin
          SQL.Clear;
          SQL.Add('UPDATE backup SET excluido = 1, UsuarioAlteracao = "' + frmLogin.idUsuario +
                                               '", DataAlteracao = "' + FormatDateTime('yyyy/mm/dd HH:MM:SS', Now) +
                '" WHERE Nome = "' + lvBackup.Items[i].SubItems[1] + '";');
          ExecSQL;
        end;

        if not (DeleteFile('C:\DB_Backups\' + lvBackup.Items[i].SubItems[1])) then
          Application.MessageBox(PChar('Erro ao excluir o backup ' + lvBackup.Items[i].SubItems[1]), 'Erro!', + MB_OK + MB_ICONERROR);

        ProgressBar2.Position:= ProgressBar2.Position + Round(dProgress);
        lblProgress.Caption:= IntToStr(ProgressBar2.Position) + '%';
      end;

      if ProgressBar2.Position <> ProgressBar2.Max then
      begin
        ProgressBar2.Position:= ProgressBar2.Position + (ProgressBar2.Max - ProgressBar2.Position);
        lblProgress.Caption:= IntToStr(ProgressBar2.Position) + '%';
      end;

      LoadLvBackup();
  end;
end;

procedure TfrmConsulta.btnCancelarClick(Sender: TObject);
begin
  EnabledFields(True);
  DBGrid1.SetFocus;
  pnlExcluirBackup.Visible:= False;
end;

procedure TfrmConsulta.btnCancelClick(Sender: TObject);
begin
  EnabledFields(True);
  DBGrid1.SetFocus;
  txtSenha.Clear;
  pnlSenha.Visible:= False;
  pnlExcluirBackup.Enabled:= True;
  pnlExcluirBackup.Visible:= False;
end;

procedure TfrmConsulta.btnAvançadaClick(Sender: TObject);
begin
  Panel1.Visible:= True;
end;

procedure TfrmConsulta.btnSairBackupClick(Sender: TObject);
begin
  EnabledFields(True);
  DBGrid1.SetFocus;
  pnlBackup.Visible:= False;
end;

procedure TfrmConsulta.btnSairClick(Sender: TObject);
begin
  txtAvançada.Clear;
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
  txtAvançada.Text:= '';
  case cboFiltro.ItemIndex of
    0: txtAvançada.EditMask:= '';
    1: txtAvançada.EditMask:= '';
    2: txtAvançada.EditMask:= '';
    3: txtAvançada.EditMask:= '';
    4: txtAvançada.EditMask:= '';
  end;
  txtAvançada.SetFocus;
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
  DBGrid1.SetFocus;
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
begin
  sCaminho:= ExtractFilePath(Application.ExeName);

  frxReport1.LoadFromFile(sCaminho + 'relEmenta.fr3');
  frxReport1.Preview:= frxPreview1;
  frxReport1.ShowReport();
end;

procedure TfrmConsulta.DBGrid1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  sleep(50);
  sCaminho:= ExtractFilePath(Application.ExeName);

  frxReport1.LoadFromFile(sCaminho + 'relEmenta.fr3');
  frxReport1.Preview:= frxPreview1;
  frxReport1.ShowReport();
end;

procedure TfrmConsulta.Excluir1Click(Sender: TObject);
begin
  pnlExcluirBackup.Visible:= True;
  EnabledFields(False);
  VisibleFields(True);
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

procedure TfrmConsulta.Gerar1Click(Sender: TObject);
begin
  pnlBackup.Visible:= True;
  LoadBackup();
  EnabledFields(False);
end;

procedure TfrmConsulta.btnIniciarBackupClick(Sender: TObject);
var slFiles: TStringList;
begin
  TimeOld:= Now;
  Timer1.Enabled:= True;
  ProgressBar1.Style:= pbstMarquee;
  EnabledFieldsBackup(False);
  sCaminho:= ExtractFilePath(Application.ExeName) + 'Backup.bat';
  Label1.Caption:= 'Aguarde enquanto o processo de backup é realizado...';
  //WinExec('C:\Projetos\cartorio\Win32\Debug\Backup.bat', SW_NORMAL);
  if (Backup(sCaminho)) then
  begin
    Timer1.Enabled:= False;
    slFiles:= GetFileList('C:\DB_Backups\*.sql');
    slFiles.Sort();
    with ADOQuery4 do
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO backup (Nome, Duracao, UsuarioCriacao, DataCriacao) VALUES ("' + slFiles[slFiles.Count-1] +
                                                                                   '", "' + lblDuracao.Caption +
                                                                                   '", "' + frmLogin.idUsuario +
                                                                                   '", "' + FormatDateTime('yyyy/mm/dd HH:MM:SS', Now) + '");');
      ExecSQL;
    end;
    EnabledFieldsBackup(True);
    ProgressBar1.Style:= pbstNormal;
    LoadBackup();
    Application.MessageBox('Backup realizado com sucesso!', 'Sucesso!', + MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    EnabledFieldsBackup(True);
    ProgressBar1.Style:= pbstNormal;
    Application.MessageBox('Falha no backup!', 'Error!', + MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmConsulta.btnOkClick(Sender: TObject);
begin
  if (VerifySenha(frmLogin.idUsuario, txtSenha.Text)) then
  begin
    Application.MessageBox('Por questões de segurança, não serão exibidos os ultimos 30 backup`s.', 'Atenção!', + MB_OK + MB_ICONINFORMATION);
    pnlSenha.Visible:= False;
    txtSenha.Clear;
    pnlExcluirBackup.Enabled:= True;
    VisibleFields(False);
    LoadLvBackup();
  end
  else
  begin
    Application.MessageBox('Senha Incorreta!', 'Error!', + MB_OK + MB_ICONERROR);
    txtSenha.Clear;
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

procedure TfrmConsulta.lvBackupItemChecked(Sender: TObject; Item: TListItem);
begin
  if (Item.Checked) then
  begin
    iCount:= iCount + 1;
  end
  else
    if iCount > 0 then
      iCount:= iCount -1;
end;

procedure TfrmConsulta.Timer1Timer(Sender: TObject);
begin
  lblDuracao.Caption:= FormatDateTime('HH:MM:SS', + NOW - TimeOld);
end;

procedure TfrmConsulta.txtAvançadaChange(Sender: TObject);
begin
  if (cboFiltro.ItemIndex < 0) then
  begin
    Application.MessageBox('Favor selecionar um filtro!', 'Atenção!', + MB_OK + MB_ICONWARNING);
  end
  else
  begin
    if (Length(txtAvançada.Text) <> 0) then
    begin
      sFilterAdvanced:= '';
      case cboFiltro.ItemIndex of
        0: sFilterAdvanced:= ' AND Especie LIKE "%' + txtAvançada.Text + '%"';
        1: sFilterAdvanced:= ' AND Comarca LIKE "%' + txtAvançada.Text + '%"';
        2: sFilterAdvanced:= ' AND Fonte LIKE "%' + txtAvançada.Text + '%"';
        3: sFilterAdvanced:= ' AND Numero LIKE "%' + txtAvançada.Text + '%"';
        4: sFilterAdvanced:= ' AND Ementa LIKE "%' + txtAvançada.Text + '%"';
      end;
      Search(sFilter + sFilterAdvanced);
    end
    else
      begin
        Search(sFilter);
      end;
  end;
end;

procedure TfrmConsulta.txtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    btnOk.OnClick(btnOk);
  end;
end;

end.
