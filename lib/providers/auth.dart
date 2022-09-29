import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motobox/models/http_exception.dart';

class Auth extends ChangeNotifier {
  late String _token;
  late String _userId;
  late DateTime _expiryDate = DateTime.now();

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authentificate(
      String email, String password, String urlSegment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyADYYBIyBatdwRQpYgkbw0tMPadqb9-O_A');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData['expiresIn']),
        ),
      );
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signup(String email, String password) async {
    return _authentificate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authentificate(email, password, 'signInWithPassword');
  }
}
