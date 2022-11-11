import 'package:reactive_forms/reactive_forms.dart';

class FormsState {
  final form = FormArray([
    FormGroup({
      'relationship': FormControl<String>(),
      'position': FormControl<String>(),
      'note': FormControl<String>(),
    })
  ]);
}
