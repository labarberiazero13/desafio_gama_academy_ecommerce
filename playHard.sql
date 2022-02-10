/*CÓDIGOS PARA INSERÇÃO DE TABELA*/
CREATE TABLE cliente(
   id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
   nome VARCHAR(100) NOT NULL, 
   email VARCHAR(70) NOT NULL UNIQUE, 
   senha VARCHAR(20) NOT NULL, 
   cpf VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE endereco(
num_seq    INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
tipo       VARCHAR(5) NOT NULL, 
logradouro VARCHAR(45) NOT NULL, 
numero     INTEGER, 
complemento VARCHAR(20), 
bairro     VARCHAR(30), 
cidade     VARCHAR(50),
estado     VARCHAR(2), 
cep        VARCHAR(10), 
cliente_id INTEGER NOT NULL,
CONSTRAINT endereco_cliente FOREIGN KEY 
(cliente_id) REFERENCES cliente(id)
);

CREATE TABLE departamento(
codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nome   VARCHAR(50) NOT NULL, 
descricao TEXT
);

CREATE TABLE pedido(
numero INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
status VARCHAR(1) NOT NULL, 
data_pedido DATE, 
valor_bruto DOUBLE, 
desconto    DOUBLE, 
valor_final   DOUBLE, 
cliente_id INTEGER NOT NULL,
CONSTRAINT cliente_pedido FOREIGN KEY 
(cliente_id) REFERENCES cliente(id)
);

CREATE TABLE produto(
codigo INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(45) NOT NULL, 
descricao TEXT, 
preco DOUBLE, 
estoque INTEGER, 
link_foto VARCHAR(255), 
departamento_codigo INTEGER NOT NULL,
CONSTRAINT produto_depto FOREIGN KEY 
(departamento_codigo) REFERENCES departamento(codigo)
);

CREATE TABLE item_pedido(
num_sequencial INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY, 
quantidade INTEGER, 
valor_unitario DOUBLE, 
valor_total DOUBLE, 
produto_codigo INTEGER NOT NULL, 
pedido_numero INTEGER NOT NULL,
CONSTRAINT item_produto FOREIGN KEY 
(produto_codigo) REFERENCES produto(codigo),
CONSTRAINT item_pedido FOREIGN KEY 
(pedido_numero) REFERENCES pedido(numero)
);

===============================================================================================================

/*INSERINDO DADOS DE CLIENTES*/
insert into cliente (id, nome, email, senha, cpf) value 
(null, 'Igor Nathan Barros', 'iigornathanbarros@muvacademia.com.br', '4588', '878.063.376-52');

insert into cliente (id, nome, email, senha, cpf) value 
(null, 'Lucas Roberto Corte Real', 'lucasrobertocortereal-80@gmeil.com', 'hNAeEQB1uA', '779.825.749-71');

insert into cliente (id, nome, email, senha, cpf) value 
(null, 'Pedro Hugo Jesus', 'ppedrohugojesus@ctfmgacc.org.br', 'lk7rLjP9pC', '461.665.817-00');

insert into cliente (id, nome, email, senha, cpf) value 
(null, 'Renato Juan Giovanni Monteiro', 'renatojuangiovannimonteiro-87@wikimetal.com.br', 'njR0J0r2qJ', '22.821.172-4');

insert into cliente (id, nome, email, senha, cpf) value 
(null, 'Gabriel Sérgio Porto', 'gabrielsergioporto..gabrielsergioporto@hmhabitacoesmodernas.com.br', 'iLDSas8tAP', '157.266.322-73');

insert into cliente (id, nome, email, senha, cpf) value 
(null,'Raul Levi Cavalcanti', 'rraullevicavalcanti@dinamicaconsultoria.com', '83tcXgb1Y7', '774.479.485-00');

insert into cliente (id, nome, email, senha, cpf) value 
(null, "Lúcia Sabrina Moura", "luciasabrinamoura__luciasabrinamoura@goldenhotel.com.br", "F8YkPcFjrg", "655.204.324-49");

insert into cliente (id, nome, email, senha, cpf) value 
(null, "Gabriela Juliana Mirella dos Santos", "gabrielajulianamirelladossantos_@lta-am.com.br", "A3EkKu2Jx7", "755.262.900-26");

insert into cliente (id, nome, email, senha, cpf) value
(null, "Cláudia Emily Vanessa Gomes", "claudiaemilyvanessagomes..claudiaemilyvanessagomes@paraisopolis.com.br", "JwX6FrOb5l", "992.317.333-03");

insert into cliente (id, nome, email, senha, cpf) value
(null, "Sabrina Analu da Rosa", "sabrinaanaludarosa_@munhozengenharia.com.br", "9JTxRg0WGI", "688.120.052-84");

/*CONSULTA CLIENTES*/
select * from cliente

===============================================================================================================

/*INSERINDO ENDEREÇOS DE CLIENTES*/
insert into endereco (num_seq, tipo, lagadouro, numero, complemento, bairro, cidade, estado, cep, cliente_id) values
(null, 'Rua', 'Eliezer de Carvalho', '776', 'sem complemento', 'Igarapé', 'Porto velho', 'RO', '76824-228', '1');

insert into endereco (num_seq, tipo, lagadouro, numero, complemento, bairro, cidade, estado, cep, cliente_id) values
(null, 'Rua', 'Três', '952', '','Cachoeira', 'Betim', 'MG', '32602-364', '2');

insert into endereco (num_seq, tipo, lagadouro, numero, complemento, bairro, cidade, estado, cep, cliente_id) values
(null, 'Rua', 'Travessa Educandos', '464', '', 'Loteamento São José', 'Rio Branco', 'AC', '69918-572', '3');

insert into endereco (num_seq, tipo, lagadouro, numero, complemento, bairro, cidade, estado, cep, cliente_id) values
(null, 'Rua', 'Rua Doutor José Ribeiro de Carvalho', '453', '', 'Catarina', 'Teresina', 'PI', '64023-643', '4');

insert into endereco (num_seq, tipo, lagadouro, numero, complemento, bairro, cidade, estado, cep, cliente_id) values
(null, 'Rua', 'Benjamin Constant', '135', '', 'São critóvão', 'Porto Velho', 'RO', '76804-072', '5');

insert into endereco (num_seq, tipo, lagadouro, numero, complemento, bairro, cidade, estado, cep, cliente_id) values
(null, 'Rua', 'Via 3', '540', '', 'Chácaras do Abreu', 'Formosa', 'GO', '73804-020', '6');

insert into endereco (num_seq, tipo, lagadouro, numero, complemento, bairro, cidade, estado, cep, cliente_id) values
(null, '', 'Travessa Cupuaçu', '557', '', 'Coroado', 'Manaus', 'AM', '69082-479', '7');

insert into endereco (num_seq, tipo, lagadouro, numero, complemento, bairro, cidade, estado, cep, cliente_id) values
(null, '', 'Quadra QNO 17 conjunto 39', '335', '', 'Ceilândia Norte', 'Brasília', 'DF', '72260-739', '8');

insert into endereco (num_seq, tipo, lagadouro, numero, complemento, bairro, cidade, estado, cep, cliente_id) values
(null, 'Av', 'Guapuré', '597', '', 'Setor 06', 'Ariquemes', 'RO', '76873-675', '9');

insert into endereco (num_seq, tipo, lagadouro, numero, complemento, bairro, cidade, estado, cep, cliente_id) values
(null, 'Rua', 'Florisvaldo Bispo dos Santos', '501', '', 'Dernival Oliveira', 'Paulo Afonso', 'BA', '48603-828', '10');

/*CONSULTA ENDEREÇOS*/
select * from endereco

===============================================================================================================

/*INSERINDO DEPARTAMENTOS*/
insert into departamento (codigo, nome, descricao) values
(null, 'Jogos Ps5', 'Games para seu Ps5');

insert into departamento (codigo, nome, descricao) values
(null, 'Jogos Ps4', 'Games para seu Ps4');

insert into departamento (codigo, nome, descricao) values
(null, 'Jogos Xbox XS', 'Games para seu Xbox XS');

insert into departamento (codigo, nome, descricao) values
(null, 'Jogos Nintendo', 'Games para seu Nintendo');

insert into departamento (codigo, nome, descricao) values
(null, 'Jogos PC', 'Games para seu PC');

/*CONSULTA DEPARTAMENTOS*/
select * from departamento
===============================================================================================================

/*INSERINDO PRODUTOS*/
insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Uncharted: Legacy of Thieves Collection PS5', 'Uncharted: Legacy of Thieves Collection é uma remasterização 
para a nova geração de 2 dos principais jogos da franquia UNCHARTED', '169.90', '50', './img/uncharted.png', '1');

insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Tom Clancys Rainbow Six Siege Deluxe PS5', 'Desbloqueie a verdadeira experiência Rainbow Six Siege com a Ultimate Edition, 
que inclui o jogo completo, todos os mapas e modos, 
uma lista de 38 operadores exclusivos dos Anos 1 a 5 
de Siege e acesso sazonal ao exclusivo Disruptor Cosmetic Pack.', '62.90', '45', './img/rainbow.png', '1');

insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Fifa 22 PS5', 'FIFA 22 chega ao Playstation 5 com gráficos impressionantes
 e uma jogabilidade ultra realista. 
 A função Powered by Footbal, 
 EA SPORTS FIFA 22 deixa o jogo ainda mais 
 real com avanços fundamentais de jogabilidade e uma n
 ova temporada de inovações em todos os modos, 
 além da tecnologia inovadora HyperMotion 
 de próxima geração no PlayStation 5 que eleva cada momento da partida.', '229.90', '72', './img/fifa22.png', '1');

insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Forza Horizon 5 Xbox One / Series X', 'Sua maior aventura Horizon te espera!
 Lidere impressionantes expedições pelo mundo aberto vibrante
 e em constante evolução nas terras mexicanas.
 Participe de corridas divertidas e sem limites enquanto pilota
 centenas dos melhores carros do mundo.', '129.90', '90', './img/forza.png', '3');
 
insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Assassin’s Creed Valhalla Xbox One / XS', 'Em Assassin’s Creed Valhalla, 
você é Eivor, um guerreiro viking temível que cresceu em meio a histórias de batalhas e glória.
 Explore um belo e dinâmico mundo aberto que tem como cenário a Idade das Trevas da Inglaterra. 
 Ataque seus inimigos, amplie seu assentamento e consolide seu poder político na busca para ganhar um lugar entre os deuses de Valhalla.',
 '129.90', '30', './img/creed.png', '3');
 
insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Cyberpunk 2077 Xbox XS', 'Cyberpunk 2077 é um mundo aberto de ação e aventura dos criadores de The Witcher 3:
 Wild Hunt, a CD Projekt Red.',
 '98.31', '63', './img/cyber.png', '3');

insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Days Gone Ps4', 'Um jogo mundo aberto de ação que coloca o jogador em um mundo tomado por uma epidemia que mudou totalmente a forma como as pessoas vivem.
 Infectados agressivos são apenas parte do medo que os sobreviventes passam todos os dias, pois eles agem em hordas assustadoras que farão de tudo para chegar até você.',
 '69.90', '20', './img/daysgone.png', '2');

insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Red Dead Redemption 2 Ps4', 'o jogo possui mundo aberto, criando muito mais possibilidades para os jogadores. Sinta-se no velho oeste,
 a ambientação do game tenta trazer aos players uma imersão a época que o jogo se passa, utilize seus revólveres, monte em seu cavalo e explore as cidades, florestas, lagos, fazendas e muitas outras coisas presentes em Red Dead Redemption 2.',
 '119.90', '80', './img/reddead.png', '2');
 
insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Resident Evil 7 Biohazard Ps4', 'é um jogo obscuro, assustador e macabro, prometendo trazer de volta à franquia a atmosfera de terror dos seus grandes clássicos.A Gold edition inclui todas as DLC',
 '99.90', '51', './img/resident.png', '2');
 
insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Metroid Dread para Nintendo Switch', 'A Caçadora Samus Aran está de volta na sua primeira nova história em 2D!
Na terça feira (dia 14), durante a E3 2021 a Nintendo anunciou,
Metroid Dread para Nintendo Switch. Nesta história, 
continua após o capítulo do jogo Metroid Fusion quando ela vai ao planeta ZDR sondar transmissões misteriosas enviadas a federação galática.',
 '369.90', '25', './img/metroid.png', '4');

insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Super Mario 3D World + Bowsers fury switch', 'é a nova versão do Super Mario World, 
um grande clássico do mercado de games, para a Nintendo Switch. ',
 '332.91', '50', './img/mario.png', '4');

insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Hyrule Warriors: Age of Calamity', 'é um jogo de ação lançado em 2020 pela Nintendo para Nintendo Switch. É uma continuidade do Hyrule Warrior, 
dado que se passa cem anos antes dos eventos de The Legend of Zelda.',
 '332.91', '15', './img/zelda.png', '4');

insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Dying Light 2 Stay Human PC', 'O vírus venceu. A civilização voltou à Idade das Trevas.
 A Cidade, um dos últimos locais dos humanos, está prestes a entrar em colapso. 
 Use sua agilidade e habilidades de combate para sobreviver e transformar o mundo. 
Suas escolhas fazem a diferença.',
 '249.00', '100', './img/dying.png', '5');
 
insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'God of War PC', 'Com a vingança contra os deuses do Olimpo em um passado distante,
 Kratos agora vive como um mortal no reino dos deuses e monstros nórdicos.
 É nesse mundo duro e implacável que ele deve lutar para sobreviver...',
 '199.00', '112', './img/god.png', '5'); 
 
insert into produto (codigo, nome, descricao, preco, estoque, link_foto, departamento_codigo) value
(null, 'Farming Simulator 22 PC', 'Crie sua fazenda e cultive os bons tempos! Trate de culturas, 
cuide de animais, 
administre a produção e enfrente os desafios sazonais',
 '159.00', '40', './img/farming.png', '5');  

/*CONSULTA PRODUTOS*/
select * from produto
===============================================================================================================

/*INSERINDO PEDIDO DO CLIENTE*/
insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-01-01', '369.90', '0', '369.90', '1');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-01-19', '199.00', '0', '369.90', '9');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-01-21', '69.90', '0', '69.90', '4');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-02-11', '69.90', '0', '69.90', '2');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-02-14', '98.31', '0', '98.31', '6');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-02-16', '62.90', '0', '62.90', '9');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-03-3', '249.00', '0', '249.00', '2');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-03-17', '159.00', '0', '159.00', '1');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-03-26', '369.90', '0', '369.90', '8');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-04-06', '369.90', '0', '369.90', '2');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-04-23', '129.90', '0', '129.90', '1');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-04-25', '229.90', '0', '229.90', '6');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-05-12', '369.90', '0', '369.90', '10');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-05-13', '229.90', '0', '229.90', '1');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-05-16', '199.90', '0', '199.90', '7');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-05-06', '119.90', '0', '119.90', '5');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-06-27', '129.90', '0', '129.90', '7');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-06-29', '199.90', '0', '199.90', '8');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-07-07', '249.00', '0', '249.00', '7');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-07-14', '62.90', '0', '62.90', '1');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-07-16', '98.31', '0', '98.31', '2');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-08-14', '229.90', '0', '229.90', '4');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-08-17', '369.90', '0', '369.90', '7');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-08-20', '169.90', '0', '169.90', '10');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-09-01', '332.91', '0', '332.91', '9');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-09-20', '229.90', '0', '229.90', '8');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-09-28', '332.91', '0', '332.91', '3');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-10-03', '159.90', '0', '159.90', '3');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-10-20', '129.90', '0', '129.90', '9');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-10-26', '159.90', '0', '159.90', '10');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-11-06', '129.90', '0', '129.90', '7');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-11-17', '169.90', '0', '169.90', '2');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-11-24', '332.91', '0', '332.91', '9');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-12-02', '199.00', '0', '199.00', '8');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-12-04', '369.90', '0', '369.90', '3');

insert into pedido (numero, status, data_pedido, valor_bruto, desconto, valor_final, cliente_id) value
(null, 'V', '2022-12-24', '229.90', '0', '229.90', '7');

/*CONSULTA PEDIDOS*/
select * from pedido
===============================================================================================================

/*INSERINDO ITEM DO PEDIDO NO CLIENTE*/
insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '369.90', '369.90', '9', '1');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '199.00', '199.00', '14', '2');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '69.90', '69.90', '7', '3');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '69.90', '69.90', '7', '4');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '98.31', '98.31', '6', '5');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '62.90', '62.90', '2', '6');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '249.00', '249.00', '13', '7');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '159.00', '159.00', '15', '8');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '369.90', '369.90', '9', '9');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '369.90', '369.90', '10', '10');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '129.90', '129.90', '5', '11');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '229.90', '229.90', '3', '12');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '369.90', '369.90', '9', '13');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '229.90', '229.90', '3', '14');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '199.90', '199.90', '14', '15');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '119.90', '119.90', '8', '16');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '129.90', '129.90', '5', '17');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '119.90', '119.90', '8', '18');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '249.00', '249.00', '13', '19');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '62.90', '62.90', '2', '20');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '98.31', '98.31', '6', '21');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '229.90', '229.90', '3', '22');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '369.90', '369.90', '10', '23');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '169.90', '169.90', '1', '24');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '332.91', '332.91', '12', '25');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '229.90', '229.90', '3', '26');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '332.91', '332.91', '11', '27');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '159.00', '159.00', '15', '28');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '129.90', '129.90', '4', '29');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '159.00', '159.00', '15', '30');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '129.90', '129.90', '5', '31');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '169.90', '169.90', '1', '32');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '332.91', '332.91', '11', '33');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '199.00', '129.00', '14', '34');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '369.90', '369.90', '10', '35');

insert into item_pedido (num_sequencial, quantidade, valor_unitario, valor_total, produto_codigo, pedido_numero) value
(null, '1', '229.90', '229.90', '3', '36');

/*CONSULTA ITEM DO PEDIDO*/
select * from item_pedido

===============================================================================================================
/* RESOLUÇÃO DO DESAFIO */

/* QUESTÃO 1  REALIZADA ACIMA - Este exercício é livre para você inserir dados nas tabelas. Adicione vários dados em todas as tabelas. Crie vários clientes, com vários endereços. 
Insira muitos produtos em vários departamentos. 
Crie pedidos em várias datas com meses diferentes (serão necessários para os próximos exercícios) */

/* QUESTÃO 2 - Quantos clientes estão cadastrados na sua base? */
select count(id) from cliente;

/* QUSTÃO 3 - Qual o produto mais caro? */
select * from produto where preco = (select max(preco) from produto);

/* QUESTÃO 4 - Qual o produto mais barato? */
select * from produto where preco = (select min(preco) from produto);

/* QUESTÃO 5 - Mostre todos os produtos com seus respectivos departamentos */
select * from departamento left outer join produto on departamento.codigo = produto.departamento_codigo;

/* QUESTÃO 6 - Quantos produtos há em cada departamento? */
select departamento_codigo, count(preco) from produto group by departamento_codigo;

/* QUESTÃO 7 - Mostre os dados dos pedidos, incluindo nomes dos clientes e nomes dos produtos que foram vendidos. */
select * from pedido inner join item_pedido on pedido.numero = item_pedido.pedido_numero
	inner join produto on produto.codigo = item_pedido.produto_codigo
    inner join cliente on pedido.cliente_id = cliente.id;

/* QUESTÃO 8 - Mostre quantos pedidos foram feitos por mês no ano de 2022 */
select month(pedido.data_pedido), count(item_pedido.quantidade) from
	pedido inner join item_pedido
    group by month(pedido.data_pedido);

/* QUESTÃO 9 - Mostre quanto foi faturado por mês */
select data_pedido, sum(valor_final) as "Faturamento" from pedido
group by data_pedido;

/* QUESTÃO 10 - Mostre o valor total do estoque por departamento*/
select departamento_codigo, sum(preco*estoque) from produto group by departamento_codigo;