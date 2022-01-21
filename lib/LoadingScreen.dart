import 'package:flutter/material.dart';
import 'package:untitled2/MainPage.dart';
import 'package:video_player/video_player.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  VideoPlayerController _videoController;

  bool _isVideoEnded = false;
  bool _videoError = false;

  @override
  void initState() {
    super.initState();
    _loadVideoPlayer();

  }

  _loadVideoPlayer() {
    _videoController = VideoPlayerController.asset(
      'assets/Home15.mp4',
    )..addListener(_listener);

    _videoController.initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      setState(() {});
      _videoController.play();
    }).catchError((error){
      print("load video error $error");
    });
    // _videoController.setLooping(true);

  }

  _listener() {
    if(!_videoController.value.isPlaying && _videoController.value.duration > Duration(seconds: 0) &&
        _videoController.value.position >= _videoController.value.duration - Duration(milliseconds: 300)) {
      // blog('video Ended');
      if (!_isVideoEnded) {
        _gotoOnboard();
      }
    }
  }


  @override
  void dispose() {
    super.dispose();
    // _controller.dispose();
    _videoController.dispose();
    // if (_videoController.value.isPlaying) _videoController.pause();
    // _videoController = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _imageView(),
          ),
          Positioned.fill(
            // child: _imageView(),
            // child: _lottieView(),
            child: _videoError ? _imageView() : _videoView(),
          ),
          if (_isVideoEnded) _loadingStatus(),
        ],
      ),
    );
  }

  Widget _imageView(){
    return  Image.asset("assets/Splash.png", fit: BoxFit.fill,);
  }

  Widget _videoView() {
    if (_videoController.value.isInitialized){
      return AspectRatio(
        aspectRatio: _videoController.value.aspectRatio,
        child: VideoPlayer(_videoController),
      );
    }
    return _imageView();
  }

  Widget _loadingStatus() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      alignment: Alignment.bottomCenter,
      child: CircularProgressIndicator(color: Colors.white,),
    );
  }

  void _gotoOnboard()  {
    // _videoController.pause();
    _videoController.removeListener(_listener);
    // _videoController = null;

    // Future.delayed(const Duration(milliseconds: 500), () {
    // HomeNavigator().goToMainPageFromLoading(context, _listModel, homeData);
    // });

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context,) => MainPage()));


  }


}

