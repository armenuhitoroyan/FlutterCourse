import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_project/pages/homepage/homepage_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:team_project/pages/homepage/photo.dart';

import '../../widgets/react_widget.dart';
import '../profile/profile_page.dart';

class HomePage extends StatelessWidget {
  TextEditingController commentCtrl = TextEditingController();
  String? fieldText;

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
          itemBuilder: (context, index) => 
          photoListBuild(context, value.photos![index])
        );
      }
    });
  }
}
