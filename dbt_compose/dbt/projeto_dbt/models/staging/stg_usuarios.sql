-- Este modelo seleciona os dados da camada bronze e aplica uma limpeza inicial.

select
    id_usuario,
    nome_completo,
    coalesce(email, 'nao informado') as email, -- Trata valores nulos no campo de email
    cidade,
    idade,
    profissao,
    coalesce(renda_mensal, 0) as renda_mensal -- Trata valores nulos na renda
from
    {{ ref('usuarios') }} -- Referencia a tabela de usuários na camada bronze
where
    nome_completo is not null -- Remove registros que não possuem nome completo
