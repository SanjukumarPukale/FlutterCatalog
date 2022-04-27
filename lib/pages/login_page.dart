import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';                           // It is used for ex: at login page it should show Welcome Sanju;  if we enter user name as Sanju
  bool changeButton = false;                  // It is used for animation of buttond
  
  //Steps to create form validation

  //1. Create a Form with a GlobalKey
  //2. Add a TextFormField with validation logic
  // 3. Create a button to validate and submit the form

  //  1. Create a Form with a GlobalKey
  final _formKey = GlobalKey<FormState>(); //It is used for form validation,

  //3. Create a button to validate and submit the form
  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()){
    setState(() {
      changeButton = true;
    });

    await Future.delayed(Duration(seconds: 1));     // It will wait for one second
    await Navigator.pushNamed(context,MyRoutes.homeRoute);                            // After this will execute, it will navigate to home page

    setState(() {
      changeButton = false;                         // This will do false means that login button reatain its size and shape as earlies
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(
              'assets/images/login_image.png',
              fit: BoxFit.cover,
            ),
            SizedBox(
              height:
                  20, // It will give some space between image and text in vertical
            ),
            Text(
              'Welcome $name',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter user name',
                      labelText: 'User name',
                    ),

//2. Add a TextFormField with validation logic
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'User name should not be empty';
                      }
                      return null;
                    },

                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Enter password', labelText: 'Password'
                        ),

                     validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password shouldnot be empty';
                      }
                      else if(value.length < 8){
                        return 'Password length should be atleast 8';
                      }
                      return null;
                    },


                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Material(
                    color: MyTheme.lightBluishColor,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changeButton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
