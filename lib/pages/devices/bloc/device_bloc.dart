import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'device_event.dart';
part 'device_state.dart';

var items = [
  'See 1 More',
  'See 2 More',
  'See 3 More',
  'See 4 More',
  'See 5 More',
];



class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(DeviceState()) {
    on<SelectMenuItemEvent>(_selectMenuItem);
    on<SelectDropdownItemEvent>(_selectDropdownItemEvent);
  }

  _selectMenuItem(SelectMenuItemEvent event, Emitter<DeviceState> emit) {
    emit(state.copyWith(selectedIndex: event.index));
  }

  _selectDropdownItemEvent(
      SelectDropdownItemEvent event, Emitter<DeviceState> emit) {
    emit(state.copyWith(dropdownvalue: event.item));
  }
}
