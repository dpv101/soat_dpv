$(function() {
    $("#soat_cliente_numero_documento").blur(function () {
        if (this.value != "")
            $.get("/clientes/doc/" + this.value, function (data) {
                var nombres_field = $("#soat_cliente_nombres");
                var apellidos_field = $("#soat_cliente_apellidos");
                var email_field = $("#soat_cliente_email");
                var telefono_field = $("#soat_cliente_telefono");

                if (nombres_field.val() == "")
                    nombres_field.val(data.nombres);
                if (apellidos_field.val() == "")
                    apellidos_field.val(data.apellidos);
                if (email_field.val() == "")
                    email_field.val(data.email);
                if (telefono_field.val() == "")
                    telefono_field.val(data.telefono);
            });
    });

    $("#soat_vehiculo_placa").blur(function () {
        if (this.value != "")
            $.get("/vehiculos/placa/" + this.value, function (data) {
                var vehiculo = data.vehiculo;
                var modelo_field = $("#soat_vehiculo_edad");
                var soat_vehiculo_clase_vehiculo_id = $("#soat_vehiculo_clase_vehiculo_id");
                var soat_vehiculo_tipo_vehiculo_id = $("#soat_vehiculo_tipo_vehiculo_id");
                if (modelo_field.val() == "")
                    modelo_field.val(vehiculo.edad);

                if(soat_vehiculo_clase_vehiculo_id.val() == ""){
                    soat_vehiculo_clase_vehiculo_id.val(vehiculo.clase_vehiculo_id);
                    $("#soat_vehiculo_clase_vehiculo_id").change();
                    setTimeout("$('#soat_vehiculo_tipo_vehiculo_id').val('"+ vehiculo.tipo_vehiculo_id +"');", 500);
                }

                var soats = data.soats;
                if(soats.length > 0){
                    alert("El vehiculo ya se encuentra asegurado hasta el " + soats[0].fecha_fin);
                }
            });
    });

    $("#soat_vehiculo_clase_vehiculo_id").change(function () {
        $("#soat_vehiculo_tipo_vehiculo_id").html("");
        if (this.value != "")
            $.get("/clase_vehiculos/" + this.value + "/tipo_vehiculos/", function (data) {
                var options = "<option></option>";
                for (var i = 0; i < data.length; i++) {
                    options += "<option value='" + data[i].id + "'>" + data[i].nombre + "</option>";
                }
                $("#soat_vehiculo_tipo_vehiculo_id").html(options);
            });
    });
});