import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:team_project/pages/homepage/homepage_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return homePage();
  }

  Widget homePage() {
    return ChangeNotifierProvider(
      create: (context) => HomepageProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Home',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
        body: SafeArea(
            child: Consumer<HomepageProvider>(
              builder: (context, value, child) => 
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: _buildContent()
                ),
              ),
            ),
          // ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Consumer<HomepageProvider>(
       builder: (context, value, child) { 
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
        return ListView.builder(
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
                          // height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.redAccent)
                          ),
                          child: Image.network(
                            '${value.photos?[index].src!.medium}',
                            // width: double.infinity,
                            // height: double.infinity,
                            fit: BoxFit.fill,
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
        ); 
      } }
    );
    // );
  }
}
