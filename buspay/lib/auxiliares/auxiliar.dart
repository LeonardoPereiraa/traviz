import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          title: Text("BusPay"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  'images/buspay.jpeg',
                  fit: BoxFit.fitWidth,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.00, 0.00, 20.00, 0.00),
                  child:
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.00, 0.00, 20.00, 0.00),
                  child:
                  TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.00, 0.00, 20.00, 0.00),
                  child:

                  RaisedButton(
                    onPressed: () {},
                    child: Text("Entrar"),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                  ),

                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.00, 0.00, 20.00, 0.00),
                  child:

                  RaisedButton(
                    onPressed: () {},
                    child: Text("Registrar"),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                  ),

                ),
              ],
            )
        )
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar:AppBar(
            title: Text("BusPay"),
            centerTitle: true,
            backgroundColor: Colors.blueAccent,
          ),
          backgroundColor: Colors.white,
          bottomNavigationBar: TabBar(
            tabs: <Widget>[
              Tab (
                text: "Perfil",
                icon: Icon(Icons.person_outline),
              ),
              Tab (
                text: "Financeiro",
                icon: Icon(Icons.monetization_on),
              ),
              Tab (
                text: "Pagar",
                icon: Icon(Icons.code),
              )
            ],
            labelColor: Colors.blueAccent,
            unselectedLabelColor: Colors.blueAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.blueAccent,
          ),

        ));
  }
}
