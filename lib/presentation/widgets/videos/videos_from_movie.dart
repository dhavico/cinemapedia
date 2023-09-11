import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  final String youtubeId;
  final String name;

  const YoutubeVideoPlayer(
      {super.key, required this.youtubeId, required this.name});

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
        initialVideoId: widget.youtubeId,
        flags: const YoutubePlayerFlags(
          hideThumbnail: true,
          //showLiveFullscreenButton: false,
          //mute: false,
          autoPlay: false,
          disableDragSeek: true,
          // loop: false,
          // isLive: false,
          // forceHD: false,
          enableCaption: false,
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.name),
        YoutubePlayer(controller: _controller),
      ],
    );
  }
}
