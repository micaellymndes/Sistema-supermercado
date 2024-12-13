create database ATACADÃO_SUPERMERCADO;
use ATACADÃO_SUPERMERCADO; 

create table tbl_cliente (
id int not null auto_increment primary key,
nome_cliente varchar(100) not null,
CPF varchar(45) not null,
unique index(id)
);

create table tbl_telefone (
id int not null auto_increment primary key,
numero int not null,
id_cliente int not null,

constraint FK_cliente_telefone
foreign key (id_cliente)
references tbl_cliente (id),
unique index (id)
);

create table tbl_email (
id int not null auto_increment primary key,
email_cliente varchar(255) not null,
id_cliente int not null,

constraint FK_cliente_email 
foreign key (id_cliente)
references tbl_cliente (id),
unique index (id)

);
create table tbl_endereco (
id int not null auto_increment primary key,
logradouro varchar(255) not null,
bairro varchar (255) not null,
cep int not null, 
cidade varchar(255) not null,
pais varchar(100) not null,
id_cliente int not null,

constraint FK_cliente_endereco
foreign key (id_cliente)
references tbl_cliente (id),
unique index(id)
);

create table tbl_colaborador (
id int not null auto_increment primary key,
nome_colaborador varchar(100) not null,
CPF varchar(100) not null,
cargo varchar(45) not null,
data_admissao date not null,
unique index(id)
);
create table tbl_email_colaborador (
id int not null auto_increment  primary key,
email_colaborador varchar(255) not null,
id_colaborador int not null,

constraint FK_colaborador_email
foreign key (id_colaborador)
references tbl_colaborador (id),
unique index(id)
);

create table tbl_telefone_colaborador (
id int not null auto_increment  primary key,
numero_colaborador int not null,
id_colaborador int not null,

constraint FK_colaborador_telefone
foreign key (id_colaborador)
references tbl_colaborador (id),
unique index(id)
);
create table tbl_fornecedor (
id int not null auto_increment  primary key,
nome_fornecedor varchar(100) not null,
CNPJ int not null,
unique index (id)
);

create table tbl_email_fornecedor (
id int not null auto_increment  primary key,
email varchar(255) not null,
id_fornecedor int not null,

constraint FK_fornecedor_email
foreign key (id_fornecedor)
references tbl_fornecedor (id),
unique index(id)
);

create table tbl_telefone_fornecedor (
id int not null auto_increment  primary key,
numero int not null,
id_fornecedor int not null,

constraint FK_fornecedor_telefone
foreign key (id_fornecedor)
references tbl_fornecedor (id),
unique index(id)
);


create table tbl_produto (
id int not null auto_increment  primary key,
nome_produto varchar(100) not null,
descricao varchar(100),
preco_custo decimal not null,
preco_venda decimal not null,
data_validade date,
id_fornecedor int not null,

constraint FK_fornecedor_produto
foreign key (id_fornecedor)
references tbl_fornecedor (id),
unique index(id)
);

create table tbl_estoque (
id int not null auto_increment  primary key,
nome_produto varchar(100) not null,
quantidade int not null,
id_produto int not null,

constraint FK_produto_estoque
foreign key (id_produto)
references tbl_produto (id),
unique index(id)
);

create table tbl_categoria_produto (
id int not null auto_increment  primary key,
alimentos varchar(45) not null,
bebidas varchar(45) not null,
higiene varchar(45) not null,
id_produto int not null,

constraint FK_produto_categoria
foreign key (id_produto)
references tbl_produto (id),
unique index(id)
);

create table tbl_forma_pagamento (
id int not null auto_increment  primary key,
dinheiro varchar(45) not null,
pix varchar(45) not null,
cartao_credito varchar(45) not null,
cartao_debito varchar(45) not null,
unique index (id)
);

create table tbl_vendas (
id int not null auto_increment  primary key,
data_vendas  date not null,
valor_total decimal not null,
produto_vendido varchar(100) not null,
quantidade int not null,
id_colaborador int not null,
id_cliente int not null,
id_produto int not null, 
id_forma_pagamento int not null,

constraint FK_colaborador_venda
foreign key (id_colaborador)
references tbl_colaborador (id),


constraint FK_cliente_venda
foreign key (id_cliente)
references tbl_cliente (id),


constraint FK_produto_venda
foreign key (id_produto)
references tbl_produto (id),


constraint FK_pagamento_venda
foreign key (id_forma_pagamento)
references tbl_forma_pagamento (id),
unique index(id)
);

create table tbl_vendas_produto (
id int not null auto_increment  primary key,
quantidade_comprada int not null,
id_produto int not null,
id_vendas int not null,

constraint FK_vendas_produto
foreign key (id_produto)
references tbl_produto (id),


constraint FK_produto_vendido
foreign key (id_vendas)
references tbl_vendas (id),
unique index(id)
);

create table tbl_promocao (
id int not null auto_increment  primary key,
nome_promocao varchar(45) not null,
data_inicio date not null,
data_termino date not null,
percentual_desconto decimal not null,
id_produto int not null,
id_vendas int not null,

constraint FK_promocao_produto
foreign key (id_produto)
references tbl_produto (id),


constraint FK_venda_promocao
foreign key (id_vendas)
references tbl_vendas (id),
unique index(id)
);
create table tbl_promocao_produto (
id int not null auto_increment  primary key,
preco_promocional decimal not null,
quantidade_promocional int not null,
id_promocao int not null,

constraint FK_produto_promocao
foreign key (id_promocao)
references tbl_promocao (id),
unique index(id)
);

show tables
