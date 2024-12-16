<?php
    //INICIALIZAR LA SESION
    session_start();

    if(isset($_SESSION["loggedin"]) && $_SESSION["loggedin"] === true){
        header("Location: ../../views/index.php");
        exit;
    }

require_once "../db.php";

$nombre = $password ="";
$nombre_err = $password_err = "";

if($_SERVER["REQUEST_METHOD"] === "POST"){
    
    if(empty(trim($_POST["nombre"]))){
        $nombre_err = "Por favor, ingrese el usuario";
    }else{
        $nombre= trim($_POST["nombre"]);
    }
    
    if(empty(trim($_POST["contrasena"]))){
        $password_err = "Por favor, ingrese una contraseña";
    }else{
        $password = trim($_POST["contrasena"]);
    }
    
    
    

    //VALIDAR CREDENCIALES
    if(empty($nombre_err) && empty($password_err)){
        
        $sql = "SELECT id, nombre, correo, contrasena, rol FROM user WHERE nombre = ?";
        
        if($stmt = mysqli_prepare($conexion, $sql)){
            
            mysqli_stmt_bind_param($stmt, "s", $param_nombre);
            
            $param_nombre = $nombre;
            
            if(mysqli_stmt_execute($stmt)){
                mysqli_stmt_store_result($stmt);
            }
            
            if(mysqli_stmt_num_rows($stmt) == 1){
                mysqli_stmt_bind_result($stmt, $id, $nombre, $email, $hashed_password, $rol);
                if(mysqli_stmt_fetch($stmt)){
                    if(password_verify($password, $hashed_password)){
                        session_start();
                        
                        // ALMACENAR DATOS EN VARABLES DE SESION
                        $_SESSION["loggedin"] = true;
                        $_SESSION["id"] = $id;
                        $_SESSION["nombre"] = $nombre;
                        
                        header("Location: ../../views/index.php");
                    }else{
                        $password_err = "La contraseña que has introducido no es valida";
                    }
                    
                } 
            }else{
                    $email_err = "No se ha encontrado ninguna cuenta con ese correo electronico.";
                }
            
        }else{
                    echo "UPS! algo salio mal, intentalo mas tarde";
                }
    }
    
    mysqli_close($conexion);
    
}

?>
























