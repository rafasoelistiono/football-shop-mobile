import 'package:flutter/material.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:football_shop/screens/productlist_form.dart';
import 'package:football_shop/screens/product_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header Drawer
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Football Shop',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Toko perlengkapan sepak bola terbaik',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),

          // Menu Navigasi
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              // Navigasi ke HomePage
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
              // SnackBar
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text("Kamu berada di halaman Home!"),
                    duration: Duration(seconds: 2),
                  ),
                );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text('Add Product'),
            onTap: () {
              // Navigasi ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const CreateProductPage(),
                ),
              );
              // SnackBar
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  const SnackBar(
                    content: Text("Kamu membuka halaman Add Product!"),
                    duration: Duration(seconds: 2),
                  ),
                );
            },
          ),
          ListTile(
              leading: const Icon(Icons.add_reaction_rounded),
              title: const Text('Product List'),
              onTap: () {
                  // Route to news list page
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProductEntryList()),
                  );
              },
          ),
        ],
      ),
    );
  }
}
