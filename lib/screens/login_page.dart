import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        "name": "Camisa",
        "image": "assets/images/camisa.png",
      },
      {
        "name": "Lentes",
        "image": "assets/images/lentes.png",
      },
      {
        "name": "Mochila",
        "image": "assets/images/mochila.png",
      },
      {
        "name": "Zapato",
        "image": "assets/images/zapato.png",
      },
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Fondo azul
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: const Color(0xFF2196f3), // Celeste claro
          ),

          // Contenido
          SingleChildScrollView(
            child: Column(
              children: [
                // AppBar personalizado
                const Padding(
                  padding: EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
                  child: Row(
                    children: [
                      Spacer(),
                      Center(
                        child: Text(
                          "Categorías",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Filtro de categorías
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      categoryButton(
                          text: "Camisetas",
                          icon: Icons.directions_run,
                          color: Colors.yellow),
                      categoryButton(
                          text: "Lestes", icon: Icons.face, color: Colors.red),
                      categoryButton(
                          text: "Mochilas",
                          icon: Icons.local_drink,
                          color: Colors.blue),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Lista de productos
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Imagen del producto
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                                child: Image.asset(
                                  product["image"]!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                            // Información del producto
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, // Centra verticalmente
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center, // Centra horizontalmente
                                  children: [
                                    Center(
                                      // Centra el texto
                                      child: Text(
                                        product["name"]!,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configuración',
          ),
        ],
      ),
    );
  }

  // Función para crear botones de categoría con íconos
  Widget categoryButton(
      {required String text, required IconData icon, required Color color}) {
    return SizedBox(
      width: 100,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          // Acción al presionar el botón
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: Colors.white),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
