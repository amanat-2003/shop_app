import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/app_drawer.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = "/orders";

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  Future _ordersFuture;

  Future _obtainOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtainOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Building Orders');
    // final ordersData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Orders!"),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: _ordersFuture,
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapshot.error != null) {
              // Do error handling
              return Center(
                child: Text('An error occured!'),
              );
            } else {
              // return ListView.builder(
              //   itemCount: ordersData.orderCount,
              //   itemBuilder: (ctx, i) => OrderItem(ordersData.orders[i]),
              // );
              return Consumer<Orders>(
                builder: (ctx, ordersData, chi) => ListView.builder(
                  itemCount: ordersData.orderCount,
                  itemBuilder: (ctx, i) => OrderItem(ordersData.orders[i]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
