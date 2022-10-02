SELECT ca.cancao as cancao, count(cr.id_cancoe) as reproducoes
FROM SpotifyClone.cancoes as ca
inner join SpotifyClone.cancoes_reprodusidas as cr
on ca.id_cancoe = cr.id_cancoe
group by ca.cancao
order by reproducoes desc, cancao
limit 2