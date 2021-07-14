import 'package:ecommerce_app/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CartView extends StatefulWidget{
  @override
 _CartViewState createState() =>_CartViewState(); 
  
}

class _CartViewState extends State<CartView>{
    @override
    Widget build(BuildContext context) {
      var cart =Provider.of<Cart>(context);
      return Scaffold(
        appBar: AppBar(
          title: Text('Cart View[\${cart.totalPrice}]'),
        ),
        body: cart.cartItems.length == 0 
        ? Text('no items in your cart')
        : ListView.builder(
          itemCount: cart.cartItems.length,
          itemBuilder: (context,index){
            return Card(
              child: ListTile(
                title: Text(cart.cartItems[index].title),
                subtitle: Text(cart.cartItems[index].price.toString()),
               trailing: IconButton(
                 icon: Icon(Icons.delete),
                 onPressed: (){
                   cart.remove(cart.cartItems[index]);
                 },), 
              ),
            );
          }
          )
      );
    }
  }
