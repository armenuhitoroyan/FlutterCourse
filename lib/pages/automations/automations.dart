import 'package:flutter/material.dart';
import 'package:ranger/config/colors.dart';
import 'package:ranger/config/images.dart';
import 'package:ranger/config/str.dart';

class Automations extends StatelessWidget {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: RangerColors.blueBtn),
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 40.0, bottom: 40.0),
                  child: Text(
                    RangerTexts.automations,
                    style: TextStyle(fontSize: 30, color: RangerColors.white),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: RangerColors.greyBottomBar,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              labelText: 'Search by name, ...',
                              border: const OutlineInputBorder(),
                            
                              focusedErrorBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: RangerColors.blueBtn),
                              ),
                             
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    // Spacer(),
                    const Text(
                      'No Automation added yet',
                      style: TextStyle(
                        fontSize: 40,
                        color: RangerColors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Tap the + to create one now',
                      style: TextStyle(fontSize: 30, color: RangerColors.black),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 100,
                      child: RangerImages.circularLineArrow,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: const EdgeInsets.all(30)),
                            child: const Icon(
                              Icons.add,
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
