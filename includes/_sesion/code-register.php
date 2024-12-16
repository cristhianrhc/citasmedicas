<?php

// Incluir archivo de conexion a la base de datos
require_once "../db.php";

// Definir variable e inicializar con valores vacio
$username = $email = $password = "";
$username_err = $email_err = $password_err = "";

if($_SERVER["REQUEST_METHOD"] == "POST"){

    // VALIDANDO INPUT DE NOMBRE DE USUARIO
    if(empty(trim($_POST["username"]))){
        $username_err = "Por favor, ingrese un nombre de usuario";
    }else{
        // Prepara una declaración de selección
        $sql = "SELECT id FROM user WHERE nombre = ?";
        if ($conexion) {
            if($stmt = mysqli_prepare($conexion, $sql)){
                mysqli_stmt_bind_param($stmt, "s", $param_username);
                
                $param_username = trim($_POST["username"]);
                
                if(mysqli_stmt_execute($stmt)){
                    mysqli_stmt_store_result($stmt);
                    
                    if(mysqli_stmt_num_rows($stmt) == 1){
                        $username_err = "Este nombre de usuario ya está en uso";
                    }else{
                        $username = trim($_POST["username"]);
                    }
                }else{
                    echo "Ups! Algo salió mal, inténtalo más tarde";
                }
            }
        }else {
            echo "Error de conexión a la base de datos";
        }
    }
    
    // VALIDANDO INPUT DE EMAIL
    if(empty(trim($_POST["email"]))){
        $email_err = "Por favor, ingrese un correo";
    }else{
        // Prepara una declaración de selección
        $sql = "SELECT id FROM user WHERE correo = ?";
        
        if($stmt = mysqli_prepare($conexion, $sql)){
            mysqli_stmt_bind_param($stmt, "s", $param_email);
            
            $param_email = trim($_POST["email"]);
            
            if(mysqli_stmt_execute($stmt)){
                mysqli_stmt_store_result($stmt);
                
                if(mysqli_stmt_num_rows($stmt) == 1){
                    $email_err = "Este correo ya está en uso";
                }else{
                    $email = trim($_POST["email"]);
                }
            }else{
                echo "Ups! Algo salió mal, inténtalo más tarde";
            }
        }
    }
    
    // VALIDANDO CONTRASEÑA
    if(empty(trim($_POST["password"]))){
        $password_err = "Por favor, ingrese una contraseña";
    } elseif (!preg_match('/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$/', trim($_POST["password"]))) {
        $password_err = "La contraseña debe tener al menos 8 caracteres, contener una mayúscula, un número y un símbolo.";
    } else {
        $password = trim($_POST["password"]);
    }
    
    // COMPROBANDO LOS ERRORES DE ENTRADA ANTES DE INSERTAR LOS DATOS EN LA BASE DE DATOS
    if(empty($username_err) && empty($email_err) && empty($password_err)){
        
        $sql = "INSERT INTO user (nombre, correo, contrasena, rol) VALUES (?, ?, ?, 3)";
        
        if($stmt = mysqli_prepare($conexion, $sql)){
            mysqli_stmt_bind_param($stmt, "sss", $param_username, $param_email, $param_password);
            
            // ESTABLECIENDO PARAMETRO
            $param_username = $username;
            $param_email = $email;
            $param_password = password_hash($password, PASSWORD_DEFAULT); // Encripta la contraseña
            
            if(mysqli_stmt_execute($stmt)){
                header("location: login.php");
            }else{
                echo "Algo salió mal, inténtalo después";
            }
        }
    }
    
    mysqli_close($conexion);
}
?>
