import 'package:flutter/material.dart';
import 'package:motionray_machine_task/view/screens/home_screen/widgets/row_name.dart';
import 'package:motionray_machine_task/view/widgets/buttons/buttons.dart';
import 'package:motionray_machine_task/view_model/fetch_provider/provider.dart';
import 'package:motionray_machine_task/view_model/model/fetch_model.dart';
import 'package:provider/provider.dart';

class ClientDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FetchClientDataProvider>(
        builder: (context, provider, child) {
      if (provider.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (provider.clientData.isEmpty) {
        return const Center(
          child: Text("No clients available."),
        );
      }
      return Column(
        children: [
          const RowNames(),
          ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: provider.clientData.length,
            itemBuilder: (context, rowIndex) {
              return Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check_box_outline_blank_outlined,
                      color: Color.fromARGB(255, 171, 170, 170),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: List.generate(
                        8,
                        (colIndex) => Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _getCellWidget(
                              colIndex,
                              provider.clientData[rowIndex],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      );
    });
  }

  Widget _getCellWidget(int colIndex, FetchClientDatas client) {
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
        return CustomButton(
          textsize: 11,
          radius: 5,
          isNetwork: false,
          isRow: false,
          color: client.status.toLowerCase() == 'active'
              ? Colors.green
              : Colors.grey,
          height: 26,
          width: 150,
          name: client.status,
          fontweight: FontWeight.w600,
          textclr: Colors.white,
          iconradius: 10,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
