import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
//import 'package:minor/Authorization/login.dart';
import '../Pages/home_page.dart';
import '../Pages/news_page.dart';
import '../Pages/watch_list.dart';

class HoverPage extends StatefulWidget {
  const HoverPage({Key? key}) : super(key: key);

  @override
  State<HoverPage> createState() => _HoverPageState();
}

class _HoverPageState extends State<HoverPage> {
  int _selectedIndex=0;
  @override
  Widget build(BuildContext context) {

    Widget navigator() {
      return Container(
        //Container(
        color: const Color(0xFF0D47A1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: const Color(0xFF0D47A1),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.black,
            gap: 8,
            //onTabChange: ,
            padding: const EdgeInsets.all(16),


            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Wishlist',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.newspaper,
                text: 'News',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      );
    }

    Widget body() {
      switch (_selectedIndex) {
        case 0:
          return HomePage();
        case 1:
          return WatchList();
        case 3:
          return NewsPage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      //backgroundColor: Colors.white,
      body : body(),
      bottomNavigationBar: navigator(),
    );
  }
}

