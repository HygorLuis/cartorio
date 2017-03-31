unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TfrmSubRamo = class(TForm)
    MainMenu1: TMainMenu;
    CadUsurio1: TMenuItem;
    Fechar1: TMenuItem;
    CadUsurio2: TMenuItem;
    Lanamentos1: TMenuItem;
    cboSubRamo: TComboBox;
    procedure CadUsurio2Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Lanamentos1Click(Sender: TObject);
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


procedure TfrmSubRamo.CadUsurio2Click(Sender: TObject);
begin
  frmUsuario.show();
  frmUsuario.DBGrid1.SetFocus;
  frmSubRamo.Close;
end;

procedure TfrmSubRamo.Fechar1Click(Sender: TObject);
begin
  frmLogin.Close;
end;

procedure TfrmSubRamo.Lanamentos1Click(Sender: TObject);
begin
  frmLancamento.Show();
  frmLancamento.DBGrid1.SetFocus;
  frmSubRamo.Close;
end;

end.
