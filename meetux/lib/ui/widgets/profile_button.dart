import 'package:flutter/material.dart';
import 'package:meetux/ui/screens/profile.dart';

class ProfileButton extends StatelessWidget {

  final String profilePic;
  final String title;


  ProfileButton(this.profilePic, this.title);


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      textColor: const Color(0xFF807a6b),
      padding: EdgeInsets.all(20.0),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      },
      child: Row(
        children: <Widget>[
          Image.network(
            '$profilePic'
          ),
          SizedBox(width: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(this.title),
              SizedBox(height: 5.0),
            ],
          ),
        ],
      ),
    );
  }
}