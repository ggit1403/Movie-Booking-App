import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/calendar_controller.dart';
import 'package:movie_booking_app/controllers/location_controller.dart';
import 'package:movie_booking_app/controllers/seat_selection_controller.dart';
import 'package:movie_booking_app/model/theatre_model.dart';

import 'package:movie_booking_app/utils/mytheme.dart';
import 'package:movie_booking_app/widgets/facilities_bottom_sheet.dart';

class TheatreBlock extends StatelessWidget {
  final TheatreModel model;
  final bool isBooking;
  final Function(int) onTimeTap;
  const TheatreBlock({
    Key? key,
    required this.model,
    this.isBooking = false,
    required this.onTimeTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var instance = CalendarController.instance;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.name,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.63,
                    ),
                    builder: (_) => FacilitesBottomSheet(model: model),
                  );
                },
                child: Icon(
                  Icons.info_outline,
                  color: Colors.black45.withOpacity(0.3),
                  size: 25,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          isBooking
              ? Text(
                  instance.format.format(instance.selectedMovieDate.value),
                  style: const TextStyle(color: Color(0xff999999)),
                )
              : RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          Icons.location_on,
                          size: 18,
                          color: Color(0xff999999),
                        ),
                      ),
                      TextSpan(
                        text: LocationController.instance.city.value + ", ",
                        style: const TextStyle(color: Color(0xff999999)),
                      ),
                      const TextSpan(
                        text: "2.3km Away",
                        style: TextStyle(color: Color(0xff444444)),
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Wrap(
              runSpacing: 10,
              alignment: WrapAlignment.spaceBetween,
              spacing: 20,
              children: List.generate(
                4,
                (index) {
                  //for dummy data
                  bool isSelected = index ==
                          SeatSelectionController
                              .instance.timeSelectedIndex.value &&
                      isBooking;
                  Color color =
                      index % 2 == 0 ? Mytheme.orangeColor : Mytheme.greenColor;
                  return GestureDetector(
                    onTap: () {
                      //to seat selection
                      onTimeTap(index);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Mytheme.greenColor
                            : const Color(0x22E5E5E5),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 1,
                          color: isSelected
                              ? Mytheme.greenColor
                              : const Color(0xffE5E5E5),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Text(
                        model.timings[index],
                        style:
                            TextStyle(color: isSelected ? Colors.white : color),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
