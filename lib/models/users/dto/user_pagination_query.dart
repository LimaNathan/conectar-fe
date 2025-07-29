// ignore_for_file: constant_identifier_names

enum OrderDirection { asc, desc }

class UserPaginationQuery {
  int? page;
  int? size;
  OrderDirection? order;
  String? name;
  String? email;
  String? role;

  UserPaginationQuery({
    this.page = 0,
    this.size = 10,
    this.order = OrderDirection.desc,
    this.name,
    this.email,
    this.role,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (page != null) {
      json.addAll({'page': page});
    }
    if (size != null) {
      json.addAll({'size': size});
    }
    if (order != null) {
      json.addAll({'order': order!.name});
    }

    if (name != null) {
      json.addAll({'name': name});
    }
    if (email != null) {
      json.addAll({'email': email});
    }
    if (role != null) {
      json.addAll({'role': role});
    }

    return json;
  }

  cleanFilters() {
    name = null;
    email = null;
    role = null;
  }

  fowardPage() {
    page = page != null ? page! + 1 : null;
    size = size;
    order = order;
    name = name;
    role = role;
    email = email;
  }

  backPage() {
    page = page != null ? page! - 1 : null;
    size = size;
    order = order;
    name = name;
    role = role;
    email = email;
  }
}
