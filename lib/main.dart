import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:reto_pragma_2/services/api_services.dart';



void main() async {
  await dotenv.load(fileName: ".env");

  final apiService = ApiService(dotenv.env['API_BASE_URL']!);

  // Products
  final productsResult = await apiService.getProducts();
  productsResult.fold(
    (error) => print('Error al obtener productos: $error'),
    (products) {
      print('\n Productos:');
      for (var p in products.take(5)) {
        print('\n PRODUCTO: ${p.title} \n PRECIO: \$${p.price} \n CATEGORÍA: ${p.category} \n DESCRIPCIÓN: ${p.description}');
      }
    },
  );

  // Carts
  final cartsResult = await apiService.getCarts();
  cartsResult.fold(
    (error) => print('Error al obtener carritos: $error'),
    (carts) {
      print('\n Carritos:');
      for (var c in carts) {
        print(c.products.map((e) {
          return 'PRODUCT ID: ${e.productId} CANTIDAD: ${e.quantity}';
        }).toString());
      }
    },
  );

  // Users
  final usersResult = await apiService.getUsers();
  usersResult.fold(
    (error) => print('Error al obtener usuarios: $error'),
    (users) {
      print('\n Usuarios:');
      for (var u in users.take(5)) {
        print('Usuario: ${u.username} Correo: ${u.email} Dirección: ${u.address.city}');
      }
    },
  );
}
