{{ 
    config(sort='cdg_comercio', dist=all) 
}}

WITH wrk_comercio_1 AS (
    select 
        cod_cred, 
        cod_dolar, 
        rut, 
        nombre_fantasia, 
        fecha_ingreso, 
        estado, 
        fecha_estado, 
        tipo_conexion, 
        cod_rubro, 
        cuenta, 
        giro_comercial, 
        id_tipoclientecomercio
    from {{ ref('comercios') }}
)

, wrk_comercio_2 AS (
    select 
        cod_cred as cdg_comercio,
        cod_dolar as cdg_comercio_dolar,
        rut as rut_cliente,
        nombre_fantasia as nom_fantasia,
        fecha_ingreso as fch_ingreso,
        estado as id_estado,
        fecha_estado as fch_estado,
        tipo_conexion as cdg_tipo_conexion,
        lpad(cod_rubro,3,'0') as cdg_rubro_tbk,
        cuenta as cdg_enrolador,
        giro_comercial as nom_giro_comercial,
        case when id_tipoclientecomercio not in (0,1,2) then 0 el id_tipoclientecomercio end as id_tipo_cliente_comercio
)

, wrk_final AS (
    select 
        *
    from wrk_comercio_2
)

select * from wrk_final;