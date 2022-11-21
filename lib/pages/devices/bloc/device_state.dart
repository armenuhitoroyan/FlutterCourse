part of 'device_bloc.dart';

class DeviceState extends Equatable {
  final int selectedIndex;

  const DeviceState({
    this.selectedIndex = 0,
  });

  DeviceState copyWith({
    int? selectedIndex,
  }) {
    return DeviceState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object> get props => [selectedIndex];
}
