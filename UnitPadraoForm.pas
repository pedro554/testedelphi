unit UnitPadraoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TPadraoForm = class
  private
    { Padronizar TButton}
    procedure padronizar_btn(btn: TButton);

    { Padronizar TPanel }
    procedure padronizar_panel(panel: TPanel);

    { Padronizar TEdit }
    procedure padronizar_edt(edt: TEdit);

  public
    { Padronizar os forms}
    procedure padronizar(Form: TForm; Titulo: String; Altura, Largura: Integer; PadronizarComponentes: Boolean; const Estilo: TFormStyle = fsNormal; const Estado_Janela: TWindowState = TWindowState.wsNormal);

    { Padronizar componentes }
    procedure padronizar_componentes(Form: TForm);

    { Atalhos padrão }
    procedure padronizar_atalhos(Form: TForm;  Sender: TObject; Key: Word);

  end;

implementation

{ TPadraoForm }

procedure TPadraoForm.padronizar(Form: TForm; Titulo: String; Altura, Largura: Integer; PadronizarComponentes: Boolean; const Estilo: TFormStyle = fsNormal; const Estado_Janela: TWindowState = TWindowState.wsNormal);
begin
  { Configurações gerais }
  Form.Caption      := Titulo;
  Form.BorderIcons  := [biSystemMenu, biMinimize, biMaximize];
  Form.BorderStyle  := bsSizeable;
  Form.Align        := alNone;
  Form.Color        := clWhite;
  Form.FormStyle    := Estilo;
  Form.KeyPreview   := true;
  Form.Position     := poScreenCenter;
  Form.WindowState  := Estado_janela;

  { Tamanho do form }
  Form.Height := Altura;
  Form.Width  := Largura;

  { Fonte }
  Form.Font.Size  := 10;
  Form.Font.Color   := clBlack;
  Form.Font.Style   := [];
  Form.Font.Name    := 'Tahoma';

  if PadronizarComponentes then
    padronizar_componentes(Form);
end;

procedure TPadraoForm.padronizar_atalhos(Form: TForm;  Sender: TObject; Key: Word);
begin
  case Key of
    VK_ESCAPE: Form.Close; { Tecla esc fecha o Form }
    VK_RETURN: Form.Perform(40, 0, 0); { Troca a tecla TAB por ENTER }
  end;
end;

procedure TPadraoForm.padronizar_btn(btn: TButton);
begin
  btn.Cursor            := crHandPoint;
  btn.Width             := 120;
  btn.Height            := 30;
  btn.AlignWithMargins  := true;
  btn.Margins.Bottom    := 5;
  btn.Margins.Left      := 5;
  btn.Margins.Right     := 5;
  btn.Margins.Top       := 5;
  btn.TabStop           := false;
end;

procedure TPadraoForm.padronizar_componentes(Form: TForm);
var
  I: Integer;
begin
  for I := 0 to Form.ComponentCount - 1 do
  begin
    if Form.Components[i] is TButton then
      padronizar_btn(TButton(Form.Components[i]))
    else if Form.Components[i] is TPanel then
      padronizar_panel(TPanel(Form.Components[i]))
    else if Form.Components[i] is TEdit then
      padronizar_edt(TEdit(Form.Components[i]));
  end;
end;

procedure TPadraoForm.padronizar_edt(edt: TEdit);
begin
  edt.CharCase := TEditCharCase.ecUpperCase;
end;

procedure TPadraoForm.padronizar_panel(panel: TPanel);
begin
  panel.BevelOuter  := bvNone;
  panel.Height      := 50;
  panel.Caption     := '';
end;

end.
