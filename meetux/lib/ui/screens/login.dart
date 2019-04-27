import 'package:flutter/material.dart';

import 'package:meetux/ui/widgets/google_sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Private methods within build method help us to
    // organize our code and recognize structure of widget
    // that we're building:
    Text _buildText() {
      return Text(
        'Meetux',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,
      );
    }

    BoxDecoration _buildBackground() {
      return BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/imageBlur.jpg"),
          fit: BoxFit.cover,
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Container(
        decoration: _buildBackground(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildText(),
              // Space between "Recipes" and the button:
              SizedBox(height: 50.0),
              GoogleSignInButton(
                onPressed: () => Navigator.of(context).pushReplacementNamed('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}