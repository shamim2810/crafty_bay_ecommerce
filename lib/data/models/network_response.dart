class NetworkResponse {
  final int? responseCode;
  final String? errorMessage;
  final dynamic responseData;
  final bool isSuccess;

  NetworkResponse({
    required this.isSuccess,
    required this.responseCode,
    this.errorMessage = 'something went wrong',
    this.responseData,
  });
}
