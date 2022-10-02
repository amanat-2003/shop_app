import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    print("Product item rebuilds");
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: GridTile(
            header: GridTileBar(
              backgroundColor: Colors.black26,
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
            ),
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: Consumer<Product>(
                builder: (ctx, product, ch) => TextButton.icon(onPressed: () {
                    product.toggleFavouriteStatus();
                  }, icon: Icon(product.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border),
                   label: ch),
                // IconButton(
                  // icon: Icon(product.isFavourite
                  //     ? Icons.favorite
                  //     : Icons.favorite_border),
                  // onPressed: () {
                  //   product.toggleFavouriteStatus();
                  // },
                //   color: Theme.of(context).accentColor,
                // ),
                child: Text("Not Rebuild!"),
              ),
              subtitle: Text(product.price.toString()),
              trailing: IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
