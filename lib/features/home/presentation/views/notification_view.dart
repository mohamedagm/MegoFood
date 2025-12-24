import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/features/home/presentation/widgets/notification_item.dart';
import 'package:mego_food/features/menu/presentation/widgets/current_order_item.dart';
import 'package:mego_food/features/menu/presentation/widgets/custom_toggle_tabs.dart';
import 'package:mego_food/features/menu/presentation/widgets/previous_oreder_item.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool isCurrentSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 12,
              children: [
                CustomHeader(
                  title: Row(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Notification.svg',
                        height: 28,
                        width: 28,
                      ),
                      Text('Notification', style: context.exTextStyles.large),
                    ],
                  ),
                ),
                CustomToggleTabs(
                  isCurrentSelected: isCurrentSelected,
                  onTap: (value) {
                    setState(() {
                      isCurrentSelected = value;
                    });
                  },
                  tab1: 'Current',
                  tab2: 'Previous',
                ),
                if (isCurrentSelected) ...[
                  NotificationItem(
                    title: 'Order Out for Delivery!',
                    sub:
                        'Your food is on the move! Track your order for real-time updates.',
                    timeago: '5 mins ago',
                  ),
                  NotificationItem(
                    title: 'Your Order is Confirmed!',
                    sub:
                        'Thanks for ordering! Your delicious meal is being prepared and will be on its way soon.',
                    timeago: '22 mins ago',
                  ),
                ],
                if (!isCurrentSelected) ...[
                  NotificationItem(
                    title: 'Rate Your Order',
                    sub:
                        'How did we do? Let us know by rating your recent order and sharing your feedback.',
                    timeago: '1 day ago',
                  ),
                  NotificationItem(
                    title: 'Hungry? Try Our New Pizza Specials!',
                    sub:
                        'Check out the latest additions to our menu and satisfy your cravings!',
                    timeago: '2 day ago',
                  ),
                  NotificationItem(
                    title: "Don't Miss Out: Special Offer Just for You!",
                    sub:
                        'Get 10% off your next order with code SAVE10. Limited time only!',
                    timeago: '2 hours ago',
                  ),
                ],
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
