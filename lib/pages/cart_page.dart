import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart'; 
class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return ListView.builder(
            padding: EdgeInsets.all(16.0),
            itemCount: cartProvider.cartItems.length,
            itemBuilder: (context, index) {
              final item = cartProvider.cartItems[index];
              return _cartItem(item.name, item.price, item.imageUrl);
            },
          );
        },
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          _showProceedToPaymentPopup(context); 
        },
        child: Text('Proceed to Payment'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget _cartItem(String name, String price, String imageUrl) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          price,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: () {
          },
        ),
      ),
    );
  }

  void _showProceedToPaymentPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Proceed to Payment"),
          content: Text("Are you sure you want to proceed to the payment page?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  
                Navigator.pushNamed(context, '/payment');  
              },
              child: Text("Proceed"),
            ),
          ],
        );
      },
    );
  }
}
