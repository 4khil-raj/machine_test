import 'package:flutter/material.dart';

class AddClientScreen extends StatelessWidget {
  const AddClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            height: MediaQuery.of(context).size.width * 0.25,
            width: MediaQuery.of(context).size.width * 0.30,
            child: Column(
              children: [
                Text('Add New Client'),
                Divider(
                  thickness: 2,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            color: Colors.grey,
                            child: Icon(
                              Icons.file_upload_outlined,
                              color: Colors.white,
                            ),
                          ),
                          Text('Drop Logo Here')
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
