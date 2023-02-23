import 'package:demo_login/home.dart';
import 'package:demo_login/otppage.dart';
import 'package:flutter/material.dart';

 class resetpage extends StatefulWidget {
  const resetpage({super.key});

  @override
  State<resetpage> createState() => _resetpageState();
}

class _resetpageState extends State<resetpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      
      appBar: AppBar(
        centerTitle: true,
      backgroundColor: Colors.blueAccent 
      ),
     // mainAxisAlignment:MainAxisAlignment.center
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_rounded),
                border: OutlineInputBorder(),
              hintText: 'Reset Password', 
              filled: true
             
              ),
          
            ),
          ),
      Padding(
        padding: EdgeInsets.all(20),
        child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
           prefixIcon: Icon(Icons.lock_open),
           border: OutlineInputBorder(),
           hintText: 'confirm password ',
           filled: true
          ),
        ),
      ),
        
        Container(
          child: SizedBox(
            width: 150,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
              child: Text('confirm'),
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => otppage(),));
              },
            ),
          ),
        )
      
        ],
      ),
      
    );
  }
}