import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globals.dart' as globals;

var apiurl = "https://new.lynkz.me";

apiCreate(String link) async{
  await http.post(apiurl, body: {"action": "new", "url": link, "json" : "true"})
      .then((response) {
    Map json = JSON.decode(response.body);
    globals.rsp[0] = json['lynkz_url'];
    globals.rsp[1] = json['delete_key'];
  });
  return [globals.rsp[0], globals.rsp[1]];
}

//this is only for testing stuff
main() async{
   var li = await apiCreate("https://retrylife.ca");
  print(li[1]);
}