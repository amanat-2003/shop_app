import 'package:flutter/material.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String ImageUrl;
  final double price;

  const ProductItem({
    this.id,
    this.title,
    this.ImageUrl,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => ProductDetailScreen(title),
            ));
          },
          child: GridTile(
            header: GridTileBar(
              backgroundColor: Colors.black26,
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
            ),
            child: Image.network(
              ImageUrl,
              fit: BoxFit.cover,
            ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
                color: Theme.of(context).accentColor,
              ),
              subtitle: Text(price.toString()),
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
