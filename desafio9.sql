SELECT count(u.id_usuario) as quantidade_musicas_no_historico
 FROM SpotifyClone.cancoes_reprodusidas as cr
 inner join SpotifyClone.usuarios as u
 on u.id_usuario = cr.id_usuario and u.nome = "Barbara Liskov";