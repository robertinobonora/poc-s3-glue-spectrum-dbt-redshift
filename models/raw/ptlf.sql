{{ 
    config(materialized='incremental',
    unique_key='lnin_sec',
    sort=['retailer_id', 'lnin_sec'],
    dist='retailer_id') 
}}

WITH wrk_1 AS (
    select 
        bin_ext, 
        lnin_sec, 
        fecha_sys, 
        fecha_proceso, 
        retailer_id, 
        tipo_tarjeta_p7, 
        identificador_producto, 
        dat_tim, 
        rec_typ, 
        tc, 
        t, 
        typ, 
        dft_capture_flg, 
        crd_ln, 
        crd_typ, 
        crd_fiid, 
        term_term_id, 
        r1_num_serie, 
        term_ln, 
        term_cntry_cde, 
        resp_cde, 
        amt_1, 
        amt_2, 
        propina, 
        apprv_cde, 
        orig_crncy_cde, 
        tipo_cuota, 
        num_cuotas, 
        identificador_modelo
    from {{ source('ext_catalog_schema','ptlf') }}
    {%- if is_incremental() -%}
    where to_timestamp(substring(dat_tim,1,14), 'YYYYMMDDHH24MISS') > 
            (select max(to_timestamp(substring(dat_tim,1,14), 'YYYYMMDDHH24MISS')) from {{ this }} ) 
    {%- endif -%}
)

, wrk_2 AS (
    select 
        cast(bin_ext as bigint) as bin_ext, 
        cast(lnin_sec as bigint) as lnin_sec, 
        to_timestamp(fecha_sys, 'YYYY-MM-DD HH24:MI:SS') as fecha_sys, 
        to_timestamp(fecha_proceso, 'YYYY-MM-DD HH24:MI:SS') as fecha_proceso, 
        cast(retailer_id as varchar(15)) as retailer_id, 
        cast(tipo_tarjeta_p7 as char(1)) as tipo_tarjeta_p7, 
        cast(identificador_producto as varchar(3)) as identificador_producto, 
        dat_tim, 
        cast(rec_typ as varchar(2)) as rec_typ, 
        cast(tc as varchar(2)) as tc, 
        t, 
        cast(typ as int) as typ, 
        cast(dft_capture_flg as smallint) as dft_capture_flg, 
        crd_ln, 
        cast(crd_typ as varchar(2)) as crd_typ, 
        cast(crd_fiid as int) as crd_fiid, 
        cast(term_term_id as varchar(30)) as term_term_id, 
        cast(r1_num_serie as varchar(30)) as r1_num_serie, 
        cast(term_ln as varchar(4)) as term_ln, 
        cast(term_cntry_cde as varchar(3)) as term_cntry_cde, 
        cast(resp_cde as int) as resp_cde, 
        amt_1, 
        amt_2, 
        propina, 
        cast(apprv_cde as varchar(8)) as apprv_cde, 
        cast(orig_crncy_cde as int) as orig_crncy_cde, 
        cast(tipo_cuota as int) as tipo_cuota, 
        cast(num_cuotas as int) as num_cuotas, 
        cast(identificador_modelo as varchar(3)) as identificador_modelo
    from wrk_1
)

, wrk_3 AS (
    select 
        *
    from wrk_2
)

select * from wrk_3
