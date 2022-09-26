import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../base/controllers/products_data_provider.dart';
import '../../base/routes.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawerEnableOpenDragGesture: false,
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
              // _key.currentState!.openDrawer();
            },
            child: Icon(Icons.menu),
          );
        },
      ),
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        // automaticallyImplyLeading: false,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.indigo,
              child: const DrawerHeader(
                child: Text(
                  'INDIGO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
             ListTile(
              title: const Text(
                'Products',
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.products);
                // Navigator.pushNamed(context, AppRoutes.products);
              },
            ),
            ListTile(
              title: const Text(
                'Feedback',
              ),
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.feedback);
              },
            ),
           
            const Spacer(),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductsDataProvider(),
      builder: (context, child) {
        return Consumer<ProductsDataProvider>(
          builder: (context, value, child) {
            return ListView.builder(
              itemBuilder: ((context, index) {
                return Text('${value.items[index].productName}');
              }),
              itemCount: value.items.length,
            );
          },
        );
      },
    );
  }
}
