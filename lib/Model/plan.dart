class PackagesModel {
  bool? error;
  List<Packages>? packages;

  PackagesModel({this.error, this.packages});

  PackagesModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    if (json['packages'] != null) {
      packages = <Packages>[];
      json['packages'].forEach((v) {
        packages!.add(Packages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error'] = error;
    if (packages != null) {
      data['packages'] = packages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Packages {
  int? id;
  String? packageName;
  double? subscriptionAmount;
  String? duration;
  int? noOfBooks;
  int? noofdays;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<Details>? details;

  Packages(
      {this.id,
      this.packageName,
      this.subscriptionAmount,
      this.duration,
      this.noOfBooks,
      this.noofdays,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.details});

  Packages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    packageName = json['package_name'];
    subscriptionAmount = json['subscription_amount'];
    duration = json['duration'];
    noOfBooks = json['no_of_books'];
    noofdays = json['noofdays'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['details'] != null) {
      details = <Details>[];
      json['details'].forEach((v) {
        details!.add(Details.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['package_name'] = packageName;
    data['subscription_amount'] = subscriptionAmount;
    data['duration'] = duration;
    data['no_of_books'] = noOfBooks;
    data['noofdays'] = noofdays;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (details != null) {
      data['details'] = details!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Details {
  int? id;
  String? detail;
  int? packageId;
  String? createdAt;
  String? updatedAt;

  Details(
      {this.id, this.detail, this.packageId, this.createdAt, this.updatedAt});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    detail = json['detail'];
    packageId = json['package_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['detail'] = detail;
    data['package_id'] = packageId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}