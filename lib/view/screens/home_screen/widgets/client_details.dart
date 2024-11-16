import 'package:flutter/material.dart';
import 'package:motionray_machine_task/view/screens/home_screen/widgets/client_table.dart';
import 'package:motionray_machine_task/view/screens/home_screen/widgets/dropdown_btn.dart';
import 'package:motionray_machine_task/view/screens/home_screen/widgets/row_name.dart';
import 'package:motionray_machine_task/view_model/provider/fetch_provider/provider.dart';
import 'package:provider/provider.dart';

class ClientDetails extends StatelessWidget {
  const ClientDetails({super.key});

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
            physics: const AlwaysScrollableScrollPhysics(),
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
                            child: tableOrder(
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
          Container(
            height: 60,
            color: const Color.fromARGB(255, 183, 182, 181),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text('Showing'),
                ),
                const DropDownButton(),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 30),
                  child: Text('Items per page'),
                ),
                const Spacer(),
                Container(
                  width: 28,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 177, 175, 175))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('1'),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('2'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Text('Next'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 40),
                  child: Text('End'),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
