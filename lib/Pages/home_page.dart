
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],


      //theme rakhne ki na rakhne bhanera confused

      /*theme: ThemeData(
        // Define the default brightness and colors.
        /*brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),*/
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.green,
          ),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.purple)),
      ),*/
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Prophecy'),
        backgroundColor: Colors.blue[900],
        //theme: ThemeData(fontFamily: 'Bebas Neue Regular'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],

      ),
      bottomNavigationBar : Container(
        color: const Color(0xFF0D47A1),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 20),
          child: GNav(
            backgroundColor: Color(0xFF0D47A1),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.black,
            gap: 8,
            //onTabChange: ,
            padding: EdgeInsets.all(16),


            tabs: [
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
          ),
        ),
      ),
      /*bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.batch_prediction),
              label: 'Prediction',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
          ],
        ),*/
      body: Container(
        height: 800,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          //color: Color(0xFF81D4FA),
          borderRadius:BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration (
                  color: Colors.blue,
                ),
                child: Text(user.email!),
                ),
              ListTile(
                leading: const Icon(Icons.password),
                title: const Text('Change password'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete account'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Sign Out'),
                leading: const Icon(Icons.logout),
                onTap: () {
                  FirebaseAuth.instance.signOut();// Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          )
      ),
    );
  }
}
