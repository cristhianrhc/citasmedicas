<?php 
    include 'code-register.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Register - MagtimusPro</title>
    <link rel="stylesheet" href="../../css/estilos.css">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <style>
        body {
            color: black; /* Cambia el color del texto a negro */
        }
        .ctn-form label,
        .ctn-form input,
        .ctn-form .text-footer {
            color: black; /* Cambia el color del texto en el formulario */
        }
        .password-strength {
            width: 100%;
            height: 10px;
            margin-top: 5px;
            background-color: #ddd;
        }
        .password-strength-bar {
            height: 100%;
            width: 0;
        }
        .strength-weak {
            background-color: red;
        }
        .strength-medium {
            background-color: orange;
        }
        .strength-strong {
            background-color: green;
        }
    </style>
</head>

<body>

    <div class="container-all">

        <div class="ctn-form text-black">

            <div class = "img">
                <img src="img/biodent.png" alt="" class="logo">
            </div>
            
            <h1 class="title">Registrarse</h1>

            <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post" onsubmit="return validateForm()">
               
                <label for="username">Nombre de Usuario</label>
                <input type="text" name="username" required>
                <span class="msg-error"><?php echo $username_err; ?></span>
                
                <label for="email">Email</label>
                <input type="email" name="email" required>
                <span class="msg-error"> <?php echo $email_err; ?></span>
                
                <label for="password">Contraseña</label>
                <input type="password" name="password" id="password" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}" oninput="checkPasswordStrength()">
                <span class="msg-error"> <?php echo $password_err; ?></span>

                <div class="password-strength">
                    <div id="password-strength-bar" class="password-strength-bar"></div>
                </div>

                <input type="checkbox" onclick="togglePasswordVisibility()"> Mostrar Contraseña

                <input type="submit" value="Registrarse">

            </form>

            <span class="text-footer">¿Ya te has registrado?
                <a href="login.php">Iniciar Sesión</a>
            </span>
        </div>

        <div class="ctn-text">
            <div class="im-conteiner">
            <div class="capa"></div>
            <img src="../../img/biodent.png" alt="Biodent">
        </div>

        </div>

    </div>

    <script>
        function validateForm() {
            var password = document.forms[0]["password"].value;
            var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$/;
            if (!pattern.test(password)) {
                alert("La contraseña debe tener al menos 8 caracteres, contener una mayúscula, un número y un símbolo.");
                return false;
            }
            return true;
        }

        function togglePasswordVisibility() {
            var passwordField = document.getElementById("password");
            if (passwordField.type === "password") {
                passwordField.type = "text";
            } else {
                passwordField.type = "password";
            }
        }

        function checkPasswordStrength() {
            var password = document.getElementById("password").value;
            var strengthBar = document.getElementById("password-strength-bar");
            var strength = 0;

            if (password.length >= 8) strength++;
            if (/[a-z]/.test(password)) strength++;
            if (/[A-Z]/.test(password)) strength++;
            if (/[0-9]/.test(password)) strength++;
            if (/[@#$%^&+=]/.test(password)) strength++;

            switch (strength) {
                case 0:
                case 1:
                case 2:
                    strengthBar.style.width = "20%";
                    strengthBar.className = "password-strength-bar strength-weak";
                    break;
                case 3:
                    strengthBar.style.width = "40%";
                    strengthBar.className = "password-strength-bar strength-weak";
                    break;
                case 4:
                    strengthBar.style.width = "60%";
                    strengthBar.className = "password-strength-bar strength-medium";
                    break;
                case 5:
                    strengthBar.style.width = "100%";
                    strengthBar.className = "password-strength-bar strength-strong";
                    break;
            }
        }
    </script>

</body>

</html>
