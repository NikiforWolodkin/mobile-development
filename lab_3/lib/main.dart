import 'package:flutter/material.dart';
import 'post.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        body: Column(
          children: [
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(4, 4, 4, 2),
                child: StoriesComponent(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return PostComponent(
                    authorName: 'Author ${index + 1}',
                    postLocation: 'Post location',
                    postDescription: 'Post description: ${index + 1}',
                    postImageUrl: 'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg?w=718&h=479',
                    authorImageUrl: 'https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg?w=718&h=479',
                    likeCount: 5000,
                    commentCount: 250,
                  );
                },
              ),
            ),
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(4, 0, 4, 4),
                child: NavBarComponent(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBarComponent extends StatelessWidget {
  const NavBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.all(
          Radius.circular(20)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 12,
          left: 24,
          right: 24,
          bottom: 12
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.home, color: Colors.deepPurpleAccent, size: 30),
            const Icon(Icons.search, size: 30),
            ClipOval(
              child: Material(
                color: Colors.deepPurpleAccent, // Button color
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PostPage()),
                    );
                  },
                  splashColor: Colors.deepPurple, // Splash color
                  child: const SizedBox(width: 50, height: 50, child: Icon(Icons.menu)),
                ),
              ),
            ),
            const Icon(Icons.bookmark_outline, size: 30),
            const CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage('https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg?w=718&h=479'),
            ),
          ],
        ),
      ),
    );
  }
}

class PostComponent extends StatelessWidget {
  final String authorName;
  final String postLocation;
  final String postDescription;
  final String postImageUrl;
  final String authorImageUrl;
  final int likeCount;
  final int commentCount;

  const PostComponent({
    Key? key,
    required this.authorName,
    required this.postLocation,
    required this.postDescription,
    required this.postImageUrl,
    required this.authorImageUrl,
    required this.likeCount,
    required this.commentCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(authorImageUrl),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(authorName, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text(postLocation, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
                Expanded(child: Container()),
                const Icon(Icons.menu_open),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(postImageUrl),
            ),
            const SizedBox(height: 8),
            Text(postDescription),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const Icon(Icons.thumb_up),
                    const SizedBox(width: 4),
                    Text('$likeCount'),
                    const SizedBox(width: 16),
                    const Icon(Icons.comment),
                    const SizedBox(width: 4),
                    Text('$commentCount'),
                  ],
                ),
                const Icon(Icons.bookmark_border),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StoriesComponent extends StatelessWidget {
  const StoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.all(
          Radius.circular(20)
        ),
      ),
      height: 164,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 16,
              left: 24,
              right: 24,
              bottom: 0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.white,
                  size: 32.0,
                ),
                Icon(
                  Icons.shop,
                  color: Colors.white,
                  size: 32.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: Flex(
                direction: Axis.horizontal,
                children: List.generate(5, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage('https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg?w=718&h=479'),
                          ),
                          Text('Story ${index + 1}'),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
