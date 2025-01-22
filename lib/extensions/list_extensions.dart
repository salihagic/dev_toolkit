import 'package:dev_toolkit/dev_toolkit.dart';

extension IterableNullableX<T> on Iterable<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension AppIterableExtensions<T> on Iterable<T> {
  T? firstOrDefault([bool Function(T element)? test, T? defaultElement]) {
    if (test != null) {
      try {
        return firstWhere(test);
      } catch (e) {
        return defaultElement;
      }
    } else {
      try {
        return firstWhere((T element) => true);
      } catch (e) {
        return defaultElement;
      }
    }
  }

  T? lastOrDefault([bool Function(T element)? test, T? defaultElement]) {
    if (test != null) {
      try {
        return lastWhere(test);
      } catch (e) {
        return defaultElement;
      }
    } else {
      try {
        return lastWhere((T element) => true);
      } catch (e) {
        return defaultElement;
      }
    }
  }

  Iterable<U> mapIndexed<U>(U Function(int index, T item) f) sync* {
    var index = 0;

    for (final item in this) {
      yield f(index, item);
      index++;
    }
  }

  Map<K, List<T>> groupBy<K>(K Function(T) keyFunction) => fold(<K, List<T>>{}, (Map<K, List<T>> map, T element) => map..putIfAbsent(keyFunction(element), () => <T>[]).add(element));
}

extension AppNullableListExtensions<T> on List<T>? {
  List<T> get value => this ?? [];

  T? next([T? element, bool Function(T element)? test, bool loop = true]) {
    if (this?.isNullOrEmpty ?? true) {
      return null;
    }

    T? byIndexOrFirst(int index) => ((index == (this?.length ?? 0) - 1) && loop) || !index.between(0, (this?.length ?? 0), endInclusive: false) ? this?.first : this?[index + 1];

    if (element != null) {
      final index = this?.indexOf(element) ?? 0;

      return byIndexOrFirst(index);
    }

    if (test != null) {
      final index = this?.indexWhere(test) ?? 0;

      return byIndexOrFirst(index);
    }

    return this![0];
  }

  /// Takes a max argument and this out the list
  /// If the list length is more than max, it takes max items from the list so that resulting list has max length with items from original list taken by mathematical skip ratio
  /// for example [1,2,3,4,5].thinOut(3) would result with [1,3,5]
  /// If the list length is less than max, result would be the same list
  List<T> thinOut(int max) {
    if (this.isNullOrEmpty) {
      return [];
    }

    if ((this?.length ?? 0) <= max) {
      return this ?? [];
    }

    final skipAmount = ((this?.length ?? 0) / max).floor();

    return List<T>.generate(max, (index) => this![index * skipAmount]);
  }
}

extension AppListExtensions<T> on List<T> {
  List<T> addThen(T element, [bool Function(T element)? test]) {
    final alreadyAdded = test != null ? firstOrDefault(test) != null : contains(element);

    if (!alreadyAdded) {
      add(element);
    }

    return this;
  }

  void replaceWhere(bool Function(T element) test, List<T> replacements) {
    final index = indexWhere(test);

    replaceRange(index, index + 1, replacements);
  }
}
