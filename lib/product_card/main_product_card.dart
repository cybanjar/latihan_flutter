import 'package:flutter/material.dart';
import 'product_card.dart';
import 'package:provider/provider.dart';

class MainProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: firstColor,
        title: Text("Product Card"),
      ),
      body: ChangeNotifierProvider<ProductState>(
        create: (context) => ProductState(),
        child: Container(
          margin: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.topCenter,
            child: Consumer<ProductState>(
              builder: (context, productState, _) => ProductCard(
                imageURL:
                    "https://cdn-prod.medicalnewstoday.com/content/images/articles/308/308796/mixed-fruits.jpg",
                name: "Buah-buahan Mix 1 Kg",
                price: "Rp. 25.000",
                quantity: productState.quantity,
                notification: (productState.quantity > 5) ? "Diskon 10%" : null,
                onAddCartTap: () {},
                onIncTap: () {
                  productState.quantity++;
                },
                onDecTap: () {
                  productState.quantity--;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState {}

class ProductSate with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;
  set quantity(int newValue) {
    _quantity = newValue;
    notifyListeners();
  }
}
