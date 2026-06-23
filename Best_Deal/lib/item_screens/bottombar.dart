import 'package:e_commerce_aap/feature/home/home_screen.dart';
import 'package:e_commerce_aap/feature/profile/profile_screen.dart';
import 'package:e_commerce_aap/item_screens/browase_screen.dart';
import 'package:e_commerce_aap/item_screens/wishlist_screen.dart';
import 'package:flutter/material.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  final List<Widget> _screens = [
    HomeScreen(),
    BrowaseScreen(),
    WishlistScreen(),
    // CartScreen(),
    ProfileScreen(),
  ];
  int _navigationindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _navigationindex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 14, 22, 72),
        unselectedItemColor: Colors.grey.shade400,
        currentIndex: _navigationindex,
        onTap: (index) {
          setState(() {
            _navigationindex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Browse'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
