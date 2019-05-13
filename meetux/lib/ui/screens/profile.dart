import 'package:flutter/material.dart';
import 'package:meetux/model/state.dart';

class ProfileScreen extends StatefulWidget{
 @override
 State<StatefulWidget> createState() => new ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  StateModel appState;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'),
      )
    );
  }
}