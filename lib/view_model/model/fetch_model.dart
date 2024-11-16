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

  factory FetchClientDatas.fromJson(Map<String, dynamic> json) {
    return FetchClientDatas(
      clientId: json['client_id'] ?? '',
      clientName: json['client_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      emailAddress: json['email_address'] ?? '',
      location: json['location'] ?? '',
      address: json['address'] ?? '',
      logo: json['logo'],
      status: json['status'] ?? '',
    );
  }

  static List<FetchClientDatas> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => FetchClientDatas.fromJson(json)).toList();
  }
}
