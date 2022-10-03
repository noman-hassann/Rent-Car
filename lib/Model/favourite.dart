class favouriteJson {
  int? id;
  int? userId;
  int? propertId;
  String? createdAt;
  String? updatedAt;
  Posts? posts;

  favouriteJson(
      {id,
      userId,
      propertId,
      createdAt,
      updatedAt,
      posts});

  favouriteJson.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    propertId = json['propert_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    posts = json['posts'] != null ?  Posts.fromJson(json['posts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['created_at'] = 
    createdAt;
    data['updated_at'] = 
    updatedAt;
    data['propert_id'] = 
    propertId;
    if (posts != null) {
      data['posts'] = posts!.toJson();
    }
    return data;
  }
}

class Posts {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? address;
  int? price;
  String? area;
  int? bedrooms;
  int? bathrooms;
  int? parking;
  String? others;
  String? description;
  int? userId;
  int? status;
  List<Images>? images;
  User? user;

  Posts(
      {id,
      createdAt,
      updatedAt,
      title,
      address,
      price,
      area,
      bedrooms,
      bathrooms,
      parking,
      others,
      description,
      userId,
      status,
      images,
      user});

  Posts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    address = json['address'];
    price = json['price'];
    area = json['area'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    parking = json['parking'];
    others = json['others'];
    description = json['description'];
    userId = json['user_id'];
    status = json['status'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add( Images.fromJson(v));
      });
    }
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['address'] = address;
    data['price'] = price;
    data['area'] = area;
    data['bedrooms'] = bedrooms;
    data['bathrooms'] = bathrooms;
    data['parking'] = parking;
    data['others'] = others;
    data['description'] = description;
    data['user_id'] = userId;
    data['status'] = status;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class Images {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? imageName;
  int? propertId;

  Images(
      {id,
      createdAt,
      updatedAt,
      imageName,
      propertId});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageName = json['image_name'];
    propertId = json['propert_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_name'] = imageName;
    data['propert_id'] = propertId;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? contact;
  String? address;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {id,
      name,
      email,
      contact,
      address,
      emailVerifiedAt,
      createdAt,
      updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    address = json['address'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['contact'] = contact;
    data['address'] = address;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}