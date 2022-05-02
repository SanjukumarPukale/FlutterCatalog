import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: 'Cart'.text.xl4.bold.color(context.accentColor).make(),
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}


class _CartTotal extends StatelessWidget {
  const _CartTotal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200, 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // ignore: deprecated_member_use
          VxConsumer(                                           // VxConsumer is same as VxBuilder and VxNotifier we can also use these but some changes is there in these three
           
           builder: (context, store, status) {
             // ignore: deprecated_member_use
             return '\$${_cart.totalPrice}'.text.xl5.color(context.theme.accentColor).make();
           },
           mutations: {RemoveMutaion},
           notifications: {},
           ), 
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(             // This will show the message when clicked on Buy Button
                content: 'Buying not supported yet'.text.make()));          
            }, 
            style: ButtonStyle(
              // ignore: deprecated_member_use
              backgroundColor: MaterialStateProperty.all(context.theme.buttonColor)
            ),
            child: 'Buy'.text.make(),
            ).w32(context),
        ]),
    );
  }
}

class _CartList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutaion]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty ? 'Nothing to show'.text.xl3.makeCentered() : ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context,index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () =>
            RemoveMutaion(_cart.items[index]),
            // setState(() {});
          ),
        title: _cart.items[index].name.text.make(),
      )
      );
  }
}