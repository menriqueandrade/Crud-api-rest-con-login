import 'package:crud_con_apirest/api/peticioneshttp.dart';
import 'package:crud_con_apirest/api/peticionesusuarios.dart';
import 'package:crud_con_apirest/models/mensajeros.dart';
import 'package:crud_con_apirest/models/usuarios.dart';
import 'package:crud_con_apirest/screens/adicionar.dart';
import 'package:crud_con_apirest/screens/perfil.dart';
import 'package:crud_con_apirest/screens/users/add_usuarios.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListaUsuarios extends StatefulWidget {
  final title;
  ListaUsuarios({Key? key, required this.title}) : super(key: key);

  @override
  State<ListaUsuarios> createState() => _ListaUsuariosState();
}

class _ListaUsuariosState extends State<ListaUsuarios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuarios'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AgregarUsuarios())).then((value) {
                  setState(() {
                    getInfo(context);
                  });
                });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: getInfo(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.update),
      ),
    );
  }
}

Widget getInfo(BuildContext context) {
  return FutureBuilder(
      future: listaUsuarios(http.Client()),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          /* Estado de espera de la peticion */
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          /**/
          case ConnectionState.done:
            return snapshot.data != null
                ? VistaUsuarios(usuarios: snapshot.data)
                : const Text('No Hay Datos');

          default:
            return const Text('Recargar los Datos');
        }
      });
}

class VistaUsuarios extends StatelessWidget {
  final List<Usuarios> usuarios;
  const VistaUsuarios({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (context, posicion) {
          return ListTile(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => Perfilmensajero(
              //             perfil: usuarios, idperfil: posicion)));
            },
            leading: CircleAvatar(
              child: Text(usuarios[posicion].nombre.substring(0,1).toUpperCase()),
            ),
          
            title: Text(usuarios[posicion].nombre),
            subtitle: Text(usuarios[posicion].apellido),
            trailing: CircleAvatar(
              child: Text(usuarios[posicion].id)
            ,)
          );
        });
  }
}
