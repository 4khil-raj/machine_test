// import 'dart:convert';

// class FetchClientDatas {
//   final String clientId;
//   final String clientName;
//   final String phoneNumber;
//   final String emailAddress;
//   final String location;
//   final String address;
//   final String? logo;
//   final String status;

//   FetchClientDatas({
//     required this.clientId,
//     required this.clientName,
//     required this.phoneNumber,
//     required this.emailAddress,
//     required this.location,
//     required this.address,
//     this.logo,
//     required this.status,
//   });

//   factory FetchClientDatas.fromJson(Map<String, dynamic> json) {
//     return FetchClientDatas(
//       clientId: json['client_id'],
//       clientName: json['client_name'],
//       phoneNumber: json['phone_number'],
//       emailAddress: json['email_address'],
//       location: json['location'],
//       address: json['address'],
//       logo: json['logo'],
//       status: json['status'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'client_id': clientId,
//       'client_name': clientName,
//       'phone_number': phoneNumber,
//       'email_address': emailAddress,
//       'location': location,
//       'address': address,
//       'logo': logo,
//       'status': status,
//     };
//   }
// }

// List<FetchClientDatas> fetchClientDatasFromJson(String str) {
//   final jsonData = json.decode(str);
//   return List<FetchClientDatas>.from(
//       jsonData.map((item) => FetchClientDatas.fromJson(item)));
// }

// String fetchClientDatasToJson(List<FetchClientDatas> data) {
//   final dyn = List<dynamic>.from(data.map((x) => x.toJson()));
//   return json.encode(dyn);
// }
class FetchClientDatas {
  final String clientId;
  final String clientName;
  final String phoneNumber;
  final String emailAddress;
  final String location;
  final String address;
  final String? logo;
  final String status;

  FetchClientDatas({
    required this.clientId,
    required this.clientName,
    required this.phoneNumber,
    required this.emailAddress,
    required this.location,
    required this.address,
    this.logo,
    required this.status,
  });

  // Factory constructor to create a FetchClientDatas object from JSON
  factory FetchClientDatas.fromJson(Map<String, dynamic> json) {
    return FetchClientDatas(
      clientId: json['client_id'],
      clientName: json['client_name'],
      phoneNumber: json['phone_number'],
      emailAddress: json['email_address'],
      location: json['location'],
      address: json['address'],
      logo: json['logo'],
      status: json['status'],
    );
  }

  // Static method to convert a list of JSON objects to a List of FetchClientDatas
  static List<FetchClientDatas> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => FetchClientDatas.fromJson(json)).toList();
  }
}
