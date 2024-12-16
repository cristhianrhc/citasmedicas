<?php
// Seguridad de sesiones
session_start();
error_reporting(0);
$varsesion = $_SESSION['nombre'];

if ($varsesion == null || $varsesion = '') {

    header("Location: ../includes/_sesion/login.php");
    die();
}
include "../includes/db.php";
$consulta = "SELECT rol FROM user WHERE nombre = '$actualsesion'";
$resultado = mysqli_query($conexion, $consulta);
if ($resultado) {
    if (mysqli_num_rows($resultado) > 0) {
        $fila = mysqli_fetch_assoc($resultado);
        $rolUsuario = $fila['rol'];
    }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <script src="../js/jquery.min.js"></script>

</head>
<?php include "../includes/header.php"; ?>



<body id="page-top">

    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Lista de Odontólogos</h6>
                <br>
                <?php
                    $rolesPermitidos = [1];
                        if (in_array($rolUsuario, $rolesPermitidos)) {
                    ?>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#doctor">
                    <span class="glyphicon glyphicon-plus"></span> Agregar Odontólogo <i class="fa fa-user-md" aria-hidden="true"></i></a></button>
                <?php }?>

            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Especialidad</th>
                                <th>Sexo</th>
                                <th>Telefono#</th>
                                <th>Fecha_Nacimiento</th>
                                <th>Correo</th>
                                <th>Fecha_Registro</th>
                                <?php
                                $rolesPermitidos = [1];
                                    if (in_array($rolUsuario, $rolesPermitidos)) {
                                ?>
                                <th>Acciones..</th>
                                <?php }?>
                            </tr>
                        </thead>

                        <?php

                        include "../includes/db.php";
                        $result = mysqli_query($conexion, "SELECT * FROM doctor ");
                        while ($fila = mysqli_fetch_assoc($result)) :

                        ?>
                            <tr>
                                <td><?php echo $fila['nombres']; ?></td>
                                <td><?php echo obtenerNombreEspecialidad($fila['id_especialidad']); ?></td>
                                <td><?php echo $fila['sexo']; ?></td>
                                <td><?php echo $fila['telefono']; ?></td>
                                <td><?php echo $fila['fecha']; ?></td>
                                <td><?php echo $fila['correo']; ?></td>
                                <td><?php echo $fila['fecha_registro']; ?></td>
                                <?php
                                $rolesPermitidos = [1];
                                    if (in_array($rolUsuario, $rolesPermitidos)) {
                                ?>
                                <td>
                                    <a class="btn btn-warning" href="../includes/editar_doctor.php?id=<?php echo $fila['id'] ?> ">
                                        <i class="fa fa-edit "></i> </a>
                                    
                                    <a href="../includes/eliminar_doctor.php?id=<?php echo $fila['id'] ?> " class="btn btn-danger btn-del">
                                        <i class="fa fa-trash "></i></a></button>
                                </td>
                                <?php }?>
                            </tr>


                        <?php endwhile; ?>
                        <?php
                        function obtenerNombreEspecialidad($id_especialidad)
                        {
                            global $conexion;
                            $consulta = "SELECT nombre FROM especialidades WHERE id = $id_especialidad";
                            $resultado = mysqli_query($conexion, $consulta);

                            if ($resultado && mysqli_num_rows($resultado) > 0) {
                                $fila = mysqli_fetch_assoc($resultado);
                                return $fila['nombre'];
                            } else {
                                return "Sin Especialidad";
                            }
                        }
                        ?>
                        </tbody>
                    </table>


                    <script>
                        $('.btn-del').on('click', function(e) {
                            e.preventDefault();
                            const href = $(this).attr('href')

                            Swal.fire({
                                title: 'Estas seguro de eliminar a este doctor?',
                                text: "¡No podrás revertir esto!!",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Si, eliminar!',
                                cancelButtonText: 'Cancelar!',
                            }).then((result) => {
                                if (result.value) {
                                    if (result.isConfirmed) {
                                        Swal.fire(
                                            'Eliminado!',
                                            'El usuario fue eliminado.',
                                            'success'
                                        )
                                    }

                                    document.location.href = href;
                                }
                            })

                        })
                    </script>
                    <script src="../package/dist/sweetalert2.all.js"></script>
                    <script src="../package/dist/sweetalert2.all.min.js"></script>
                    <script src="../package/jquery-3.6.0.min.js"></script>



                </div>
            </div>
        </div>

    </div>
    <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <?php include "../includes/footer.php"; ?>

    <?php include "../includes/form_doctor.php"; ?>

    </div>
    <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->




</body>

</html>