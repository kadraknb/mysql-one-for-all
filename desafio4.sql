SELECT usu.nome as usuario, 
if( MAX(car.historico_de_reproducoes) > '2021-01-01 00:00:00', 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM SpotifyClone.usuarios as usu
inner join SpotifyClone.cancoes_reprodusidas as car
on usu.id_usuario = car.id_usuario
group by usu.nome
order by usu.nome