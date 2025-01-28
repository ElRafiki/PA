import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String keyUsername = 'username';
  static const String keyPassword = 'password';
  static const String keyIsLoggedIn = 'isLoggedIn';
  static const String keyIsAdmin = 'isAdmin';

  // Admin Standardwerte
  static const String defaultAdminUser = 'admin';
  static const String defaultAdminPass = 'admin123';

  // Admin-Anmeldedaten initialisieren
  static Future<void> initializeAdmin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (!(prefs.containsKey(keyUsername))) {
        await prefs.setString(keyUsername, defaultAdminUser);
        await prefs.setString(keyPassword, defaultAdminPass);
        await prefs.setBool(keyIsAdmin, true);
      }
    } catch (e) {
      debugPrint('Fehler bei Admin-Initialisierung: $e');
    }
  }

  // Prüfen ob Admin-Login
  static Future<bool> isAdminLogin(String username, String password) async {
    try {
      return username == defaultAdminUser && password == defaultAdminPass;
    } catch (e) {
      debugPrint('Fehler bei Admin-Check: $e');
      return false;
    }
  }

  // Speichern der Anmeldedaten
  static Future<bool> saveCredentials(String username, String password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(keyUsername, username);
      await prefs.setString(keyPassword, password);
      await prefs.setBool(keyIsLoggedIn, true);
      return true;
    } catch (e) {
      debugPrint('Fehler beim Speichern: $e');
      return false;
    }
  }

  // Abrufen der Anmeldedaten
  static Future<Map<String, String?>> getCredentials() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return {
        'username': prefs.getString(keyUsername),
        'password': prefs.getString(keyPassword),
      };
    } catch (e) {
      debugPrint('Fehler beim Abrufen: $e');
      return {'username': null, 'password': null};
    }
  }

  // Prüfen ob Benutzer angemeldet ist
  static Future<bool> isLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(keyIsLoggedIn) ?? false;
    } catch (e) {
      debugPrint('Fehler beim Login-Status: $e');
      return false;
    }
  }

  // Abmelden und Daten löschen
  static Future<bool> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      return true;
    } catch (e) {
      debugPrint('Fehler beim Logout: $e');
      return false;
    }
  }
}
