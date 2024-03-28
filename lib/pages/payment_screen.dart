import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  final double seatPrice;
  final List<String> selectedSeats;

  const PaymentPage({
    Key? key,
    required this.seatPrice,
    required this.selectedSeats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    '../assets/movies/movie1.png', // Replace with the actual path to the movie image
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Movie: Kung Fu Panda 4',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Date: 10th October 2022',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Time: 7:00 PM',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Seats: ${selectedSeats.join(", ")}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Giá vé: $seatPrice',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            Center(
              child: Column(
                children: [
                  Text(
                    'Chọn phương thức thanh toán:',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        '../assets/icons/momo.png', // Replace with the actual path to MoMo logo
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(width: 16),
                      Image.asset(
                        '../assets/icons/tpbank.jpg', // Replace with the actual path to bank logo
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: Handle payment logic
                    },
                    child: Text('Pay Now'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
