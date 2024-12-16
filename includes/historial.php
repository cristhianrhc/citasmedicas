<?php


session_start();
error_reporting(0);
$varsesion = $_SESSION['nombre'];

	if($varsesion== null || $varsesion= ''){
     header("Location: _sesion/login.php");
	
	}

////////////////// CONEXION A LA BASE DE DATOS ////////////////////////////////////
$id = $_GET['id'];
include "db.php"; 
$consulta = "SELECT * FROM pacientes WHERE id = $id";
$resultado = mysqli_query($conexion, $consulta);
$usuario = mysqli_fetch_assoc($resultado);
?>
<?php include_once "header.php"; ?>


<!DOCTYPE html>
<html lang="es-MX">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registros</title>


    <link rel="stylesheet" href="../../css/fontawesome-all.min.css">
	<link rel="stylesheet" href="../../css/2.css">
	<link rel="stylesheet" href="../../css/estilo.css">
</head>

<body>



    <form  action="functions.php" id="form" method="POST">

        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                     
                            <h3 class="text-center">Actualizar historial del Paciente <?php echo $usuario ['nombre']; ?></h3>
                            <br>
                            <div class="form-group">
                            <label for="nombre" class="form-label">Nombre/Apellido *</label>
                            <input type="text"  id="nombre" name="nombre" class="form-control" value="<?php echo $usuario ['nombre']; ?>">
                            </div>
     
                            <div class="form-group">
                                <label for="username">Antecedentes:</label><br>
                                <textarea id="antecedentes" name="antecedentes" class="form-control" rows="3" required><?php echo $usuario['antecedentes']; ?></textarea>
        
                            </div>
                            <div class="form-group">
                                <label for="username">Asunto o enfermedad:</label><br>
                                <textarea id="enfermedades" name="enfermedades" class="form-control" rows="3" required><?php echo $usuario['enfermedades']; ?></textarea>
                            </div>

                            <div class="form-group">
                                  <label for="rol_id" class="form-label">Estado:</label>
                                  <select name="estado" id="estado" class="form-control" required >
                                  <option <?php echo $usuario ['estado']==='Pendiente' ? "selected='selected' ": "" ?> value="Pendiente">Pendiente</option>
                                  <option <?php echo $usuario ['estado']==='Atendido' ? "selected='selected' ": "" ?> value="Atendido">Atendido</option>
                               </select>
                            </div>
                      
                            <input type="hidden" name="accion" value="editar_historial">
                                <input type="hidden" name="id" value="<?php echo $id;?>">
                               <br>
                                <div class="mb-3">
                                    
                                <button type="submit" id="form" name="form" class="btn btn-success" >Editar</button>
                               <a href="../views/pacientes.php" class="btn btn-danger">Cancelar</a>
                               
                            </div>
                            </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <?php  include_once "footer.php"; ?>
</body>
</html>