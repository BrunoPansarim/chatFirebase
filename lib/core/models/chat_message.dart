class ChatMessage {
  final String id;
  final String text;
  final String createdAt;

  final String userId;
  final String username;
  final String userImageURL;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userId,
    required this.username,
    required this.userImageURL,
  });
}