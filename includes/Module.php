<?php


// 13 de Abril del 2014
// Module.php
// @brief tareas que se realizan con modulos.

class Module {
	public static $module;
	public static $view;
	public static $message;

	public static function setModule($module){
		self::$module = $module;
	}

	public static function loadLayout(){
		include "includes/".Module::$module."/header.php";
	}

	// validacion del modulo
	public static function isValid(){
		$valid = false;
		$folder = "includes/_sesion".Module::$module;
		
			if(is_dir($folder)){
				$valid=true;

			}else { self::$message= "<b>404 NOT FOUND</b> Module <b>".Module::$module."</b> folder !! - <a href='http://evilnapsis.com/legobox/help/'>Help</a>"; }
		
	
		return $valid;
	}

	public static function Error(){
		echo self::$message;
		die();
	}

}



?>