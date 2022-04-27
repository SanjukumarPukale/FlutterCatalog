import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_wigets/catalog_header.dart';
import '../widgets/home_wigets/catalog_list.dart';

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
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.lightBluishColor,
        child: Icon(CupertinoIcons.cart, color: Colors.white,),                           //adding of cart icon
        ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),       
              if(CatalogModel.items != null && CatalogModel.items!.isNotEmpty)    
               CatalogList().py16().expand()
              else
               CircularProgressIndicator().centered().py16().expand(),
            ],
          ),
        ),
      )
    );
  }
} 









