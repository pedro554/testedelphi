unit UnitCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, UnitPadraoForm, UnitClassBanco,
  Vcl.Mask, UnitClassCliente,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TForm_Cadastro = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    btnSair: TButton;
    btnGravar: TButton;
    edtNome: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCPF: TMaskEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    edtNumero: TEdit;
    Label7: TLabel;
    edtCidade: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    edtNomeMae: TEdit;
    Label4: TLabel;
    edtNomePai: TEdit;
    Label5: TLabel;
    edtCEP: TMaskEdit;
    cbEstado: TComboBox;
    edtEndereco: TEdit;
    Label10: TLabel;
    edtRG: TEdit;
    edtCodigo: TEdit;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGravarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    padrao: TPadraoForm;
    FEditar: Boolean;
    FCliente: TCliente;

    procedure atribuir_valores;
    procedure limpar;
  public
    property editar: Boolean read FEditar write FEditar;
    property cliente: TCliente read FCliente write FCliente;

    procedure preencher_campos(id: string);
  end;

var
  Form_Cadastro: TForm_Cadastro;

implementation

{$R *.dfm}

procedure TForm_Cadastro.atribuir_valores;
begin
  cliente.id        := edtCodigo.Text;
  cliente.nome      := edtNome.Text;
  cliente.cpf       := edtCPF.Text;
  cliente.rg        := edtRG.Text;
  cliente.mae       := edtNomeMae.Text;
  cliente.pai       := edtNomePai.Text;
  cliente.cep       := edtCEP.Text;
  cliente.endereco  := edtEndereco.Text;
  cliente.numero    := edtNumero.Text;
  cliente.cidade    := edtCidade.Text;
  cliente.estado    := cbEstado.Text;
end;

procedure TForm_Cadastro.btnGravarClick(Sender: TObject);
begin
  atribuir_valores;

  if not editar then
    cliente.cadastrar
  else
    cliente.editar;

  close;
end;

procedure TForm_Cadastro.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TForm_Cadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  limpar;
end;

procedure TForm_Cadastro.FormCreate(Sender: TObject);
begin
  { Ao criar o form, padroniza com os valores passados }
  padrao.padronizar(self, 'Cadastro cliente', 400, 800, true);

  cliente := TCliente.Create;
end;

procedure TForm_Cadastro.FormDestroy(Sender: TObject);
begin
  cliente.free;
end;

procedure TForm_Cadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  padrao.padronizar_atalhos(self, sender, key);
  case key of
    vk_f1: btnGravarClick(sender);
  end;
end;

procedure TForm_Cadastro.limpar;
var
  i: Integer;
begin
  for i := 0 to self.ComponentCount - 1 do
  begin
    if self.Components[i] is TEdit then
      TEdit(self.Components[i]).Text := ''
    else if self.Components[i] is TMaskEdit then
      TMaskEdit(self.Components[i]).Text := ''
    else if self.Components[i] is TComboBox then
      TComboBox(self.Components[i]).ItemIndex := 0;
  end;
end;

procedure TForm_Cadastro.preencher_campos(id: string);
var
  bd: TBanco;
  erro: string;
begin
  bd := TBanco.Create;
  if not bd.conectar(erro) then
  begin
    bd.free;
    showmessage(erro);
    exit;
  end;

  bd.qry.Open('select * from cliente, cliente_endereco where cliente.id=:id and cliente_endereco.idcliente=:id', [id]);
  edtCodigo.text    := id;
  edtNome.Text      := bd.qry.fieldbyname('nome').AsString;
  edtCPF.Text       := bd.qry.fieldbyname('cpf').AsString;
  edtRG.Text        := bd.qry.fieldbyname('rg').AsString;
  edtNomeMae.Text   := bd.qry.fieldbyname('mae').AsString;
  edtNomePai.Text   := bd.qry.fieldbyname('pai').AsString;
  edtNumero.Text    := bd.qry.fieldbyname('numero').AsString;
  edtCidade.Text    := bd.qry.fieldbyname('cidade').AsString;
  edtCEP.Text       := bd.qry.fieldbyname('cep').AsString;
  edtEndereco.Text  := bd.qry.fieldbyname('endereco').AsString;
  cbEstado.Text     := bd.qry.fieldbyname('estado').AsString;

  bd.free;
end;

end.
