<?php


session_start();
error_reporting(0);
$varsesion = $_SESSION['nombre'];

if ($varsesion == null || $varsesion = '') {
    header("Location: _sesion/login.php");
}

?>

<div class="modal fade" id="citas" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-dark text-white">
                <h3 class="modal-title" id="exampleModalLabel">Agregar nueva cita<?php echo $fila['nombre']; ?>
                </h3>
                <button type="button" class="btn btn-black" data-dismiss="modal">
                    <i class="fa fa-times" aria-hidden="true"></i></button>
            </div>
            <div class="modal-body">

                <form action="../includes/functions.php" method="POST">
                    <div class="form-group">
                        <label for="fecha" class="form-label">Fecha*</label>
                        <input type="date" id="fecha" name="fecha" class="form-control" required>
                    </div>

                    <div class="form-group">
                        <label for="hora" class="form-label">Hora*</label>
                        <input type="time" id="hora" name="hora" class="form-control" required>
                    </div>

                    <div class="form-group ">
                        <label>Paciente</label>
                        <select class="form-control" id="id_paciente" name="id_paciente">
                            <option value="0">--Selecciona una opcion--</option>
                            <?php

                            include("db.php");
                            //Codigo para mostrar categorias desde otra tabla
                            $sql = "SELECT * FROM pacientes ";
                            $resultado = mysqli_query($conexion, $sql);
                            while ($consulta = mysqli_fetch_array($resultado)) {
                                echo '<option value="' . $consulta['id'] . '">' . $consulta['nombre'] . '</option>';
                            }

                            ?>


                        </select>
                    </div>

                    <div class="form-group">
                        <label>Doctor</label>
                        <select class="form-control" id="id_doctor" name="id_doctor">
                            <option value="0">--Selecciona una opcion--</option>
                            <?php
                            $sql = "SELECT * FROM doctor";
                            $resultado = mysqli_query($conexion, $sql);
                            while ($consulta = mysqli_fetch_array($resultado)) {
                                echo '<option value="' . $consulta['id'] . '">' . $consulta['nombres'] . '</option>';
                            }
                            ?>
                        </select>
                    </div>

                    <div class="form-group ">
                        <label>Especialidad</label>
                        <select class="form-control" id="id_especialidad" name="id_especialidad">
                            <option value="0">--Selecciona una opcion--</option>
                           
                        </select>
                    </div>
                    <input type="hidden" id="id_especialidad_hidden" name="id_especialidad">


                    <label for="observacion">Observacion:</label>
                    <input class="form-control" name="observacion" required type="text" id="observacion" placeholder="Escribe una observacion del paciente">

                    <div class="form-group">
                        <label for="pendiente" class="form-label">Estado:</label>
                        <select name="estado" id="estado" class="form-control" required>
                            <option value="">--Selecciona una opcion--</option>
                            <option value="1">Atendido</option>
                            <option value="2">Pendiente</option>
                        </select>
                    </div>


                    <input type="hidden" name="accion" value="insert_cita">
                    <br>

                    <div class="mb-3">

                        <input type="submit" value="Guardar" id="register" class="btn btn-success" name="registrar">
                        <a href="citas.php" class="btn btn-danger">Cancelar</a>

                    </div>
            </div>
        </div>

        </form>
    </div>
</div>
<!-- Agrega esto en el head de tu documento HTML -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
$(document).ready(function () {
    $('#register').click(function () {
            console.log("Valor de id_especialidad_hidden: " + $('#id_especialidad_hidden').val());
        });
    $('#id_doctor').change(function () {
        var doctorId = $(this).val();

        console.log('Doctor ID seleccionado:', doctorId);

        // Realizar la solicitud AJAX para obtener las especialidades
        $.ajax({
            type: 'POST',
            url: '../includes/obtener_especialidades.php',
            data: { doctorId: doctorId },
            success: function (response) {
                console.log('Respuesta del servidor:', response);

                try {
                    // Intentar analizar la respuesta como JSON
                    var data = JSON.parse(response);
                    if (data.status === 'success') {
                        // Actualizar las opciones de especialidades
                        var options = '';
                        data.message.forEach(function (option) {
                            options += '<option value="' + option.id + '">' + option.nombre + '</option>';
                        });
                        $('#id_especialidad').html(options);
                        console.log('Opciones de especialidades actualizadas:', options);

                        // También actualiza el valor del campo oculto con el id de la especialidad seleccionada
                        $('#id_especialidad_hidden').val($('#id_especialidad').val());
                        console.log('ID Especialidad oculta actualizada:', $('#id_especialidad_hidden').val());
                    } else {
                        console.error('Error del servidor:', data.message);
                    }
                } catch (error) {
                    console.error('Error al analizar la respuesta JSON:', error);
                }
            },
            error: function (err) {
                console.error('Error en la solicitud AJAX:', err.responseText);
            }
        });
    });
});




</script>
