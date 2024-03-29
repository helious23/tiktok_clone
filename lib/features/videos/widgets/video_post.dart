import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoints.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_bgm.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:tiktok_clone/features/videos/widgets/video_comments.dart';
import 'package:tiktok_clone/features/videos/widgets/video_tag.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  const VideoPost({
    super.key,
    required this.onVideoFinished,
    required this.index,
  });

  final Function onVideoFinished;
  final int index;

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.MOV");

  late final AnimationController _animationController;

  bool _isPaused = false;
  bool _isMuted = false;

  final Duration _animationDuration = const Duration(milliseconds: 200);

  final List<String> tags = [
    "가야랜드🎢",
    "Super Viking",
    "Camp site",
    "With Soyeul💖",
  ];

  void _onVideoChanged() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    if (kIsWeb) {
      await _videoPlayerController.setVolume(0);
      _isMuted = true;
    }
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    _videoPlayerController.addListener(_onVideoChanged);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) return;
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onTogglePause();
    }
  }

  void _onTogglePause() {
    if (!mounted) return;
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onTogglePause();
    }
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      constraints: const BoxConstraints(
        maxWidth: Breakpoints.sm,
      ),
      builder: (context) => const VideoComments(),
      isScrollControlled: true,
    );
    _onTogglePause();
  }

  void _onToggleVolume() {
    _videoPlayerController.setVolume(_isMuted ? 100 : 0);
    setState(() {
      _isMuted = !_isMuted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: Breakpoints.sm,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: _videoPlayerController.value.isInitialized
                    ? VideoPlayer(_videoPlayerController)
                    : Container(
                        color: Colors.black,
                      ),
              ),
              Positioned.fill(
                child: GestureDetector(
                  onTap: _onTogglePause,
                ),
              ),
              Positioned.fill(
                child: IgnorePointer(
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _animationController.value,
                          child: child,
                        );
                      },
                      child: AnimatedOpacity(
                        duration: _animationDuration,
                        opacity: _isPaused ? 1 : 0,
                        child: const FaIcon(
                          FontAwesomeIcons.play,
                          color: Colors.white,
                          size: Sizes.size56,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (kIsWeb)
                Positioned(
                  left: 20,
                  top: 20,
                  child: GestureDetector(
                    onTap: _onToggleVolume,
                    child: Container(
                      height: Sizes.size32,
                      width: Sizes.size32,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: FaIcon(
                          _isMuted
                              ? FontAwesomeIcons.volumeXmark
                              : FontAwesomeIcons.volumeHigh,
                          color: Colors.white,
                          size: Sizes.size12,
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                bottom: 20,
                left: 10,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "@Max",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gaps.v10,
                      const Text(
                        "Super Viking with Soyeul 💖 ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: Sizes.size18,
                        ),
                      ),
                      Gaps.v10,
                      VideoTag(
                        tag: tags.map((tag) => '#$tag').join(', '),
                      ),
                      Gaps.v10,
                      SizedBox(
                        height: 30,
                        width: MediaQuery.of(context).size.width / 2,
                        child: const VideoBgmInfo(bgmInfo: "10cm - 봄이 좋냐?"),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      foregroundImage: NetworkImage(
                          'https://avatars.githubusercontent.com/u/78624290?v=4'),
                      child: Text("Max"),
                    ),
                    Gaps.v24,
                    VideoButton(
                      icon: FontAwesomeIcons.solidHeart,
                      text: S.of(context).likeCount(1230091238),
                    ),
                    Gaps.v24,
                    GestureDetector(
                      onTap: () => _onCommentTap(context),
                      child: VideoButton(
                        icon: FontAwesomeIcons.solidComment,
                        text: S.of(context).commentCount(929038),
                      ),
                    ),
                    Gaps.v24,
                    const VideoButton(
                      icon: FontAwesomeIcons.share,
                      text: "Share",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
