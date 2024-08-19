import 'package:trackman_flutter_app1/data/golf_details.dart';
import 'package:trackman_flutter_app1/util/responsive.dart';
import 'package:trackman_flutter_app1/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class TargetDetailsCard extends StatelessWidget {
  const TargetDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final golfDetails = GolfDetails();

    return GridView.builder(
      itemCount: golfDetails.golfData.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Responsive.isMobile(context) ? 2 : 10,
        crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
        mainAxisSpacing: 12.0,
      ),
      itemBuilder: (context, index) => CustomCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 4),
              child: Text(
                golfDetails.golfData[index].value,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              golfDetails.golfData[index].title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
