{% macro ejecucion_proyecto(tipo_registro) -%}
{%- if tipo_registro == 1 -%}
insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
values(NULL,NULL,'{{ tipo_registro }}',NULL,NULL); commit;
{%- else -%}
insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
values(NULL,NULL,'{{ tipo_registro }}',getdate(),NULL); commit;
{%- endif -%}
{%- endmacro%}