part of 'device_bloc.dart';

class DeviceState extends Equatable {
  final int selectedIndex;
  // final List<String> items;
  String? dropdownvalue;

  DeviceState({
    this.selectedIndex = 0,
    // this.items = const [],
    this.dropdownvalue,
  });

  DeviceState copyWith({
    int? selectedIndex,
    // List<String>? items,
    String? dropdownvalue,
  }) {
    return DeviceState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        // items: items ?? this.items,
        dropdownvalue: dropdownvalue ?? this.dropdownvalue);
  }

  @override
  List<Object> get props => [selectedIndex, /* items */];
}
