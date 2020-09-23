import 'dart:async';
import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';


class PlaySongsModel with ChangeNotifier{
  AudioPlayer _audioPlayer = AudioPlayer();
  StreamController<String> _curPositionController = StreamController<String>.broadcast();


  int curIndex = 0;
  Duration curSongDuration;
  AudioPlayerState _curState;
  Stream<String> get curPositionStream => _curPositionController.stream;
  AudioPlayerState get curState => _curState;


  void init() {

  }

  // 歌曲进度
  void sinkProgress(int m){
    _curPositionController.sink.add('$m-${curSongDuration.inMilliseconds}');
  }



  /// 暂停、恢复
  void togglePlay(){
    if (_audioPlayer.state == AudioPlayerState.PAUSED) {
      resumePlay();
    } else {
      pausePlay();
    }
  }

  // 暂停
  void pausePlay() {
    _audioPlayer.pause();
  }

  /// 跳转到固定时间
  void seekPlay(int milliseconds){
    _audioPlayer.seek(Duration(milliseconds: milliseconds));
    resumePlay();
  }

  /// 恢复播放
  void resumePlay() {
    _audioPlayer.resume();
  }

  @override
  void dispose() {
    super.dispose();
    _curPositionController.close();
    _audioPlayer.dispose();
  }


}
