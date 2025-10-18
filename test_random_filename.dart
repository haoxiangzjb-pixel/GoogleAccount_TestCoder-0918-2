import 'dart:math';

/// 生成随机文件名
String _generateRandomFileName() {
  var random = Random();
  var stringBuffer = StringBuffer();
  
  // 生成8位随机字母数字字符串
  for (int i = 0; i < 8; i++) {
    int randomInt = random.nextInt(36); // 0-9, a-z 共36个字符
    if (randomInt < 10) {
      stringBuffer.write(randomInt); // 0-9
    } else {
      stringBuffer.write(String.fromCharCode(97 + randomInt - 10)); // a-z
    }
  }
  
  return 'data_${stringBuffer.toString()}';
}

void main() {
  // 测试随机文件名生成
  for (int i = 0; i < 5; i++) {
    print('随机文件名: ${_generateRandomFileName()}');
  }
}