import 'package:http/http.dart' as http;
import 'dart:convert';
import 'globals.dart' as globals;

var apiurl = "https://new.lynkz.me";

Create(String link) async{
  await http.post(apiurl, body: {"action": "new", "url": link, "json" : "true"})
      .then((response) {
    Map json = JSON.decode(response.body);
    globals.rsp[0] = json['lynkz_url'];
    globals.rsp[1] = json['delete_key'];
  });
  return [globals.rsp[0], globals.rsp[1]];
}

Delete(String link, String delete_key) async{
 
 return "feature incomplete";
}

//this is only for testing stuff
main() async{
  var li = await Create("https://retrylife.ca");
  print(li[1]);
}
