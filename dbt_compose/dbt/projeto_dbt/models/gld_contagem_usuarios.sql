-- Este modelo cria uma análise da renda média por profissão.

with slv_usuarios as (
    select * from {{ ref('slv_usuarios') }}
)

select
    profissao,
    count(id_usuario) as total_de_profissionais,
    avg(renda_mensal) as renda_media,
    min(renda_mensal) as renda_minima,
    max(renda_mensal) as renda_maxima
from
    slv_usuarios
where
    profissao is not null
    and profissao != 'Estudante' -- Exclui estudantes da análise de renda profissional
group by
    profissao
order by
    renda_media desc
