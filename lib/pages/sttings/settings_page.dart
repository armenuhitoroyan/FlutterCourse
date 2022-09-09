import 'package:flutter/material.dart';
import 'package:shop/api/shop_api.dart';
import 'package:shop/models/setting_model.dart';

import '../../widgets/popup_btn_widget.dart';



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
           PopupBtnWidget()
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
        if (snapshot.hasData) {
         
          final settings = snapshot.data as List<SettingModel>;

          return ListView.separated(
            itemBuilder: (context, index) {
              text = Text(settings[index].setting_name ?? '');
               bool isSwitched = settings[index].setting_value as bool;
              return Row(
                children: [
                  text,
                    Switch(
                      value: isSwitched,
     
                          onChanged: (value) {
                            print('isSwitched: $isSwitched');
                            setState(() {
                              isSwitched = value;
                              print('isClicked: $isSwitched');
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                    )
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

}
