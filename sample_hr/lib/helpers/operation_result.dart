
class OperationResult<T>{
  T data;
  bool success;
  String message;
  OperationResult({this.success, this.message,this.data});
}