namespace java com.example.chat
namespace cpp chat
namespace py chat

struct ChatMessage {
  1: required i64 id,
  2: required string sender,
  3: required string content,
  4: required i64 timestamp,
  5: optional string recipient,
  6: optional bool isRead = false
}

enum MessageType {
  TEXT = 0,
  IMAGE = 1,
  FILE = 2,
  SYSTEM = 3
}

struct EnhancedChatMessage {
  1: required ChatMessage baseMessage,
  2: optional MessageType messageType = MessageType.TEXT,
  3: optional map<string, string> metadata
}