import 'package:exam_at/base/routes.dart';
import 'package:flutter/material.dart';

class TopMenuWidget extends StatelessWidget {
  const TopMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return menu(context);
  }

  Widget menu(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            // ignore: sort_child_properties_last
                            child: const Center(
                              child: Icon(
                                Icons.verified_user,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(0),
                                backgroundColor: null),
                          ),
                        ),
                        const Text('Play Now'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.quiz);
                          },
                          // ignore: sort_child_properties_last
                          child: const Center(
                            child: Icon(
                              Icons.shopping_basket,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(0),
                              backgroundColor: null),
                        ),
                      ),
                      const Text('Profile'),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
