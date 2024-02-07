import 'package:flutter/material.dart';
import 'package:tasky1/data/ProductDataModel.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductDataModel> products;

  const ProductGridView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            _showProduct(context, products[index]);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey.withOpacity(0.1),

            ),
            margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.network(
                    products[index].productImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 275,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        products[index].productName.length > 15
                        ?  '${products[index].productName.substring(0, 15)}...'
                        : products[index].productName,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                      const SizedBox(height: 8),
                       Text(
                        'Price : ${products[index].productPrice.toString()}',
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Rating : ${products[index].productRating.toString()}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Stock level : ${products[index].productStock.toString()}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
void _showProduct(BuildContext context, ProductDataModel pdm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Product Overview',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
          ),
        ),
        content: Column(

          children: [
            const SizedBox(height: 30.0,),
            Text(
                pdm.productName,
                style: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ) ,
            ),
            const SizedBox(height: 20.0,),
            Image.network(pdm.productImage),
            const SizedBox(height: 20.0,),
            Text(
              'Price : ${pdm.productPrice.toString()}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
              Text(
                'Rating : ${pdm.productRating.toString()}',
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Stock level : ${pdm.productStock.toString()}',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

            const SizedBox(height: 20.0,),
            Text(
                pdm.productDesc,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close'),
          ),
        ],
      );
    },
  );
}
