import 'package:flutter/material.dart';

extension AppFormStateX on GlobalKey<FormState> {
  bool validate() => currentState?.validate() ?? false;
}
