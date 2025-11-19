import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/productlist_form.dart';
import 'package:football_shop/screens/product_entry_list.dart';
import 'package:football_shop/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final String nama = "Lionel Messi"; //nama
  final String npm = "2406275678"; //npm
  final String kelas = "B"; //kelas

  final List<ItemHomepage> items = [
    ItemHomepage(
      "Product List",
      Icons.list_alt_rounded,
      const Color(0xFF2563EB), 
    ),
    ItemHomepage(
      "Create Product",
      Icons.add_circle_outline_rounded,
      const Color(0xFFEA580C),
    ),
    ItemHomepage(
      "Logout",
      Icons.logout_rounded,
      const Color(0xFFDC2626),
    ),
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onItemTap(ItemHomepage item) async {
    final request = context.read<CookieRequest>();
    if (item.name == "Logout") {
      final response = await request.logout(
        "http://localhost:8000/auth/logout/",
      );
      if (response['message'] == 'Logout berhasil.') {
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
            (Route<dynamic> route) => false,
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(content: Text("Logout berhasil.")));
        }
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(const SnackBar(content: Text("Logout gagal.")));
      }
    } else if (item.name == "Product List") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductEntryList()),
      );
    } else if (item.name == "Create Product") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CreateProductPage()),
      );
    } else {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!")),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Menggunakan background abu-abu muda seperti pada HTML (bg-slate-50)
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        // Desain AppBar bersih seperti Navbar HTML
        title: const Text(
          'Athlete Lab',
          style: TextStyle(
            color: Color(0xFF0F172A), // Slate-900
            fontWeight: FontWeight.w900, // font-black
            letterSpacing: -0.5,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[200],
            height: 1.0,
          ),
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Header (Mirip Header Section HTML)
              const Text(
                "Welcome Back,",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Color(0xFF475569), // Slate-600
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                widget.nama,
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900, // font-black
                  color: Color(0xFF0F172A), // Slate-900
                  height: 1.1,
                ),
              ),
              
              const SizedBox(height: 24.0),

              // User Info Section (Desain mirip Filter Section HTML)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0), // rounded-xl
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInfoColumn(Icons.badge_outlined, "NPM", widget.npm),
                    Container(height: 40, width: 1, color: Colors.grey[200]),
                    _buildInfoColumn(Icons.class_outlined, "Class", widget.kelas),
                  ],
                ),
              ),

              const SizedBox(height: 32.0),
              
              const Text(
                "Quick Actions",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              
              const SizedBox(height: 16.0),

              // Grid Menu
              GridView.count(
                primary: false,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2, // Mengubah jadi 2 kolom agar kartu lebih lebar & jelas
                childAspectRatio: 1.3, 
                children: widget.items.map((ItemHomepage item) {
                  return ItemCard(item, onTap: () => _onItemTap(item));
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk info user
  Widget _buildInfoColumn(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFFEA580C), size: 24), // Orange Icon
        const SizedBox(height: 8),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[500],
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color;

  ItemHomepage(this.name, this.icon, this.color);
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;
  final VoidCallback? onTap;

  const ItemCard(this.item, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            // Gradient background mirip tombol HTML
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                item.color,
                item.color.withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: item.color.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Dekorasi lingkaran transparan di background kartu
              Positioned(
                right: -10,
                top: -10,
                child: Icon(
                  item.icon,
                  size: 80,
                  color: Colors.white.withOpacity(0.15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        item.icon,
                        color: Colors.white,
                        size: 28.0,
                      ),
                    ),
                    Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}