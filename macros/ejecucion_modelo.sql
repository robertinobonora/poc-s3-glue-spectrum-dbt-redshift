{% macro ejecucion_modelo(this) -%}
{%- if this.name == 'ptlf' -%}
    {{ ejecucion_modelo_ptlf(this) }}
{%- elif  this.name == 'comercios' -%}
    {{ ejecucion_modelo_comercios(this) }}
{%- elif this.name == 'producto_canal_contratado' -%}
    {{ ejecucion_modelo_pcc(this) }}
{%- elif this.name == 'tx_adquirida' -%}
    {{ ejecucion_modelo_tx_adquirida(this) }}
{%- endif -%}
{%- endmacro%}