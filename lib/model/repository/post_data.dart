import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:motionray_machine_task/view_model/provider/fetch_provider/provider.dart';
import 'package:provider/provider.dart';

class PostClientRepository {
  final String apiKey = "your_api_key_here";

  Future<bool> createClient(Map<String, dynamic> clientData, context) async {
    try {
      final response = await http.post(
        Uri.parse('https://apist.alnasiyaerp.com/rest/v1/clients'),
        headers: {
          'Content-Type': 'application/json',
          'apikey':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
        },
        body: jsonEncode(clientData),
      );

      if (response.statusCode == 201) {
        final clientProvider =
            Provider.of<FetchClientDataProvider>(context, listen: false);
        clientProvider.fetchClientData();
        Navigator.pop(context);
        return true;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Something missing!!!')));
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
