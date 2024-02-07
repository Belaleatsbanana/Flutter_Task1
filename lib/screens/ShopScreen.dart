import 'package:flutter/material.dart';
import 'package:tasky1/data/DataSource.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => ShopScreenState();
}

class ShopScreenState extends State<ShopScreen> {

  late DataSource dataSource;

  @override
  void initState() {
    super.initState();
    dataSource = DataSource();
    DataSource.getProductsFromApi().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
        child: DataSource.listOfProduct.isEmpty
            ? const Center(child: CircularProgressIndicator()) // Show loading indicator while data is being fetched
          : DataSource.buildProductGridView(context),
      ),

    );
  }
}
