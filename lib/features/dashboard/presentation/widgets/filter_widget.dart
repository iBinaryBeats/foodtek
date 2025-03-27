import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/core/utils/responsive.dart';

class FilterWidget extends StatelessWidget {
  FilterWidget({super.key});
  ValueNotifier<double> _priceRange = ValueNotifier<double>(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Details'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Filter',
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              ),
              SizedBox(height: responsiveHeight(context, 5)),

              _buildSectionTitle('Price range'),
              SizedBox(height: responsiveHeight(context, 5)),

              _buildMinMaxFields('5', '504'), // Min , Max
              SizedBox(height: responsiveHeight(context, 5)),
              filterSlider(priceRange: _priceRange),
              SizedBox(height: responsiveHeight(context, 10)),
              _buildSectionTitle('Discount'),

              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Min',

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 3,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.green, width: 1),
                        ),
                      ),
                      readOnly: true,
                    ),
                  ),

                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Max',

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 3,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.green, width: 1),
                        ),
                      ),
                      readOnly: true,
                    ),
                  ),
                ],
              ),

              _buildSectionTitle('Discount'),

              _buildChips(['Fair Feed', 'Descent']),
              SizedBox(height: 20.h),

              _buildSectionTitle('Location'),
              _buildChips(['1 KM', '3.2 KM', '10 KM']),
              SizedBox(height: 20.h),

              _buildSectionTitle('Skin'),
              _buildChips([
                'Train Texture',
                'Skin/Catch Catch',
                'Sealed Perlin',
                'Clear Cheveler',
                'Mine Ground Cool',
                'Leisure Thermizer',
              ], isMultiLine: true),
              SizedBox(height: 20.h),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                  ),
                  child: Text(
                    'Apply Filters',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.grey[400],
        fontSize: 10.sp,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _buildMinMaxFields(String minValue, String maxValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Min',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.green, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.green, width: 3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1),
              ),
            ),
            readOnly: true,
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Max',

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.green, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.green, width: 3),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.green, width: 1),
              ),
            ),
            readOnly: true,
          ),
        ),
      ],
    );
  }

  Widget _buildChips(List<String> items, {bool isMultiLine = false}) {
    return Wrap(
      spacing: 8.w,
      runSpacing: isMultiLine ? 8.h : 0,
      children:
          items.map((item) {
            return FilterChip(
              label: Text(item),
              selected: false,
              onSelected: (bool selected) {},
              selectedColor: Colors.green.withOpacity(0.2),
              backgroundColor: Colors.grey[200],
              labelStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey[300]!),
              ),
            );
          }).toList(),
    );
  }
}

class filterSlider extends StatelessWidget {
  const filterSlider({super.key, required ValueNotifier<double> priceRange})
    : _priceRange = priceRange;

  final ValueNotifier<double> _priceRange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder<double>(
            valueListenable: _priceRange,
            builder: (context, value, child) {
              return SliderTheme(
                data: SliderThemeData(
                  trackHeight: 5.0,
                  activeTrackColor: Colors.green,
                  thumbColor: Colors.white,
                  overlayColor: Colors.green.withOpacity(0.2),
                ),
                child: Slider(
                  value: value,
                  min: 0,
                  max: 10,

                  label: value.round().toString(),
                  activeColor: Colors.green,
                  onChanged: (newValue) {
                    _priceRange.value = newValue;
                    print(
                      _priceRange.value.toInt(),
                    ); // i wanna send the value to the api as Int make it sense
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
