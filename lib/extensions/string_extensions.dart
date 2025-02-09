// Can you please analyze these extension methods and write a valid README.MD file that showcases how to use each of the methods
// Please generate the result as one copyable readme.md section

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';

extension DevStringNullableExtensions on String? {
  String get value => this ?? '';
  int get count => value.length;
  String or(String other) => isNotNullOrEmpty ? value : other;
  bool get isNullOrEmpty => value.trim() == '';
  bool get isNotNullOrEmpty => !isNullOrEmpty;
  bool get isNumeric =>
      value.isNotNullOrEmpty && double.tryParse(value.value) != null;
  String cut([int maxLength = 10, bool withDots = true]) => this == null
      ? value
      : count < maxLength
          ? value
          : '${this?.substring(0, maxLength)}${withDots ? '...' : ''}';
  String get trimSpaces => value.replaceAll(RegExp(r'\s+'), ' ');
  String trimIfOnlyChar(String char) =>
      value.split('').any((x) => x != char && x != ' ') ? value : '';
  Color? toColor() => isNullOrEmpty ? null : Color(hexToInteger('FF$value'));
  bool get isImageFileType =>
      _imageFileExtensions.any((extension) => value.endsWith(extension));
  bool get containsUrl =>
      RegExp(r'<a\b[^>]*>(.*?)<\/a>', caseSensitive: false).hasMatch(value);
  bool get isIban => RegExp(
          r'^([A-Z]{2}[ ' +
              '\\\\' +
              '-]?[0-9]{2})(?=(?:[ ' +
              '\\\\' +
              '-]?[A-Z0-9]){9,30}\$)((?:[ ' +
              '\\\\' +
              '-]?[A-Z0-9]{3,5}){2,7})([ ' +
              '\\\\' +
              '-]?[A-Z0-9]{1,3})?\$',
          caseSensitive: false)
      .hasMatch(value);
  String coalesce(String other) => isNotNullOrEmpty ? value : other;
  String capitalize() => count < 2
      ? value.toUpperCase()
      : '${value[0].toUpperCase()}${value.substring(1).toLowerCase()}';
  Color toPrimaryColor() {
    final colors = [
      Colors.red,
      Colors.pink,
      Colors.purple,
      Colors.deepPurple,
      Colors.indigo,
      Colors.blue,
      Colors.teal,
      Colors.green,
      Colors.orange,
      Colors.deepOrange,
      Colors.brown,
    ];
    var bytes = utf8.encode(value);
    var digest = md5.convert(bytes);
    int hashValue = digest.bytes.fold(0, (prev, elem) => prev + elem);
    int colorIndex = hashValue % colors.length;
    return colors[colorIndex];
  }
}

bool isNullOrEmpty(String? text) => text.isNullOrEmpty;
bool isNotNullOrEmpty(String? text) => text.isNotNullOrEmpty;
int hexToInteger(String hex) => int.parse(hex, radix: 16);

List<String> _imageFileExtensions = [
  '.jpg',
  '.jpeg',
  '.png',
  '.gif',
];
