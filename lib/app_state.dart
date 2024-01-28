import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _scheduledNotificationTimes = prefs
              .getStringList('ff_scheduledNotificationTimes')
              ?.map((x) => DateTime.fromMillisecondsSinceEpoch(int.parse(x)))
              .toList() ??
          _scheduledNotificationTimes;
    });
    _safeInit(() {
      _lastGreetingTime = prefs.containsKey('ff_lastGreetingTime')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_lastGreetingTime')!)
          : _lastGreetingTime;
    });
    _safeInit(() {
      _greeting = prefs.getString('ff_greeting') ?? _greeting;
    });
    _safeInit(() {
      _weeklyGenerations =
          prefs.getInt('ff_weeklyGenerations') ?? _weeklyGenerations;
    });
    _safeInit(() {
      _weeklyGenerationsDate = prefs.containsKey('ff_weeklyGenerationsDate')
          ? DateTime.fromMillisecondsSinceEpoch(
              prefs.getInt('ff_weeklyGenerationsDate')!)
          : _weeklyGenerationsDate;
    });
    _safeInit(() {
      _darkModeSet = prefs.getBool('ff_darkModeSet') ?? _darkModeSet;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<DateTime> _scheduledNotificationTimes = [];
  List<DateTime> get scheduledNotificationTimes => _scheduledNotificationTimes;
  set scheduledNotificationTimes(List<DateTime> _value) {
    _scheduledNotificationTimes = _value;
    prefs.setStringList('ff_scheduledNotificationTimes',
        _value.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void addToScheduledNotificationTimes(DateTime _value) {
    _scheduledNotificationTimes.add(_value);
    prefs.setStringList(
        'ff_scheduledNotificationTimes',
        _scheduledNotificationTimes
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void removeFromScheduledNotificationTimes(DateTime _value) {
    _scheduledNotificationTimes.remove(_value);
    prefs.setStringList(
        'ff_scheduledNotificationTimes',
        _scheduledNotificationTimes
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void removeAtIndexFromScheduledNotificationTimes(int _index) {
    _scheduledNotificationTimes.removeAt(_index);
    prefs.setStringList(
        'ff_scheduledNotificationTimes',
        _scheduledNotificationTimes
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void updateScheduledNotificationTimesAtIndex(
    int _index,
    DateTime Function(DateTime) updateFn,
  ) {
    _scheduledNotificationTimes[_index] =
        updateFn(_scheduledNotificationTimes[_index]);
    prefs.setStringList(
        'ff_scheduledNotificationTimes',
        _scheduledNotificationTimes
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void insertAtIndexInScheduledNotificationTimes(int _index, DateTime _value) {
    _scheduledNotificationTimes.insert(_index, _value);
    prefs.setStringList(
        'ff_scheduledNotificationTimes',
        _scheduledNotificationTimes
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  DateTime? _lastGreetingTime =
      DateTime.fromMillisecondsSinceEpoch(1699550940000);
  DateTime? get lastGreetingTime => _lastGreetingTime;
  set lastGreetingTime(DateTime? _value) {
    _lastGreetingTime = _value;
    _value != null
        ? prefs.setInt('ff_lastGreetingTime', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_lastGreetingTime');
  }

  String _greeting = '';
  String get greeting => _greeting;
  set greeting(String _value) {
    _greeting = _value;
    prefs.setString('ff_greeting', _value);
  }

  TempImageDocumentStruct _tempImageDocument = TempImageDocumentStruct();
  TempImageDocumentStruct get tempImageDocument => _tempImageDocument;
  set tempImageDocument(TempImageDocumentStruct _value) {
    _tempImageDocument = _value;
  }

  void updateTempImageDocumentStruct(
      Function(TempImageDocumentStruct) updateFn) {
    updateFn(_tempImageDocument);
  }

  int _weeklyGenerations = 10;
  int get weeklyGenerations => _weeklyGenerations;
  set weeklyGenerations(int _value) {
    _weeklyGenerations = _value;
    prefs.setInt('ff_weeklyGenerations', _value);
  }

  DateTime? _weeklyGenerationsDate =
      DateTime.fromMillisecondsSinceEpoch(1699564320000);
  DateTime? get weeklyGenerationsDate => _weeklyGenerationsDate;
  set weeklyGenerationsDate(DateTime? _value) {
    _weeklyGenerationsDate = _value;
    _value != null
        ? prefs.setInt(
            'ff_weeklyGenerationsDate', _value.millisecondsSinceEpoch)
        : prefs.remove('ff_weeklyGenerationsDate');
  }

  bool _darkModeSet = false;
  bool get darkModeSet => _darkModeSet;
  set darkModeSet(bool _value) {
    _darkModeSet = _value;
    prefs.setBool('ff_darkModeSet', _value);
  }

  final _stylesManager = StreamRequestManager<List<AdminRecord>>();
  Stream<List<AdminRecord>> styles({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<AdminRecord>> Function() requestFn,
  }) =>
      _stylesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearStylesCache() => _stylesManager.clear();
  void clearStylesCacheKey(String? uniqueKey) =>
      _stylesManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
