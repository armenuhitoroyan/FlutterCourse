import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.camera_alt_rounded)),
                Tab(text: 'CHATS'),
                Tab(text: 'STATUS'),
                Tab(text: 'CALLS'),
              ],
            ),
            title: const Text('WhatsApp'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(1),
            children: const <Widget>[
              ListTile(
                  title: Text(
                      "Battery Full"
                  ),
                  subtitle: Text(
                      "The battery is full."
                  ),
                  leading:  CircleAvatar(
                    backgroundImage: AssetImage(
                        "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2016'),
              ),
              ListTile(
                title: Text("Anchor"),
                subtitle: Text("Lower the anchor."),
                leading:CircleAvatar(
                  backgroundImage: AssetImage(
                    "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                  ), // no matter how big it is, it won't overflow
                ),
                trailing: Text('2013'),
              ),
              ListTile(
                  title: Text("Alarm"),
                  subtitle: Text("This is the time."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2018')
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2017')
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2015')
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2013')
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2014')
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Icon(Icons.star)
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Icon(Icons.star)
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2013')
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2007')
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Icon(Icons.star)
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2013')
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2013')
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2004')
              ),
              ListTile(
                  title: Text("Ballot"),
                  subtitle: Text("Cast your vote."),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      "https://image.shutterstock.com/image-vector/business-user-icon-users-group-260nw-412967089.jpg",
                    ), // no matter how big it is, it won't overflow
                  ),
                  trailing: Text('2013')
              )
            ],
          ),
        ),
      ),
    );
  }
}


Widget listWiewidget() {
  return ListView.builder(
      itemCount: 25,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: const Icon(Icons.list),
            trailing: const Text(
              "GFG",
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
            title: Text("List item $index"));
      }
  );
}