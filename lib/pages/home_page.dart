import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_wigets/catalog_header.dart';
import '../widgets/home_wigets/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final url = 'https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     loadData();
  }

  loadData() async{
   await Future.delayed(Duration(seconds: 2));
   final catalogJson = await rootBundle.loadString('assets/files/catalog.json');

  //  final response = await http.get(Uri.parse(url));
  //  final catalogJson = response.body;

   final decodedData = jsonDecode(catalogJson);                                      // convereted to map from String format
   var productsData = decodedData['products'];
   CatalogModel.items = List?.from(productsData).map<Item>((item) => Item.fromMap(item)).toList(); 
   setState(() {
     
   });
                                     
  }


  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
  //  final dummyList = List.generate(20, (index) => CatalogModel.items[0]); 
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutaion, RemoveMutaion},
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: MyTheme.lightBluishColor,
          child: Icon(CupertinoIcons.cart, color: Colors.white,),                           //adding of cart icon
          ).badge(color: Vx.red500, size: 22, count: _cart.items.length, textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          )),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32, 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),       
              if(CatalogModel.items != null && CatalogModel.items.isNotEmpty)    
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









