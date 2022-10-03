SELECT U.nome as usuario, count(CR.id_cancoe) as qt_de_musicas_ouvidas, ROUND(SUM(C.duracao_segundos / 60), 2) as total_minutos
 FROM SpotifyClone.usuarios as U
 inner join SpotifyClone.cancoes_reprodusidas as CR
 on U.id_usuario = CR.id_usuario
 inner join SpotifyClone.cancoes as C
 on C.id_cancoe = CR.id_cancoe
 group by U.nome
 order by U.nome
 ;