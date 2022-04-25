import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDeatilPage extends StatelessWidget {
  final Item catalog;

  const HomeDeatilPage({Key? key,required this.catalog}) : assert(catalog != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Image.network(catalog.image),
          ]),
    );
  }
}