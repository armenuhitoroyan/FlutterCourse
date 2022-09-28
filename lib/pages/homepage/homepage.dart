import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return homePage();
  }

  Widget homePage() {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
            style: TextStyle(color: Colors.cyan),
          ),
        ),
      ),
      body: SafeArea(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => 
               Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                 child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 56,
                          backgroundColor: Colors.cyan,
                          child: Container(
                            height: double.infinity,
                            alignment: Alignment.center,
                            child: ClipOval(
                              child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_EZwam8kElu8CYpDDTDLHcp7upEP8MtUlPA&usqp=CAU',
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'Անուն Ազգանուն',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                             ),
               ),
            ),
          ),
        ),
      ),
    );
  }
}
