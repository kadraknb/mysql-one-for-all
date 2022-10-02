SELECT
ROUND(MIN(p.valor_plano), 2) AS faturamento_minimo,
ROUND(MAX(p.valor_plano), 2) AS faturamento_maximo,
ROUND(AVG(p.valor_plano), 2) AS faturamento_medio,
ROUND(SUM(p.valor_plano), 2) AS faturamento_total
FROM SpotifyClone.planos as p
INNER JOIN SpotifyClone.plano_usuario as pu
ON p.id_plano = pu.id_plano;