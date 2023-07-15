import 'package:http/http.dart' as http;
import 'dart:convert';

import 'user.dart';

class UserRepository {
  Future<List<User>> getUsers(int page, int perPage) async {
    final response = await http.get(
      Uri.parse('https://reqres.in/api/users?page=$page&per_page=$perPage'),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final usersData = jsonData['data'];

      List<User> fetchedUsers = [];
      for (var user in usersData) {
        fetchedUsers.add(User.fromJson(user));
      }

      return fetchedUsers;
    } else {
      throw Exception('Failed to fetch users');
    }
  }
}
