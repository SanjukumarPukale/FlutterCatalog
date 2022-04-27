import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              'Catalog App'.text.xl5.bold.color(MyTheme.lightBluishColor).make(),              // This is similar to Text('Catalog App')
              'Trending products'.text.xl2.make(),
            ],
          );
  }
}