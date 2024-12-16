<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie-edge">
    <title>Login</title>
   
    <link rel="stylesheet" type="text/css "href="../../css/style.css">
    <link rel="stylesheet" type="text/css "href="../../css/estilos.css">

	<link rel="icon" href="assets/img/logo.png" type="image/x-icon"/>
	<script src="../../js/fonts.js"></script>
</head>
<body>
   <!--  <img class="wave"src="../assets/img/wave.png" alt="">  -->
    <div class="contenedor">
    <div class="img">
    <img src="../../img/biodent.png" alt="">
    </div>
        <div class="contenido-login">
        <form action="../functions.php" method="POST">
                <img src="../../img/biodent.png" alt="">
                <h2>BioDENT</h2>
                <h1 class="l">INICIAR SESION</h1>
            
                <div class="input-div nit">
                    <div class="i">
                        <i class="fas fa-user"></i>
                    </div>
                    <div class="div">
                        <input type="text"  name="nombre" id="nombre"  placeholder="USUARIO">
                    </div>
                </div>
                <div class="input-div pass">
                    <div class="i">
                        <i class="fas fa-lock"></i>
                    </div>
                    <div class="div">
                        <input type="password" name="contrasena" id="contrasena" placeholder="CONTRASEÑA" >
                        <input type="hidden" name="accion" value="acceso_user">
                    </div>
                </div>
                <button class="btn"  type="submit"> Iniciar sesion </button>
                <div class="center-container">
                    <a href="registros_usuarios.php" class="registrarse-btn">Registrarse</a>
                </div>
            </form>
        </div>
    </div>
</body>

</html>
