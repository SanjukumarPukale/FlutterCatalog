import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/login_image.png', 
            fit: BoxFit.cover,
             ),
             SizedBox(          
               height: 20,         // It will give some space between image and text in vertical
             ),
             Text('Welcome', style: TextStyle(
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),
            ),
            SizedBox(
               height: 20,
             ),
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
               child: Column(
                 children: [
                   TextFormField(
                 decoration: InputDecoration(
                   hintText: 'Enter user name',
                   labelText: 'User name'
                 ),
               ),
               TextFormField(
                 obscureText: true,
                 decoration: InputDecoration(
                   hintText: 'Enter password',
                   labelText: 'Password'
                 ),
               ),
               SizedBox(
               height: 40,
             ),
            
             ElevatedButton(
               onPressed: (){
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
               }, 
               child: Text('Login'),
               style: TextButton.styleFrom(
                 minimumSize: Size(150, 40),
               ),
               ),
                 ],
               ),
             )
          ],
        ),
      )
    );
  }
}