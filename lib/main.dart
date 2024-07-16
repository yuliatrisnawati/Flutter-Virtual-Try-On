// import 'package:flutter/material.dart';
// import 'package:fashion_lens/pages/detection.dart';
// import 'package:fashion_lens/pages/edit_profile.dart';
// import 'package:fashion_lens/pages/female_blouse.dart';
// import 'package:fashion_lens/pages/female_dress.dart';
// import 'package:fashion_lens/pages/female_jacket.dart';
// import 'package:fashion_lens/pages/female_short.dart';
// import 'package:fashion_lens/pages/female_skirt.dart';
// import 'package:fashion_lens/pages/forgot_password.dart';
// import 'package:fashion_lens/pages/landing_page.dart';
// import 'package:fashion_lens/pages/landing_page_2.dart';
// import 'package:fashion_lens/pages/male_jacket.dart';
// import 'package:fashion_lens/pages/male_or_female.dart';
// import 'package:fashion_lens/pages/male_pants.dart';
// import 'package:fashion_lens/pages/male_shirts.dart';
// import 'package:fashion_lens/pages/male_shorts.dart';
// import 'package:fashion_lens/pages/male_sweatshirt.dart';
// import 'package:fashion_lens/pages/profile.dart';
// import 'package:fashion_lens/pages/profile_1.dart';
// import 'package:fashion_lens/pages/set_password.dart';
// import 'package:fashion_lens/pages/sign_in.dart';
// import 'package:fashion_lens/pages/sign_up.dart';
// import 'package:fashion_lens/pages/verification.dart';
// import 'package:camera/camera.dart';

// List<CameraDescription>? cameras;

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   try {
//     cameras = await availableCameras();
//   } on CameraException catch (e) {
//     print('Error in fetching the cameras: $e');
//   }

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Fashion Lens',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => LandingPage(),
//         '/landingpage2': (context) => LandingPage2(),
//         '/signup': (context) => SignUp(),
//         '/signin': (context) => SignIn(),
//         '/verificationemail': (context) => Verification(),
//         '/forgotpassword': (context) => ForgotPassword(),
//         '/setpassword': (context) => SetPassword(),
//         '/profile': (context) => Profile(),
//         '/profile1': (context) => Profile1(),
//         '/editprofile': (context) => EditProfile(),
//         '/deteksi': (context) => Detection(),
//         '/maleorfemale': (context) => MaleOrFemale(),
//         '/femalejacket': (context) => FemaleJacket(),
//         '/femaledress': (context) => FemaleDress(),
//         '/femaleshort': (context) => FemaleShort(),
//         '/femaleskirt': (context) => FemaleSkirt(),
//         '/femaleblouse': (context) => FemaleBlouse(),
//         '/malejacket': (context) => MaleJacket(),
//         '/maleshorts': (context) => MaleShorts(),
//         '/malepants': (context) => MalePants(),
//         '/malesweatshirt': (context) => MaleSweatshirt(),
//         '/maleshirts': (context) => MaleShirts(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fashion_lens/pages/detection.dart';
import 'package:fashion_lens/pages/edit_profile.dart';
import 'package:fashion_lens/pages/female_blouse.dart';
import 'package:fashion_lens/pages/female_dress.dart';
import 'package:fashion_lens/pages/female_jacket.dart';
import 'package:fashion_lens/pages/female_short.dart';
import 'package:fashion_lens/pages/female_skirt.dart';
import 'package:fashion_lens/pages/forgot_password.dart';
import 'package:fashion_lens/pages/landing_page.dart';
import 'package:fashion_lens/pages/landing_page_2.dart';
import 'package:fashion_lens/pages/male_jacket.dart';
import 'package:fashion_lens/pages/male_or_female.dart';
import 'package:fashion_lens/pages/male_pants.dart';
import 'package:fashion_lens/pages/male_shirts.dart';
import 'package:fashion_lens/pages/male_shorts.dart';
import 'package:fashion_lens/pages/male_sweatshirt.dart';
import 'package:fashion_lens/pages/profile.dart';
import 'package:fashion_lens/pages/profile_1.dart';
import 'package:fashion_lens/pages/set_password.dart';
import 'package:fashion_lens/pages/sign_in.dart';
import 'package:fashion_lens/pages/sign_up.dart';
import 'package:fashion_lens/pages/verification.dart';
import 'package:camera/camera.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fashion Lens',
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
        '/landingpage2': (context) => LandingPage2(),
        '/signup': (context) => SignUp(),
        '/signin': (context) => SignIn(),
        '/verificationemail': (context) => Verification(),
        '/forgotpassword': (context) => ForgotPassword(),
        '/setpassword': (context) => SetPassword(),
        '/profile': (context) => Profile(),
        '/profile1': (context) => Profile1(),
        '/editprofile': (context) => EditProfile(),
        '/deteksi': (context) => Detection(),
        '/maleorfemale': (context) => MaleOrFemale(),
        '/femalejacket': (context) => FemaleJacket(),
        '/femaledress': (context) => FemaleDress(),
        '/femaleshort': (context) => FemaleShort(),
        '/femaleskirt': (context) => FemaleSkirt(),
        '/femaleblouse': (context) => FemaleBlouse(),
        '/malejacket': (context) => MaleJacket(),
        '/maleshorts': (context) => MaleShorts(),
        '/malepants': (context) => MalePants(),
        '/malesweatshirt': (context) => MaleSweatshirt(),
        '/maleshirts': (context) => MaleShirts(),
      },
    );
  }
}
