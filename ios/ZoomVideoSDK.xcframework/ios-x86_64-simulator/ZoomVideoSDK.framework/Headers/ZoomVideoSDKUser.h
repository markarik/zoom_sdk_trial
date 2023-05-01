//
//  ZoomVideoSDKUserInfo.h
//  ZoomVideoSDK
//
//  Created by Zoom Video Communications on 2018/12/7.
//  Copyright © 2018 Zoom Video Communications, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZoomVideoSDKRawDataPipe.h"
#import "ZoomVideoSDKVideoCanvas.h"

/*!
 @class ZoomVideoSDKVideoStatisticInfo
 @brief Video statistic information.
*/
@interface ZoomVideoSDKVideoStatisticInfo : NSObject
/*!
 @brief frame width
 */
@property (nonatomic, assign) NSInteger     width;
/*!
 @brief frame height
 */
@property (nonatomic, assign) NSInteger     height;
/*!
 @brief frame per second
 */
@property (nonatomic, assign) NSInteger     fps;
/*!
 @brief bits per second
 */
@property (nonatomic, assign) NSInteger     bps;

@end

/*!
 @class ZoomVideoSDKShareStatisticInfo
 @brief Share statistic information.
*/
@interface ZoomVideoSDKShareStatisticInfo : NSObject
/*!
 @brief frame width
 */
@property (nonatomic, assign) NSInteger     width;
/*!
 @brief frame height
 */
@property (nonatomic, assign) NSInteger     height;
/*!
 @brief frame per second
 */
@property (nonatomic, assign) NSInteger     fps;
/*!
 @brief bits per second
 */
@property (nonatomic, assign) NSInteger     bps;

@end

/*!
 @class ZoomVideoSDKAudioStatus
 @brief Audio status of user
 */
@interface ZoomVideoSDKAudioStatus : NSObject
/*!
 @brief Determine whether the audio is muted.
 */
@property (nonatomic, assign) BOOL          isMuted;
/*!
 @brief Determine whether the user is talking.
 */
@property (nonatomic, assign) BOOL          talking;
/*!
 @brief Get audio type: VOIP (Voice over IP), Telephony, or None.
 */
@property (nonatomic, assign) ZoomVideoSDKAudioType  audioType;

@end

/*!
 @class ZoomVideoSDKUser
 @brief Zoom Video SDK user information.
 */
@interface ZoomVideoSDKUser : NSObject
/*!
 @brief Get the user's id.
 */
- (NSUInteger)getUserID;
/*!
 @brief Get the name of the user in the session.
 */
- (NSString *_Nullable)getUserName;
/*!
 @brief Get the user's custom identity.. Which pass in jwt token or in SDKSessionContext.customUserId
 */
- (NSString *_Nullable)getCustomUserId;
/*!
 @brief Determine whether the user is the host.
 */
- (BOOL)isHost;
/*!
 @brief Determine whether the user is the manager.
 */
- (BOOL)isManager;
/*!
 @brief Get the user's video status.
 @warning This interface be marked as deprecated, then it will be instead by ZoomVideoSDKRawDataPipe.videoStatus() and ZoomVideoSDKVideoCanvas.videoStatus()
 */
- (ZoomVideoSDKVideoStatus *_Nullable)videoStatus DEPRECATED_ATTRIBUTE;
/*!
 @brief Get the user's audio status.
 */
- (ZoomVideoSDKAudioStatus *_Nullable)audioStatus;
/*!
 @brief Get the user's share status.
 @warning This interface be marked as deprecated, then it will be instead by ZoomVideoSDKRawDataPipe.shareStatus() and ZoomVideoSDKVideoCanvas.shareStatus()
 */
- (ZoomVideoSDKShareStatus *_Nullable)shareStatus DEPRECATED_ATTRIBUTE;
/*!
 @brief Get the user's video statistic information.
 */
- (ZoomVideoSDKVideoStatisticInfo *_Nullable)getVideoStatisticInfo;
/*!
 @brief Get the user's share statistic information.
 */
- (ZoomVideoSDKShareStatisticInfo *_Nullable)getShareStatisticInfo;
/*!
 @brief Get the user's video pipe.
 */
- (ZoomVideoSDKRawDataPipe *_Nullable)getVideoPipe;
/*!
 @brief Get the user's multi-camera stream list.
 @return a list of all streaming cameras pipe. For more information, see [ZoomVideoSDKRawDataPipe].
 */
- (NSArray <ZoomVideoSDKRawDataPipe *> *_Nullable)getMultiCameraStreamList;
/*!
 @brief Get the user's share pipe.
 */
- (ZoomVideoSDKRawDataPipe *_Nullable)getSharePipe;
/*!
 @brief Get the user's video canvas.
 */
- (ZoomVideoSDKVideoCanvas *_Nullable)getVideoCanvas;
/*!
 @brief Get the user's multi-camera canvas list.
 @return a list of all video canvas. For more information, see [ZoomVideoSDKVideoCanvas].
 */
- (NSArray <ZoomVideoSDKVideoCanvas *> *_Nullable)getMultiCameraCanvasList;
/*!
 @brief The user's share canvas.
 */
- (ZoomVideoSDKVideoCanvas *_Nullable)getShareCanvas;

@end
