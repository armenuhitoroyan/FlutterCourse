import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class RForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildcontent();
  }
}

Widget _buildcontent() {
  List<DropdownMenuItem<dynamic>> list = <String>[
    'One',
    'Two',
    'Free',
    'Four',
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  return Card(
    color: Colors.grey[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      // side: const BorderSide(
      //   color: Colors.greenAccent,
      // ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 10),
                  child: ReactiveDropdownField(
                    formControlName: 'relationship',
                    items: list,
                    decoration: const InputDecoration(
                      labelText: 'Relationship',
                    ),
                    // validationMessages: '',
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: ReactiveTextField(
                    formControlName: 'position',
                    decoration: const InputDecoration(
                      labelText: 'Position',
                    ),
                    textCapitalization: TextCapitalization.words,
                    style: const TextStyle(
                      backgroundColor: Colors.white,
                    ),
                    
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ReactiveTextField(
                    formControlName: 'note',
                    decoration: const InputDecoration(
                      labelText: 'Note',
                    ),
                    textCapitalization: TextCapitalization.words,
                    style: const TextStyle(
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.close,
                          ),
                        ),
                        const Text('Cancel'),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.save_sharp,
                          ),
                        ),
                        const Text('Save'),
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
