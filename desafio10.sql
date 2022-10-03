SELECT cancao as nome, count(cr.id_cancoe) as reproducoes
FROM SpotifyClone.cancoes as c
inner join SpotifyClone.usuarios as u
on u.id_plano = 1 or u.id_plano = 3
inner join SpotifyClone.cancoes_reprodusidas as cr
on c.id_cancoe = cr.id_cancoe and u.id_usuario = cr.id_usuario
group by c.cancao
order by c.cancao
;