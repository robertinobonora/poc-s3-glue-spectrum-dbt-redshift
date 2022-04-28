{% macro ejecucion_pre_modelo(this) -%}
{%- set source_relation = adapter.get_relation(
    database=this.database,
    schema=this.schema,
    identifier=this.name) -%}
{% set table_exists=source_relation is not none %}
{%- if table_exists -%}
{%- if this.name == 'ptlf' -%}
insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
values(1,NULL,1,NULL,NULL); commit;
{%- elif this.name == 'comercios' -%}
insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
values(2,NULL,1,NULL,NULL); commit;
{%- endif -%}
{%- endif -%}
{%- endmacro%}