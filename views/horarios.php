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
                <h6 class="m-0 font-weight-bold text-primary">Lista de Disponibilidad</h6>
                <br>
                <?php
                        $rolesPermitidos = [1, 2];
                        if (in_array($rolUsuario, $rolesPermitidos)) {
                ?>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#horario">
                    <span class="glyphicon glyphicon-plus"></span> Agregar horario <i class="fa fa-sticky-note" aria-hidden="true"></i> </a></button>
                    <?php }?>


            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Dias de atencion odontológica</th>
                                <th>Odontólogo</th>
                                <th>Fecha_Registro</th>
                                <?php
                                $rolesPermitidos = [1, 2];
                                    if (in_array($rolUsuario, $rolesPermitidos)) {
                                ?>
                                <th>Acciones</th>
                                <?php }?>
                            </tr>
                        </thead>

                        <?php

                        include "../includes/db.php";
                        $result = mysqli_query($conexion, "SELECT h.id, h.dias, d.nombres as doctor, h.fecha 
                                    FROM horario h
                                    LEFT JOIN doctor d ON h.id_doctor = d.id");
                        while ($fila = mysqli_fetch_assoc($result)) :

                        ?>
                            <tr>
                                <td><?php echo $fila['dias']; ?></td>
                                <td><?php echo $fila['doctor']; ?></td>
                                <td><?php echo $fila['fecha']; ?></td>

                                <?php
                                $rolesPermitidos = [1, 2];
                                    if (in_array($rolUsuario, $rolesPermitidos)) {
                                ?>
                                <td>
                                    <a class="btn btn-warning" href="../includes/editar_horario.php?id=<?php echo $fila['id'] ?> ">
                                        <i class="fa fa-edit "></i> </a>
                                    <a href="../includes/eliminar_horario.php?id=<?php echo $fila['id'] ?> " class="btn btn-danger btn-del">
                                        <i class="fa fa-trash "></i></a></button>
                                </td>
                                <?php }?>
                            </tr>


                        <?php endwhile; ?>

                        </tbody>
                    </table>


                    <script>
                        $('.btn-del').on('click', function(e) {
                            e.preventDefault();
                            const href = $(this).attr('href')

                            Swal.fire({
                                title: 'Estas seguro de eliminar este horario?',
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

    <?php include "../includes/form_horario.php"; ?>

    </div>
    <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->




</body>

</html>