class TokenEntity {
  String accessToken;
  String refreshToken;

  TokenEntity({
    this.accessToken = "",
    this.refreshToken = "",
  });

  factory TokenEntity.fromJson(Map<String, dynamic> json) => TokenEntity(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };

  @override
  String toString() {
    return 'TokenEntity{accessToken: $accessToken, refreshToken: $refreshToken}';
  }
}
