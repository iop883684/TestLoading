import 'package:flutter/material.dart';
import 'package:untitled2/HomeScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    print("RegisterScreen build");
    return Scaffold(
      appBar:  AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 20.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text('Register')),
      body: Column(
        children: [
          TextField(

          ),
          MaterialButton(
            color: Colors.indigo,
            child: Text("go to home"),
            onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context,) => HomeScreen(), fullscreenDialog: true));
              // setState(() {
              //
              // });
            },
          ),
          MaterialButton(
            color: Colors.indigo,
            child: Text("couter ++"),
            onPressed: (){
              Singleton.counter.value += 1;
            },
          ),
        ],
      ),
    );
  }
}
