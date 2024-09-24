import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'pages/opening_page.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/cart_page.dart';
import 'pages/payment_page.dart';
import 'pages/account_page.dart';
import 'pages/cart_provider.dart'; 

void main() => runApp(FoodDeliveryApp());

class FoodDeliveryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Biryani Delivery App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.orange,
            secondary: Colors.orangeAccent,
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => OpeningPage(),
          '/login': (context) => LoginPage(),
          '/home': (context) => MainPage(),
          '/payment': (context) => PaymentPage(),  
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Payment'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0: return HomePage();
      case 1: return CartPage();
      case 2: return PaymentPage();  
      case 3: return AccountPage();
      default: return HomePage();
    }
  }
}
