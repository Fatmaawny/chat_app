class MessageModel{
  final String message;

  MessageModel(this.message);

  factory MessageModel.fromjson(jsonData){
    return MessageModel(jsonData['text']);
  }
}