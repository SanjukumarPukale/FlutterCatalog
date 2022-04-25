import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double version = 2.104;

  final String name = 'Flutter';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     loadData();
  }

  loadData() async{
   await Future.delayed(Duration(seconds: 2));
   final catalogJson = await rootBundle.loadString('assets/files/catalog.json');
   final decodedData = jsonDecode(catalogJson);                                      // convereted to map from String format
   var productsData = decodedData['products'];
   CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList(); 
   setState(() {
     
   });
                                     
  }


  @override
  Widget build(BuildContext context) {
  //  final dummyList = List.generate(20, (index) => CatalogModel.items[0]); 
    return Scaffold(
      appBar: AppBar( 
        title: Text('Catalog App', style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty) ? ListView.builder(          //if catalogMo del.items is null then CircularProgressIndicator executes, otherwise ListView.builder() will execute. here we are using conditional statement.
          itemCount: CatalogModel.items?.length,
          itemBuilder: (context,index){
            return ItemWidget(
              item: CatalogModel.items![index], 
              );
            }
          )
          :Center(child: CircularProgressIndicator(),                    //It will show progress indicator until page will be fully loaded. means untill CatalogModel.items become nonNull value.
        ),
      ),
      drawer: MyDrawer(),
    );
  }
} 