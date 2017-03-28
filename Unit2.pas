unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TfrmSubRamo = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    CadUsurio1: TMenuItem;
    Fechar1: TMenuItem;
    CadUsurio2: TMenuItem;
    Lanamentos1: TMenuItem;
    cboSubRamo: TComboBox;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid3: TDBGrid;
    DBGrid2: TDBGrid;
    procedure CadUsurio2Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure cboSubRamoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSubRamo: TfrmSubRamo;

implementation

{$R *.dfm}

uses Unit1, Unit3;


procedure TfrmSubRamo.CadUsurio2Click(Sender: TObject);
begin
  frmUsuario.show();
  frmSubRamo.Close;
end;

procedure TfrmSubRamo.cboSubRamoChange(Sender: TObject);
begin
  case cboSubRamo.ItemIndex of
    0 : begin
          Panel1.Visible:= true;
          Panel2.Visible:= false;
          Panel3.Visible:= false;
        end;

    1 : begin
          Panel2.Visible:= true;
          Panel1.Visible:= false;
          Panel3.Visible:= false;
        end;

    2 : begin
          Panel3.Visible:= true;
          Panel2.Visible:= false;
          Panel1.Visible:= false;
        end;
  end;
end;

procedure TfrmSubRamo.Fechar1Click(Sender: TObject);
begin
  frmLogin.Close;
end;

end.
