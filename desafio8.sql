SELECT ar.artista as artista, al.album as album
 FROM SpotifyClone.artistas as ar
 inner join SpotifyClone.albuns as al
 on al.id_artista = ar.id_artista
 where artista = "Elis Regina"
 order by album