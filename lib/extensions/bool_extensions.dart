extension DevBoolNullableX on bool? {
  bool get value => this ?? false;
}

extension DevBoolListNullableX on List<bool>? {
  bool anyTrue() => this?.any((x) => x) ?? false;
  bool allTrue() => this?.every((x) => x) ?? false;
  bool anyFalse() => this?.any((x) => !x) ?? false;
  bool allFalse() => this?.every((x) => !x) ?? false;
}
