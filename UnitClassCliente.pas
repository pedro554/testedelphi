unit UnitClassCliente;

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
      FID: string;
      FCEP: string;
      FEndereco: string;
      FNumero: string;
      FCidade: string;
      FEstado: string;
      procedure SetRG(const Value: string);
      procedure setNumero(const Value: string);
      procedure setNome(const Value: string);
    public
      property id: string read FID write FID;
      property nome: string read FNome write setNome;
      property cpf: string read FCPF write FCPF;
      property rg: string read FRG write SetRG;
      property mae: string read FMae write FMae;
      property pai: string read FPai write FPai;
      property cep: string read FCEP write FCEP;
      property endereco: string read FEndereco write FEndereco;
      property numero: string read FNumero write setNumero;
      property cidade: string read FCidade write FCidade;
      property estado: string read FEstado write FEstado;

      procedure cadastrar;
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
  begin
    bd.free;
    showmessage(erro);
    exit;
  end;
  
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

  tb.Active := false;
  tb.TableName := 'cliente_endereco';
  tb.Active := true;

  bd.qry.ExecSQL('insert into cliente_endereco(`cep`, `endereco` ,`numero` ,`cidade` ,`estado` ,`idcliente`) ' +
                  'values (:cep, :endereco, :numero, :cidade, :estado, LAST_INSERT_ID())',
                  [cep, endereco, numero, cidade, estado]);

  tb.free;
  bd.free;

  showmessage('Cliente cadastrado');
end;

procedure TCliente.editar;
var
  qry: TFDQuery;
  bd: TBanco;
  erro: string;
begin
  bd := TBanco.Create;
  if not bd.conectar(erro) then
  begin
    bd.Free;
    showmessage(erro);
    exit;
  end;

  qry := TFDQuery.Create(nil);
  qry.Connection := bd.con;

  qry.ExecSQL('update cliente set nome=:n, cpf=:c, rg=:r, mae=:m, pai=:p where id=:id', [nome, cpf, rg, mae, pai, id]);
  qry.ExecSQL('update cliente_endereco set cep=:cep, endereco=:end, numero=:num, cidade=:cid, estado=:est where idcliente=:id',
    [cep, endereco, numero, cidade, estado, id]);

  bd.free;
  qry.free;

  Showmessage('Cliente editado');
end;

procedure TCliente.setNome(const Value: string);
begin
  if Trim(Value) = '' then
    raise Exception.Create('Informe o nome do cliente');

  FNome := Value;
end;

procedure TCliente.setNumero(const Value: string);
begin
  try
    StrToInt(Value);
  except
    raise Exception.Create('O número não é válido');
  end;

  FNumero := Value;
end;

procedure TCliente.SetRG(const Value: string);
begin
  if Value.Length > 10 then
    raise Exception.Create('o RG deve ter no máximo 10 caracteres');

  FRG := Value;
end;

end.
