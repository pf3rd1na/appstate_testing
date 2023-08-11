import 'package:firebase_remote_config/firebase_remote_config.dart';

class FirebaseConnect {
  static final remoteConfig = FirebaseRemoteConfig.instance;

  static Future<String?> loadLink() async {
    String result = '';
    try {
      await remoteConfig.fetchAndActivate();
      result = remoteConfig.getString('url');
    } catch (e) {
      return null;
    }
    return result;
  }
}
