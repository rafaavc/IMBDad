# IMBDad
Gráfico UML: https://drive.google.com/file/d/1Kfb0K9rVixMKcVXM8QM_8QYg6jSg05Xg/view?fbclid=IwAR1DlrWIMS4xg-so6GwzXwxo8pI2SGgoUcTaSmEigtLQOMzrzE8d8KkY9Y4

Relatório: https://docs.google.com/document/d/1V8rOgiysqNMPu2Ok7lEFIIz8MInvzcaOUimfKS9Nes8/edit?fbclid=IwAR15RgkxE3lQjEuv9sayKAzYb8tEuUy5iYwKVSXaIC-X5iVOk7oe8TN8J6E#heading=h.nirefwb1hxfi

## Entrega 1: done

## Entrega 2: in progress

#### B. Praticamente feita

#### C. Análise	de	Dependências	Funcionais e	Formas	Normais
Para	cada	relação	deve	ser	indicado o	conjunto	de	dependências	funcionais associado e	eventuais	violações	à	Forma	Normal	Boyce-Codd	e	3ª	Forma	Normal.	A	não	existência	de	violações	deve	ser	justificada.	Esta	análise	deve	também	ser	
acrescentada	ao	relatório.

#### D. Criação	da	base	de	dados	em	SQLite
O próximo	passo	envolve	criar	a	base	de	dados	em	SQLite.	O	SQLite	permite	ler	comandos de	um	ficheiro.	Esta	funcionalidade	deve	ser	usada	para	(re)criar	a	base de	dados	sempre	que	necessário. Deve	ser	criado um	ficheiro	chamado	criar.sql que	inclua	as	instruções	SQL	para criar	todas	as	tabelas	mencionadas	no	esquema	relacional	resultante	do	passo	4.	
Antes	da criação	das	tabelas, ser	garantida	a	eliminação	de	tabelas	anteriores	com	o mesmo	nome.	O	ficheiro	deve	assemelhar-se	a:

```
drop table if exists R1;
...
create table R1 (....);
...
```

#### E. Adição	de	restrições	à	base	de	dados
Na	criação	da	base	de	dados	devem	ser	incluídas todas	as	restrições	convenientes para	a	manutenção	da	integridade	dos	dados	armazenados.	É	necessário	considerar que	a	implementação	de	restrições	em	SQLite	não	está	totalmente	em	conformidade com	o	standard	SQL-99	(SQL2).
As	restrições	definidas devem	ser	listadas,	de	forma	ordenada	e	em	linguagem	natural (por	exemplo:	“não	pode	haver	dois	estudantes	com	o	mesmo	ID”),	no relatório.	Para	cada	uma	das	restrições	deve também	ser	especificada a	sua	forma	de implementação	– restrição	chave	(PRIMARY	KEY	ou	UNIQUE), restrição	de integridade	referencial	(chave	estrangeira), restrição	CHECK, restrição	NOT	NULL?
Depois	de	identificada	a	forma	de	implementação	de	cada	restrição,	é	necessário implementá-las.	Para	isso	devem	ser	feitas	alterações	ao	ficheiro	criar.sql.	As restrições	que	necessitarem	de	um	gatilho	para	serem	implementadas,	devem	ser	deixadas	para	a	Entrega	III do	projeto.
O	ficheiro	criar.sql deve	ser	submetido	na	2ª	entrega.

#### F. Carregamento	de	dados
Após	a	criação	da	base	de	dados	é	necessário	proceder	ao	seu	povoamento.	Nesta fase	deve	ser	criar	um	ficheiro	chamado	povoar.sql que	contenha	as	instruções	SQL necessárias	para	a	introdução	de	dados	nas	tabelas	criadas. No	início	deste	ficheiro deve ser	incluída a instrução
```PRAGMA	foreign_keys	=	ON;```
de	forma	a	garantir	que	está	ativa	a	verificação	de	integridade	referencial	da	base	de dados.
O	ficheiro	povoar.sql deve	ser	submetido	na	2ª	entrega.

