import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  final String author;
  final String postLocation;
  final String description;

  const PostPage({
    Key? key,
    required this.author,
    required this.postLocation,
    required this.description,
  }) : super(key: key);

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
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage('https://i.natgeofe.com/n/548467d8-c5f1-4551-9f58-6817a8d2c45e/NationalGeographic_2572187_3x2.jpg?w=718&h=479'),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(author, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(postLocation),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(description, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 4, 4),
                    child: ShopControlsComponent(),
                  ),
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
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomContainer(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
                  width: 100,
                  height: 66,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Container()),
                        const Text('Size', style: TextStyle(color: Colors.grey)),
                        const Text('Small', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Expanded(child: Container()),
                      ],
                    ), 
                  ), 
                ),
                CustomContainer(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  width: 100,
                  height: 66,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Container()),
                        const Text('Color', style: TextStyle(color: Colors.grey)),
                        Container(height: 5),
                        Container(
                          height: 10,
                          width: 60,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20)
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ), 
                  ), 
                ),
              ],
            ),
            Column(
              children: [
                CustomContainer(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
                  width: 150,
                  height: 66,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Container()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('+', style: TextStyle(fontSize: 20)),
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: const Center(child: Text('2', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),),
                            ),
                            const Text('-', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Expanded(child: Container()),
                      ],
                    ), 
                  ), 
                ),
                CustomContainer(
                  padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
                  width: 150,
                  height: 66,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 6, 16, 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Container()),
                        const Text('Price', style: TextStyle(color: Colors.grey)),
                        const Text('\$ 1200', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Expanded(child: Container()),
                      ],
                    ), 
                  ), 
                ),
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(10)
                ),
              ),
              width: 70,
              child: Column(
                children: [
                  Expanded(child: Container()),
                  const Icon(Icons.shop_outlined),
                  const Text('Buy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Expanded(child: Container()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double height;
  final double width;

  const CustomContainer({Key? key, required this.child, required this.padding, required this.height, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}
