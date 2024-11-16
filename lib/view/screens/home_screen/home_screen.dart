import 'package:flutter/material.dart';
import 'package:motionray_machine_task/view/screens/add_client/add_client.dart';
import 'package:motionray_machine_task/view/screens/home_screen/search.dart';
import 'package:motionray_machine_task/view/screens/home_screen/widgets/client_details.dart';
import 'package:motionray_machine_task/view/widgets/buttons/buttons.dart';
import 'package:motionray_machine_task/view/widgets/form_field/form_field.dart';
import 'package:motionray_machine_task/view/widgets/navigators/navigators.dart';
import 'package:motionray_machine_task/view_model/provider/fetch_provider/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final clientProvider =
        Provider.of<FetchClientDataProvider>(context, listen: false);
    clientProvider.fetchClientData();
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: CustomTextFormField(
                        onTap: () =>
                            customNavPush(context, ClientSearchScreen()),
                        hintText: 'Search...',
                        controller: searchController,
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomButton(
                      onTap: () =>
                          customNavPush(context, const AddClientScreen()),
                      textsize: 11,
                      radius: 5,
                      isNetwork: false,
                      isRow: false,
                      color: Colors.red,
                      height: 26,
                      width: 150,
                      name: 'Add New Clients',
                      fontweight: FontWeight.w600,
                      textclr: Colors.white,
                      iconradius: 10,
                    ),
                  )
                ],
              ),
              ClientDetails()
            ],
          ),
        ),
      ),
    );
  }
}
