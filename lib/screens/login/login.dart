import 'package:crud_con_apirest/api/peticioneshttp.dart';
import 'package:crud_con_apirest/api/peticionesusuarios.dart';
import 'package:crud_con_apirest/screens/lista.dart';
import 'package:crud_con_apirest/screens/users/add_usuarios.dart';
import 'package:crud_con_apirest/screens/users/usuarios_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailuser = TextEditingController();
  TextEditingController passwuser = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 80.0,
                  backgroundImage: NetworkImage(
                      'https://login.gov/assets/img/login-gov-288x288.png')),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailuser,
                decoration: InputDecoration(hintText: 'Ingrese el Email'),
              ),
              TextField(
                controller: passwuser,
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   IconButton(onPressed: () {
                    Get.to(() => AgregarUsuarios());
                   }, icon: Icon(Icons.app_registration)),
                  IconButton(
                      onPressed: () {
                          validarUsuariosConInfo(
                                http.Client(), emailuser.text, passwuser.text)
                            .then((response) {
                          print(response.length);
                          if (response.length == 1) {
                            Get.to(() => ListaUsuarios(title: 'Usuarios'));
                          } else {
                            Get.snackbar(
                              "Login",
                              'Datos Invalidos',
                              icon: Icon(Icons.person, color: Colors.red),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        });
                                
                      },
                      icon: Icon(Icons.login))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
// Widget getInfo(BuildContext context, cliente, apellido, usuario) {
//   return FutureBuilder(
//       future: validarUsuariosConInfo(http.Client(), apellido, usuario),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         switch (snapshot.connectionState) {
//           /* Estado de espera de la peticion */
//           case ConnectionState.waiting:
//             return const CircularProgressIndicator();
//           /**/
//           case ConnectionState.done:
//             return snapshot.data != null
//                 ? 
//                 ListaMensajeros (title: 'Mensajeros')
//                 : const Text('No Hay Datos');

//           default:
//             return const Text('Recargar los Datos');
//         }
//       });
// }
