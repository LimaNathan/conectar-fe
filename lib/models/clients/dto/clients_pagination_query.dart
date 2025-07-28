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
  bool? status;
  bool? conectaPlus;

  ClientsPaginationQuery({
    this.page = 0,
    this.size = 10,
    this.order = OrderDirection.desc,
    this.presentationName,
    this.cnpj,
    this.corporateReason,
    this.tags,
    this.status,
    this.conectaPlus,
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
      json.addAll({'tags': tags as List<String>});
    }

    if (status != null) {
      json.addAll({'status': status});
    }

    if (conectaPlus != null) {
      json.addAll({'conectaPlus': conectaPlus});
    }

    return json;
  }

  cleanFilters() {
    cnpj = null;
    corporateReason = null;
    presentationName = null;
    tags = null;
    status = null;
    conectaPlus = null;
  }

  fowardPage() {
    page = page != null ? page! + 1 : null;
    size = size;
    order = order;
    cnpj = cnpj;
    corporateReason = corporateReason;
    presentationName = presentationName;
    tags = tags;
  }

  backPage() {
    page = page != null ? page! - 1 : null;
    size = size;
    order = order;
    cnpj = cnpj;
    corporateReason = corporateReason;
    presentationName = presentationName;
    tags = tags;
  }
}
