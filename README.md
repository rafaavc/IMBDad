# IMBDad
[Gráfico UML](https://drive.google.com/file/d/1Kfb0K9rVixMKcVXM8QM_8QYg6jSg05Xg/view?fbclid=IwAR1DlrWIMS4xg-so6GwzXwxo8pI2SGgoUcTaSmEigtLQOMzrzE8d8KkY9Y4)

[Relatório](https://docs.google.com/document/d/1V8rOgiysqNMPu2Ok7lEFIIz8MInvzcaOUimfKS9Nes8/edit?fbclid=IwAR15RgkxE3lQjEuv9sayKAzYb8tEuUy5iYwKVSXaIC-X5iVOk7oe8TN8J6E#heading=h.nirefwb1hxfi)

## Entrega 1: done (18)

## Entrega 2: done

## Entrega 3: in progress

### G. Interrogação da Base	de	dados

Para	esta	tarefa	deve	ser	definido	um	conjunto	de	interrogações	pertinentes	para	o	
contexto	da	base	de	dados.	Por	exemplo,	uma	interrogação	que	liste	os	países	
existentes	numa	base	de	dados	de	uma	biblioteca	é	menos	pertinente	do	que	uma	
interrogação	que	lista	os	livros	mais	requisitados	num	dado	período.	Deste	conjunto,
devem	ser	selecionadas 10	interrogações	que:

- sejam diferentes	entre	si	(por	exemplo,	ter	uma	interrogação	que	lista	o	nome	dos	
clientes	na	base	de	dados	e	outra	que	lista	o	nome	das	empresas	na	base	de	dados	é	
equivalente a	ter	apenas	1	interrogação);
- na	sua	construção	façam	uso	da	maior diversidade	de	operadores	SQL;
- sejam	de	complexidade	distinta.

As	10	interrogações	devem	ser	listadas,	de	forma	ordenada	e em	linguagem	natural,
no	relatório.	

Tal	como	na	criação	da	base	de	dados,	as	interrogações	devem	começar	por	ser	
testadas	interactivamente	através	do cliente	de linha	de	comando	do	SQLite.

As	interrogações	devem	ser	eficientes.	Sempre	que	possível	devem	privilegiar	as	
junções	às	sub-interrogações.

Cada	uma	das	10	interrogações	deve	ser	escrita	num	ficheiro	próprio:	int1.sql,	
int2.sql,	...,	int10.sql.	No	início	destes	ficheiros	devem	ser	incluídas as	seguintes	
instruções	para	tornar	o	resultado	mais	legível:

```
.mode	 columns
.headers	on
.nullvalue	NULL
```
Os	nomes	dos	ficheiros	devem	corresponder à	ordenação	das	interrogações	
mencionadas	no	relatório.

### H. Adição	de	gatilhos	à	base	de	dados

Por	fim,	devem	ser	definidos 3	gatilhos	que	sejam	úteis	para	a	monitorização	e	
manutenção	da	base	de	dados. Pelo	menos	um	dos	gatilhos	deve	implementar	uma	
restrição.	Para	cada	gatilho	devem	ser	criados 3 ficheiros:	gatilhoN_adiciona.sql,
gatilhoN_remove.sql e	gatilhoN_verifica.sql,	com	N	=	1,	2	ou	3.

Em	gatilhoN_adiciona.sql,	deve	ser	incluída a	instrução	SQL	que	permite criar	o	
gatilho.	Caso	a	restrição	para	a	qual se	está	a	criar	o	gatilho	possa	ser	violada	por	
mais	do	que	um	tipo	de	modificação	à	base	de	dados,	pode	ser	necessário criar	mais	
do	que	um	gatilho	para	garantir	a	restrição.	Se	o	gatilho	descobrir	que	uma	restrição	
está	a	ser	violada,	pode	modificar	a	base	de	dados	de	forma	a	garantir	que	a	violação	
é	anulada ou	pode	desencadear	um	erro.	Um	gatilho	SQLite	pode	desencadear	um	
erro	através	de:

```
SELECT	raise(rollback,	‘<mensagem	de	erro>’);
```
Quando	esta	instrução	é	executada,	a	ação	que	desencadeou	o	gatilho	é	desfeita	e	é	
apresentada	a	mensagem	de	erro	pretendida.
  
No	ficheiro	gatilhoN_remove.sql deve	ser	incluída a	instrução	que	elimina	o	gatilho	
da	base	de	dados.
  
No	ficheiro	gatilhoN_verifica.sql devem	ser	incluídas as	instruções	SQL	que	permitem	
confirmar	que	o	gatilho	está	bem	implementado.	Por	exemplo,	se	o	gatilho	inserir	
um	tuplo	na	relação	R2	sempre	que	seja	inserido	um	tuplo	na	relação	R1,	este	
ficheiro	deverá	ter instruções	semelhantes	a:	
  
```
SELECT	*	FROM	TABLE R2;
INSERT	INTO	R1 VALUES (valor1,	valor2,	...);
SELECT	*	FROM	TABLE	R2;
```
  
No	relatório	deve	descrever	sucintamente, de	forma	ordenada	e	em	linguagem	
natural, os	3	gatilhos	implementados.

Os	nomes	dos	ficheiros	devem	corresponder à	ordenação	das	interrogações	
mencionadas	no	relatório. Em	cada	um	dos	ficheiros,	deve	ser	ativada	a	verificação	
de	integridade	referencial.

