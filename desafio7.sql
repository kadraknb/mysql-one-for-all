SELECT ar.artista as artista, al.album as album, count(sa.id_artista) as seguidores
 FROM SpotifyClone.artistas as ar
 inner join SpotifyClone.albuns as al
 on al.id_artista = ar.id_artista
 inner join SpotifyClone.seguindo_artistas as sa
 on sa.id_artista = ar.id_artista
 group by sa.id_artista, al.album
 order by seguidores desc, artista, album;