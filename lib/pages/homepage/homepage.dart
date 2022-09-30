import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_project/base/routes.dart';
import 'package:team_project/pages/homepage/homepage_provider.dart';

import '../../widgets/react_widget.dart';
import '../profile/profile_page.dart';

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
              style: TextStyle(color: Colors.blueGrey),
            ),
          ),
        ),
        body: SafeArea(
          child: Consumer<HomepageProvider>(
            builder: (context, value, child) => Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.all(15), child: _buildContent()),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Consumer<HomepageProvider>(builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
          itemCount: value.photos?.length,
          itemBuilder: (context, index) => Column(
            children: [
              Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  CircleAvatar(
                    radius: 48, // Image radius
                    backgroundImage:
                        NetworkImage('${value.photos?[index].src!.medium}'),
                  ),

                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context) => 
                                  ProfilePage(photo: value.photos![index],),
                              )
                            ); 
                          },
                          // Navigator.pushNamed(context, AppRoutes.profile),
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10),
                                    child: Text(
                                      '${value.photos?[index].photographer}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 22
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
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
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                '${value.photos?[index].src!.medium}',
                              ),
                              fit: BoxFit.cover,
                            ),
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
                        ReactWidget(),
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
      }
    });
  }
}
