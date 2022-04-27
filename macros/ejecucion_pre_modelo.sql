{% macro ejecucion_modelo(this) -%}
{%- if this.table = '"ptlf"'-%}
insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
values(1,NULL,1,NULL,NULL); commit;
{%- elif  this.table = '"comercios"' -%}
insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
values(2,NULL,1,NULL,NULL); commit;
{%- endif -%}
{%- endmacro%}