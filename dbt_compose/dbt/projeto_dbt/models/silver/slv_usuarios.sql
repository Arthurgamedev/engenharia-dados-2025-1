-- Este modelo enriquece os dados da camada de staging com regras de negócio.

with stg_usuarios as (
    select * from {{ ref('stg_usuarios') }}
)

select
    id_usuario,
    split_part(nome_completo, ' ', 1) as primeiro_nome,
    split_part(nome_completo, ' ', 2) as ultimo_nome,
    email,
    idade,
    profissao,
    renda_mensal,
    lower(cidade) as cidade_normalizada,
    -- Cria uma nova coluna para categorizar a renda
    case
        when renda_mensal < 3000 then 'Baixa'
        when renda_mensal >= 3000 and renda_mensal < 7000 then 'Média'
        when renda_mensal >= 7000 then 'Alta'
        else 'N/A'
    end as faixa_renda
from
    stg_usuarios
