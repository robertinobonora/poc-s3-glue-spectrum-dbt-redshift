{% macro ejecucion_modelo(this) -%}
{%- if this.name = 'ptlf' -%}
    {{ ejecucion_modelo_ptlf(this) }}
{%- elif  this.name = 'comercios' -%}
    {{ ejecucion_modelo_comercios(this) }}
{%- endif -%}
{%- endmacro%}