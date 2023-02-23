import 'package:audioplayers/audioplayers.dart';
import 'package:demo_login/study.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

 @override
  void initState() {
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E Concern')
      ),
      body:
      
      GridView.count(
        crossAxisCount: 2,
        children: List.generate(50, (index) {
         
      return Center(
            child: InkWell(
                onTap: () {
                _pdfViewerKey.currentState?.openBookmarkView();
                 Navigator.push(context,MaterialPageRoute(builder: (context) => study(),
                 ),
                 );
                 },
                 
                child: Container(
                  height: 150,
                  width: 170,
                  color: Colors.orangeAccent,
                  child: Center(
                    child: Text(
                      'Item $index',
                      style: TextStyle(fontSize: 20),
                     
                      ),
                   ),
                ),
              ),
              
              
            );
            
          }),
          
        ),
        
        
      

      
//        SingleChildScrollView(
//          child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
            
//             Row(
//               children: [
//                 Padding(padding:EdgeInsets.only(left: 17)),
//                 Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.orangeAccent,
//                 ),
//                 SizedBox(
//                   width: 15.0,
//                 ),

//                  Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 15.0,
//             ),
       
//             Row(
//               children: [
//                 Padding(padding:EdgeInsets.only(left: 17)),
//                 Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.green,
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.orangeAccent,
//                 ),
//               ],
//             ),

//              SizedBox(
//               height: 15.0,
//             ),
       
//             Row(
//               children: [
//                 Padding(padding:EdgeInsets.only(left: 17)),
//                 Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.orangeAccent,
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),

//                  Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.green,
//                 ),
//               ],
//             ),

//              SizedBox(
//               height: 15.0,
//             ),

//             Row(
//               children: [
//                 Padding(padding:EdgeInsets.only(left: 17)),
//                 Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.green,
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),

//                 Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.orangeAccent,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 15.0,
//             ),

//             Row(
//               children: [
//                  Padding(padding:EdgeInsets.only(left: 17)),
//                 Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.green,
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.orangeAccent,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),

//             Container(
//               height: 150,
//               width: 170,
//               color: Colors.green,
//             ),
            
//            ],
//          ),
//        ), 
   );
  }
 }