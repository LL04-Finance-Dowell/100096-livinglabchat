import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _profileinfo = prefs.getStringList('ff_profileinfo')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _profileinfo;
    _username = prefs.getString('ff_username') ?? _username;
    _userrole = prefs.getString('ff_userrole') ?? _userrole;
    _userlanguage = prefs.getString('ff_userlanguage') ?? _userlanguage;
    _usercountry = prefs.getString('ff_usercountry') ?? _usercountry;
    _useremail = prefs.getString('ff_useremail') ?? _useremail;
    _userphone = prefs.getString('ff_userphone') ?? _userphone;
    _logedinUserProfile =
        prefs.getStringList('ff_logedinUserProfile')?.map((x) {
              try {
                return jsonDecode(x);
              } catch (e) {
                print("Can't decode persisted json. Error: $e.");
                return {};
              }
            }).toList() ??
            _logedinUserProfile;
    if (prefs.containsKey('ff_userdata')) {
      try {
        _userdata = jsonDecode(prefs.getString('ff_userdata') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _roomid = 71;
  int get roomid => _roomid;
  set roomid(int _value) {
    _roomid = _value;
  }

  List<dynamic> _LoggedInUser = [];
  List<dynamic> get LoggedInUser => _LoggedInUser;
  set LoggedInUser(List<dynamic> _value) {
    _LoggedInUser = _value;
  }

  void addToLoggedInUser(dynamic _value) {
    _LoggedInUser.add(_value);
  }

  void removeFromLoggedInUser(dynamic _value) {
    _LoggedInUser.remove(_value);
  }

  void removeAtIndexFromLoggedInUser(int _index) {
    _LoggedInUser.removeAt(_index);
  }

  List<dynamic> _roomlistvar = [
    jsonDecode(
        '{\"room_id\":71,\"room_name\":\"fvOPHO6n859KsTmUlNkbyZ40\",\"company\":null}')
  ];
  List<dynamic> get roomlistvar => _roomlistvar;
  set roomlistvar(List<dynamic> _value) {
    _roomlistvar = _value;
  }

  void addToRoomlistvar(dynamic _value) {
    _roomlistvar.add(_value);
  }

  void removeFromRoomlistvar(dynamic _value) {
    _roomlistvar.remove(_value);
  }

  void removeAtIndexFromRoomlistvar(int _index) {
    _roomlistvar.removeAt(_index);
  }

  List<dynamic> _profileinfo = [];
  List<dynamic> get profileinfo => _profileinfo;
  set profileinfo(List<dynamic> _value) {
    _profileinfo = _value;
    prefs.setStringList(
        'ff_profileinfo', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToProfileinfo(dynamic _value) {
    _profileinfo.add(_value);
    prefs.setStringList(
        'ff_profileinfo', _profileinfo.map((x) => jsonEncode(x)).toList());
  }

  void removeFromProfileinfo(dynamic _value) {
    _profileinfo.remove(_value);
    prefs.setStringList(
        'ff_profileinfo', _profileinfo.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromProfileinfo(int _index) {
    _profileinfo.removeAt(_index);
    prefs.setStringList(
        'ff_profileinfo', _profileinfo.map((x) => jsonEncode(x)).toList());
  }

  String _username = '';
  String get username => _username;
  set username(String _value) {
    _username = _value;
    prefs.setString('ff_username', _value);
  }

  String _userrole = '';
  String get userrole => _userrole;
  set userrole(String _value) {
    _userrole = _value;
    prefs.setString('ff_userrole', _value);
  }

  String _userlanguage = '';
  String get userlanguage => _userlanguage;
  set userlanguage(String _value) {
    _userlanguage = _value;
    prefs.setString('ff_userlanguage', _value);
  }

  String _usercountry = '';
  String get usercountry => _usercountry;
  set usercountry(String _value) {
    _usercountry = _value;
    prefs.setString('ff_usercountry', _value);
  }

  String _useremail = '';
  String get useremail => _useremail;
  set useremail(String _value) {
    _useremail = _value;
    prefs.setString('ff_useremail', _value);
  }

  String _userphone = '';
  String get userphone => _userphone;
  set userphone(String _value) {
    _userphone = _value;
    prefs.setString('ff_userphone', _value);
  }

  String _loginResponse = 'status';
  String get loginResponse => _loginResponse;
  set loginResponse(String _value) {
    _loginResponse = _value;
  }

  String _loggedInUserName = '';
  String get loggedInUserName => _loggedInUserName;
  set loggedInUserName(String _value) {
    _loggedInUserName = _value;
  }

  List<dynamic> _logedinUserProfile = [];
  List<dynamic> get logedinUserProfile => _logedinUserProfile;
  set logedinUserProfile(List<dynamic> _value) {
    _logedinUserProfile = _value;
    prefs.setStringList(
        'ff_logedinUserProfile', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToLogedinUserProfile(dynamic _value) {
    _logedinUserProfile.add(_value);
    prefs.setStringList('ff_logedinUserProfile',
        _logedinUserProfile.map((x) => jsonEncode(x)).toList());
  }

  void removeFromLogedinUserProfile(dynamic _value) {
    _logedinUserProfile.remove(_value);
    prefs.setStringList('ff_logedinUserProfile',
        _logedinUserProfile.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromLogedinUserProfile(int _index) {
    _logedinUserProfile.removeAt(_index);
    prefs.setStringList('ff_logedinUserProfile',
        _logedinUserProfile.map((x) => jsonEncode(x)).toList());
  }

  dynamic _userdata;
  dynamic get userdata => _userdata;
  set userdata(dynamic _value) {
    _userdata = _value;
    prefs.setString('ff_userdata', jsonEncode(_value));
  }
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
