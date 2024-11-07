import 'package:flutter/material.dart';
import 'models/product.dart';
import 'pages/productdetail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: "Eau de Parfum Floral",
      description:
          "Parfum dengan aroma bunga yang menyegarkan dan elegan, cocok untuk acara formal.",
      price: 550.000,
      imageUrl:
          "https://i.pinimg.com/564x/0a/24/f8/0a24f8c9020f0b3652478ec65582cefd.jpg",
    ),
    Product(
      id: 2,
      name: "Citrus Fresh",
      description:
          "Aroma buah segar yang memberikan kesan energi dan kesegaran sepanjang hari.",
      price: 600.000,
      imageUrl:
          "https://i.pinimg.com/564x/bb/44/1d/bb441df05bacb2be6375ddc391eb6d9a.jpg",
    ),
    Product(
      id: 3,
      name: "Woody Musk",
      description:
          "Parfum beraroma kayu yang hangat dan sensual, memberikan kesan maskulin.",
      price: 750.000,
      imageUrl:
          "https://i.pinimg.com/564x/60/a1/b9/60a1b957f738b4eacc180c7d4e98024a.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Parfum Shop'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 243, 117, 0)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.network(
                        product.imageUrl,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\Rp${product.price.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 16,
                                color: const Color.fromARGB(255, 243, 117, 0)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
