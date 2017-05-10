program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {frmLogin},
  Unit2 in 'Unit2.pas' {frmConsulta},
  Unit3 in 'Unit3.pas' {frmUsuario},
  Unit4 in 'Unit4.pas' {frmLancamento};

{$R *.res}

begin
  //Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmConsulta, frmConsulta);
  Application.CreateForm(TfrmUsuario, frmUsuario);
  Application.CreateForm(TfrmLancamento, frmLancamento);
  Application.Run;
end.
