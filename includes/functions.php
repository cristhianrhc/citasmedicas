<?php

require_once("db.php");

if (isset($_POST['accion'])) {
    switch ($_POST['accion']) {
            //casos de registros

        case 'acceso_user';
            acceso_user();
            break;

        case 'insert_doctor':
            insert_doctor();
            break;

        case 'insert_cita':
            insert_cita();
            break;

        case 'insert_esp':
            insert_esp();
            break;

        case 'insert_horario':
            insert_horario();
            break;

        case 'insert_paciente':
            insert_paciente();
            break;

        case 'editar_user':
            editar_user();
            break;

        case 'editar_paciente':
            editar_paciente();
            break;
        case 'editar_historial':
            editar_historial();
            break;

        case 'editar_esp':
            editar_esp();
            break;

        case 'editar_doctor':
            editar_doctor();
            break;

        case 'editar_hora':
            editar_hora();
            break;

        case 'editar_cita':
            editar_cita();
            break;
        case 'existeEspecialidad':
            existeEspecialidad($_POST['id_especialidad_hidden'], $conexion);
            break;
            
    }
}


function acceso_user()
{
    include("db.php");
    extract($_POST);

    $nombre = $conexion->real_escape_string($_POST['nombre']);
    $password = $conexion->real_escape_string($_POST['contrasena']);
    session_start();
    $_SESSION['nombre'] = $nombre;

    $consulta = "SELECT*FROM user where nombre='$nombre' and contrasena='$password'";
    $resultado = mysqli_query($conexion, $consulta);
    $filas = mysqli_fetch_array($resultado);

    if ($filas) {
        if ($filas['rol'] == 1) {
            header('Location: ../views/usuarios.php');
        } elseif ($filas['rol'] == 2 || $filas['rol'] == 3|| $filas['rol'] == 4) {
            header('Location: ../views/index.php');
        } else {

        }
    } else {
        echo "<script language='JavaScript'>
        alert('Usuario o Contraseña Incorrecta');
        location.assign('./_sesion/login.php');
        </script>";
        session_destroy();
    }

}

function insert_esp()
{
    include "db.php";
    extract($_POST);

    $consulta = "INSERT INTO especialidades (nombre) VALUES ('$nombre')";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/especialidades.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/especialidades.php');
         </script>";
    }
}

function insert_horario()
{
    include "db.php";
    extract($_POST);

    $consulta = "INSERT INTO horario (dias, id_doctor) VALUES ('$dias', '$id_doctor')";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/horarios.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/horarios.php');
         </script>";
    }
}

function insert_paciente()
{
    include "db.php";
    extract($_POST);

    $consulta = "INSERT INTO pacientes (nombre, sexo, correo, telefono,  estado)
    VALUES ('$nombre', '$sexo', '$correo', '$telefono',  '$estado')";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/pacientes.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/pacientes.php');
         </script>";
    }
}

function insert_cita()
{
    include "db.php";
    extract($_POST);

    // Comprobar si la especialidad existe
    if (!existeEspecialidad($id_especialidad, $conexion)) {
        echo json_encode(['status' => 'error', 'message' => 'La especialidad seleccionada no es válida']);
        return;
    }

    $consulta = "INSERT INTO citas (fecha, hora, id_paciente, id_doctor, id_especialidad, observacion, estado)
VALUES ('$fecha', '$hora', '$id_paciente', '$id_doctor', '$id_especialidad', '$observacion', '$estado')";

    // Manejar errores de SQL
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') {
            // Si es una solicitud AJAX, solo envía una respuesta de éxito
            echo json_encode(['status' => 'success', 'message' => 'El registro fue actualizado correctamente']);
        } else {
            // Si no es una solicitud AJAX, realiza la redirección
            echo "<script language='JavaScript'>
            alert('El registro fue actualizado correctamente');
            location.assign('../views/citas.php');
            </script>";
        }
    } else {
        // Manejar el error
        if (isset($_SERVER['HTTP_X_REQUESTED_WITH']) && strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) === 'xmlhttprequest') {
            // Si es una solicitud AJAX, solo envía una respuesta de error
            echo json_encode(['status' => 'error', 'message' => 'Uy no! ya valió, habla con el ingeniero :v']);
        } else {
            // Si no es una solicitud AJAX, realiza la redirección
            echo "<script language='JavaScript'>
            alert('Uy no! ya valió, habla con el ingeniero :v');
            location.assign('../views/citas.php');
            </script>";
        }
        echo "Error en la consulta: " . mysqli_error($conexion);
    }
}

function existeEspecialidad($id_especialidad, $conexion) {
    echo "ID Especialidad: $id_especialidad"; // Agregamos esta línea para imprimir el valor en la consola
    $consulta = "SELECT id FROM especialidades WHERE id = '$id_especialidad'";
    $resultado = mysqli_query($conexion, $consulta);
    return mysqli_num_rows($resultado) > 0;
}


function insert_doctor()
{
    include "db.php";
    extract($_POST);
    $consulta = "INSERT INTO doctor (cedula, nombres, id_especialidad, sexo,  telefono, fecha, correo)
    VALUES ('$cedula', '$nombres', '$id_especialidad','$sexo', '$telefono',  '$fecha', '$correo')";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/medicos.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/medicos.php');
         </script>";
    }
}


function editar_user()
{
    include "db.php";
    extract($_POST);
    $consulta = "UPDATE user SET nombre = '$nombre', correo = '$correo', contrasena = '$contrasena',
     rol ='$rol' WHERE id = '$id' ";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/usuarios.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/usuarios.php');
         </script>";
    }
}

function editar_paciente()
{
    include "db.php";
    extract($_POST);
    $consulta = "UPDATE pacientes SET nombre = '$nombre', sexo = '$sexo', correo = '$correo', 
    telefono = '$telefono', estado ='$estado' WHERE id = '$id' ";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/pacientes.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/pacientes.php');
         </script>";
    }
}
function editar_historial()
{
    include "db.php";
    extract($_POST);
    $consulta = "UPDATE pacientes SET nombre = '$nombre', antecedentes = '$antecedentes', enfermedades = '$enfermedades', 
    estado ='$estado' WHERE id = '$id' ";
    $resultado = mysqli_query($conexion, $consulta);
    echo "ID: $id, Nombre: $nombre, Antecedentes: $antecedentes, Enfermedades: $enfermedades, Estado: $estado";

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/pacientes.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/pacientes.php');
         </script>";
    }
}

function editar_esp()
{
    include "db.php";
    extract($_POST);
    $consulta = "UPDATE especialidades SET nombre = '$nombre' WHERE id = '$id' ";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/especialidades.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/especialidades.php');
         </script>";
    }
}

function editar_doctor()
{
    include "db.php";
    extract($_POST);
    $consulta = "UPDATE doctor SET cedula = '$cedula', nombres = '$nombres', id_especialidad = '$id_especialidad',  sexo = '$sexo',
    telefono = '$telefono', fecha = '$fecha',  correo = '$correo' WHERE id = '$id' ";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/medicos.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/medicos.php');
         </script>";
    }
}

function editar_hora()
{
    include "db.php";
    extract($_POST);
    $consulta = "UPDATE horario SET dias = '$dias', id_doctor = '$id_doctor' WHERE id = '$id' ";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/horarios.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/horarios.php');
         </script>";
    }
}

function editar_cita()
{
    include "db.php";
    extract($_POST);
    $consulta = "UPDATE citas SET fecha = '$fecha', hora = '$hora', id_paciente = '$id_paciente', id_doctor = '$id_doctor',
    id_especialidad = '$id_especialidad', observacion = '$observacion' , estado= '$estado' 
    WHERE id = '$id' ";
    $resultado = mysqli_query($conexion, $consulta);

    if ($resultado) {
        echo "<script language='JavaScript'>
        alert('El registro fue actualizado correctamente');
        location.assign('../views/citas.php');
        </script>";
    } else {
        echo "<script language='JavaScript'>
         alert('Uy no! ya valio hablale al ing :v');
         location.assign('../views/citas.php');
         </script>";
    }
}
