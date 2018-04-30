import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globals.dart' as globals;
import 'dart:core';

var apicreateurl = "https://new.lynkz.me";
var apideleteurl = "https://api.lynkz.me";

Create(String link) async{
  await http.post(apicreateurl, body: {"action": "new", "url": link, "json" : "true"})
      .then((response) {
    Map json = JSON.decode(response.body);
    globals.rsp[0] = json['lynkz_url'];
    globals.rsp[1] = json['delete_key'];
  });
  return [globals.rsp[0], globals.rsp[1]];
}

Delete(String identifier, String delete_key) async{
  await http.post(apideleteurl, body: {"action" : "delete", "identifier" : identifier, "delete_key" : delete_key}).then((response) {
  });
}

urlToIdentifier(String url){
  var identifier = url.substring(17);
  return identifier;
}

//this is only for testing stuff
main() async{
  var li = await Create("https://retrylife.ca");
  print(li[0]);

  print(urlToIdentifier(li[0]));
  Delete(urlToIdentifier(li[0]), li[1]);
}
