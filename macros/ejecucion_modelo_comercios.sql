{% macro ejecucion_modelo_comercios(this) -%}
insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 2,1,2,getdate(), count(1) from {{ this }}; commit;

insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 2,5,2,getdate(), count(1) from {{ this }} as com
where com.cod_cred is null or trim(com.cod_cred) = '' or trim(com.cod_cred) = ' '; commit;

insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 2,6,2,getdate(), count(1) from {{ this }} as com
where com.fecha_ingreso is null or trim(com.fecha_ingreso) = '' or trim(com.fecha_ingreso) = ' '; commit;

insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 2,7,2,getdate(), count(1) from {{ this }} as com
where com.tipo_conexion is null or trim(com.tipo_conexion) = '' or trim(com.tipo_conexion) = ' '; commit;

insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 2,8,2,getdate(), count(1) from {{ this }} as com
where com.cod_rubro is null or trim(com.cod_rubro) = '' or trim(com.cod_rubro) = ' '; commit;

insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
select 2,9,2,getdate(), count(1) from {{ this }} as com
where com.id_tipoclientecomercio is null or trim(com.id_tipoclientecomercio) = '' or trim(com.id_tipoclientecomercio) = ' '; commit;

insert into dev.modelo_metricas.ejecucion_metrica (id_proceso,id_metrica,id_tipo_registro,tms_ejecucion_fin,val_metrica)
values(2,NULL,3,getdate(),NULL); commit;
{% endmacro -%}