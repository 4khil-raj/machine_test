import 'package:flutter/material.dart';
import 'package:motionray_machine_task/model/repository/data_fetch.dart';
import 'package:motionray_machine_task/view_model/model/fetch_model.dart';

class FetchClientDataProvider with ChangeNotifier {
  List<FetchClientDatas> _clientData = [];
  List<FetchClientDatas> _filteredData = [];
  bool _isLoading = false;

  List<FetchClientDatas> get clientData =>
      _filteredData.isEmpty ? _clientData : _filteredData;
  bool get isLoading => _isLoading;

  Future<void> fetchClientData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await ClientRepository().fetchClients();
      _clientData = data;
      _filteredData = [];
    } catch (error) {
      _clientData = [];
      _filteredData = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void searchClientData(String query) {
    if (query.isEmpty) {
      _filteredData = [];
    } else {
      _filteredData = _clientData.where((client) {
        return client.clientName.toLowerCase().contains(query.toLowerCase()) ||
            client.phoneNumber.toLowerCase().contains(query.toLowerCase()) ||
            client.emailAddress.toLowerCase().contains(query.toLowerCase()) ||
            client.location.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    notifyListeners();
  }
}
