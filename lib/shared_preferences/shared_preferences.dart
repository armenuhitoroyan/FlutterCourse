import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  late SharedPreferences prefs;

  TextEditingController controller = TextEditingController();
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SharedPreferences Demo'),
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter Email',
                ),
              ),
              Text(
                email,
                style: const TextStyle(fontSize: 20, color: Colors.blue),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print(controller.text);
                    save();
                  },
                  child: const Text('Save'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print(email);
                    retrieve();
                  },
                  child: const Text('Retrieve'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print(email);
                    delete();
                  },
                  child: const Text('Delete'),
                ),
              )
            ],
          ),
        ));
  }

  save() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setString('email', controller.text.toString());
    });
  }

  retrieve() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString('email')!;
    });
  }

  delete() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.remove('email');
      email = '';
    });
  }
}
