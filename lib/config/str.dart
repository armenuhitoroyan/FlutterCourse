class RangerTexts {
  final String _emailErr = 'Please enter a valid address';
  final String _errorMessage = 'Field must not be empty';
  final String _pinCodeError = 'Please enter a valid pin code';

  static const String macAddress = 'MAC Address';
  static const String helperTextAddress =
      'Enter last 6 characters 4827589XXXXXX';
  static const String pin = 'PIN';
  static const String helperTextPin = 'XXX-XXXX-XXX';

  String get emailErr {
    return _emailErr;
  }

  String get errorMessage {
    return _errorMessage;
  }

  String get pinCodeError {
    return _pinCodeError;
  }
}
