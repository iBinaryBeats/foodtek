import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class NotificationBottomSheet extends StatelessWidget {
  final String title;

  NotificationBottomSheet({Key? key, required this.title}) : super(key: key);

  final responseBlue = const Color(0xFF3B82F6);

  final List<Map<String, dynamic>> notifications = const [
    {
      'title': 'Delayed Order:',
      'content':
          'We’re sorry! Your order is running late. New ETA: 10:30 PM. Thanks for your patience!',
      'timestamp': 'Last Wednesday at 9:42 AM',
      'unread': true,
    },
    {
      'title': 'Promotional Offer:',
      'content':
          'Craving something delicious? 🍔 Get 20% off on your next order. Use code: YUMMY20.',
      'timestamp': 'Last Wednesday at 9:42 AM',
      'unread': false,
    },
    {
      'title': 'Out for Delivery:',
      'content':
          'Your order is on the way! 🚗 Estimated arrival: 15 mins. Stay hungry!',
      'timestamp': 'Last Wednesday at 9:42 AM',
      'unread': true,
    },
    {
      'title': 'Order Confirmation:',
      'content':
          'Your order has been placed! 🍔 We’re preparing it now. Track your order live!',
      'timestamp': 'Last Wednesday at 9:42 AM',
      'unread': false,
    },
  ];

  List<Map<String, dynamic>> _getFilteredNotifications(String type) {
    if (type == 'Unread') {
      return notifications.where((n) => n['unread'] == true).toList();
    } else if (type == 'Read') {
      return notifications.where((n) => n['unread'] == false).toList();
    }
    return notifications;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, size: 22),
                ),
                Center(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    //TODO
                  },
                  icon: Icon(Icons.menu),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            TabBar(
              indicatorColor: AppColors.green,
              labelColor: AppColors.green,
              unselectedLabelColor: Colors.grey,
              tabs: const [
                Tab(text: 'All'),
                Tab(text: 'Unread'),
                Tab(text: 'Read'),
              ],
            ),
            SizedBox(height: 15.h),
            Expanded(
              child: TabBarView(
                children:
                    ['All', 'Unread', 'Read'].map((type) {
                      final filteredList = _getFilteredNotifications(type);
                      return ListView.separated(
                        itemCount: filteredList.length,
                        separatorBuilder: (_, __) => const Divider(height: 20),
                        itemBuilder: (context, index) {
                          final notif = filteredList[index];
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (notif['unread'])
                                Container(
                                  width: 8,
                                  height: 8,
                                  margin: const EdgeInsets.only(
                                    top: 6,
                                    right: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: responseBlue,
                                    shape: BoxShape.circle,
                                  ),
                                )
                              else
                                const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notif['title'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      notif['content'],
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      notif['timestamp'],
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
