// ignore_for_file: constant_identifier_names

enum OrderDirection { asc, desc }

class ClientsPaginationQuery {
  int? page;

  int? size;
  OrderDirection? order;
  String? presentationName;
  String? cnpj;
  String? corporateReason;
  List<String>? tags;

  ClientsPaginationQuery({
    this.page = 0,
    this.size = 10,
    this.order = OrderDirection.desc,
    this.presentationName,
    this.cnpj,
    this.corporateReason,
    this.tags,
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
    if (presentationName != null) {
      json.addAll({'presentationName': presentationName});
    }

    if (cnpj != null) {
      json.addAll({'cnpj': cnpj});
    }
    if (corporateReason != null) {
      json.addAll({'corporateReason': corporateReason});
    }
    if (tags != null) {
      json.addAll({'tags': tags});
    }
    return json;
  }

  factory ClientsPaginationQuery.fowardPage(ClientsPaginationQuery query) {
    return ClientsPaginationQuery(
      page: query.page != null ? query.page! + 1 : null,
      size: query.size,
      order: query.order,
      cnpj: query.cnpj,
      corporateReason: query.corporateReason,
      presentationName: query.presentationName,
      tags: query.tags,
    );
  }

  factory ClientsPaginationQuery.backPage(ClientsPaginationQuery query) {
    return ClientsPaginationQuery(
      page: query.page != null ? query.page! - 1 : null,
      size: query.size,
      order: query.order,
      cnpj: query.cnpj,
      corporateReason: query.corporateReason,
      presentationName: query.presentationName,
      tags: query.tags,
    );
  }
}
