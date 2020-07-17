import 'package:flutter/material.dart';
import 'package:fluttersection812shopapp/screens/edit_product_screen.dart';
import 'package:fluttersection812shopapp/widgets/app_drawer.dart';
import 'package:fluttersection812shopapp/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-product';

  Future<void> _refrechProducts(BuildContext context) async {
    await Provider.of<ProductProvider>(context, listen: false)
        .fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes produits'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refrechProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (_, i) => UserProductItem(productData.items[i].title,
                productData.items[i].imageUrl, productData.items[i].id),
            itemCount: productData.items.length,
          ),
        ),
      ),
    );
  }
}
