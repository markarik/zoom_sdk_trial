import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk.dart';
import 'package:flutter_zoom_videosdk/native/zoom_videosdk_user.dart';

const SHOW_TALKING_ICON_DURATION = 2000;

class View extends HookWidget {
  final Map<String, dynamic> creationParams;
  const View({super.key, required this.creationParams});

  @override
  Widget build(BuildContext context) {
    var isSharing = useState(false);
    // This is used in the platform side to register the view.
    String viewType = '<platform-view-type>';

    if (isSharing.value != (creationParams["sharing"] as bool)) {
      isSharing.value = !isSharing.value;
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        );
      case TargetPlatform.iOS:
        return UiKitView(
          viewType: viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: creationParams,
          creationParamsCodec: const StandardMessageCodec(),
        );
      default:
        throw UnsupportedError("Unsupported platform");
    }
  }
}

class VideoView extends HookWidget {
  final ZoomVideoSdkUser? user;
  final bool sharing;
  final bool preview;
  final bool focused;
  final bool hasMultiCamera;
  final String multiCameraIndex;
  final String? videoAspect;
  final bool fullScreen;

  const VideoView({
    super.key,
    required this.user,
    required this.sharing,
    required this.preview,
    required this.focused,
    required this.hasMultiCamera,
    required this.multiCameraIndex,
    this.videoAspect,
    required this.fullScreen,
  });

  @override
  Widget build(BuildContext context) {
    var isVideoOn = useState(false);
    var isTalking = useState(false);
    var isMuted = useState(false);
    var isMounted = useIsMounted();
    var zoom = ZoomVideoSdk();
    var isSharing = useState(false);
    user?.audioStatus?.isMuted().then((muted) => isMuted.value = muted);

    useEffect(() {
      updateVideoStatus() {
        if (user == null) return;
        Future<void>.microtask(() async {
          if (isMounted()) {
            isVideoOn.value = (await user!.videoStatus!.isOn());
            isSharing.value = sharing;
          }
        });
      }

      resetAudioStatus() {
        isTalking.value = false;
        isMuted.value = false;
      }

      updateAudioStatus() async {
        if (!isMounted()) return;
        var talking = await user?.audioStatus?.isTalking();
        var muted = await user?.audioStatus?.isMuted();
        isMuted.value = muted!;
        isTalking.value = talking!;
        if (talking) {
          Timer(
              const Duration(milliseconds: SHOW_TALKING_ICON_DURATION),
              () => {
                    if (isMounted())
                      {
                        isTalking.value = false,
                      }
                  });
        }
      }

      updateVideoStatus();
      return null;
    }, [zoom, user]);

    ImageIcon audioStatusIcon;
    if (isTalking.value) {
      audioStatusIcon = const ImageIcon(
        AssetImage("assets/icons/talking@2x.png"),
      );
    } else if (isMuted.value) {
      audioStatusIcon = const ImageIcon(
        AssetImage("assets/icons/muted@2x.png"),
      );
    }
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};
    creationParams.putIfAbsent("userId", () => user?.userId);
    creationParams.putIfAbsent("sharing", () => sharing);
    creationParams.putIfAbsent("preview", () => preview);
    creationParams.putIfAbsent("focused", () => focused);
    creationParams.putIfAbsent("hasMultiCamera", () => hasMultiCamera);
    if (videoAspect == null) {
      creationParams.putIfAbsent("videoAspect", () => VideoAspect.PanAndScan);
    } else {
      creationParams.putIfAbsent("videoAspect", () => videoAspect);
    }
    creationParams.putIfAbsent("fullScreen", () => fullScreen);

    if (fullScreen) {
      if (sharing) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: View(creationParams: creationParams),
        );
      } else if (isVideoOn.value) {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: View(creationParams: creationParams),
        );
      } else {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 0),
          child: Container(
              alignment: Alignment.center,
              child: const Image(
                image: AssetImage("assets/icons/default-avatar.png"),
              )),
        );
      }
    } else {
      if (isVideoOn.value || sharing) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 110,
          width: 110,
          child: Stack(
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: const Color(0xff232323),
                  border: Border.all(
                    color: const Color(0xff666666),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                alignment: Alignment.center,
                child: View(creationParams: creationParams),
              ),
              Container(
                height: 110,
                width: 110,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 20,
                  width: 110,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  user!.userName,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(right: 5, bottom: 5),
                // height: 110,
                // width: 110,
                child: Image(
                  height: 12,
                  width: 12,
                  image: isMuted.value
                      ? const AssetImage("assets/icons/muted@2x.png")
                      : const AssetImage("assets/icons/talking@2x.png"),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        );
      } else {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 110,
          width: 110,
          child: Stack(
            children: [
              Container(
                height: 110,
                width: 110,
                decoration: BoxDecoration(
                  color: const Color(0xff232323),
                  border: Border.all(
                    color: const Color(0xff666666),
                    width: 1,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                alignment: Alignment.center,
                child: Container(
                    alignment: Alignment.center,
                    child: const Image(
                      height: 60,
                      width: 60,
                      image: AssetImage("assets/icons/default-avatar.png"),
                    )),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 20,
                  width: 110,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.only(left: 5),
                child: Text(
                  user!.userName,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: const EdgeInsets.only(right: 5, bottom: 5),
                child: Image(
                  height: 12,
                  width: 12,
                  image: isMuted.value
                      ? const AssetImage("assets/icons/muted@2x.png")
                      : const AssetImage("assets/icons/talking@2x.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        );
      }
    }
  }
}
