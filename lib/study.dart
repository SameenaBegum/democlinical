import 'package:audioplayers/audioplayers.dart';
import 'package:demo_login/sign.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:video_player/video_player.dart';

class study extends StatefulWidget {
  const study({super.key});

  @override
  State<study> createState() => _studyState();
}

class _studyState extends State<study> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  AudioPlayer audioPlayer = AudioPlayer();
  var audio = AudioPlayer();

  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/Butterfly.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Study details'),
        ),
        body: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Container(
              height: 450,
              width: 400,
              color: Colors.grey,
              child: Column(
                children: [
                  Image.asset('assets/c1.jpg', height: 50, width: 50),
                  Text(
                    'welcome',
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          VideoPlayer(_controller),
                          // _ControlsOverlay(controller: _controller),
                          VideoProgressIndicator(_controller,
                              allowScrubbing: true),
                          IconButton(
                              icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white),
                              onPressed: () {
                                setState(() {
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    _controller.play();
                                  }
                                });
                              }),
                        ],
                      ),
                    ),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      height: 50,
                      child: IconButton(
                          icon: Icon(Icons.play_arrow),
                          onPressed: () {
                            audio.play(AssetSource('audio.wav'));
                          }),
                    ),
                    IconButton(
                        icon: Icon(Icons.pause),
                        onPressed: () {
                          audio.pause();
                        }),
                    IconButton(
                        icon: Icon(Icons.stop),
                        onPressed: () {
                          audio.stop();
                        }),
                  ]),
                  Expanded(
                    child: SfPdfViewer.network(
                        'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                        key: _pdfViewerKey,
                      ),
                  ),
                  
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,

          // ),
          // Container(
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          //     child: Text('Comment'),
          //     onPressed: () {

          //     },
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          //  Padding(
          //    padding: const EdgeInsets.only(right: 250),
          //    child: Text('Q&A',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          //  ),
          // Container(
          //   height: 30,
          //   width: 300,
          //   color: Colors.grey,
          //   child: DropdownButton<String>(
          //  items: <String>['Yes','No'].map((String value) {
          //  return DropdownMenuItem<String>(
          //  value: value,
          //  child: Text(value),
          //   );
          //     }).toList(),
          //   onChanged: (_) {},
          //    )
          //    ),
          //  SizedBox(
          //   height: 10,
          //  ),
          //  Container(
          //   height: 30,
          //   width: 300,
          //   color: Colors.grey,
          //   child: TextField(
          //     obscureText: false,
          //     decoration: InputDecoration(
          //       hintText:'Yes or No',
          //       ),
          //       ),
          //  ),
          //  SizedBox(
          //   height: 10,
          //  ),
          //  Container(
          //   height: 30,
          //   width: 300,
          //   color: Colors.grey,
          //   child: TextField(
          //     obscureText: false,
          //     decoration: InputDecoration(
          //       hintText:'Yes or No',
          //       ),
          //       ),
          //  ),
          //  SizedBox(
          //   height: 10,
          //  ),

          //    Container(
          //   height: 30,
          //   width: 300,
          //   color: Colors.grey,
          //   child: DropdownButton<String>(
          //  items: <String>['Yes','No'].map((String value) {
          //  return DropdownMenuItem<String>(
          //  value: value,
          //  child: Text(value),
          //   );
          //     }).toList(),
          //   onChanged: (_) {},
          //    )
          //    ),
          //  Container(
          //  child: ElevatedButton(
          //    style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
          //     child: Text('Signed'),

          //     onPressed: () {
          //       Navigator.push(context,MaterialPageRoute(builder: (context) => signedpage(),));
          //     },)
          //  )
        ]),
      ),
    );
  }
}

class _ButterFlyAssetVideo {}
