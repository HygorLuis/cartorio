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
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
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
    DBEdit4: TDBEdit;
    lblComarca: TLabel;
    DBEdit5: TDBEdit;
    lblFonte: TLabel;
    DBEdit6: TDBEdit;
    lblNumero: TLabel;
    DBEdit7: TDBEdit;
    lblRamo: TLabel;
    lblSubRamo: TLabel;
    DBRichEdit1: TDBRichEdit;
    MainMenu1: TMainMenu;
    Voltar1: TMenuItem;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancamento: TfrmLancamento;

implementation

{$R *.dfm}

uses Unit1, Unit2, Unit3;

end.
