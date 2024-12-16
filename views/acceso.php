<?php 
error_reporting(0);
session_start();
$actualsesion = $_SESSION['nombre'];

if($actualsesion == "Administrador"){
    header("Location: ../views/usuarios.php");
	die();

}


echo "<script language='JavaScript'>
alert('Necesitamos validar que eres Administrador para acceder a esta vista!!Vuelve a Iniciar Sesion');
location.assign('../views/index.php');
</script>"

?>