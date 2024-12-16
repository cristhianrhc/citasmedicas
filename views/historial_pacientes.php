<?php
// Seguridad de sesiones
session_start();
error_reporting(0);
$varsesion = $_SESSION['nombre'];

if ($varsesion == null || $varsesion == '') {
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
                <h6 class="m-0 font-weight-bold text-primary">Historial de Pacientes</h6>
                <br>
                <?php
                    $rolesPermitidos = [1, 2];
                    if (in_array($rolUsuario, $rolesPermitidos)) {
                ?>
                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#historial">
                    <span class="glyphicon glyphicon-plus"></span> Agregar Historial <i class="fa fa-notes-medical"></i> 
                </button>
                <?php } ?>
            </div>
            <?php
            $rolesPermitidos = [1, 2];
            if (in_array($rolUsuario, $rolesPermitidos)) {
            ?>
              
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Paciente</th>
                                <th>Fecha</th>
                                <th>Descripción</th>
                                <?php
                                $rolesPermitidos = [1, 2, 4];
                                if (in_array($rolUsuario, $rolesPermitidos)) {
                                ?>
                                <th>Acciones</th>
                                <?php } ?>
                            </tr>
                        </thead>

                        <?php
                        $result = mysqli_query($conexion, "SELECT * FROM pacientes ");
                        while ($fila = mysqli_fetch_assoc($result)) :
                        ?>
                            <tr>
                                <td><?php echo $fila['id']; ?></td>
                                <td><?php echo $fila['paciente']; ?></td>
                                <td><?php echo $fila['fecha']; ?></td>
                                <td><?php echo $fila['descripcion']; ?></td>
                                <td>
                                <?php
                                    $rolesPermitidos = [1, 2];
                                    if (in_array($rolUsuario, $rolesPermitidos)) {
                                ?>
                                    <a class="btn btn-warning" href="../includes/editar_historial.php?id=<?php echo $fila['id'] ?>">
                                        <i class="fa fa-edit"></i> 
                                    </a>
                                <?php } ?>
                                <?php
                                    $rolesPermitidos = [1, 2, 4];
                                    if (in_array($rolUsuario, $rolesPermitidos)) {
                                ?>
                                    <a href="../includes/ver_historial.php?id=<?php echo $fila['id'] ?>" class="btn btn-info">
                                        <i class="fa fa-eye"></i> 
                                    </a>
                                <?php } ?>
                                <?php
                                    $rolesPermitidos = [1, 2];
                                    if (in_array($rolUsuario, $rolesPermitidos)) {
                                ?>
                                    <a href="../includes/eliminar_historial.php?id=<?php echo $fila['id'] ?>" class="btn btn-danger btn-del">
                                        <i class="fa fa-trash"></i>
                                    </a>
                                <?php } ?>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                        </tbody>
                    </table>

                    <script>
                        $('.btn-del').on('click', function(e) {
                            e.preventDefault();
                            const href = $(this).attr('href')

                            Swal.fire({
                                title: 'Estas seguro de eliminar este historial?',
                                text: "¡No podrás revertir esto!",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'Si, eliminar!',
                                cancelButtonText: 'Cancelar',
                            }).then((result) => {
                                if (result.value) {
                                    if (result.isConfirmed) {
                                        Swal.fire(
                                            'Eliminado!',
                                            'El historial fue eliminado.',
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
            <?php } ?>
        </div>

    </div>
    <!-- /.container-fluid -->

    </div>
    <!-- End of Main Content -->

    <?php include "../includes/footer.php"; ?>
    <?php include "../includes/historial.php"; ?>

    </div>
    <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

</body>
</html>
