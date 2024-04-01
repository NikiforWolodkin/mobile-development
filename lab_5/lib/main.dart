import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'post_component.dart';
import 'post_states.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final postBlocs = List<PostBloc>.generate(25, (_) => PostBloc());

    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Scaffold(
        body: PageView(
          children: [
            Column(
              children: [
                const SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(4, 4, 4, 2),
                    child: StoriesComponent(),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: postBlocs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return BlocProvider.value(
                        value: postBlocs[index]..add(LoadPost()),
                        child: PostComponent(),
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
            )
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
      child: const Padding(
        padding: EdgeInsets.only(
          top: 12,
          left: 24,
          right: 24,
          bottom: 12
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.home, color: Colors.deepPurpleAccent, size: 30),
            Icon(Icons.search, size: 30),
            ClipOval(
              child: Material(
                color: Colors.deepPurpleAccent, // Button color
                child: InkWell(
                  splashColor: Colors.deepPurple, // Splash color
                  child: SizedBox(width: 50, height: 50, child: Icon(Icons.menu)),
                ),
              ),
            ),
            Icon(Icons.bookmark_outline, size: 30),
            CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage('https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg?w=718&h=479'),
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
