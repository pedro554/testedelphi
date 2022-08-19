unit UnitClassBanco;

interface
uses
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.SysUtils, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, IniFiles;

type
  TBanco = class
    private
      FQry: TFDQuery;
      FDriver: TFDPhysMySQLDriverLink;
      FCon: TFDConnection;

      function banco_existe: boolean;

      procedure conectar_servidor;
    public
      constructor Create;
      destructor Destroy; override;

      property qry: TFDQuery read FQry write FQry;
      property driver: TFDPhysMySQLDriverLink read FDriver write FDriver;
      property con: TFDConnection read FCon write FCon;

      function conectar(out Erro: String): boolean;

      procedure criar_bd;
  end;

implementation

{ TBanco }

function TBanco.banco_existe: boolean;
begin
  try
    qry.ExecSQL('USE `testedelphi`;');
    result := true;
  except
    result := false;
  end;
end;

function TBanco.conectar(out Erro: String): boolean;
begin
  { Estabelece a conexão com o banco de dados }
  result := false;
  conectar_servidor;
  Con.Params.Values['Database']   := 'testedelphi';

  try
    Con.Connected := true;
    result        := true;
  except
    on E: Exception do
      Erro := 'Falha ao estabelecer conexão com o banco de dados: ' + E.Message;
  end;
end;

procedure TBanco.conectar_servidor;
var
  ini: TIniFile;
begin
  ini := TIniFile.Create(GetCurrentDir + '\cfgbanco.ini');

  { Configurações de conexão com o servidor do banco de dados }
  try
    Con.Params.Values['Server']     := ini.ReadString('cfg', 'Server', 'localhost');
    Con.Params.Values['User_name']  := ini.ReadString('cfg', 'User_name', 'root');
    Con.Params.Values['Password']   := ini.ReadString('cfg', 'Password', 'spsg91g8');

    { Por ser um teste com banco de dados SQL, o sistema não permite alterar estas opções }
    Con.Params.Values['DriverID']   := 'MySQL';
    Con.Params.Values['Port']       := '3306';

    ini.free;
  except
    on E: Exception do
    begin
      ini.free;
      raise Exception.Create('Falha ao conectar com o servidor: ' + E.Message);
    end;
  end;
end;

constructor TBanco.Create;
begin
  qry               := TFDQuery.Create(nil);
  driver            := TFDPhysMySQLDriverLink.Create(nil);
  driver.VendorLib  := GetCurrentDir + '\libmysql.dll';
  con               := TFDConnection.Create(nil);

  qry.connection    := Con;
end;

procedure TBanco.criar_bd;
begin
  conectar_servidor;

  { Verifica se o banco de dados ja existe, para não precisar executar os comandos a baixo sempre que abrir o sistema }
  if banco_existe then
    exit;

  qry.ExecSQL('CREATE DATABASE IF NOT EXISTS `testedelphi`');

  qry.ExecSQL(  'USE `testedelphi`;' +
                  'CREATE TABLE IF NOT EXISTS `cliente` (' +
                  '`id` int(11) NOT NULL AUTO_INCREMENT,' +
                  '`nome` varchar(50) DEFAULT NULL,' +
                  '`cpf` varchar(14) DEFAULT NULL,' +
                  '`rg` int(10) unsigned DEFAULT 0,' +
                  '`mae` varchar(50) DEFAULT NULL,' +
                  '`pai` varchar(50) DEFAULT NULL,' +
                  'PRIMARY KEY (`id`)' +
                  ') ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;');

   qry.ExecSQL( 'USE `testedelphi`;' +
                  'CREATE TABLE IF NOT EXISTS `cliente_endereco` (' +
                  '`id` int(11) NOT NULL AUTO_INCREMENT,' +
                  '`cep` varchar(50) DEFAULT NULL,' +
                  '`endereco` varchar(50) DEFAULT NULL,' +
                  '`numero` int(11) DEFAULT NULL,' +
                  '`cidade` varchar(50) DEFAULT NULL,' +
                  '`estado` varchar(2) DEFAULT NULL,' +
                  '`idcliente` int(11) NOT NULL,' +
                  'PRIMARY KEY (`id`) USING BTREE,' +
                  'KEY `FK_cliente_endereco_cliente` (`idcliente`),' +
                  'CONSTRAINT `FK_cliente_endereco_cliente` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE' +
                  ') ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb3;');

   Con.Commit;
end;

destructor TBanco.Destroy;
begin
  driver.free;
  qry.free;
  con.free;
  inherited;
end;

end.
