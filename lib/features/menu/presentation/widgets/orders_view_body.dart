import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mego_food/core/theme/theme_context_extensions.dart';
import 'package:mego_food/core/widgets/custom_header.dart';
import 'package:mego_food/features/menu/presentation/widgets/current_order_item.dart';
import 'package:mego_food/features/menu/presentation/widgets/custom_toggle_tabs.dart';
import 'package:mego_food/features/menu/presentation/widgets/previous_oreder_item.dart';

class OrdersViewBody extends StatefulWidget {
  const OrdersViewBody({super.key});

  @override
  State<OrdersViewBody> createState() => _OrdersViewBodyState();
}

class _OrdersViewBodyState extends State<OrdersViewBody> {
  bool isCurrentSelected = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 24,
            children: [
              CustomHeader(
                leading: BackButton(),
                title: Text('My Orders', style: context.exTextStyles.large),
                actions: [SvgPicture.asset('assets/icons/More.svg')],
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
              if (isCurrentSelected) CurrentOrderItem(),
              if (!isCurrentSelected) ...[
                PreviousOrederItem(),
                PreviousOrederItem(),
                PreviousOrederItem(),
                PreviousOrederItem(),
              ],
              SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
