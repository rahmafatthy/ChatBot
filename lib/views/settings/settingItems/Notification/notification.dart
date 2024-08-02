import 'package:flutter/material.dart';

import '../../../../componant/Notification_item.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';

class Notifi extends StatelessWidget {
  const Notifi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          title: const Text(Notifications),
          backgroundColor: primaryColor,
          actions: const [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.delete,
                color: secondaryPrimaryColor,
                size: 25,
              ),
            )
          ],
        ),
        body: const Column(
          children: [
            NotificationItem(
              image: notifi_item1,
              title: TransactionCompleted,
              subtitle: sub,
              time: duration,
            ),
            NotificationItem(
              image: hindi,
              title: TransactionCompleted,
              subtitle: sub,
              time: duration,
            ),
            NotificationItem(
              image: arabic,
              title: TransactionCompleted,
              subtitle: sub,
              time: duration,
            ),
          ],
        ));
  }
}
