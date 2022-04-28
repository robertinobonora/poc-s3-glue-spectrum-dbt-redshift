{{ 
    config(sort=['cdg_comercio', 'tms_transaccion'], dist='cdg_comercio') 
}}

WITH wrk_ptlf_1 AS (
    select bin_ext, lnin_sec, fecha_sys, fecha_proceso, retailer_id, tipo_tarjeta_p7, identificador_producto, dat_tim, 
        rec_typ, tc, t, typ, dft_capture_flg, crd_ln, crd_typ, crd_fiid, term_term_id, r1_num_serie, term_ln, term_cntry_cde, 
        resp_cde, amt_1, amt_2, propina, apprv_cde, orig_crncy_cde, tipo_cuota, num_cuotas, identificador_modelo
    from {{ ref('ptlf') }}
)

, wrk_comercios_1 AS (
    select cod_cred, cod_dolar, rut, nombre_fantasia, fecha_ingreso, estado, fecha_estado, tipo_conexion, cod_rubro, cuenta, 
        giro_comercial, id_tipoclientecomercio
    from {{ ref('comercios') }}
)

, wrk_join_1 AS (
    select 
        ptlf.lnin_sec as id_transaccion
        ,cast(ptlf.fecha_sys as timestamp) as tms_sistema
        ,to_timestamp(substr(ptlf.dat_tim,1,14), 'YYYY-MM-DD HH24:MI:SS') as tms_transaccion
        ,case
            when ptlf.num_bin_ext = '1111111111' then 106
            when ptlf.dft_capture_flg = 0 then 105
            when ptlf.rec_typ in ('01','20','21','22','23') and ptlf.typ in (210,220) and ptlf.tc in ('10','12','13','15','18') 
                and ptlf.resp_cde <= 9 and ptlf.dft_capture_flg = 1 then 100
            when ptlf.rec_typ in ('01','20','21','22','23') and ptlf.typ in (210,220) and ptlf.tc in ('10','12','13','15','18') 
                and ptlf.resp_cde > 9 and ptlf.dft_capture_flg = 1 then 101
            when ptlf.rec_typ in ('01','20','21','22','23') and ptlf.typ in (420) and ptlf.tc in ('10','12','13','14','15','18') 
                and ptlf.dft_capture_flg = 1 then 102
            when ptlf.rec_typ in ('01','20','21','22','23') and ptlf.typ in (420) and ptlf.tc in ('14') 
                and ptlf.resp_cde <= 9 and ptlf.dft_capture_flg = 1 then 103
            else -1 end as cdg_tipo_tx
        ,ptlf.typ as cdg_identificador_tx
        ,ptlf.tc as cdg_subtipo_tx
        ,ptlf.rec_typ as cdg_tipo_registro
        ,ptlf.resp_cde as cdg_tipo_respuesta
        ,case when ptlf.dft_capture_flg = 1 then 1 else 0 end as flg_captura
        ,case when ptlf.resp_cde <= 9 then 1 else 0 end as flg_estado_aprobada
        ,ptlf.apprv_cde as cdg_autorizacion
        ,cast(lpad(ptlf.orig_crncy_cde,3,'0') as varchar(3)) as cdg_moneda
        ,coalesce(com.cdg_comercio,substr(ptlf.retailer_id,5,length(ptlf.retailer_id)),'-1') as cdg_comercio
        ,ptlf.tipo_cuota as id_tipo_cuota
        ,ptlf.num_cuotas as num_cuotas
        ,ptlf.bin_ext as num_bin_ext
        ,case 
            when upper(trim(ptlf.crd_typ)) = 'P' then 
                case 
                    when ptlf.crd_fiid = 598 then 'VI'
                    when ptlf.crd_fiid = 564 then 'MC'
                    when ptlf.crd_fiid = 690 then 'MC'
                    when ptlf.crd_fiid = 547 then 'AMEX'
                    when ptlf.crd_fiid = 562 then 'DS'
                else '-1'
            when upper(trim(ptlf.crd_typ)) = 'V' then 'VI'
            when upper(trim(ptlf.crd_typ)) = 'M' then 'MC'
            when upper(trim(ptlf.crd_typ)) = 'AX' then 'AMEX'
            else '-1' end as cdg_marca_tarjeta
        ,case 
            when upper(ptlf.tipo_tarjeta_p7) = 'D' then 
                case 
                    when upper(ptlf.identificador_producto) in ('PP','MPI','VPI','MPD','VPD') then 'P'
                    else 'D'
            when upper(ptlf.tipo_tarjeta_p7) = 'C' then 'C'
            else '-1' end as cdg_medio_pago
        ,ptlf.identificador_modelo as cdg_modelo_operacion
        ,ptlf.crd_fiid as cdg_fiid
        ,case
            when ptlf.term_ln <> 'SRVP' then term_term_id 
            else Null end as id_terminal
        ,case
            when ptlf.term_ln = 'SRVP' then term_term_id
            else Null end as cdg_canal_billetera
        ,ptlf.term_ln as cdg_red_terminal
        ,ptlf.term_cntry_cde as cdg_pais_terminal
        ,ptlf.r1_num_serie as cdg_serie_equipo_r1
        ,cast(ptlf.amt_1 as double) as mto_transaccion
        ,cast(ptlf.amt_2 as double) as mto_vuelto
        ,cast(ptlf.propina as double) as mto_propina
        ,cast(substring(ptlf.dat_tim,1,4) as varchar(4)) as anno_proc
        ,cast(lpad(substring(ptlf.dat_tim,5,2),2,'0') as varchar(2)) as mes_proc
        ,cast(lpad(substring(ptlf.dat_tim,7,2),2,'0') as varchar(2)) as dia_proc
    from wrk_ptlf_1 as ptlf
    left join wrk_comercios_1 com 
    on substring(ptlf.retailer_id,5,length(ptlf.retailer_id)) = com.cod_cred
)

, wrk_final AS (
    select 
        *
    from wrk_join_1
)

select * from wrk_final