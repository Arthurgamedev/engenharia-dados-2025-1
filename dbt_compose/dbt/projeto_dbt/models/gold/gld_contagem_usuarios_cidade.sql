with slv_usuarios as (
    select * from {{ ref('slv_usuarios') }}
)

select
    cidade_normalizada,
    count(id_usuario) as total_de_usuarios
from
    slv_usuarios
group by
    cidade_normalizada
order by
    total_de_usuarios desc