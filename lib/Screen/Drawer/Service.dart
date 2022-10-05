import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
class Servicee extends StatelessWidget {
  const Servicee ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      
  
    return Scaffold(
        
          body: const WebView(
            initialUrl: 'http://global.sharp/corporate/eco/social/customer_satisfaction/',
            javascriptMode: JavascriptMode.unrestricted,
          ),
        );
  }
}
