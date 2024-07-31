import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationService {
  static Future<void> init() async {
    await AwesomeNotifications().initialize(
        '',
        [
          NotificationChannel(
            channelKey: 'high_importance_channel',
            channelGroupKey: 'high_importance_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white,
            channelShowBadge: true,
            onlyAlertOnce: true,
            playSound: true,
            criticalAlerts: true,
            importance: NotificationImportance.Max,
            
          )
        ],
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: 'high_importance_channel_group',
            channelGroupName: 'Group 1',
          )
        ],
        debug: true);

    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('Notification created: ${receivedNotification.id}');
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('Notification displayed: ${receivedNotification.id}');
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('Notification dismissed: ${receivedAction.id}');
    final payload = receivedAction.payload ?? {};
    if (payload['navigate'] == "true") {
      print('navigate');
    }
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('Action received: ${receivedAction.id}');
  }

  static Future<void> showNotification({
    required String title,
    required String body,
    final String? summary,
    final Map<String, String>? payload,
    final ActionType actionType = ActionType.Default,
    final NotificationLayout notificationLayout = NotificationLayout.BigPicture,
    final NotificationCategory? category,
    final String? bigPicture,
    final List<NotificationActionButton>? actionButtons,
    final bool scheduled = false,
    final int? interval,
  }) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'high_importance_channel',
        title: title,
        body: body,
        summary: summary,
        payload: payload,
        notificationLayout: notificationLayout,
        actionType: actionType,
        category: category,
        bigPicture: bigPicture,
      ),
      actionButtons: actionButtons,
      schedule: scheduled
          ? NotificationInterval(
              interval: interval!,
              timeZone:
                  await AwesomeNotifications().getLocalTimeZoneIdentifier(),
              preciseAlarm: true,
            )
          : null,
    );
  }
}
