import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:motionray_machine_task/view_model/model/fetch_model.dart';

import 'dart:convert'; // To decode the JSON response

class ClientRepository {
  Future<List<FetchClientDatas>> fetchClients() async {
    final url =
        Uri.parse('https://apist.alnasiyaerp.com/rest/v1/clients?select=*');

    final response = await http.get(
      url,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAgCiAgICAicm9sZSI6ICJhbm9uIiwKICAgICJpc3MiOiAic3VwYWJhc2UtZGVtbyIsCiAgICAiaWF0IjogMTY0MTc2OTIwMCwKICAgICJleHAiOiAxNzk5NTM1NjAwCn0.dc_X5iR_VP_qT0zsiyj_I_OZ2T9FtRU2BBNWN8Bu4GE',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      // Decode the response body to a List of JSON objects
      final List<dynamic> data = json.decode(response.body);

      // Convert the List<dynamic> to a List<FetchClientDatas>
      return FetchClientDatas.listFromJson(data);
    } else {
      throw Exception('Failed to load clients');
    }
  }
}
