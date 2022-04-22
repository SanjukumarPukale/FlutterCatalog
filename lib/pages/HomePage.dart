import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);
  final double version = 2.104;
  final String name = 'Flutter';
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar( 
        title: Text('Catalog App', style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context,index){
            return ItemWidget(
              item: dummyList[index], 
              );
          }
          ),
      ),
      drawer: MyDrawer(),
    );
  }
} 