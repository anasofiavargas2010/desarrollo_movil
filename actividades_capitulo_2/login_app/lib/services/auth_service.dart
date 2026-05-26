import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService {
  static const String _usersKey = 'users';
  static const String _currentUserKey = 'current_user';

  // Guardar usuario registrado
  Future<bool> registerUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Obtener usuarios existentes
    List<String>? usersList = prefs.getStringList(_usersKey);
    List<Map<String, dynamic>> users = [];
    
    if (usersList != null) {
      users = usersList
          .map((userJson) => jsonDecode(userJson) as Map<String, dynamic>)
          .toList();
    }
    
    // Verificar si el email ya está registrado
    if (users.any((u) => u['email'] == user.email)) {
      return false; // Usuario ya existe
    }
    
    // Agregar nuevo usuario
    users.add(user.toJson());
    
    // Guardar lista actualizada
    List<String> updatedList = users
        .map((user) => jsonEncode(user))
        .toList();
    
    await prefs.setStringList(_usersKey, updatedList);
    return true;
  }
  
  // Iniciar sesión
  Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    
    List<String>? usersList = prefs.getStringList(_usersKey);
    
    if (usersList == null) return false;
    
    for (String userJson in usersList) {
      Map<String, dynamic> user = jsonDecode(userJson);
      if (user['email'] == email && user['password'] == password) {
        // Guardar usuario actual
        await prefs.setString(_currentUserKey, userJson);
        return true;
      }
    }
    
    return false;
  }
  
  // Obtener usuario actual
  Future<User?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString(_currentUserKey);
    
    if (userJson != null) {
      return User.fromJson(jsonDecode(userJson));
    }
    return null;
  }
  
  // Cerrar sesión
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_currentUserKey);
  }
  
  // Verificar si hay sesión activa
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_currentUserKey);
  }
}