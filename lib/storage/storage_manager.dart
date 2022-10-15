// Created by linkkader on 12/10/2022

import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;

import 'block.dart';
import 'easy_downloader.dart';

class StorageManager{
  static final StorageManager _instance = StorageManager._internal();
  StorageManager._internal();
  factory StorageManager() => _instance;
  bool _isInit = false;

  late Box<EasyDownloader> _box;

  Future init() async {
    assert(!_isInit, "StorageManager already initialized");
    Directory appDocumentDir = await path.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(EasyDownloaderAdapter());
    Hive.registerAdapter(DownloadBlockAdapter());
    _box = await Hive.openBox<EasyDownloader>("easy_downloader");
    _isInit = true;
  }

  //add
  Future<int> add(EasyDownloader easyDownloader) async {
    assert(_isInit, "StorageManager not initialized");
    var key = await _box.add(easyDownloader);
    await _box.put(key, easyDownloader.copyWith(downloadId: key));
    return key;
  }

  //delete
  Future<void> delete(int key) async {
    assert(_isInit, "StorageManager not initialized");
    await _box.delete(key);
  }

}