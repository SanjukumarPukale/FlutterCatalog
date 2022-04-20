import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = 'https://qph.fs.quoracdn.net/main-thumb-761464374-200-brwgqejoertnowdrihlqosaalgoimptt.jpeg';
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: Colors.deepPurple),
                accountName: Text('Sanjukumar'), 
                accountEmail: Text('sanjukumar@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                )
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                ),
                title: Text('Home',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),),
              
            ),

            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                ),
                title: Text('Profile',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),),
              
            )
          ], 
        ),
      ),
    );
  }
} 