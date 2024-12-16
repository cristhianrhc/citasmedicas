<?php
class Database {
    public $user = "root";
    public $pass = "";
    public $host = "localhost";
    public $ddbb = "medicina";
    public static $db;
    public static $con;

    function __construct(){
        $this->user = "root";
        $this->pass = "";
        $this->host = "localhost";
        $this->ddbb = "medicina";
    }

    function connect(){
        self::$con = new mysqli($this->host, $this->user, $this->pass, $this->ddbb);

        if (self::$con->connect_error) {
            die("Connection failed: " . self::$con->connect_error);
        }

        return self::$con;
    }

    public static function getCon(){
        if(self::$con == null){
            self::$db = new Database();
            self::$con = self::$db->connect();
        }
        return self::$con;
    }
}
?>
