import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<NewsApp> {
  final String url =
      'https://newsapi.org/v2/everything?q=crypto&apiKey=59c3af56a19f4c44aa08fb485e45a355';
  late List<dynamic> articles;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  Future<void> getNews() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        articles = json.decode(response.body)['articles'];
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto News',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Crypto News'),
        ),
        body: articles == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: articles.length,
          itemBuilder: (BuildContext context, int index) {
            final article = articles[index];
            return GestureDetector(
              onTap: () {
                // TODO: Navigate to article details screen
              },
              child: Card(
                margin:
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                elevation: 3.0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        article['title'],
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        article['description'],
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            article['source']['name'],
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            article['publishedAt'].substring(0, 10),
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          article['urlToImage'],
                          height: 200.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

// import 'package:flutter/material.dart';
//
// import 'news_api.dart';
//
// class CryptoNewsScreen extends StatefulWidget {
//   final String apiKey;
//
//   const CryptoNewsScreen({required this.apiKey});
//
//   @override
//   _CryptoNewsScreenState createState() => _CryptoNewsScreenState();
// }
//
// class _CryptoNewsScreenState extends State<CryptoNewsScreen> {
//   late Future<List<dynamic>> _newsFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _newsFuture = getCryptoNews(widget.apiKey);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cryptocurrency News'),
//       ),
//       body: FutureBuilder(
//         future: _newsFuture,
//         builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
//           if (snapshot.hasData) {
//             return ListView.builder(
//               itemCount: snapshot.data!.length,
//               itemBuilder: (context, index) {
//                 var article = snapshot.data![index];
//                 return ListTile(
//                   leading: Image.network(
//                     article['urlToImage'] ?? '',
//                     width: 100,
//                     height: 100,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text(article['title']),
//                   subtitle: Text(article['description']),
//                   onTap: () {
//                     // Handle article tap
//                   },
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return Center(child: Text('${snapshot.error}'));
//           } else {
//             return Center(child: CircularProgressIndicator());
//           }
//         },
//       ),
//     );
//   }
// }
}