

dynamic returnResponse({required bool isSuccess, required int statusCode, String? payload, String? message}) {
  return {
    "isSuccess": isSuccess,
    "statusCode": statusCode,
    "payload": payload, // Replace with actual payload if needed
    "message": message,
  };
}