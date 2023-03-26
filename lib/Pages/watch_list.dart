import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WatchListPage extends StatelessWidget {
  const WatchListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

/*class WishlistPage extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  final wishlistCollection = firestoreInstance.collection('users').doc(user).collection('wishlist');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestoreInstance
          .collection('users')
          .doc(user.email!)
          .collection('wishlist')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        final wishlistItems = snapshot.data.docs.map((doc) => doc.data()).toList();

        return ListView.builder(
          itemCount: wishlistItems.length,
          itemBuilder: (context, index) {
            final item = wishlistItems[index];
            return ListTile(
              title: Text(item['name']),
              subtitle: Text(item['description']),
              trailing: Text('\$${item['price'].toStringAsFixed(2)}'),
            );
          },
        );
      },
    );
  }*/