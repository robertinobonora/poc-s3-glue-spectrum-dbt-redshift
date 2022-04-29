{{ 
    config(sort='cod_cred', dist='cod_cred') 
}}

WITH wrk_1 AS (
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
    from {{ source('ext_catalog_schema','comercios') }}
    where cast(anno||mes||dia as int) = (select max(cast(anno||mes||dia as int)) from {{ source('ext_catalog_schema','comercios') }})
)

, wrk_2 AS (
    select 
        cast(cod_cred as varchar(9)) as cod_cred, 
        cast(cod_dolar as varchar(9)) as cod_dolar, 
        cast(rut as varchar(10)) as rut, 
        cast(nombre_fantasia as varchar(100)) as nombre_fantasia, 
        to_timestamp(fecha_ingreso, 'YYYY-MM-DD HH24:MI:SS') as fecha_ingreso, 
        cast(estado as smallint) as estado, 
        to_timestamp(fecha_estado, 'YYYY-MM-DD HH24:MI:SS') as fecha_estado, 
        cast(tipo_conexion as varchar(10)) as tipo_conexion, 
        cast(cod_rubro as varchar(3)) as cod_rubro, 
        cast(cuenta as varchar(40)) as cuenta, 
        cast(giro_comercial as varchar(100)) as giro_comercial, 
        cast(id_tipoclientecomercio as smallint) as id_tipoclientecomercio
    from wrk_1
)

, wrk_3 AS (
    select 
        *
    from wrk_2
)

select * from wrk_3