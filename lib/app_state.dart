import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _apiKey = await secureStorage.getString('ff_apiKey') ?? _apiKey;
    });
    await _safeInitAsync(() async {
      _isDarkMode = await secureStorage.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    await _safeInitAsync(() async {
      _language = await secureStorage.getString('ff_language') ?? _language;
    });
    await _safeInitAsync(() async {
      _voiceSpeed =
          await secureStorage.getDouble('ff_voiceSpeed') ?? _voiceSpeed;
    });
    await _safeInitAsync(() async {
      _applanguage =
          await secureStorage.getString('ff_applanguage') ?? _applanguage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _apiKey = 'Z6i7Yx2aaaY2OZ2W9SZmL-lAAht_jd4kGUD3AULnukA';
  String get apiKey => _apiKey;
  set apiKey(String value) {
    _apiKey = value;
    secureStorage.setString('ff_apiKey', value);
  }

  void deleteApiKey() {
    secureStorage.delete(key: 'ff_apiKey');
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    secureStorage.setBool('ff_isDarkMode', value);
  }

  void deleteIsDarkMode() {
    secureStorage.delete(key: 'ff_isDarkMode');
  }

  List<dynamic> _currentCovnersation = [];
  List<dynamic> get currentCovnersation => _currentCovnersation;
  set currentCovnersation(List<dynamic> value) {
    _currentCovnersation = value;
  }

  void addToCurrentCovnersation(dynamic value) {
    currentCovnersation.add(value);
  }

  void removeFromCurrentCovnersation(dynamic value) {
    currentCovnersation.remove(value);
  }

  void removeAtIndexFromCurrentCovnersation(int index) {
    currentCovnersation.removeAt(index);
  }

  void updateCurrentCovnersationAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    currentCovnersation[index] = updateFn(_currentCovnersation[index]);
  }

  void insertAtIndexInCurrentCovnersation(int index, dynamic value) {
    currentCovnersation.insert(index, value);
  }

  List<dynamic> _chatHistory = [];
  List<dynamic> get chatHistory => _chatHistory;
  set chatHistory(List<dynamic> value) {
    _chatHistory = value;
  }

  void addToChatHistory(dynamic value) {
    chatHistory.add(value);
  }

  void removeFromChatHistory(dynamic value) {
    chatHistory.remove(value);
  }

  void removeAtIndexFromChatHistory(int index) {
    chatHistory.removeAt(index);
  }

  void updateChatHistoryAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    chatHistory[index] = updateFn(_chatHistory[index]);
  }

  void insertAtIndexInChatHistory(int index, dynamic value) {
    chatHistory.insert(index, value);
  }

  String _language = 'en-US';
  String get language => _language;
  set language(String value) {
    _language = value;
    secureStorage.setString('ff_language', value);
  }

  void deleteLanguage() {
    secureStorage.delete(key: 'ff_language');
  }

  double _voiceSpeed = 0.5;
  double get voiceSpeed => _voiceSpeed;
  set voiceSpeed(double value) {
    _voiceSpeed = value;
    secureStorage.setDouble('ff_voiceSpeed', value);
  }

  void deleteVoiceSpeed() {
    secureStorage.delete(key: 'ff_voiceSpeed');
  }

  String _applanguage = '';
  String get applanguage => _applanguage;
  set applanguage(String value) {
    _applanguage = value;
    secureStorage.setString('ff_applanguage', value);
  }

  void deleteApplanguage() {
    secureStorage.delete(key: 'ff_applanguage');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
