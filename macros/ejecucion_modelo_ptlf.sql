{% macro ejecucion_modelo_ptlf(this) -%}
insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 1,1,2,'{{ dbt_utils.current_timestamp }}', count(1) from {{ this }}; commit;

insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 1,2,2,'{{ dbt_utils.current_timestamp }}', count(1) from {{ this }} as ptlf
where ptlf.lnin_sec is null or ptlf.lnin_sec = '' or ptlf.lnin_sec = ' '; commit;

{%- set source_comercio = adapter.get_relation(
    database={{ ref('comercios') }}.database ,
    schema={{ ref('comercios') }}.schema,
    identifier={{ ref('comercios') }}.name) -%}
{% set table_comercios_exists=source_comercio is not none %}
{%- if table_comercios_exists -%}
insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 1,3,2,'{{ dbt_utils.current_timestamp }}', count(1)
from (select ptlf.retailer_id,com.cod_cred from {{ this }} as ptlf left join {{ ref('comercios') }} com 
on substr(ptlf.retailer_id,5,length(ptlf.retailer_id)) = com.cod_cred) as qry1
where qry1.cod_cred is null; commit;
{%- endif -%}

insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 1,4,2,'{{ dbt_utils.current_timestamp }}', count(1)from {{ this }} as ptlf
where ptlf.apprv_cde is null or ptlf.apprv_cde like '%00000000%' or ptlf.apprv_cde = '' or ptlf.apprv_cde = ' '; commit;

insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
values(1,NULL,3,'{{ dbt_utils.current_timestamp }}',NULL); commit;
{% endmacro -%}