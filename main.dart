import 'dart:async';
import 'package:flutter/material.dart';
import './web_view_container.dart';

import 'dart:typed_data';
import '';

void main() {
  runApp(MaterialApp(
    title: 'Flutter',
    home: FirstScreen(),
  ));

}



class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('iRANG'), backgroundColor: Colors.blue,),
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/logo.jpeg',
                width: 640.0,
                height: 360.0,
              ),
            Center(
                child: RaisedButton(
                  child: const Text(
                    'Keep Them Safe',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: () {
                    _navigateToSecondScreen(context);
                  },
                )
            )
            ]
          )
      ),
    );
  }

  void _navigateToSecondScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('iRANG'),backgroundColor: Colors.blue,),
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
          children: <Widget>[
            Center(
              child: RaisedButton(
                child: const Text(
                  'View Main Door',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  _navigateThirdScreen(context);
                },
              ),
            ),
            Center(
              child: RaisedButton(
                child: const Text(
                  'Gallery',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () { _navigateGalleryScreen(context);},
              ),
            )
          ],
        )
    );
  }

  void _goBackToFirstScreen(BuildContext context) {
    Navigator.pop(context);
  }
}

void _navigateThirdScreen(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ThirdScreen(),
      ));
}

void _navigateGalleryScreen(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Gallery(),
      ));
}

class ThirdScreen extends StatefulWidget{
  @override
  _ThirdScreen createState() => _ThirdScreen();

}

class _ThirdScreen extends State<ThirdScreen>{
  static final links = ['https://6c91bc42.ngrok.io'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('iRANG'),backgroundColor: Colors.blue,),
        backgroundColor: Colors.lightBlueAccent,
        key: Key('123'),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: links.map((link) => _urlButton(context, link)).toList(),
                ))));
  }

  Widget _urlButton(BuildContext context, String url) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: FlatButton(
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
          child: Text('View Camera'),
          onPressed: () => _handleURLButtonPress(context, url),
        )
    );

  }


  void _handleURLButtonPress(BuildContext context, String url) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WebViewContainer(url)));
  }

  void _goBackToFirstScreen(BuildContext context) {
    Navigator.pop(context);
  }

  }

//  void _index(int k){
//    if (k == 0){ _createCameraImage(); }
//  }
//
//
//  void _createCameraImage() async {
//    Uint8List file = await _videoViewController.makeSnapshot();
//    setState(() {
//      image = file;
//    });
//
//  }
    void _goBackToFirstScreen(BuildContext context) {
      Navigator.pop(context);}



class Gallery extends StatefulWidget{
  @override
  _Gallery createState() => _Gallery();

}
class _Gallery extends State<Gallery>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('iRANG'),backgroundColor: Colors.blue,),
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/ss.jpg',
                width: 200.0,
                height: 200.0,
              ),

            ],
          ),
      ),
    );
  }
  void _goBackToFirstScreen(BuildContext context) {
    Navigator.pop(context);}
}
