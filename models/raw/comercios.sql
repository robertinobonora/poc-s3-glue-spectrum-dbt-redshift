{{ 
    config(sort='cod_cred', dist=all) 
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
    from {{ source(ext_catalog_schema,comercios) }}
)

select * from wrk_1;