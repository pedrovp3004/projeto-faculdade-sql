use faculdade;


-- 01.Recupere a média de salários(avg) dos professores que são Adjunto 1. 

select 
avg(professores.vl_salario)
from professores inner join cargos 
on professores.cd_cargo = cargos.cd_cargo 
where nm_cargo = "Professor Adjunto-1";

-- 02.Recupere o nome e a quantidade de disciplinas com carga horária de 60h.

select 
nm_disciplina
,count(*)
from disciplinas 
where qt_carga_horaria = 60
group by nm_disciplina;


-- 03. Recupere o nome dos professores juntamente com o nome das disciplinas que eles ministraram em 2013.2.
select nm_professor, nm_disciplina
from professores inner join aulas 
on professores.cd_professor = aulas.cd_professor
inner join disciplinas 
on aulas.cd_disciplina = disciplinas.cd_disciplina
where nu_semestre = '2013.2';

-- 04. Recupere o nome dos professores que não ministraram disiciplinas em 2013.1 (use EXITS/NOT EXISTS)

select p.nm_professor
from professores p
where NOT EXISTS 
(select a.cd_professor from aulas a 
where a.cd_professor=p.cd_professor and a.nu_semestre='2013.1');

-- 05. Recupere o nome dos professores que nunca ministraram disciplinas 
select nm_professor 
from professores
left join aulas on professores.cd_professor = aulas.cd_professor
where cd_disciplina is null;

-- 06. Recupere o nome das disciplinas que foram ofertadas pelo menos duas vezes

select 
nm_disciplina
,count(*) as qtd_ofertada
from disciplinas inner join aulas 
on disciplinas.cd_disciplina = aulas.cd_disciplina 
group by nm_disciplina
having count(*) > 1;

-- 07. Retorne a quantidade de professores do departamento D001 que ministraram a disciplina IF973

SELECT 
    COUNT(*)
FROM
    professores
        INNER JOIN
    departamentos ON professores.cd_departamento = departamentos.cd_departamento
        INNER JOIN
    aulas ON professores.cd_professor = aulas.cd_professor
        INNER JOIN
    disciplinas ON disciplinas.cd_disciplina = aulas.cd_disciplina
WHERE
    departamentos.nm_departamento = 'D001-Ciencia da Computacao'
        AND disciplinas.nm_disciplina = 'IF973-Ciencia de Dados';
        
        
        
        
-- 08. Recupere os dados dos professores que já ministraram todas as disciplinas
select 
nm_professor
from professores 
inner join aulas on professores.cd_professor = aulas.cd_professor
inner join disciplinas on aulas.cd_disciplina = disciplinas.cd_disciplina
where disciplinas.cd_disciplina in (1 and 2 and 3);

-- 09.Recupere o nome das disciplinas que já foram ministradas por mais de um professor

select nm_disciplina
from disciplinas  
inner join aulas on disciplinas.cd_disciplina = aulas.cd_disciplina
group by nm_disciplina
having count(distinct aulas.cd_professor) > 1;

-- 10. Para cada departamento, recupere o numero do depto e o valor do maior salário do professor adjunto I.

SELECT 
    p.cd_departamento, 
    MAX(p.vl_salario) AS maior_salario_adjunto
FROM professores p
INNER JOIN cargos c ON p.cd_cargo = c.cd_cargo
WHERE c.nm_cargo = 'Professor Adjunto-1'
GROUP BY p.cd_departamento;

-- 11. Retorne o nome dos professores que ministraram tanto a disciplina IF973 quanto a disciplina IF992

SELECT p.nm_professor
FROM professores p
JOIN aulas a ON p.cd_professor = a.cd_professor
JOIN disciplinas d ON a.cd_disciplina = d.cd_disciplina
WHERE d.nm_disciplina IN ('IF973-Ciencia de Dados', 'IF992-Modelagem de Banco de Dados')
GROUP BY p.nm_professor
HAVING COUNT(DISTINCT d.nm_disciplina) = 2;