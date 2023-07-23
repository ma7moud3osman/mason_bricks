class WalletRequest {
  late final String receiver;
  late final int amount;

  WalletRequest({
    required this.receiver,
    required this.amount,
  });

  WalletRequest.fromJson(Map<String, dynamic> json) {
    receiver = json['receiver'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['receiver'] = receiver;
    data['amount'] = amount;
    return data;
  }
}
