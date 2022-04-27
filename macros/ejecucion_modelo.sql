{% macro ejecucion_modelo(this) -%}
{%- if this.table = '"ptlf"'-%}
    {{ ejecucion_modelo_ptlf(this) }}
{%- elif  this.table = '"comercios"' -%}
    {{ ejecucion_modelo_comercios(this) }}
{%- endif -%}
{%- endmacro%}