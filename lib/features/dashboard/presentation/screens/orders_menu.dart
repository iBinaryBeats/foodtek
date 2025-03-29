import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/utils/responsive.dart';
import 'package:foodtek/features/dashboard/presentation/widgets/home_app.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/utils/app_constants.dart';

class OrdersMenu extends StatelessWidget {
  OrdersMenu({super.key});

  List<Widget> tabs = [
    Tab(child: Align(alignment: Alignment.topLeft, child: Text('Cart'))),
    Tab(child: Align(alignment: Alignment.topLeft, child: Text('History'))),
  ];

  List<Map<dynamic, dynamic>> ordered_items = [
    {
      'image': 'assets/images/menu_item.png',
      'title': 'Chicken Burger',
      'subTitle': 'Burger Factory LTD',
      'price': 20,
      'quantity': ValueNotifier<int>(0), // Use ValueNotifier for each item
    },
    {
      'image': 'assets/images/menu_item.png',
      'title': 'Chicken Burger',
      'subTitle': 'Burger Factory LTD',
      'price': 20,
      'quantity': ValueNotifier<int>(0), // Use ValueNotifier for each item
    },
    {
      'image': 'assets/images/onion_pizza.png',
      'title': 'Onion Pizza',
      'subTitle': 'Pizza Palace',
      'price': 4,
      'quantity': ValueNotifier<int>(0),
    },
    {
      'image': 'assets/images/menu_item.png',
      'title': 'Chicken Burger',
      'subTitle': 'Burger Factory LTD',
      'price': 20,
      'quantity': ValueNotifier<int>(0),
    },
    {
      'image': 'assets/images/onion_pizza.png',
      'title': 'Onion Pizza',
      'subTitle': 'Pizza Palace',
      'price': 4,
      'quantity': ValueNotifier<int>(0),
    },
    {
      'image': 'assets/images/menu_item.png',
      'title': 'Chicken Burger',
      'subTitle': 'Burger Factory LTD',
      'price': 20,
      'quantity': ValueNotifier<int>(0),
    },
    {
      'image': 'assets/images/onion_pizza.png',
      'title': 'Onion Pizza',
      'subTitle': 'Pizza Palace',
      'price': 4,
      'quantity': ValueNotifier<int>(0),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            HomeAppBar(
              title: 'Current Location',
              subtitle: 'Jl. Soekarno Hatta 15A Malang',
              locationIconPath: AppConstant.locationIconPath,
              currentLocationIconPath: AppConstant.currentLocationPath,
              notificationIconPath: AppConstant.notificationEmpty,
            ),
            TabBar(
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.green,
              labelColor: Colors.green,
              tabs: tabs,
              labelStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Stack(
                    children: [
                      Positioned.fill(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: ordered_items.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: responsiveWidth(context, 24),
                                    ),
                                    child: Slidable(
                                      closeOnScroll: true,
                                      direction: Axis.horizontal,
                                      startActionPane: ActionPane(
                                        motion: ScrollMotion(),
                                        children: [
                                          SlidableAction(
                                            onPressed: (context) {
                                              //TODO
                                              print('test');
                                            },
                                            padding: const EdgeInsets.all(30),
                                            borderRadius: BorderRadius.circular(
                                              18,
                                            ),
                                            backgroundColor: Color(0xffFDAC1D),
                                            foregroundColor: Colors.white,
                                            icon: Icons.delete,
                                            autoClose: true,
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 16),
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: Colors.green,
                                          ),
                                        ),
                                        child: ListTile(
                                          leading: Image.asset(
                                            ordered_items[index]['image'],
                                          ),
                                          title: Text(
                                            ordered_items[index]['title'],
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          subtitle: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                ordered_items[index]['subTitle'],
                                              ),
                                              Text(
                                                '\$ ${ordered_items[index]['price']}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                  fontSize: 16.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  if (ordered_items[index]['quantity']
                                                          .value >
                                                      0)
                                                    ordered_items[index]['quantity']
                                                        .value--;
                                                },
                                                icon: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffeaf7ed),
                                                    border: Border.all(
                                                      color: Color(0xffeaf7ed),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ),
                                              ValueListenableBuilder<int>(
                                                valueListenable:
                                                    ordered_items[index]['quantity'],
                                                builder: (
                                                  context,
                                                  value,
                                                  child,
                                                ) {
                                                  return SizedBox(
                                                    width: 18.w,
                                                    height: 16.h,
                                                    child: Text(
                                                      value.toString(),
                                                      style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  if (ordered_items[index]['quantity']
                                                          .value <
                                                      19)
                                                    ordered_items[index]['quantity']
                                                        .value++;
                                                },
                                                icon: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: _buildSummaryCard(context),
                      ),
                    ],
                  ),
                  Center(child: Text('History')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 20),
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.green,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildSummaryRow('Sub-Total', '\$100'),
                _buildSummaryRow('Delivery Charge', '\$10'),
                _buildSummaryRow('Discount', '\$5'),
                Divider(color: Colors.white),
                _buildSummaryRow('Total:', '\$110', isBold: true),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Place My Order',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Image.asset('assets/images/orderPath.png'),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: Colors.white,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
