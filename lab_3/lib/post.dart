import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: NetworkImage('https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg?w=718&h=479'),
            fit: BoxFit.cover,
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0),
            ],
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.0),
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 48, 0, 0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.arrow_back, size: 45),
                                ),
                                const Icon(Icons.shop, size: 45),
                              ],
                            ),
                          ],
                        ), 
                      ),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg?w=718&h=479'),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Author', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Post location', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 12, 24, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Product description', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(4, 16, 4, 4),
                  child: ShopControlsComponent(),
                ),
              ],
            ) 
          ),
        ),
      ),
    );
  }
}

class ShopControlsComponent extends StatelessWidget {
  const ShopControlsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: const BorderRadius.all(
          Radius.circular(20)
        ),
      ),
      height: 180,
    );
  }
}