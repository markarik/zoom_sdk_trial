# Zoom Video SDK for Flutter - Beta

## Beta note
Note for beta (to be added to the top of the intro doc page):

We’d love for you to join the public beta for the addition of the Flutter wrapper to our Video SDK. With this additional framework, you’re able to accelerate development of natively compiled, multi-platform, video-based applications from a single codebase, while building with Zoom’s core technology.

Please [share your feedback](https://zoom.sjc1.qualtrics.com/jfe/form/SV_9GKCAz47kNTobB4?jfefe=new) before March 20, 2023. Thank you for being a Zoom tester!

## Introduction
Flutter Wrapper for Video SDK enables you to build custom applications with access to raw video and audio data. With this additional framework, you’re able to accelerate development of natively compiled, multi-platform, video-based applications from a single codebase, while building with Zoom’s core technology. [Learn more about Video SDK](https://marketplace.zoom.us/docs/sdk/video/introduction/).

## Before you start
* Install Flutter on your computer, please visit [Flutter.dev](https://docs.flutter.dev/get-started/install) for more information.
* Set up a [developer account](https://marketplace.zoom.us/docs/sdk/video/developer-accounts/) to get your credentials.
* Learn how to use your Video SDK key and secret to [authorize](https://marketplace.zoom.us/docs/sdk/video/auth/) use.
* Download the SDK package from the [Marketplace](https://marketplace.zoom.us/) and [get started](https://marketplace.zoom.us/docs/sdk/video/flutter/get-started)!

## Configure and run the sample app

### Configure the sample app
* Fill in the SDK Key & Secret in `/flutter-zoom-video-sdk/example/lib/config.dart`.
* Verify that the example configuration is correct in `/flutter-zoom-video-sdk/example/lib/main.dart`:
    ```
InitConfig initConfig = InitConfig(
    domain: 'zoom.us',
    enableLog: false,
);
```
### Run the sample app
In `/flutter-zoom-video-sdk/example/lib`, run this command on the console:
`flutter run`
If there are multiple devices available, there will be a list shown on the console, select the device you want to launch the app on.
To see more details about the sample app as it's running, run the Android sample app in Android Studio and the iOS sample app on Xcode. 

## Need help?

If you're looking for help, try [Developer Support](https://devsupport.zoom.us/) or our [Developer Forum](https://devforum.zoom.us). Priority support is also available with [Premier Developer Support plans](https://zoom.us/docs/en-us/developer-support-plans.html).

---
Copyright ©2023 Zoom Video Communications, Inc. All rights reserved.





