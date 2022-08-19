unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UnitPadraoForm, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, UnitClassBanco,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Menus, frxClass, frxDBSet, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef;

type
  TForm_Principal = class(TForm)
    Panel1: TPanel;
    edtPesquisar: TEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btnExcluir: TButton;
    btnSair: TButton;
    btnCadastro: TButton;
    btnEditar: TButton;
    btnPesquisar: TButton;
    DataSource1: TDataSource;
    MainMenu1: TMainMenu;
    Relatrios1: TMenuItem;
    Clientes1: TMenuItem;
    relCliente: TfrxReport;
    dsCliente: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnCadastroClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
  private
    padrao: TPadraoForm;
    FBD: TBanco;

    function listar(valPesquisa: String): TFDQuery;
  public
    { Public declarations }

    property BD: TBanco read FBD write FBD;
  end;

var
  Form_Principal: TForm_Principal;

implementation

{$R *.dfm}

uses
  UnitCadastro;

procedure TForm_Principal.btnCadastroClick(Sender: TObject);
begin
  Form_Cadastro.editar := false;
  Form_Cadastro.ShowModal;

  btnPesquisarClick(sender);
end;

procedure TForm_Principal.btnEditarClick(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.fieldbyname('id').IsNull then
  begin
    Showmessage('Selecione um cliente para editar');
    exit;
  end;

  Form_Cadastro.editar := true;
  Form_Cadastro.preencher_campos(DBGrid1.DataSource.DataSet.fieldbyname('id').AsString);
  Form_Cadastro.ShowModal;

  btnPesquisarClick(sender);
end;

procedure TForm_Principal.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja excluír este cliente?', 'Teste Delphi', 4) = 6 then
  begin
    bd.qry.ExecSQL('delete from cliente where id=:id', [DBGrid1.DataSource.DataSet.fieldbyname('id').AsString]);
    btnPesquisarClick(sender);
  end;
end;

procedure TForm_Principal.btnPesquisarClick(Sender: TObject);
begin
  DataSource1.DataSet := listar(edtPesquisar.Text);
end;

procedure TForm_Principal.Clientes1Click(Sender: TObject);
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

  bd.qry.Open('select * from cliente, cliente_endereco where cliente_endereco.idcliente = cliente.id order by cliente.nome');
  dsCliente.DataSet := bd.qry;

  relCliente.ShowReport(true);
end;

procedure TForm_Principal.FormCreate(Sender: TObject);
begin
  padrao.padronizar(self, 'Clientes', 800, 1020, True);


  { Cria o banco de dados caso não exista }
  bd := TBanco.Create;
  bd.criar_bd;
end;

procedure TForm_Principal.FormDestroy(Sender: TObject);
begin
  bd.Free;
end;

procedure TForm_Principal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  padrao.padronizar_atalhos(self, sender, key);
  case Key of
    VK_F1: btnCadastroClick(sender);
    VK_F2: btnEditarClick(sender);
    VK_F4: btnExcluirClick(sender);
  end;
end;

procedure TForm_Principal.FormShow(Sender: TObject);
begin
  btnPesquisarClick(sender);
end;

function TForm_Principal.listar(valPesquisa: String): TFDQuery;
var
  erro: String;
  I: Integer;
begin
  if not bd.conectar(erro) then
  begin
    Showmessage(erro);
    exit;
  end;

  bd.qry.Open('select cliente.id, cliente.nome, cliente.cpf, cliente.rg, cliente.mae, cliente.pai, ' +
              'cliente_endereco.cep, cliente_endereco.endereco, cliente_endereco.numero, cliente_endereco.cidade, cliente_endereco.estado ' +
              'from cliente, cliente_endereco ' +
              'where cliente.nome like :n and cliente_endereco.idcliente = cliente.id', ['%' + valPesquisa + '%']);

  result := bd.qry;
end;

end.
