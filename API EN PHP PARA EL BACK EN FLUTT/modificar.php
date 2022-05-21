<?php

header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Methods: HEAD, GET, POST, PUT, PATCH, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header('Content-Type: application/json');
$method = $_SERVER['REQUEST_METHOD'];
if ($method == "OPTIONS") {
header('Access-Control-Allow-Origin: *');
header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method,Access-Control-Request-Headers, Authorization");
header("HTTP/1.1 200 OK");
die();
}


    require "config.php";

   
    $ideditar = $_POST['id'];   
    $nombre = $_POST['nombre'];   
    $foto = $_POST['foto'];
    $placa = $_POST['placa'];   
    $telefono = $_POST['telefono'];  
    $whatsapp = $_POST['whatsapp'];  
    $moto = $_POST['moto'];  
    $soat = $_POST['soat'];  
    $tecno = $_POST['tecno'];  
    $activo = $_POST['activo'];  
    
   /*
    $ideditar ='8'; 
    $nombre ='alex';   
    $foto = "alex";   
    $placa ="alex";   
    $telefono = "alex";   
    $whatsapp ="alex";   
    $moto = "alex";   
    $soat = "alex";   
    $tecno ="alex";   
    $activo = "alex";   
    */

    $sql = "UPDATE mensajeroscrud SET nombre='$nombre',foto='$foto',placa='$placa',telefono='$telefono',whatsapp='$whatsapp',moto='$moto',soat='$soat',tecno='$tecno',activo='$activo' WHERE id='$ideditar'";
    
    if (mysqli_query($con, $sql)) {
    $respuesta = array("mensaje"=>"Datos Modificados");
    $json_string = json_encode($respuesta);
    echo $json_string;
  } else {
    $respuesta = array("mensaje"=>"Error". mysqli_error($con));
    $json_string = json_encode($respuesta);
    echo $json_string;
  }
    
?>