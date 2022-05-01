import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/home_wigets/add_to_cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class HomeDeatilPage extends StatelessWidget {
  final Item catalog;

  const HomeDeatilPage({Key? key,required this.catalog}) : assert(catalog != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                   '\$${catalog.price}'.text.bold.xl4.red800.make(),
                   AddToCart(
                     catalog: catalog,
                     ).wh(120, 50),
                  ],
                 ).p16(),
      ),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)
                ).h32(context),
                Expanded(
                  child: VxArc(
                    height: 30.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            catalog.name.text.xl4.color(MyTheme.lightBluishColor).bold.make(),
                            catalog.desc.text.textStyle(context.captionStyle!).xl.make(),
                            10.heightBox, 
                            'Kasd ea sea ut est amet vero amet duo sit amet. Dolores rebum et takimata ipsum, lorem clita stet lorem dolore clita vero lorem diam. Tempor accusam no et ut no dolores lorem ea justo. Kasd dolore invidunt et sadipscing, amet consetetur ipsum sed rebum amet et et. At et.'
                            .text.make().p16()
                        
                          ],
                        ).py64(),
                      )
                                  ),
                  ))
            ]
          ),
        )
    );
  }
}