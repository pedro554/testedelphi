program ProjectTesteDelphi;

uses
  Vcl.Forms,
  UnitCadastro in 'UnitCadastro.pas' {Form_Cadastro},
  UnitPadraoForm in 'UnitPadraoForm.pas',
  UnitClassBanco in 'UnitClassBanco.pas',
  UnitPrincipal in 'UnitPrincipal.pas' {Form_Principal},
  UnitClassCliente in 'UnitClassCliente.pas',
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TForm_Principal, Form_Principal);
  Application.CreateForm(TForm_Cadastro, Form_Cadastro);
  Application.Run;
end.
