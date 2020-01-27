import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'file_utils.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // variavel de checkbox	
  bool valeuCheckbox =  false;
  String teste="" ;
   
  //Declaração dos Controllers
  TextEditingController loginController ;
  TextEditingController passController = TextEditingController();
  String _infoText = "";
  String username = "";

  //Key usado para Validação do formulário
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //Conexao a nossa API
  Future<List> _login() async {
			if(valeuCheckbox){
				
				FileUtils().writeCounter(loginController.text);
			}
    //url de teste, retornando um json
    //login: jorge
    //senha:123
    final response = await http.post(
      "https://jtstief.000webhostapp.com/login_app.php",
      body: {
        "username": loginController.text,
        "userpass": passController.text,
      },
    );

    _infoText = "";
    //Variavel de retorno do Json
    setState(() {
      var datauser = json.decode(response.body);
      if (datauser == false) {
        _infoText = "Falha ao Logar";
      } else {
        if (datauser['level'] == 'Admin') {
			if(valeuCheckbox){
				
				FileUtils().writeCounter(loginController.text);
			}
          username= datauser['level'];
          Navigator.pushReplacementNamed(context, '/Admin' );
           
      
          //Navigator.of(context).pushNamed('/Admin');
        }
      }
    });
  }
  


  void initState(){
	FileUtils().readCounter().then((value){
		setState((){
			teste=value;
			loginController=TextEditingController(text: value);	
		});	
		
	});

  }

  void _resetFields() {
    loginController.text = "";
    passController.text = "";
    setState(() {
      _infoText = "";
    });
  }

 bool onChanged(bool value){
     setState((){
        valeuCheckbox = !value;
	
     });	
    return null ;
 }

  @override
  Widget build(BuildContext context) {  
    
    
  
    
    	
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.directions_bus,
                    size: 100.0,
                    color: Colors.lightBlue,
                  ),
                  Text(
                    "Bus Pay",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold),
                  ),

                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.lightBlue),
                        labelText: "Login",
                        labelStyle: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
                      controller: loginController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira seu Login";
                        }
                      }),
                  Divider(),
                  TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.vpn_key, color: Colors.lightBlue),
                        labelText: "Senha",
                        labelStyle: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
                      controller: passController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Insira sua senha";
                        }
                      }),
		Row(children: <Widget>[
			Checkbox(value: valeuCheckbox , onChanged: (bool value){onChanged(valeuCheckbox);}),
				Text("salvar login")
                    ]),
                  
	
                  Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Container(
                          height: 50.0,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _login();

                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            color: Colors.lightBlue,
                          ))),
                  Text(
                    _infoText,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.lightBlue, fontSize: 25.0),
                  ),
                ],
              ))),
    );
  }
}
