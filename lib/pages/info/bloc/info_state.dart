part of 'info_bloc.dart';

class InfoState extends Equatable {
  TextEditingController? address;
  TextEditingController? pinCode;

  InfoState({this.address, this.pinCode});

  InfoState copyWith({
    TextEditingController? address,
    TextEditingController? pinCode,
  }) {
    return InfoState(
      address: address ?? this.address,
      pinCode: pinCode ?? this.pinCode,
    );
  }

  @override
  List<Object> get props => [];
}
