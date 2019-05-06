import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final addProduct;
ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              addProduct({
                'title': 'New product',
                'image': 'assets/food.jpg',
              });
            },
            child: Text('Add product'),
          );
  }
}