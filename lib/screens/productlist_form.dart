import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:football_shop/widgets/left_drawer.dart';

class CreateProductPage extends StatefulWidget {
  const CreateProductPage({super.key});

  @override
  State<CreateProductPage> createState() => _CreateProductPageState();
}

class _CreateProductPageState extends State<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _description = "";
  int _price = 0;
  int _stock = 0;
  String _category = "";
  String _imageUrl = "";
  bool _isFeatured = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Product'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Product Name
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    hintText: "Enter product name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Product name cannot be empty!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Description
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Description",
                    hintText: "Describe your product",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  maxLines: 3,
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Description cannot be empty!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Price and Stock
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Price (Rp)",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            _price = int.tryParse(value) ?? 0;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter price!";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Stock",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            _stock = int.tryParse(value) ?? 0;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter stock!";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                // Category Dropdown
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Category",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: "Jersey", child: Text("Jersey")),
                    DropdownMenuItem(value: "Boots", child: Text("Boots")),
                    DropdownMenuItem(value: "Ball", child: Text("Ball")),
                    DropdownMenuItem(
                      value: "Accessories",
                      child: Text("Accessories"),
                    ),
                    DropdownMenuItem(
                      value: "Merchandise",
                      child: Text("Merchandise"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _category = value ?? "";
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Select a category!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Image URL
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "Product Image URL",
                    hintText: "https://example.com/image.jpg",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _imageUrl = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),

                // Checkbox
                CheckboxListTile(
                  title: const Text("Mark as Featured Product"),
                  value: _isFeatured,
                  onChanged: (value) {
                    setState(() {
                      _isFeatured = value ?? false;
                    });
                  },
                ),
                const SizedBox(height: 24.0),

                // Submit button
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        // TODO: Ganti URL dengan URL aplikasi Anda
                        // Untuk emulator Android, gunakan http://10.0.2.2:8000/
                        // Untuk browser, gunakan http://localhost:8000/
                        // Pastikan Anda memiliki objek 'request' yang tersedia di scope ini.

                        // For Android emulator, use http://10.0.2.2:8000/
                        // For web, use http://localhost:8000/
                        final response = await request.postJson(
                          "http://localhost:8000/create-flutter/", // Updated URL as per your feedback
                          jsonEncode({
                            // Data dari form Anda dipetakan ke format JSON
                            "name": _name,
                            "description": _description,
                            "price": _price,
                            "stock": _stock,
                            "category": _category,
                            "thumbnail":
                                _imageUrl, // Dipetakan dari _imageUrl Anda
                            "is_featured":
                                _isFeatured, // Asumsi _isFeatured sudah boolean
                          }),
                        );

                        if (context.mounted) {
                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Product successfully created!"),
                              ),
                            );
                            // Kembali ke halaman sebelumnya setelah berhasil
                            Navigator.pop(context);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  response['message'] ??
                                      "Something went wrong, please try again.",
                                ),
                              ),
                            );
                          }
                        }
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text("Error: $e")));
                        }
                      }
                    }
                  },
                  child: const Text("Create Product"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
