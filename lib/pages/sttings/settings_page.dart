
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
  late Text text;
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
          // print(snapshot.runtimeType);
         
          final settings = snapshot.data as List<SettingModel>;
          // print(settings);

          return ListView.separated(
            itemBuilder: (context, index) {
              text = Text(settings[index].setting_name ?? '');
              return Row(
                children: [
                  text,
                  SwitchWidget()
                ],
              );
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
    String? text;
    bool? val;
    List<String>? texts;
   return FutureBuilder(
    future: ShopAPI().settings.getSettingsData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final settings = snapshot.data as List<SettingModel>;
        // print('settings: ${settings.map((e) => e.setting_name)}');
        print('type: ${settings.map((e) { 
          text = e.setting_name as String;
          return text; 
        })}');

        
      }
      return PopupMenuButton(
        itemBuilder: (context) {
          return [
                  // ignore: prefer_const_constructors
            PopupMenuItem(
              value: 'edit',
                // ignore: prefer_const_constructors
              child: Text('$text'),
            ),
  
          ];
        },
        onSelected: (String value){
          print('You Click on po up menu item');
        },
      );
    },
  );
   
  

   
    
    // List<SettingModel> list = [];
    // list = future.then((value) => value.map((e) => e.id));
    // return   PopupMenuButton(
    //    itemBuilder: (context) {  
    //      return [  
    //        PopupMenuItem<int>(
    //         value: 1,
    //         child: Column(
    //           children: [
    //             Row(
    //             children: [
    //                Text('Text'),
    //                 SwitchWidget()
    //             ],
    //             ),
    //           ]
    //         )
    //       ),
        //  ];
      //  },
    // );
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
