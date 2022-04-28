{% macro ejecucion_modelo_tx_adquirida(this) -%}
insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 4,1,2,getdate(), count(1) from {{ this }}; commit;

insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
values(4,NULL,3,getdate(),NULL); commit;
{% endmacro -%}