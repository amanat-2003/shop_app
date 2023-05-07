import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';
import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem({
    this.id,
    this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: ((context) => AlertDialog(
                        title: Text('Are you sure?'),
                        content: Text(
                            'Do you want to delete your product permanently?'),
                        actions: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.close,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              try {
                                Navigator.of(context).pop();
                                await Provider.of<Products>(context,
                                        listen: false)
                                    .deleteProduct(id);
                              } catch (error) {
                                scaffold.showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Deleting Failed! ${error.toString()}',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }
                            },
                            icon: Icon(
                              Icons.check,
                              color: Theme.of(context).errorColor,
                            ),
                          ),
                        ],
                      )),
                );
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
