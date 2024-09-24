import 'package:flutter/material.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biriyani Menu'),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(16.0),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/chicken-biryani.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Delicious Biriyani, Hot and Fresh!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            _biryaniItem(context, 'Chicken Biriyani', '₹250', 'assets/images/chick.jpg'),
            _biryaniItem(context, 'Mutton Biriyani', '₹350', 'assets/images/Mutton.jpg'),
            _biryaniItem(context, 'Paneer Biriyani', '₹200', 'assets/images/paneer.jpg'),
            _biryaniItem(context, 'Egg Biriyani', '₹150', 'assets/images/paneer.jpg'),
          ],
        ),
      ),
    );
  }

  Widget _biryaniItem(BuildContext context, String name, String price, String imageUrl) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageUrl,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text(price, style: TextStyle(fontSize: 16, color: Colors.grey[700])),
        trailing: ElevatedButton(
          onPressed: () {
            Provider.of<CartProvider>(context, listen: false).addItem(CartItem(name, price, imageUrl));
          },
          child: Text('Add to Cart'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ),
    );
  }
}
