import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);
  final double version = 2.104;
  final String name = 'Flutter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Catalog App', style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Container(
          child: Text('welcome to $name version $version'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}