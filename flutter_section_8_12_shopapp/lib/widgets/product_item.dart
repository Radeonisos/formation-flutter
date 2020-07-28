import 'package:flutter/material.dart';
import 'package:fluttersection812shopapp/providers/auth.dart';
import 'package:fluttersection812shopapp/providers/cart.dart';
import 'package:fluttersection812shopapp/providers/product.dart';
import 'package:provider/provider.dart';

import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);

    final cart = Provider.of<Cart>(context, listen: false);

    final authData = Provider.of<Auth>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetailsScreen.routeName,
                  arguments: productData.id);
            },
            child: Hero(
              tag: productData.id,
              child: FadeInImage(
                placeholder:
                    AssetImage('assets/images/product-placeholder.png'),
                image: NetworkImage(productData.imageUrl),
                fit: BoxFit.cover,
              ),
            )),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
              builder: (ctx, product, _) => IconButton(
                    icon: Icon(product.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border),
                    onPressed: () {
                      product.toogleFavoriteStatus(
                          authData.token, authData.userId);
                    },
                    color: Theme.of(context).accentColor,
                  )),
          title: Text(
            productData.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(
                  productData.id, productData.title, productData.price);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Produit ajouté au panier',
                ),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  label: 'Annuler',
                  onPressed: () {
                    cart.removeSingleItem(productData.id);
                  },
                ),
              ));
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
