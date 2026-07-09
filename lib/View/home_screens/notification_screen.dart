import 'package:docter_appointment_app/Modal/notification_modal.dart';
import 'package:docter_appointment_app/Service/notification_api.dart';
import 'package:docter_appointment_app/View/home_screens/components/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final NotificationApi notificationApi = NotificationApi();
  List<NotificationModal> notification = [];
  List<NotificationItem> todayNotifications = [];
List<NotificationItem> yesterdayNotifications = [];
List<NotificationItem> olderNotifications = [];

  @override
  void initState() {
    super.initState();
    loadNotification();
  }

 Future<void> loadNotification() async {
  notification = await notificationApi.getNotificationApi();

  final items = notification.first.notifications;

  todayNotifications.clear();
  yesterdayNotifications.clear();
  olderNotifications.clear();

  final now = DateTime.now();

  for (var item in items) {
    final date = item.createdAt;

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      todayNotifications.add(item);
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      yesterdayNotifications.add(item);
    } else {
      olderNotifications.add(item);
    }
  }

  setState(() {});
}

String getNotificationTime(DateTime createdAt) {
  final now = DateTime.now();
  final difference = now.difference(createdAt);

  if (difference.inMinutes < 1) {
    return "Just now";
  }

  if (difference.inMinutes < 60) {
    return "${difference.inMinutes}m";
  }

  if (difference.inHours < 24) {
    return "${difference.inHours}h";
  }

  if (difference.inDays == 1) {
    return "1d";
  }

  if (difference.inDays < 7) {
    return "${difference.inDays}d";
  }

  return "${createdAt.day}/${createdAt.month}/${createdAt.year}";
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Notification",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
              ),
              //height: 30, width: 50, 
              
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text("1 New",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14
                ),
                
                ),
              ),
              ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TODAY",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Mark all as read",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                itemCount:  todayNotifications.length ,
                itemBuilder: (context, index) {
                  
                      
                  return NotificationCard(
                    title: todayNotifications[index].title,
                    content: todayNotifications[index].message,
                    time: getNotificationTime(todayNotifications[index].createdAt),
                  );
                },
              ),
        
        
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "YESTERDAY",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Mark all as read",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
        
        
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                itemCount:  yesterdayNotifications.length ,
                itemBuilder: (context, index) {
                  
                      
                  return NotificationCard(
                    title: yesterdayNotifications[index].title,
                    content: yesterdayNotifications[index].message,
                    time: getNotificationTime(yesterdayNotifications[index].createdAt)
                  );
                },
              ),
        
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "OLDER",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Mark all as read",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
        
        
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                itemCount:  olderNotifications.length ,
                itemBuilder: (context, index) {
                  
                      
                  return NotificationCard(
                    title: olderNotifications[index].title,
                    content: olderNotifications[index].message,
                    time: getNotificationTime(olderNotifications[index].createdAt)
                  );
                },
              ),
        
        
        
            ],
          ),
        ),
      ),
    );
  }
}

