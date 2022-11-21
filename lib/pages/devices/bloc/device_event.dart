part of 'device_bloc.dart';

abstract class DeviceEvent extends Equatable {
  const DeviceEvent();

  @override
  List<Object> get props => [];
}

class SelectMenuItemEvent extends DeviceEvent {
  final int index;

  const SelectMenuItemEvent(this.index);
}
