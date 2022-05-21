import 'package:crud_con_apirest/screens/lista.dart';
import 'package:crud_con_apirest/screens/users/usuarios_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CRUD HTTP API REST',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: ListaUsuarios(
        title: 'Proyecto Mensajeros'
      ),
    );
  }
}