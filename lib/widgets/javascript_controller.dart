@JS()
library blockchainlogic.js;

import 'package:js/js.dart';
//import 'dart:js_util';

@JS()
external dynamic submitFile(var _file);
external dynamic login();
external dynamic loggedIn();
external dynamic logout();
external dynamic setMeme(String _memeHash);
external dynamic getMeme();
