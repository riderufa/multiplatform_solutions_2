import 'package:flutter/material.dart';
import 'package:multiplatform_solutions_2/app_platform.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:webview_flutter/webview_flutter.dart';

WebViewController controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
    ),
  );

Widget webView(String link) => AppPlatform.isMobile
    ? WebViewWidget(
        controller: controller..loadRequest(Uri.parse(link)),
      )
    : Hyperlink(link: link);

class Hyperlink extends StatelessWidget {
  final String link;
  const Hyperlink({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Text(link),
      ),
      onTap: () {
        launchUrlString(link);
      },
    );
  }
}
