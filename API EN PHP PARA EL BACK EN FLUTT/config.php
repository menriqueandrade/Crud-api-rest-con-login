<?php

session_start();
$host = "localhost"; /* equipo */
$user = "id16281468_root"; /* usuario */
$password = "CrudFlutter21*"; /* clave */
$dbname = "id16281468_crud"; /* base de datos */

$con = mysqli_connect($host, $user, $password,$dbname);

if (!$con) {
  die("Connection failed: " . mysqli_connect_error());
}
//echo "Conexion Exitosa";

?>
