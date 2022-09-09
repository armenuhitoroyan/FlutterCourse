import 'package:flutter/material.dart';

import '../api/shop_api.dart';
import '../models/setting_model.dart';


class PopupBtnWidget  extends StatefulWidget{
  @override
  State<PopupBtnWidget> createState() => _PopupBtnWidgetState();
}

class _PopupBtnWidgetState extends State<PopupBtnWidget> {
  @override
  Widget build(BuildContext context) {
    return popupBtnWidget();
  }

    Widget popupBtnWidget() {
    String text = '';
    List<String> dataList = [];
   return FutureBuilder(
    future: ShopAPI().settings.getSettingsData(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final settings = snapshot.data as List<SettingModel>;
        print('type: ${settings.map((e) { 
          text = e.setting_name as String;
          dataList.add(text);

          print(dataList);
         
          return text; 
        })}');

        
      }
      return PopupMenuButton(
        itemBuilder: (context) {
          int length = dataList.length;
          print('------- $dataList');
          dataList.map(
            (e) => e
          );
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
   
}
}