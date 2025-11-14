import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:football_shop/screens/product_detail.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryList extends StatefulWidget {
  const ProductEntryList({super.key});

  @override
  State<ProductEntryList> createState() => _ProductEntryListState();
}

class _ProductEntryListState extends State<ProductEntryList> {
  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome, use URL http://localhost:8000

    final response = await request.get('http://localhost:8000/json/');

    // Decode response to json format
    var data = response;

    // Convert json data to ProductEntry objects
    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product List',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color(0xFFEA580C),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 4,
      ),
      drawer: const LeftDrawer(),
      backgroundColor: const Color(0xFFF8FAFC),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFEA580C)),
            );
          } else {
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      size: 80,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'No products available yet.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF64748B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Check back later for new items!',
                      style: TextStyle(fontSize: 14, color: Color(0xFF94A3B8)),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductEntryCard(
                  product: snapshot.data![index],
                  onTap: () {
                    // Navigate to product detail or show snackbar
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: snapshot.data![index]),
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(
                            "You clicked on ${snapshot.data![index].name}",
                          ),
                          backgroundColor: const Color(0xFFEA580C),
                        ),
                      );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
