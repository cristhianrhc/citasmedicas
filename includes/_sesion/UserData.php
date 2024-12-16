<?php
class UserData {
	public static $tablename = "user";

	public function UserData(){
		$this->nombre = "";
		$this->contrasena = "";
		$this->fecha = "NOW()";
	}

	public function add(){
		$sql = "insert into ".self::$tablename." (nombre,contraseña,rol,fecha) ";
		$sql .= "value (\"$this->nombre\",\"$this->contraseña\",$this->rol,$this->fecha)";
		Executor::doit($sql);
	}

	public static function getById($id){
		$sql = "select * from ".self::$tablename." where id=$id";
		$query = Executor::doit($sql);
		return Model::one($query[0],new UserData());
	}



	public static function getAll(){
		$sql = "select * from ".self::$tablename." order by fecha desc";
		$query = Executor::doit($sql);
		return Model::many($query[0],new UserData());
	}


	public static function getLike($q){
		$sql = "select * from ".self::$tablename." where title like '%$q%' or content like '%$q%'";
		$query = Executor::doit($sql);
		return Model::many($query[0],new UserData());
	}


}

?>