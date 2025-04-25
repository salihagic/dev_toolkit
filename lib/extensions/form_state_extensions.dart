import 'package:flutter/material.dart';

extension DevFormStateX on GlobalKey<FormState> {
  bool validate() => currentState?.validate() ?? false;
}
