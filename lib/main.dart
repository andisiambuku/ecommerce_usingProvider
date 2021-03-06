import 'package:ecommerce_app/productlistview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/cartview.dart';
import 'models/cart.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create:(context) => Cart(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ) ;
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                   Icons.shopping_cart_rounded,
                   color: Colors.white,
                   ),
                  onPressed:(){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder:(context)=> CartView()));
                  }, 
                  ),
                  Text(cart.count.toString())
              ],
            ), )
        ],
        centerTitle: true,
      ),
      body: Center(child: ProductListView())
    );
  }
}
