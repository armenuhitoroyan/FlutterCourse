
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:shop/api/settings/settings_api.dart';
import 'package:shop/api/shop_api.dart';
import 'package:shop/base/routes.dart';
import 'package:shop/models/setting_model.dart';

import '../../widgets/switch_widget.dart';


class SettingsPageWidget extends StatefulWidget {
  const SettingsPageWidget({Key? key}) : super(key: key);

  @override
  State<SettingsPageWidget> createState() => _SettingsPageWidgetState();
}

class _SettingsPageWidgetState extends State<SettingsPageWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
        ),
        actions: [
          // PopupMenuButton(
          //   itemBuilder: (context){
          //     return [
          //       const PopupMenuItem<int>(
          //         value: 0,
          //         child: Text("My Account"),
          //       ),

          //       const PopupMenuItem<int>(
          //         value: 1,
          //         child: Text("Settings"),
          //       ),

          //       const PopupMenuItem<int>(
          //         value: 2,
          //         child: Text("Logout"),
          //       ),
          //     ];
          //   },
          // )

          popupBtnWidget()
        ],
        automaticallyImplyLeading: false,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: ShopAPI().settings.getSettingsData(),
      builder: (context, snapshot) {
        //  print(snapshot);
        if (snapshot.hasData) {
         
          final settings = snapshot.data as List<SettingModel>;
          // print(settings);

          return ListView.separated(
            itemBuilder: (context, index) {
              return Text(settings[index].setting_name ?? '');
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: settings.length,
          );
        } else {
          return const Center(
            child: Text('No Items'),
          );
        }
      },
    );
  }


  Widget popupBtnWidget() {
    Future<List<SettingModel>> future = ShopAPI().settings.getSettingsData();
   
    print('--------------------');
    
    List<SettingModel> list = [];
    // list = future.then((value) => value.map((e) => e.id));
    return PopupMenuButton(
       itemBuilder: (context) {  
         return [  
           PopupMenuItem<int>(
            value: 1,
            child: Column(
              children: [
                Row(
                children: [
                  const Text('Settings'),
                    SwitchWidget()
                ],
                ),
              ]
            )
          ),
         ];
       },
    );  
  }

  Widget customSwitch () {
    bool isSwitched = false;
   return Switch(
      value: isSwitched,
     
      onChanged: (value) {
        setState(() {
           isSwitched = value;
                
        });
      },
      activeTrackColor: Colors.lightGreenAccent,
      activeColor: Colors.green,
    );
  }


}
