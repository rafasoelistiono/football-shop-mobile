import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:intl/intl.dart'; // Import intl untuk format harga

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  // Helper untuk format mata uang (Rupiah)
  String _formatPrice(int price) {
    // Menggunakan NumberFormat dari package intl
    final formatCurrency = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatCurrency.format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'), // Diubah
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail image
            if (product.thumbnail.isNotEmpty)
              Image.network(
                // Tetap menggunakan proxy URL Anda
                'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(product.thumbnail)}',
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Featured badge
                  if (product.isFeatured)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      margin: const EdgeInsets.only(bottom: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Text(
                        'Featured',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  // Product Name
                  Text(
                    product.name, // Diubah dari news.title
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Product Price (BARU)
                  Text(
                    _formatPrice(product.price), // Ditambahkan
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo.shade700,
                    ),
                  ),
                  const SizedBox(height: 12),


                  // Category
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.indigo.shade100,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          product.category.toUpperCase(), // Diubah dari news.category
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo.shade700,
                          ),
                        ),
                      ),
                      // Tanggal dihapus
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Rating, Sales, and Stock (DIUBAH)
                  Row(
                    children: [
                      // Rating
                      Icon(Icons.star, size: 16, color: Colors.amber.shade700),
                      const SizedBox(width: 4),
                      Text(
                        '${product.rating.toStringAsFixed(1)}', // Menampilkan rating
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Sales Count
                      Icon(Icons.shopping_cart, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        '${product.salesCount} sold', // Diubah dari news.newsViews
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Stock
                      Icon(Icons.inventory_2_outlined, size: 16, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Text(
                        'Stock: ${product.stock}', // Menampilkan stok
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 32),

                  // Full Description
                  Text(
                    product.description, // Diubah dari news.content
                    style: const TextStyle(
                      fontSize: 16.0,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}