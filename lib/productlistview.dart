import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/product.dart';
import 'models/cart.dart';

class ProductListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: _getProducts(),
      builder: (context,snapshot){
        if(snapshot.hasData){
          List? data = snapshot.data;
          return _productListView(data);
        } else if (snapshot.hasData){
          return Text("${snapshot.error}");
        } 
        return CircularProgressIndicator();
      },
      );
  }

  Future <List<Product>> _getProducts() async{
    final productURL = 'https://fakestoreapi.com/products';
    final response = await http.get(productURL);

  if(response.statusCode == 200){
    List jsonResponse = json.decode(response.body);
    return jsonResponse
            .map((product) => new Product.fromJson(product))
            .toList();
  }else{
    throw Exception('Failed to Load');
  }
  }
  ListView _productListView(data){
    return ListView.builder(
      itemCount:data.length,
      itemBuilder: (context,index){
        var cart = Provider.of<Cart>(context);
        return ListTile(
          title: Text(data[index].title),
          subtitle: Text(data[index].price.toString()),
          trailing: Icon(Icons.add),
          onTap:() {
            cart.add(data[index]);
          },
        );
      }
    );
  }
}