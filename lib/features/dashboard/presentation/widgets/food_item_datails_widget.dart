import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/responsive.dart';
import '../../../widgets/custom/custom_button.dart'; // Assuming CustomButton is defined elsewhere

class FoodItemDetails extends StatelessWidget {
  final String imageUrl;
  final String foodName;
  final double rating;
  final int reviewsCount;
  final double price;
  final double originalPrice;
  final String description;
  final ValueNotifier<int> quantity = ValueNotifier(3);
  final ValueNotifier<double> _spicyLevel = ValueNotifier(5);

  FoodItemDetails({
    Key? key,
    required this.imageUrl,
    required this.foodName,
    required this.rating,
    required this.reviewsCount,
    required this.price,
    required this.originalPrice,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Details ', style: TextStyle(fontFamily: 'Ubuntu')),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: responsiveHeight(context, 25)),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assets/images/order_now.png'),
            ),
            SizedBox(height: responsiveHeight(context, 15)),

            Text(
              "Cheeseburger Wendy's Burger",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter',
              ),
            ),
            SizedBox(height: responsiveHeight(context, 5)),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star_half, color: Colors.amber),
                SizedBox(width: 5),
                Text("4.5 (89 reviews)", style: TextStyle(color: Colors.grey)),
              ],
            ),

            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "\$7.99",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  "\$9.5",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),

            SizedBox(height: responsiveHeight(context, 5)),
            Text(
              "Nulla occaecat velit laborum exercitation ullamco. Elit labore eu aute elit nostrud culpa velit excepteur deserunt sunt. Velit non est cillum consequat cupidatat ex Lorem laboris labore aliqua ad duis eu laborum",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: responsiveHeight(context, 20)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveHeight(context, 25),
                vertical: responsiveHeight(context, 8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Spicy",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "Quantity",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: ValueListenableBuilder<double>(
                    valueListenable: _spicyLevel,
                    builder: (context, value, child) {
                      return SliderTheme(
                        data: SliderThemeData(
                          trackHeight: 5.0,
                          activeTrackColor: Colors.red,
                          thumbColor: Colors.white,
                          overlayColor: Colors.red.withOpacity(0.2),
                        ),
                        child: Slider(
                          value: value,
                          min: 0,
                          max: 10,

                          label: value.round().toString(),
                          activeColor: Colors.red,
                          onChanged: (newValue) {
                            _spicyLevel.value = newValue;
                            // _spicyLevel.value=_spicyLevel.value.toInt();
                            print(
                              _spicyLevel.value.toInt(),
                            ); // i wanna send the value to the api as Int make it sense
                          },
                        ),
                      );
                    },
                  ),
                ),

                // SizedBox(width: responsiveWidth(context, 50)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity.value >= 1) quantity.value--;
                          print('test');
                        },
                        icon: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.remove, color: Colors.green),
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: quantity,
                        builder: (context, value, child) {
                          return Text(
                            quantity.value.toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                      IconButton(
                        onPressed: () {
                          if (quantity.value < 25) quantity.value++;
                          print('test');
                        },
                        icon: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Mild',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: (MediaQuery.of(context).size.width / 2) - 50),
                  Text(
                    'Hot',
                    style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(context, 25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: 'Add To Cart',
                  textColor: Colors.white,
                  onPressed: () {
                    //TODO
                  },
                  buttonColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
