part of 'q_info_bloc.dart';

class QInfoValidState extends Equatable {
  final bool? loading;
  final bool isValid;
  final String? errorMessage;
  final String? errorEmail;
  final String? errorPin;

  QInfoValidState({
    this.loading,
    this.isValid = false,
    this.errorMessage,
    this.errorEmail,
    this.errorPin
  });

  QInfoValidState copyWith({
    bool? loading,
    bool? isValid,
    String? errorMessage,
    String? errorEmail,
    String? errorPin,
  }) {
    return QInfoValidState(
      loading: loading ?? this.loading,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
      errorEmail: errorEmail ?? this.errorEmail,
      errorPin: errorPin ?? this.errorEmail
    );
  }

  @override
  List<Object> get props => [isValid];
}
