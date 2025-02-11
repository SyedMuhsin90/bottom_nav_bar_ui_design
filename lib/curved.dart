import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Curved extends StatefulWidget {
  const Curved({super.key});

  @override
  State<Curved> createState() => _CurvedState();
}

class _CurvedState extends State<Curved> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.pinkAccent, // Prevents transparency issue
        color: Colors.white, // Navigation bar color
        buttonBackgroundColor: Colors.white, // Active button color
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.add, size: 30, color: Colors.black),
          Icon(Icons.shopping_basket_outlined, size: 30, color: Colors.black),
          Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.black),
          Icon(Icons.shop_2_outlined, size: 30, color: Colors.black),
          Icon(Icons.list, size: 30, color: Colors.black),
          Icon(Icons.compare_arrows, size: 30, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _page.toString(),
                // ignore: deprecated_member_use
                textScaleFactor: 10.0,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final CurvedNavigationBarState? navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState?.setPage(1);
                },
                child: const Text('Go To Page of index 1'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
