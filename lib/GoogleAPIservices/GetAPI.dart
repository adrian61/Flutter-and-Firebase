class GetAPI {
  String apiKey;

  GetAPI({this.apiKey});

  GetAPI.fromJson(Map<String, dynamic> json) {
    apiKey = json['api_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_key'] = this.apiKey;
    return data;
  }
}
