/// status : "success"
/// message : "Product added successfully to your wishlist"
/// data : ["6428ead5dc1175abc65ca0ad"]

class WishListResponse {
  WishListResponse({
    this.status,
    this.message,
    this.statusMsg,
    this.data,
  });

  WishListResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? json['data'].cast<String>() : [];
  }

  String? status;
  String? statusMsg;
  String? message;
  List<String>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data;
    return map;
  }
}
