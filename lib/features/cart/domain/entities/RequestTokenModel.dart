/// token : "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SjFjMlZ5WDJsa0lqb3hOamd5TVRNekxDSmhiVzkxYm5SZlkyVnVkSE1pT2pFd01EQXdMQ0pqZFhKeVpXNWplU0k2SWtWSFVDSXNJbWx1ZEdWbmNtRjBhVzl1WDJsa0lqbzBOREV6T0RZNUxDSnZjbVJsY2w5cFpDSTZNVGMzTURFME1EY3lMQ0ppYVd4c2FXNW5YMlJoZEdFaU9uc2labWx5YzNSZmJtRnRaU0k2SWxOaGJHMWhJaXdpYkdGemRGOXVZVzFsSWpvaVJXd3RSR1ZsYmlJc0luTjBjbVZsZENJNklrNUJJaXdpWW5WcGJHUnBibWNpT2lKT1FTSXNJbVpzYjI5eUlqb2lUa0VpTENKaGNHRnlkRzFsYm5RaU9pSk9RU0lzSW1OcGRIa2lPaUpPUVNJc0luTjBZWFJsSWpvaVRrRWlMQ0pqYjNWdWRISjVJam9pVGtFaUxDSmxiV0ZwYkNJNkluTmhiRzFoYUc5emMyRnRNRGswUUdkdFlXbHNMbU52YlNJc0luQm9iMjVsWDI1MWJXSmxjaUk2SWpBeE1EWTRPVFk1TlRFMklpd2ljRzl6ZEdGc1gyTnZaR1VpT2lKT1FTSXNJbVY0ZEhKaFgyUmxjMk55YVhCMGFXOXVJam9pVGtFaWZTd2liRzlqYTE5dmNtUmxjbDkzYUdWdVgzQmhhV1FpT21aaGJITmxMQ0psZUhSeVlTSTZlMzBzSW5OcGJtZHNaVjl3WVhsdFpXNTBYMkYwZEdWdGNIUWlPbVpoYkhObExDSmxlSEFpT2pFM01EUTNNamt5TXpRc0luQnRhMTlwY0NJNklqRTFOQzR5TXpjdU1qSTBMakl4TlNKOS5mbzg4aWdvSlJKWHBnX1ZjX0Q3RlNuQkt3cXhZaFNudUItME9vTVFJTmxXb19hcmJVNEtwWXZHajVrU1dpNDg3OUFMUzd3eDVHeEFQTDRzeUZRSFRudw=="

// ignore_for_file: file_names

class RequestTokenModel {
  RequestTokenModel({
      this.token,});

  RequestTokenModel.fromJson(dynamic json) {
    token = json['token'];
  }
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}