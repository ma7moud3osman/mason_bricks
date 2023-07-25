class ContactUsRequest {
  late final String message;
  late final String subject;

  ContactUsRequest({
    required this.message,
    required this.subject,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['subject'] = subject;
    data['message'] = message;
    return data;
  }
}

class UpdateContactUsRequest {
  late final String id;
  late final String status;

  UpdateContactUsRequest({
    required this.id,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;

    return data;
  }
}
