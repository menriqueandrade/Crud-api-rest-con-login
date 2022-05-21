import 'package:crud_con_apirest/api/peticioneshttp.dart';
import 'package:crud_con_apirest/api/peticionesusuarios.dart';
import 'package:flutter/material.dart';

class AgregarUsuarios extends StatefulWidget {
  AgregarUsuarios({Key? key}) : super(key: key);

  @override
  State<AgregarUsuarios> createState() => _AgregarMensajeroState();
}

class _AgregarMensajeroState extends State<AgregarUsuarios> {
  TextEditingController controlNombre = TextEditingController();
  TextEditingController controlApellido = TextEditingController();
  TextEditingController controlUsuario = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Usuarios"),
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Center(
          child: ListView(
            children: [
              TextField(
                controller: controlNombre,
                decoration:
                    const InputDecoration(labelText: 'Ingrese el Nombre'),
              ),
              TextField(
                controller: controlApellido,
                decoration:
                    const InputDecoration(labelText: 'Ingrese la Apellido'),
              ),
              TextField(
                controller: controlUsuario,
                decoration:
                    const InputDecoration(labelText: 'Ingrese la Usuario'),
              ),
              ElevatedButton(
                  onPressed: () {
                    adicionarUsuario(
                        controlNombre.text,
                        controlApellido.text,
                        controlUsuario.text);
                    Navigator.pop(context);
                  },
                  child: const Text('Agregar Usuarios'))
            ],
          ),
        ),
      ),
    );
  }
}
