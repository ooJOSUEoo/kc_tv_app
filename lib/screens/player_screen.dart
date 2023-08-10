import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerScreen extends StatefulWidget {
  final String url;
  const PlayerScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;
  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  bool _isPlayerReady = false;
  late String _videoId;


  @override
  void initState() {
    super.initState();
    _videoId = YoutubePlayer.convertUrlToId(widget.url).toString();
    _controller = YoutubePlayerController(
      initialVideoId: _videoId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      )
    );
    // ..addListener(listener)
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}