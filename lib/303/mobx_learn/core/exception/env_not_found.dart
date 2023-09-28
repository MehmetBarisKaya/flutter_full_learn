class EnvNotFund implements Exception {
  final String? value;

  EnvNotFund(this.value);

  @override
  String toString() {
    return "This $value doesnt found in env file";
  }
}
