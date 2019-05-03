import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager({ this.startingProduct = 'Sweets tester'});

  @override
  State<StatefulWidget> createState() {
    return _ProdductManagerState();
  }
}

class _ProdductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    super.initState();
    _products.add(widget.startingProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                _products.add('New food');
              });
            },
            child: Text('Add product'),
          ),
        ),
        Products(),
      ],
    );
  }
}
