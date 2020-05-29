import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop/providers/orders.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderItem order;

  OrderItemWidget(this.order);

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('R\$ ${widget.order.total.toStringAsFixed(2)}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy hh:mm').format(
                widget.order.date,
              ),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: (widget.order.products.length * 25.0) + 10,
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              child: ListView(
                children: widget.order.products.map((product) {
                  return Row(
                    children: <Widget>[
                      Text(
                        product.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${product.quantity}x R\$ ${product.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  );
                }).toList(),
              ),
            )
        ],
      ),
    );
  }
}
