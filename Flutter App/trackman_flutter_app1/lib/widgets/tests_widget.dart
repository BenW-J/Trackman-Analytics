import 'package:trackman_flutter_app1/data/previous_reports_data.dart';
import 'package:trackman_flutter_app1/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class PreviousTests extends StatelessWidget {
  const PreviousTests({super.key});

  @override
  Widget build(BuildContext context) {
    final data = PreviousReportsData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Previous Tests",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 12),
        const Text(
          "Select multiple reports to see averaged data",
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500,color: Colors.grey),
        ),
        const SizedBox(height: 12),
        for (var index = 0; index < data.scheduled.length; index++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: CustomCard(
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.scheduled[index].title,
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            data.scheduled[index].date,
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Icon(Icons.more),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
