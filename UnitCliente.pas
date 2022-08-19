unit UnitCliente;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, UnitClassBanco,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TCliente = class
    private
      FNome: string;
      FCPF: string;
      FRG: string;
      FPai: string;
      FMae: string;
    procedure SetCPF(const Value: string);
    procedure SetRG(const Value: string);
    public
      property nome: string read FNome write FNome;
      property cpf: string read FCPF write SetCPF;
      property rg: string read FRG write SetRG;
      property mae: string read FMae write FMae;
      property pai: string read FPai write FPai;


      constructor Create;
      destructor Destroy; override;

      procedure cadastrar;
      procedure excluir;
      procedure editar;
  end;

implementation

{ TCliente }

procedure TCliente.cadastrar;
var
  bd: TBanco;
  tb: TFDTable;
  erro: string;
begin
  bd := TBanco.Create;

  if not bd.conectar(erro) then
    showmessage(erro);
  
  tb := TFDTable.Create(nil);
  
  tb.Connection := bd.con;
  tb.TableName  := 'cliente';
  tb.Active     := true;

  tb.Insert;
  tb.fieldbyname('nome').AsString := nome;
  tb.fieldbyname('cpf').AsString  := cpf;
  tb.fieldbyname('rg').AsString   := rg;
  tb.fieldbyname('mae').AsString  := mae;
  tb.fieldbyname('pai').AsString  := pai;
  tb.Post;  

  tb.free;
  bd.free;

  showmessage('Cliente cadastrado');
end;

constructor TCliente.Create;
begin

end;

destructor TCliente.Destroy;
begin

  inherited;
end;

procedure TCliente.editar;
begin

end;

procedure TCliente.excluir;
begin

end;

procedure TCliente.SetCPF(const Value: string);
begin
  FCPF := Value;
end;

procedure TCliente.SetRG(const Value: string);
begin
  FRG := Value;
end;

end.
