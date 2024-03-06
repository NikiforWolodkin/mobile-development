import 'package:flutter/material.dart';

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
      home: const Scaffold(
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: StoriesComponent(),
              ),
            ),
            Expanded(
              child: Center(
                child: Text('Hello World!'),
              ),
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
      height: 163,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
              bottom: 0
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.white,
                  size: 35.0,
                ),
                Icon(
                  Icons.shop,
                  color: Colors.white,
                  size: 35.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
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
