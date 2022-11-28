part of 'device_bloc.dart';

class DeviceState extends Equatable {
  final int selectedIndex;
  // final List<String> items;
  String? dropdownvalue;
  bool onOff;

  DeviceState({
    this.selectedIndex = 0,
    // this.items = const [],
    this.dropdownvalue,
    this.onOff = false,
  });

  DeviceState copyWith({
    int? selectedIndex,
    String? dropdownvalue,
    bool? onOff,
  }) {
    return DeviceState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        dropdownvalue: dropdownvalue ?? this.dropdownvalue,
        onOff: onOff ?? this.onOff);
  }

  @override
  List<Object> get props => [
        selectedIndex, /* items */
        onOff
      ];
}
