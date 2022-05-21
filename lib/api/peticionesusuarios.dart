import 'dart:convert';


import 'package:crud_con_apirest/models/usuarios.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Usuarios>> listaUsuarios(http.Client client) async {
  //final response =
  //    await client.get('https://desarolloweb2021a.000webhostapp.com/API/listarnotas.php');
  //var id = "2";
  final response = await client.get(Uri.parse(
      'https://propiedadh.000webhostapp.com/API/listar.php'));

  // Usa la función compute para ejecutar parsePhotos en un isolate separado
  return compute(pasaraUsuarioss, response.body);
}

// Una función que convierte el body de la respuesta en un List<Photo>
List<Usuarios> pasaraUsuarioss(String responseBody) {
  final pasar = json.decode(responseBody).cast<Map<String, dynamic>>();

  return pasar.map<Usuarios>((json) => Usuarios.fromJson(json)).toList();
}

void adicionarUsuario(
    String nombre,
    String apellido,
    String usuario,) async {
  var url = Uri.parse(
      "https://propiedadh.000webhostapp.com/API/adicionar.php");

  await http.post(url, body: {
    'nombre': nombre,
    'apellido': apellido,
    'usuario': usuario,
  });
}

// void editarUsuarios(
//     String id,
//     String nombre,
//     String foto,
//     String placa,
//     String telefono,
//     String whatsapp,
//     String moto,
//     String soat,
//     String tecno,
//     String activo) async {
//   var url = Uri.parse(
//       "https://desarolloweb2021a.000webhostapp.com/proyectoUsuariossapi/modificar.php");

//   await http.post(url, body: {
//     'id': id,
//     'nombre': nombre,
//     'foto': foto,
//     'placa': placa,
//     'telefono': telefono,
//     'whatsapp': whatsapp,
//     'moto': moto,
//     'soat': soat,
//     'tecno': tecno,
//     'activo': activo
//   });
// }

// void eliminarUsuarios(id) async {
//   var url = Uri.parse(
//       "https://desarolloweb2021a.000webhostapp.com/proyectoUsuariossapi/eliminar.php");

//   await http.post(url, body: {
//     'ideliminar': id,
//   });
// }
