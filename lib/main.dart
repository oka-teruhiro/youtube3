import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:youtube_player_iframe_web_example/src/connectivity_sample.dart';

void main() {
  runApp(const MyApp());
}

///
class MyApp extends StatelessWidget {
  ///
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Youtube Player Iframe Web Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Youtube Player Iframe Web Demo'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: SizedBox(
            height: 1000,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return const Column(
                    children: [
                      SizedBox(
                        height:400,
                          child: PlayerWidget(),
                      ),
                      Divider(),
                      Expanded(child: _WebViewWidget()),
                    ],
                  );
                }

                return const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: PlayerWidget()),
                    VerticalDivider(),
                    Expanded(child: _WebViewWidget()),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

///
class PlayerWidget extends StatelessWidget {
  ///
  const PlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectivitySample(
      child: YoutubePlayer(
        controller: YoutubePlayerController.fromVideoId(
          videoId: 'StwDgaLTwwQ',
          params: const YoutubePlayerParams(
            showControls: true,
            showFullscreenButton: true,
          ),
        ),
        aspectRatio: 5 / 8,
      ),
    );
  }
}

class _WebViewWidget extends StatefulWidget {
  const _WebViewWidget();

  @override
  State<_WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<_WebViewWidget> {
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()..loadRequest(Uri.https('okatoku331.net'));
  }

  late final WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return ConnectivitySample(child: WebViewWidget(controller: _controller));
  }
}