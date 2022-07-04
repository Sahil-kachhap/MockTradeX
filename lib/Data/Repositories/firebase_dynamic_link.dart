import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

class FirebaseDynamicLinkService{

  static Future<String> createDynamicLink() async{
    FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      // The Dynamic Link URI domain. You can view created URIs on your Firebase console
      uriPrefix: 'https://mocktradex.page.link',
      // The deep Link passed to your application which you can use to affect change
      link: Uri.parse('https://mocktradex.page.link/mVFa'),
      // Android application details needed for opening correct app on device/Play Store
      androidParameters: const AndroidParameters(
        packageName: 'com.example.mock_tradex',
        minimumVersion: 1,
      ),
      // iOS application details needed for opening correct app on device/App Store

    );

    final Uri uri = await dynamicLinks.buildLink(parameters);
    return uri.toString();
  }

}