class TwitterLoginRequest {
  final String authToken;
  final String authTokenSecret;

  TwitterLoginRequest({
    required this.authToken,
    required this.authTokenSecret,
  });

  Map<String, dynamic> toJson() => {
        "authToken": authToken,
        "authTokenSecret": authTokenSecret,
      };
}
