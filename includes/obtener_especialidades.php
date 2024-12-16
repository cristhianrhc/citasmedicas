<?php
include("db.php");

if (isset($_POST['doctorId'])) {
    $doctorId = $_POST['doctorId'];

    $query = "SELECT e.id, e.nombre FROM especialidades e INNER JOIN doctor d ON e.id = d.id_especialidad WHERE d.id = $doctorId";
    $result = mysqli_query($conexion, $query);

    if ($result) {
        $options = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $options[] = array('id' => $row['id'], 'nombre' => $row['nombre']);
        }
    
        $response = array('status' => 'success', 'message' => $options);
        echo json_encode($response);
    } else {
        $response = array('status' => 'error', 'message' => 'Error en la consulta');
        echo json_encode($response);
    }
} else {
    echo json_encode(array('status' => 'error', 'message' => 'ID del doctor no proporcionado'));
}
?>
