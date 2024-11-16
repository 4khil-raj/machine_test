import 'package:flutter/material.dart';
import 'package:motionray_machine_task/model/repository/post_data.dart';
import 'package:motionray_machine_task/view/widgets/buttons/buttons.dart';
import 'package:motionray_machine_task/view/widgets/form_field/form_field.dart';
import 'package:motionray_machine_task/view_model/provider/image_picker/image.dart';
import 'package:provider/provider.dart';

class AddClientScreen extends StatefulWidget {
  const AddClientScreen({super.key});

  @override
  State<AddClientScreen> createState() => _AddClientScreenState();
}

class _AddClientScreenState extends State<AddClientScreen> {
  bool loading = false;
  bool status = false;
  String imagePath = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController phnController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        loading = false;
        imagePath = '';
      });
    });
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 800;
            final formWidth = isWide
                ? constraints.maxWidth * 0.45
                : constraints.maxWidth * 0.9;

            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.40,
                width: formWidth,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text(
                        'Add New Client',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: isWide ? 1 : 2,
                            child: Column(
                              children: [
                                Consumer<FilePickerProvider>(
                                  builder: (context, provider, child) {
                                    imagePath = provider.fileUrl ?? '';
                                    return InkWell(
                                      onTap: () async {
                                        await provider.pickImage();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 195, 194, 194),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        height: 210,
                                        width: 210,
                                        child: imagePath != ''
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  imagePath,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : const Icon(
                                                Icons.file_upload_outlined,
                                                color: Colors.white,
                                                size: 50,
                                              ),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Drop Logo Here',
                                  style: TextStyle(fontSize: 10),
                                ),
                                const SizedBox(height: 50),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 139, 138, 138),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Text('Status'),
                                          ),
                                          const Spacer(),
                                          Flexible(
                                            child: Transform.scale(
                                              scale: 0.7,
                                              child: Switch(
                                                value: status,
                                                onChanged: (value) {
                                                  setState(() {
                                                    status = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: isWide ? 2 : 3,
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  hintText: 'Client Name',
                                  controller: nameController,
                                ),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  hintText: 'Phone Number',
                                  controller: phnController,
                                ),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  hintText: 'Email Address',
                                  controller: emailController,
                                ),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  hintText: 'Location',
                                  controller: locationController,
                                ),
                                const SizedBox(height: 10),
                                CustomTextFormField(
                                  maxline: 4,
                                  hintText: 'Address',
                                  controller: addressController,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: loading
                                      ? const CircularProgressIndicator()
                                      : Row(
                                          children: [
                                            CustomButton(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              textsize: 11,
                                              radius: 5,
                                              isNetwork: false,
                                              isRow: false,
                                              color: const Color.fromARGB(
                                                  255, 94, 94, 94),
                                              height: 32,
                                              width: 90,
                                              name: 'Cancel',
                                              fontweight: FontWeight.w600,
                                              textclr: Colors.white,
                                              iconradius: 10,
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            CustomButton(
                                              onTap: () {
                                                PostClientRepository()
                                                    .createClient({
                                                  "client_name":
                                                      nameController.text,
                                                  "phone_number":
                                                      phnController.text,
                                                  "email_address":
                                                      emailController.text,
                                                  "location":
                                                      locationController.text
                                                }, context);
                                                setState(() {
                                                  loading = true;
                                                });
                                                // Navigator.pop(context);
                                              },
                                              textsize: 11,
                                              radius: 5,
                                              isNetwork: false,
                                              isRow: false,
                                              color: Colors.red,
                                              height: 32,
                                              width: 90,
                                              name: 'Submit',
                                              fontweight: FontWeight.w600,
                                              textclr: Colors.white,
                                              iconradius: 10,
                                            ),
                                          ],
                                        ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
