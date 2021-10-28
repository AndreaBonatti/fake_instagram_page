import 'package:fake_instagram_page/model/profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<ProfileModel> downloadUserProfile() async {
  final response = await http
      .get(Uri.parse("https://www.instagram.com/thisisbillgates/?__a=1"));

  if (response.statusCode != 200) {
    throw Exception("Error while dowloading user profile");
  }

  final data = json.decode(response.body);
  return ProfileModel.fromData(data);
}
