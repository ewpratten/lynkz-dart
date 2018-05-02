import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globals.dart' as globals;
import 'dart:core';

Create(String link) async {
  await http.post(globals.apicreateurl,
      body: {"action": "new", "url": link, "json": "true"}).then((response) {
    Map json = JSON.decode(response.body);
    globals.rsp[0] = json['lynkz_url'];
    globals.rsp[1] = json['delete_key'];
  });
  return [globals.rsp[0], globals.rsp[1]];
}

Delete(String identifier, String delete_key) async {
  await http.post(globals.apideleteurl, body: {
    "action": "delete",
    "identifier": identifier,
    "delete_key": delete_key
  }).then((response) {});
}

urlToIdentifier(String url) {
  var identifier = url.substring(17);
  return identifier;
}