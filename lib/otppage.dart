import 'package:demo_login/home.dart';
import 'package:flutter/material.dart';

class otppage extends StatefulWidget {
  const otppage({super.key});

  @override
  State<otppage> createState() => _otppageState();
}

class _otppageState extends State<otppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Registration  Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
      
            Padding(
              padding: const EdgeInsets.only(top: 200,left: 40,right: 40),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                prefixIcon: Icon(Icons.pending),
                  border: OutlineInputBorder(),
                  hintText: 'Enter OTP',
                  filled: true
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            
          Container(
            child: SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                child: Text('Register'),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>home(),));
                },
                
               
              ),
            ),
          )   
    

      ]),
    );
  }
}
