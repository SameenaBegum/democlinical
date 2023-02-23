import 'package:flutter/material.dart';

class signedpage extends StatefulWidget {
  const signedpage({super.key});

  @override
  State<signedpage> createState() => _signedpageState();
}

class _signedpageState extends State<signedpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signed page'),
      ),

    );
  }
}