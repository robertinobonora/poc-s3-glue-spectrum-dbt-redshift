{% docs detalle_campo_bin_ext%}
    Bin extendido de 10 dígitos
{% enddocs%}

{% docs detalle_campo_lnin_sec%}
    Identificador de la transacción
{% enddocs%}

{% docs detalle_campo_fecha_sys%}
    Fecha del sistema cuando se registró la transacción
{% enddocs%}

{% docs detalle_campo_fecha_proceso%}
    Fecha cuando se procesa la transacción
{% enddocs%}

{% docs detalle_campo_retailer_id%}
    Código del comercio donde se realiza la transacción ("5970" + codigo)
{% enddocs%}

{% docs detalle_campo_tipo_tarjeta_p7%}
    Medio de pago por el que se realiza la transacción (C - Crédito, D - Débito)
{% enddocs%}

{% docs detalle_campo_identificador_producto%}
    Utilizada para poder identificar transacciones de Prepago
{% enddocs%}

{% docs detalle_campo_dat_tim%}
    String que contiene la fecha de la transaccón (yyyyMMddhhmmssms)
{% enddocs%}

{% docs detalle_campo_rec_typ%}
    Tipo de registro
{% enddocs%}

{% docs detalle_campo_tc%}
    Subtipo de la transacción
{% enddocs%}

{% docs detalle_campo_t%}
    N/A
{% enddocs%}

{% docs detalle_campo_typ%}
    Identificador de la transacción
{% enddocs%}

{% docs detalle_campo_dft_capture_flg%}
    Identificador de si una transacción tiene captura o no
{% enddocs%}

{% docs detalle_campo_crd_ln%}
    N/A
{% enddocs%}

{% docs detalle_campo_crd_typ%}
    Marca de la tarjeta
{% enddocs%}

{% docs detalle_campo_crd_fiid%}
    FIID del emisor que emite la transacción
{% enddocs%}

{% docs detalle_campo_term_term_id%}
    DDL en transacciones presenciales o producto en transacciones no presenciales
{% enddocs%}

{% docs detalle_campo_r1_num_serie%}
    Número de serie del equipo donde se realiza una transacción presencial
{% enddocs%}

{% docs detalle_campo_term_ln%}
    Canal electrónico utilizado
{% enddocs%}

{% docs detalle_campo_term_cntry_cde%}
    País registrado en el equipo donde se realiza la transacción
{% enddocs%}

{% docs detalle_campo_resp_cde%}
    Código de respuesta de una transacción que se autoriza
{% enddocs%}

{% docs detalle_campo_amt_1%}
    Monto completo de la transacción (incluye surcharge, propina, vuelto, etc.)
{% enddocs%}

{% docs detalle_campo_amt_2%}
    Monto del vuelto de la transacción
{% enddocs%}

{% docs detalle_campo_propina%}
    Monto de la propina de la transacción
{% enddocs%}

{% docs detalle_campo_apprv_cde%}
    Código de autorización de la transacción
{% enddocs%}

{% docs detalle_campo_orig_crncy_cde%}
    Moneda en la cual fue realiza la transacción
{% enddocs%}

{% docs detalle_campo_tipo_cuota%}
    Identificador del tipo de cuota en que se realizó una transacción de crédito en cuotas
{% enddocs%}

{% docs detalle_campo_num_cuotas%}
    Número de cuotas en la que se realizó una transacción de crédito en cuotas
{% enddocs%}

{% docs detalle_campo_identificador_modelo%}
    Identificador del modelo de tarificación en el que se realizó la transacción
{% enddocs%}

{% docs detalle_campo_cod_cred%}
    Código del comercio donde se realiza la transacción
{% enddocs%}

{% docs detalle_campo_cod_dolar%}
    Código de comercio dólar asociado al cliente cuando puede operar con moneda dólar
{% enddocs%}

{% docs detalle_campo_rut%}
    RUT del cliente
{% enddocs%}

{% docs detalle_campo_nombre_fantasia%}
    Nombre de fantasía del cliente
{% enddocs%}

{% docs detalle_campo_fecha_ingreso%}
    Fecha de ingreso del cliente a Transbank
{% enddocs%}

{% docs detalle_campo_estado%}
    Estado actual del comercio
{% enddocs%}

{% docs detalle_campo_fecha_estado%}
    Fecha de cambio del estado de cada código de  comercio
{% enddocs%}

{% docs detalle_campo_tipo_conexion%}
    Tipo de conexión que tiene el producto contratado por el cliente y que está asociado al código del comercio
{% enddocs%}

{% docs detalle_campo_cod_rubro%}
    Rubro al que pertenece el comercio dependiendo de la actividad que realiza el cliente
{% enddocs%}

{% docs detalle_campo_cuenta%}
    Cuenta que ingresa al comercio a los sistemas Transbank
{% enddocs%}

{% docs detalle_campo_giro_comercial%}
    Giro comercial del cliente
{% enddocs%}

{% docs detalle_campo_id_tipoclientecomercio%}
    Identificación del tipo de comercio (0 - Comercio PSP, 1 - Cliente PSP, 2 - Comercio secundario)
{% enddocs%}

{% docs detalle_campo_id_transaccion%}
    Identificador de la transacción
{% enddocs%}

{% docs detalle_campo_tms_sistema%}
    Fecha y hora sistema cuando ingresa la transacción
{% enddocs%}

{% docs detalle_campo_tms_transaccion%}
    Fecha y hora de la transacción
{% enddocs%}

{% docs detalle_campo_cdg_tipo_tx%}
    Corresponde a las distintas tipificaciones que se otorga a las transacciones
        100 - Transacción de venta
        101 - Transacción rechazada/no valorizable
        102 - Transacción de reversa
        103 - Transacción de anulación
        105 - Transacción sin captura
        106 - Transacción de ajuste (bin extendido 1111111111)
{% enddocs%}

{% docs detalle_campo_cdg_identificador_tx%}
    Código identificador de la transacción adquirida
        210 - Transacción de autorización o venta en línea
        220 - Transacción forzada de autorización o venta
        420 - Reversa de transacción de tipo financiero
        500 - Transacción de tipo administrativo (cierre batch)
{% enddocs%}

{% docs detalle_campo_cdg_subtipo_tx%}
    Código del subtipo de la transacción adquirida
        10 - Venta con tarjeta de crédito (con/sin cuotas), venta con tarjeta de débito, transacción de solo autorización (10, 13, 15)
        13 - Venta telefónica (MOTO), venta internet
        14 - Anulación de venta crédito, anulación de venta telefónica/internet crédito
        15 - Avance en efectivo crédito
        17 - Consulta cuotas (consulta de saldo)
        18 - Venta con vuelto con tarjeta de débito
{% enddocs%}

{% docs detalle_campo_cdg_tipo_registro%}
    Código del tipo de registro
        00 - Registro inicial
        01 - Transacción financiera
        04 - Transacción administrativa
        20 - Transacción financiera excepcion (posted)
        21 - Transacción financiera excepcion (not posted)
        22 - Transacción financiera excepcion (partially posted)
        23 - Transacción financiera excepcion (invalid data)
{% enddocs%}

{% docs detalle_campo_cdg_tipo_respuesta%}
    Código del tipo de repsueta de la transacción
        <= 9 - Transacción es aprobada
        > 9 - Transacción es rechazada
{% enddocs%}

{% docs detalle_campo_flg_captura%}
    Flag de transacción adquirida capturada
        0 - Sin captura (solo autorización)
        1 - Con captura
{% enddocs%}

{% docs detalle_campo_flg_estado_aprobada%}
    Flag de estado de aprobación de la transacción adquirida
        0 - Rechazada
        1 - Aprobada
{% enddocs%}

{% docs detalle_campo_cdg_autorizacion%}
    Código de autorización de la transacción
{% enddocs%}

{% docs detalle_campo_cdg_moneda%}
    Código ISO de la moneda en la cual se efectua la transacción
{% enddocs%}

{% docs detalle_campo_cdg_comercio%}
    Código del Comercio
{% enddocs%}

{% docs detalle_campo_id_tipo_cuota%}
    Identificador del tipo de cuota de una transacción en cuotas
{% enddocs%}

{% docs detalle_campo_num_cuotas%}
    Número de cuotas de una transacción en cuotas
{% enddocs%}

{% docs detalle_campo_num_bin_ext%}
    Primeros 10 dígitos del dato PAN
{% enddocs%}

{% docs detalle_campo_cdg_marca_tarjeta%}
    Código de la marca de la tarjeta que realiza la transacción
{% enddocs%}

{% docs detalle_campo_cdg_medio_pago%}
    Código del medio de pago utilizado para la transacción
        C - Crédito
        D - Débito
        P - Prepago
{% enddocs%}

{% docs detalle_campo_cdg_modelo_operacion%}
    Identificador del modelo de operación
{% enddocs%}

{% docs detalle_campo_cdg_fiid%}
    Código FIID del emisor
{% enddocs%}

{% docs detalle_campo_id_terminal%}
    Identificador del terminal desde ptlf (ddl en transacciones presenciales)
{% enddocs%}

{% docs detalle_campo_cdg_canal_billetera%}
    Código canal billetera (producto en transacciones no presenciales)
{% enddocs%}

{% docs detalle_campo_cdg_red_terminal%}
    Código de red del terminal (red lógica)
        CBQR - Cobro QR
        PSP - PSP
        PRO1 - POS/Host (presencial)
        SAG1 - SumUP
        AGEN - Agencias
        SRVP - Webpay
{% enddocs%}

{% docs detalle_campo_cdg_pais_terminal%}
    Código del pais del terminal empleado
{% enddocs%}

{% docs detalle_campo_cdg_serie_equipo_r1%}
    Código de serie del equipo R1
{% enddocs%}

{% docs detalle_campo_mto_transaccion%}
    Monto de la transacción en moneda origen
{% enddocs%}

{% docs detalle_campo_mto_vuelto%}
    Monto del vuelto de la transacción en moneda origen
{% enddocs%}

{% docs detalle_campo_mto_propina%}
    Monto de la propina de la transacción en moneda origen
{% enddocs%}

{% docs detalle_campo_anno_proc%}
    Año de la fecha de procesamiento
{% enddocs%}

{% docs detalle_campo_mes_proc%}
    Mes de la fecha de procesamiento
{% enddocs%}

{% docs detalle_campo_dia_proc%}
    Día de la fecha de procesamiento
{% enddocs%}

{% docs detalle_campo_cdg_comercio_dolar%}
    Código del comercio asociado a la venta en dólar
{% enddocs%}

{% docs detalle_campo_rut_cliente%}
    RUT del cliente
{% enddocs%}

{% docs detalle_campo_nom_fantasia%}
    Nombre de fantasía del comercio
{% enddocs%}

{% docs detalle_campo_fch_ingreso%}
    Fecha de ingreso del comercio en sistemas Transbank
{% enddocs%}

{% docs detalle_campo_id_estado%}
    Identificador del estado actual en que se encuentra el comercio
{% enddocs%}

{% docs detalle_campo_fch_estado%}
    Fecha de cambio de estado en el que se encuentra el comercio
{% enddocs%}

{% docs detalle_campo_cdg_tipo_conexion%}
    Código del tipo de conexion utilizado por el producto asociado al comercio
{% enddocs%}

{% docs detalle_campo_cdg_rubro_tbk%}
    Código del rubro Transbank en el cual opera el comercio
{% enddocs%}

{% docs detalle_campo_cdg_enrolador%}
    Código del enrolador que ingreso los datos del comercio a los sistemas Transbank
{% enddocs%}

{% docs detalle_campo_nom_giro_comercial%}
    Nombre del Giro comercial asociado al cliente
{% enddocs%}

{% docs id_tipo_cliente_comercio%}
    Identificador del tipo de comercio
        0 - Comercio normal
        1 - Cliente PSP
        2 - Comercio secundario asociado al PSP
{% enddocs%}