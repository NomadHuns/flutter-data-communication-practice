import 'package:flutter/material.dart';
import 'package:http_app/post.dart';
import 'package:http_app/post_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: PostRepository().findById(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print("테이터 있음!");
                  Post post = snapshot.data!;
                  return Center(child: Text("${post.title}"));
                } else {
                  print("테이터 없음...");
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: PostRepository().findAll(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Post> postList = snapshot.data!;
                  return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(Icons.ac_unit_outlined),
                        title: Text("${postList[index].title}"),
                        subtitle: Text("${postList[index].body}"),
                      );
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )

        ],
      ),
    );
  }
}
