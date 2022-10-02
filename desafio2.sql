SELECT count(cancao) as cancoes,
(SELECT count(artista) FROM SpotifyClone.artistas) as artistas,
(SELECT count(album) FROM SpotifyClone.albuns) as albuns
FROM SpotifyClone.cancoes;