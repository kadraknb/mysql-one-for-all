SELECT cancao as nome_musica,
case
 when cancao like '%Bard%' then REPLACE(cancao, 'Bard', 'QA')
 when cancao like '%Amar%' then REPLACE(cancao, 'Amar', 'Code Review')
 when cancao like '%Pais%' then REPLACE(cancao, 'Pais', 'Pull Requests')
 when cancao like '%SOUL%' then REPLACE(cancao, 'SOUL', 'CODE')
 when cancao like '%SUPERSTAR%' then REPLACE(cancao, 'SUPERSTAR', 'SUPERDEV')
end as novo_nome
FROM SpotifyClone.cancoes
where cancao like '%Bard%'
OR cancao like '%Amar%'
OR cancao like '%Pais%'
OR cancao like '%SOUL%'
OR cancao like '%SUPERSTAR%'
order by cancao desc;