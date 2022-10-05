import 'package:Gayd/Screen/Welcome.dart';
import 'package:Gayd/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';

class WalkthroughScreen extends StatelessWidget {
  final List<OnbordingData> list = [
    OnbordingData(
      image: AssetImage("asset/logo.jpg"),
      titleText: Text(
        "اهلا بكم في تطبيق قايض",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      descText: Text(
        "افضل تطبيق للمقايضة والتسوق",
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange),
      ),
    ),
    OnbordingData(
      image: AssetImage("asset/1.PNG"),
      titleText: Text("وفر أموالك معنا"),
      descText: Text(
          "يمكنك مقايضة ممتلكات غير المفيدة باغراض تحتاجها بدون دفع المال"),
    ),
    OnbordingData(
      image: AssetImage("asset/2.PNG"),
      titleText: Text("تسوق من المنزل"),
      descText:
          Text("يمكنك ايضا تطبيق قايض من التسوق والدفع بالبطاقة من المنزل"),
    ),
    OnbordingData(
      image: AssetImage("asset/3.PNG"),
      titleText: Text("نعمل على ارضائك"),
      descText: Text(""),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroScreen(
      onbordingDataList: list,
      colors: [
        Colors.white,
        Colors.red,
      ],
      pageRoute: MaterialPageRoute(
        builder: (context) => Welcome(),
      ),
      nextButton: Text(
        "التالي",
        style: TextStyle(
          color: primaryColor,
        ),
      ),
      lastButton: Text(
        "الدخول",
        style: TextStyle(
          color: primaryColor,
        ),
      ),
      skipButton: Text(
        "تخطي",
        style: TextStyle(
          color: primaryColor,
        ),
      ),
      selectedDotColor: Colors.orange,
      unSelectdDotColor: Colors.grey,
    );
  }
}
