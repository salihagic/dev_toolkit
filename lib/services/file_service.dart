import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:path/path.dart' as path;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'package:dev_toolkit/extensions/list_extensions.dart';
import 'package:dev_toolkit/extensions/string_extensions.dart';

abstract class FileService {
  Future<void> open(String path);
  Future<void> openOrThrow(String path);
  Future<String> regenerateAbsolutePath(String absolutePath);
  Future<String> getAppDocumentsDirectoryPath();
  FileInfo getFileInfo(File file);
  Future<(String, String)> createFilePathAndName(
      {String? name, required String extension, bool temporary = false});
  Future<FileInfo> createFile({String? name, required String extension});
  Future<File> writeToFile(Uint8List data);
}

class FileServiceImpl implements FileService {
  @override
  Future<void> open(String path) async => OpenFile.open(path);

  @override
  Future<void> openOrThrow(String path) async {
    final result = await OpenFile.open(path);

    if (result.type != ResultType.done)
      throw ArgumentError.value(path, 'path', 'Failed to open file.');
  }

  @override
  Future<String> regenerateAbsolutePath(String absolutePath) async {
    if (Platform.isIOS) {
      final fileName = absolutePath.split('/').lastOrDefault();
      final diectoryPath = await getAppDocumentsDirectoryPath();

      return '$diectoryPath/$fileName';
    }

    return absolutePath;
  }

  @override
  Future<String> getAppDocumentsDirectoryPath([String? pathSufix]) async {
    try {
      Directory? directory;

      // For Android, use getExternalStorageDirectory.
      // For iOS, use getApplicationDocumentsDirectory as iOS doesn't support external storage.
      if (Platform.isAndroid) {
        directory = await getExternalStorageDirectory();
      } else if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      }

      // You can use your app's subdirectory within the external storage directory.
      final String path =
          '${directory?.path}${pathSufix.isNotNullOrEmpty ? '/${pathSufix}' : ''}';

      // Creating the directory if it doesn't exist
      final myDir = Directory(path);
      if (!await myDir.exists()) {
        await myDir.create(recursive: true);
      }

      return path;
    } catch (e) {
      debugPrint('FileService > getDownloadsFolderPath: ${e.toString()}');
    }

    return '';
  }

  @override
  FileInfo getFileInfo(File file) {
    final name = const Uuid().v1();
    final extension = path.extension(file.path);

    return FileInfo(
      file: file,
      name: name,
      extension: extension,
      path: file.path,
      type: FileInfoType.fromExtension(extension),
    );
  }

  @override
  Future<(String, String)> createFilePathAndName(
      {String? name, required String extension, bool temporary = false}) async {
    final n = name ?? const Uuid().v1();
    final directoryPath = temporary
        ? (await getTemporaryDirectory()).path
        : await getAppDocumentsDirectoryPath();

    return ('$directoryPath/$n${n.contains('.') ? '' : '.$extension'}', n);
  }

  @override
  Future<FileInfo> createFile({String? name, required String extension}) async {
    final (path, n) =
        await createFilePathAndName(name: name, extension: extension);

    // Creating the directory if it doesn't exist
    final file = File(path);
    if (!await file.exists()) {
      await file.create(recursive: true);
    }

    return FileInfo(
      file: file,
      name: n,
      extension: extension,
      path: file.path,
      type: FileInfoType.fromExtension(extension),
    );
  }

  @override
  Future<File> writeToFile(Uint8List data) async {
    final buffer = data.buffer;

    Directory tempDir = await getTemporaryDirectory();

    final filePath = '${tempDir.path}/${const Uuid().v1()}.tmp';

    return File(filePath).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
}

enum FileInfoType {
  /// The asset is not an image, video, or audio file.
  other,

  /// The asset is an image file.
  image,

  /// The asset is a video file.
  video,

  /// The asset is an audio file.
  audio;

  factory FileInfoType.fromExtension(String? extension) =>
      switch (extension.value.toLowerCase()) {
        '.jpg' => FileInfoType.image,
        '.jpeg' => FileInfoType.image,
        '.heic' => FileInfoType.image,
        '.png' => FileInfoType.image,
        '.mp3' => FileInfoType.audio,
        '.m4a' => FileInfoType.audio,
        '.wav' => FileInfoType.audio,
        '.mp4' => FileInfoType.video,
        '.mkv' => FileInfoType.video,
        '.mov' => FileInfoType.video,
        _ => FileInfoType.other,
      };
}

class FileInfo {
  String path;
  File file;
  String name;
  String get nameWithExtension => '$name$extension';
  String extension;
  FileInfoType type;
  FileInfo? thumbnail;

  bool get isOther => type == FileInfoType.other;
  bool get isImage => type == FileInfoType.image;
  bool get isVideo => type == FileInfoType.video;
  bool get isAudio => type == FileInfoType.audio;

  Future<int> get size async => await file.length();

  FileInfo({
    required this.path,
    required this.file,
    required this.name,
    required this.extension,
    required this.type,
    this.thumbnail,
  });

  factory FileInfo.fromPath(String path) {
    final extension = p.extension(path);

    return FileInfo(
      file: File(path),
      name: basename(path),
      extension: extension,
      path: path,
      type: FileInfoType.fromExtension(extension),
    );
  }
}
