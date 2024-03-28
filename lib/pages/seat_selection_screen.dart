import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movie_booking_app/controllers/auth_controller.dart';
import 'package:movie_booking_app/controllers/seat_selection_controller.dart';
import 'package:movie_booking_app/model/movie_model.dart';
import 'package:movie_booking_app/model/theatre_model.dart';
import 'package:movie_booking_app/widgets/no_of_seats.dart';
import 'package:movie_booking_app/widgets/seat_layout.dart';
import 'package:movie_booking_app/widgets/seat_type.dart';
import 'package:movie_booking_app/widgets/theatre_block.dart';
import 'package:movie_booking_app/pages/payment_screen.dart';

import '../utils/dummy_data.dart';

class SeatSelectionScreen extends StatefulWidget {
  final TheatreModel theatreModel;
  final MovieModel movieModel;
  const SeatSelectionScreen({
    Key? key,
    required this.theatreModel,
    required this.movieModel,
  }) : super(key: key);

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  noOfSeatSelection() {
    return Expanded(
      child: Container(
        color: Colors.white,
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "How Many Seats?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: SvgPicture.asset(
                    "assets/icons/${SeatSelectionController.instance.getAsset()}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              NoOfSeats(onTap: SeatSelectionController.instance.noOfSeats),
              const SizedBox(
                height: 10,
              ),
              SeatType(
                onTap: SeatSelectionController.instance.seatType,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBar({required Function(bool) toggle}) {
    return BottomAppBar(
      child: SizedBox(
        height: AppBar().preferredSize.height,
        child: ElevatedButton(
          onPressed: () {
            if (SeatSelectionController.instance.isSeatSelection.value) {
              if (SeatSelectionController.instance.seatPrice <= 0.0) {
                AuthController.instance
                    .getErrorSnackBarNew("Please select at least one seat");
                return;
              }
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(
                    seatPrice: SeatSelectionController.instance.seatPrice.value,
                    selectedSeats:
                        SeatSelectionController.instance.selectedSeats.toList(),
                  ),
                ),
              );
            } else {
              if (SeatSelectionController.instance.noOfSeats.value <= 0) {
                AuthController.instance
                    .getErrorSnackBarNew("Please select number of seats");
                return;
              }
              toggle(true);
            }
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          child: Obx(
            () => Center(
              child: Text(
                SeatSelectionController.instance.isSeatSelection.value
                    ? "Pay ${SeatSelectionController.instance.seatPrice.value}"
                    : "Select Seats",
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget myAppBar({required Function(bool) toggle}) {
    return AppBar(
      elevation: 0,
      title: Text(
        widget.movieModel.title,
        style: TextStyle(
          color: Colors.white, // Màu chữ trắng
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            toggle(false);
            SeatSelectionController.instance.selectedSeats = <String>[].obs;
            SeatSelectionController.instance.seatPrice = 0.0.obs;
            SeatSelectionController.instance.seatPrices = [].obs;
          },
          child: Obx(
            () => Text(
              "${SeatSelectionController.instance.noOfSeats < 0 ? 0 : SeatSelectionController.instance.noOfSeats} Seats",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          bottomBar(toggle: SeatSelectionController.instance.isSeatSelection),
      backgroundColor: const Color(0xFFF5F5FA),
      appBar:
          myAppBar(toggle: SeatSelectionController.instance.isSeatSelection),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TheatreBlock(
            model: widget.theatreModel,
            onTimeTap: SeatSelectionController.instance.timeSelectedIndex,
            isBooking: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(() => SeatSelectionController.instance.isSeatSelection.value
              ? SeatLayout(model: seatLayout)
              : noOfSeatSelection()),
        ],
      ),
    );
  }
}
