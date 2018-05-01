# lynkz
## The somewhat official wrapper for lynkz.me written in Dartlang
By: Evan Pratten

# How to use

```Dart
import 'package:lynkz/lynkz.dart' as lynkz;

main() async{
// shorten a link
var shortenedlink = await lynkz.Create("Https://link.here");

// print that link
print(shortenedlink[0]);

// get the link id
var linkid = lynkz.urlToIdentifier(shortenedlink[0]);

// get the delete key
var deletekey = shortenedlink[1];

// delete that link
lynkz.Delete(linkid, deletekey);
}
```
