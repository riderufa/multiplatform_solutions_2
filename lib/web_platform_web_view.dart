import 'dart:html';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

Widget webView(String link) => WebPlatformWebView(link: link);

class WebPlatformWebView extends StatelessWidget {
  final String link;
  const WebPlatformWebView({super.key, required this.link});

  @override
  Widget build(BuildContext context) {
    final id = Random().nextInt.toString();
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory(id, (int viewId) => IFrameElement()..src = link);
    return Container(
      child: HtmlElementView(viewType: id),
    );
  }
}
