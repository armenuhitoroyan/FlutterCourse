import 'package:reactive_forms/reactive_forms.dart';

class FormsState {
  final form = FormArray([
    FormGroup({
      'relationship': FormArray<String>([
        FormControl<String>(value: 'rel'),
      ]),
      'position': FormArray<String>([
        FormControl<String>(),
      ]),
      'note': FormArray<String>([
        FormControl<String>(),
      ]),
    })
  ]);
}
