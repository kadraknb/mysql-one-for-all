SELECT usu.nome,
(SELECT count(id_usuario)
FROM SpotifyClone.cancoes_reprodusidas
where id_usuario = usu.id_usuario) as qt_de_musicas_ouvidas,
(SELECT ROUND(SUM(ca.duracao_segundos / 60), 2)
from SpotifyClone.cancoes as ca,
SpotifyClone.cancoes_reprodusidas as cr
where cr.id_usuario = usu.id_usuario and ca.id_cancoe = cr.id_cancoe) as total_minutos
from SpotifyClone.usuarios as usu
ORDER BY usu.nome;