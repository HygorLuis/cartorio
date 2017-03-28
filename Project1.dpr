program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {frmLogin},
  Unit2 in 'Unit2.pas' {frmSubRamo},
  Unit3 in 'Unit3.pas' {frmUsuario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSubRamo, frmSubRamo);
  Application.CreateForm(TfrmUsuario, frmUsuario);
  Application.Run;
end.
