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
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
      body: SafeArea(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: getData()
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
        ListView.builder(
          itemCount: value.photos?.length,
          itemBuilder: (context, index) => 
          Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [   
                  // ignore: prefer_const_constructors
                  CircleAvatar(
                    radius: 48, // Image radius
                    backgroundImage: NetworkImage('${value.photos?[index].src!.medium}'),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        '${value.photos?[index].photographer}',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent)
                          ),
                          child: Image.network(
                            '${value.photos?[index].src!.medium}',
                            width: double.infinity,
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
