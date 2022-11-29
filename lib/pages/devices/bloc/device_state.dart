part of 'device_bloc.dart';

class DeviceState extends Equatable {
  final int selectedIndex;
  // final List<String> items;
  String? dropdownvalue;
  bool onOff;
  double index;
  bool isStarted;

  DeviceState({
    this.selectedIndex = 0,
    // this.items = const [],
    this.dropdownvalue,
    this.onOff = false,
    this.index = 0,
    this.isStarted = false
  });

  DeviceState copyWith({
    int? selectedIndex,
    String? dropdownvalue,
    bool? onOff,
    double? index,
    bool? isStarted
  }) {
    return DeviceState(
        selectedIndex: selectedIndex ?? this.selectedIndex,
        dropdownvalue: dropdownvalue ?? this.dropdownvalue,
        onOff: onOff ?? this.onOff,
        index: index ?? this.index,
        isStarted: isStarted ?? this.isStarted);
  }

  @override
  List<Object> get props => [
        selectedIndex,
        /* items */
        onOff,
        index,
        isStarted
      ];
}
