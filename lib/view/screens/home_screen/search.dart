import 'package:flutter/material.dart';
import 'package:motionray_machine_task/view_model/provider/fetch_provider/provider.dart';
import 'package:provider/provider.dart';

class ClientSearchScreen extends StatefulWidget {
  @override
  State<ClientSearchScreen> createState() => _ClientSearchScreenState();
}

class _ClientSearchScreenState extends State<ClientSearchScreen> {
  @override
  void dispose() {
    super.dispose();
    final clientProvider =
        Provider.of<FetchClientDataProvider>(context, listen: false);
    clientProvider.fetchClientData();
  }

  Widget build(BuildContext context) {
    final clientDataProvider = Provider.of<FetchClientDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Client Search'),
        leading: IconButton(
            onPressed: () {
              clientDataProvider.fetchClientData();
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) {
                clientDataProvider.searchClientData(query);
              },
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: clientDataProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: clientDataProvider.clientData.length,
                    itemBuilder: (context, index) {
                      final client = clientDataProvider.clientData[index];
                      return ListTile(
                        title: Text(client.clientName),
                        subtitle: Text(client.emailAddress),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
