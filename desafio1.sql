DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      id_plano INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      `tipo_plano` VARCHAR(45) NOT NULL,
      `valor_plano` DOUBLE NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuarios(
      `id_usuario` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      `nome` VARCHAR(45) NOT NULL,
      `sobrenome` VARCHAR(100) NOT NULL,
      `idade` INT(3) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      `id_artista` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      `artista` VARCHAR(60) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      `id_album` INT NOT NULL AUTO_INCREMENT,
      `id_artista` INT NOT NULL,
      `album` VARCHAR(45) NOT NULL,
      `ano_lancamento` YEAR NOT NULL,
      CONSTRAINT PRIMARY KEY(id_album),
      FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`artistas` (`id_artista`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes(
      `id_cancoe` INT NOT NULL AUTO_INCREMENT,
      `cancao` VARCHAR(100) NOT NULL,
      `duracao_segundos` INT NOT NULL,
      `id_album` INT NOT NULL,
      CONSTRAINT PRIMARY KEY (`id_cancoe`),
        FOREIGN KEY (`id_album`)
        REFERENCES `SpotifyClone`.`albuns` (`id_album`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.cancoes_reprodusidas(
      `id_cancoe_reprodusida` INT NOT NULL AUTO_INCREMENT,
      `id_usuario` INT NOT NULL,
      `id_cancoe` INT NOT NULL,
      CONSTRAINT PRIMARY KEY (`id_cancoe_reprodusida`, `id_usuario`),
        FOREIGN KEY (`id_usuario`)
        REFERENCES `SpotifyClone`.`usuarios` (`id_usuario`),
        FOREIGN KEY (`id_cancoe`)
        REFERENCES `SpotifyClone`.`cancoes` (`id_cancoe`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico_de_reproducoes(
    `id_historico_de_reproducoes` INT NOT NULL AUTO_INCREMENT,
    `data_reproducao` DATETIME NOT NULL,
    `historico_de_reproducao` INT NOT NULL,
    `id_usuario` INT NOT NULL,
    CONSTRAINT PRIMARY KEY (`id_historico_de_reproducoes`),
      FOREIGN KEY (`historico_de_reproducao` , `id_usuario`)
      REFERENCES `SpotifyClone`.`cancoes_reprodusidas` (`id_cancoe_reprodusida` , `id_usuario`)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.plano_usuario(
    `id_plano_usuario` INT NOT NULL AUTO_INCREMENT,
    `id_usuario` INT NOT NULL,
    `id_plano` INT NOT NULL,
    `data_assinatura` DATE NOT NULL,
    CONSTRAINT PRIMARY KEY (`id_plano_usuario`),
      FOREIGN KEY (`id_usuario`)
      REFERENCES `SpotifyClone`.`usuarios` (`id_usuario`),
      FOREIGN KEY (`id_plano`)
      REFERENCES `SpotifyClone`.`planos` (`id_plano`)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.seguindo_artistas(
      `id_seguindo_artista` INT NOT NULL AUTO_INCREMENT,
      `id_usuario` INT NOT NULL,
      `id_artista` INT NOT NULL,
      CONSTRAINT PRIMARY KEY (`id_seguindo_artista`, `id_usuario`, `id_artista`),
        FOREIGN KEY (`id_usuario`)
        REFERENCES `SpotifyClone`.`usuarios` (`id_usuario`),
        FOREIGN KEY (`id_artista`)
        REFERENCES `SpotifyClone`.`artistas` (`id_artista`)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (tipo_plano, valor_plano)
  VALUES
    ('gratuito', '0.00'),
    ('universitário', '5.99'),
    ('pessoal', '6.99'),
    ('familiar', '7.99');

  INSERT INTO SpotifyClone.usuarios (nome, sobrenome, idade)
  VALUES
    ('Barbara', 'Liskov', '82'),
    ('Robert', 'Cecil Martin', '58'),
    ('Ada', 'Lovelace', '37'),
    ('Martin', 'Fowler', '46'),
    ('Sandi', 'Metz', '58'),
    ('Paulo', 'Freire', '19'),
    ('Bell', 'Hooks', '26'),
    ('Christopher', 'Alexander', '85'),
    ('Judith', 'Butler', '45'),
    ('Jorge', 'Amado', '58');

  INSERT INTO SpotifyClone.artistas (artista)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.albuns (id_artista, album, ano_lancamento)
  VALUES
    ('1', 'Renaissance', '2022'),
    ('2', 'Jazz', '1978'),
    ('2', 'Hot Space', '1982'),
    ('3', 'Falso Brilhante', '1998'),
    ('3', 'Vento de Maio', '2001'),
    ('4', 'QVVJFA?', '2003'),
    ('5', 'Somewhere Far Beyond', '2007'),
    ('6', 'I Put A Spell On You', '2012');

  INSERT INTO SpotifyClone.cancoes (cancao, duracao_segundos, id_album)
  VALUES
    1('BREAK MY SOUL', '279', '1'),
    2('VIRGO’S GROOVE', '269', '1'),
    3('ALIEN SUPERSTAR', '116', '1'),
    4('Don’t Stop Me Now', '203', '2'),
    5('Under Pressure', '152', '3'),
    6('Como Nossos Pais', '105', '4'),
    7('O Medo de Amar é o Medo de Ser Livre', '207', '5'),
    8('Samba em Paris', '267', '6'),
    9('The Bard’s Song', '244', '7'),
    0('Feeling Good', '100', '8');

  INSERT INTO SpotifyClone.cancoes_reprodusidas (id_usuario, id_cancoe)
  VALUES
    ('1', '8'),
    ('1', '2'),
    ('1', '10'),
    ('2', '10'),
    ('2', '7'),
    ('3', '10'),
    ('3', '2'),
    ('4', '8'),
    ('5', '8'),
    ('5', '5'),
    ('6', '7'),
    ('6', '1'),
    ('7', '4'),
    ('8', '4'),
    ('9', '9'),
    ('10', '3');

  INSERT INTO SpotifyClone.historico_de_reproducoes (data_reproducao, id_usuario, historico_de_reproducao)
  VALUES
    ('2022-02-28 10:45:55','1', '1'),
    ('2020-05-02 05:30:35','1', '2'),
    ('2020-03-06 11:22:33','1', '3'),
    ('2022-08-05 08:05:17','2', '4'),
    ('2020-01-02 07:40:33','2', '5'),
    ('2020-11-13 16:55:13','3', '6'),
    ('2020-12-05 18:38:30','3', '7'),
    ('2021-08-15 17:10:10','4', '8'),
    ('2022-01-09 01:44:33','5', '9'),
    ('2020-08-06 15:23:43','5', '10'),
    ('2017-01-24 00:31:17','6', '11'),
    ('2017-10-12 12:35:20','6', '12'),
    ('2011-12-15 22:30:49','7', '13'),
    ('2012-03-17 14:56:41','8', '14'),
    ('2022-02-24 21:14:22','9', '15'),
    ('2015-12-13 08:30:22','10', '16');

  INSERT INTO SpotifyClone.plano_usuario (id_usuario, id_plano, data_assinatura)
  VALUES
    ('1', '1', '2019-10-20'),
    ('2', '1', '2017-01-06'),
    ('3', '4', '2017-12-30'),
    ('4', '4', '2017-01-17'),
    ('5', '4', '2018-04-29'),
    ('6', '2', '2018-02-14'),
    ('7', '2', '2018-01-05'),
    ('8', '3', '2019-06-05'),
    ('9', '3', '2020-05-13'),
    ('10', '3', '2017-02-17');

  INSERT INTO SpotifyClone.seguindo_artistas (id_usuario, id_artista)
  VALUES
    ('1', '1'),
    ('1', '2'),
    ('1', '3'),
    ('2', '1'),
    ('2', '3'),
    ('3', '2'),
    ('4', '4'),
    ('5', '5'),
    ('5', '6'),
    ('6', '7'),
    ('6', '1'),
    ('7', '7'),
    ('9', '3'),
    ('10', '2');
Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
(`SpotifyClone`.`seguindo_artistas`, CONSTRAINT `seguindo_artistas_ibfk_2` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`))
