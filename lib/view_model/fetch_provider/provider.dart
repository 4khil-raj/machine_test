import 'package:flutter/material.dart';
import 'package:motionray_machine_task/model/repository/data_fetch.dart';
import 'package:motionray_machine_task/view_model/model/fetch_model.dart';

class FetchClientDataProvider with ChangeNotifier {
  List<FetchClientDatas> _clientData = [];
  bool _isLoading = false;

  List<FetchClientDatas> get clientData => _clientData;
  bool get isLoading => _isLoading;

  /// Method to fetch client data using the ClientRepository
  Future<void> fetchClientData() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Fetch data from ClientRepository
      final data = await ClientRepository().fetchClients();
      _clientData = data;
    } catch (error) {
      // Handle any errors
      print('Error fetching client data: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
