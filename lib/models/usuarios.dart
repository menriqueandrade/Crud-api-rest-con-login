class Usuarios {
  final String id;
  final String nombre;
  final String apellido;
  final String usuario;
  
 
    Usuarios({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.usuario,
   
 });
factory Usuarios.fromJson(Map<String, dynamic> json) {
    return Usuarios(
      id: json['id'],
      nombre: json['nombre'],
      apellido: json['apellido'],
      usuario: json['usuario'],
      
    );
  }
 
}