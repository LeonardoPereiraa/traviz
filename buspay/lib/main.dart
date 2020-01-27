import 'package:flutter/material.dart';
import 'package:buspay/login.dart';
import 'package:buspay/admin.dart';
import 'file_utils.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    int b= 5;
    print(b);
    int p = 0;	
	
    
    
    	
    
  
    		
    return MaterialApp(
      title: 'BusPay',
      theme: ThemeData( 
        dividerColor: Colors.grey[500],
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Login(),
      routes: <String,WidgetBuilder>{
        '/Login': (BuildContext context) => new Login(),
        '/Admin': (BuildContext context) => new Admin(),
      },
    );
  }
}

