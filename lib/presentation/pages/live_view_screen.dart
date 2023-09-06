import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:ReNew8/controller/home_controller.dart';

import 'live_widget.dart';

class LiveViewScreen extends StatefulWidget {
  final String url;

  const LiveViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<LiveViewScreen> createState() => _LiveViewScreenState();
}

class _LiveViewScreenState extends State<LiveViewScreen> {
  VlcPlayerController? vlcPlayerController;

  liveFun() {
    vlcPlayerController = VlcPlayerController.network(widget.url,
        hwAcc: HwAcc.auto,
        autoInitialize: true,
        autoPlay: true,
        options: VlcPlayerOptions(
          rtp: VlcRtpOptions(['--rtsp-tcp']),
        ));
  }

  @override
  void initState() {
    liveFun();

    LiveWidget(
      homeController: HomeController(),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: VlcPlayer(
          virtualDisplay: true,
          controller: vlcPlayerController!,
          aspectRatio: 16 / 9,
          placeholder: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
