import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wafirufahmi_portalberita/menu/detail.dart';

class MenuPage extends StatefulWidget {
  static String tag = 'menu-page';
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List _post = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Terbaru'),
      ),
      body: ListView.builder(
          itemCount: _post.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                color: Colors.grey[200],
                height: 100,
                width: 100,
                child: _post[index]['urlToImage'] != null
                    ? Image.network(
                        _post[index]['urlToImage'],
                        width: 100,
                        fit: BoxFit.cover,
                      )
                    : Center(),
              ),
              title: Text(
                '${_post[index]['title']}',
                maxLines: 2,
              ),
              subtitle: Text(
                '${_post[index]['description']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(
                      url: _post[index]['url'],
                      title: _post[index]['title'],
                      content: _post[index]['content'],
                      publishedAt: _post[index]['publishedAt'],
                      author: _post[index]['author'],
                      urlToImage: _post[index]['urlToImage'],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }

  Future _getData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?country=id&apiKey=527f45ed21594068ac44346a8f6859f1'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _post = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }
}
