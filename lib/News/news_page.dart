import 'package:flutter/material.dart';

import 'news_api.dart';

class CryptoNewsScreen extends StatefulWidget {
  final String apiKey;

  const CryptoNewsScreen({required this.apiKey});

  @override
  _CryptoNewsScreenState createState() => _CryptoNewsScreenState();
}

class _CryptoNewsScreenState extends State<CryptoNewsScreen> {
  late Future<List<dynamic>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = getCryptoNews(widget.apiKey);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cryptocurrency News'),
      ),
      body: FutureBuilder(
        future: _newsFuture,
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var article = snapshot.data![index];
                return ListTile(
                  leading: Image.network(
                    article['urlToImage'] ?? '',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  title: Text(article['title']),
                  subtitle: Text(article['description']),
                  onTap: () {
                    // Handle article tap
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}