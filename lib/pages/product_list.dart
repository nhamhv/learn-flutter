import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/products.dart';
import './product_edit.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildEditbutton(
      BuildContext context, int index, ProductsModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return ProductEditPage();
        }));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        final products = model.products;
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(products[index].title),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.endToStart) {
                    model.selectProduct(index);
                    model.deleteProduct();
                  } else if (direction == DismissDirection.startToEnd) {
                    print('Swiped satrt to end');
                  } else {
                    print('Other');
                  }
                },
                background: Container(
                  color: Colors.red,
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(products[index].image),
                      ),
                      title: Text(products[index].title),
                      subtitle: Text('\$${products[index].price.toString()}'),
                      trailing: _buildEditbutton(context, index, model),
                    ),
                    Divider(),
                  ],
                ));
          },
          itemCount: products.length,
        );
      },
    );
  }
}
