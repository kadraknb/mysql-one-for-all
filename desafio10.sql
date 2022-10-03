SELECT cancao as nome, count(cr.id_cancoe)
FROM SpotifyClone.cancoes as c
inner join SpotifyClone.plano_usuario as pu
on pu.id_plano = 1 or pu.id_plano = 3
inner join SpotifyClone.cancoes_reprodusidas as cr
on c.id_cancoe = cr.id_cancoe and pu.id_usuario = cr.id_usuario
group by c.cancao
order by c.cancao
;