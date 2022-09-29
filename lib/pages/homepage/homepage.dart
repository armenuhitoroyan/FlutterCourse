import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_project/pages/homepage/homepage_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return homePage();
  }

  Widget homePage() {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(color: Colors.cyan),
          ),
        ),
      ),
      body: SafeArea(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) => 
               Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                 child: getData()
               ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getData() {
    return ChangeNotifierProvider(
      create: (context) => HomepageProvider(),
      child: Consumer<HomepageProvider>(
       builder: (context, value, child) => 
        Column(
          children: [
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [   
                // ignore: prefer_const_constructors
                CircleAvatar(
                  radius: 48, // Image radius
                  backgroundImage: NetworkImage('https://images.pexels.com/photos/3257075/pexels-photo-3257075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                ),
                const Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      'Անուն Ազգանուն',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Image.network(
                    'https://images.pexels.com/photos/3257075/pexels-photo-3257075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    // width: double.infinity,
                    height: 200,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(Icons.favorite_border),
                    const Icon(Icons.message),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Icon(Icons.share),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
