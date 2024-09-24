import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Account', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/user.webp'), 
            ),
            SizedBox(height: 10),
            Text(
              'Gowtham', 
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepOrange),
            ),
            Text(
              'gg@example.com',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 0, 0, 0)),
            ),
            SizedBox(height: 30),

            _buildAccountOption('Order History', Icons.history, () {
            }),
            SizedBox(height: 10),
            _buildAccountOption('Payment Methods', Icons.payment, () {
              Navigator.pushNamed(context, '/payment');
            }),
            SizedBox(height: 10),
            _buildAccountOption('Settings', Icons.settings, () {
            }),

            Spacer(),
            ElevatedButton(
              onPressed: () {
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountOption(String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: Colors.deepOrange,),
            SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
