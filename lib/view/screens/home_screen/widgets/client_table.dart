import 'package:flutter/material.dart';
import 'package:motionray_machine_task/view/widgets/buttons/buttons.dart';
import 'package:motionray_machine_task/view_model/model/fetch_model.dart';

Widget tableOrder(int colIndex, FetchClientDatas client) {
  switch (colIndex) {
    case 0:
      return CircleAvatar(
        backgroundImage: NetworkImage(client.logo ?? ''),
        radius: 20,
      );
    case 1:
      return Text(
        client.clientId.toString(),
        textAlign: TextAlign.center,
      );
    case 2:
      return Text(
        client.clientName,
        textAlign: TextAlign.center,
      );
    case 3:
      return Text(
        client.emailAddress,
        textAlign: TextAlign.center,
      );
    case 4:
      return Text(
        client.phoneNumber,
        textAlign: TextAlign.center,
      );
    case 5:
      return Text(
        client.location,
        textAlign: TextAlign.center,
      );
    case 6:
      return Text(
        client.address,
        textAlign: TextAlign.center,
      );
    case 7:
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            textsize: 11,
            radius: 5,
            isNetwork: false,
            isRow: false,
            color: client.status.toLowerCase() == 'active'
                ? Colors.green
                : Colors.grey,
            height: 26,
            width: 90,
            name: client.status,
            fontweight: FontWeight.w600,
            textclr: Colors.white,
            iconradius: 10,
          ),
          Icon(Icons.arrow_right),
        ],
      );
    default:
      return const SizedBox.shrink();
  }
}
