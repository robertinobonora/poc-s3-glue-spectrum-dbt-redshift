{{ 
    config(sort=['retailer_id', 'lnin_sec'], dist='retailer_id') 
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
)

select * from wrk_1;