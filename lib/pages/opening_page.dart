import 'package:flutter/material.dart';

class OpeningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 6), () {
      Navigator.pushReplacementNamed(context, '/login');
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/images/chick.jpg'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Welcome to Biryani Delivery!',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            SizedBox(height: 10.0),
            Text('Your favorite biryani is just a click away!', style: TextStyle(fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}
