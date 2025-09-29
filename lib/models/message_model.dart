class MessageModel{
  final String message;
  final String id;
  MessageModel(this.message, this.id);

  factory MessageModel.fromjson(jsonData){
    return MessageModel(jsonData['text'],jsonData['id']);
  }
}