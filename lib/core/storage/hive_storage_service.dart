import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:mego_food/core/storage/hive_registrar.g.dart';

class HiveStorageService {
  final Map<String, Box> _boxes = {};
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;
    await Hive.initFlutter();
    Hive.registerAdapters();
    _isInitialized = true;
  }

  Future<Box<T>> openBox<T>(String name) async {
    if (_boxes.containsKey(name)) {
      return _boxes[name]! as Box<T>;
    }
    if (Hive.isBoxOpen(name)) {
      final box = Hive.box<T>(name);
      _boxes[name] = box;
      return box;
    }
    final box = await Hive.openBox<T>(name);
    _boxes[name] = box;
    return box;
  }
}
