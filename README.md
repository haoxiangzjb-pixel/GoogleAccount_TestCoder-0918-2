# Dart异步网络数据获取与保存

本项目演示了如何使用Dart（或JavaScript模拟）异步获取网络数据并将其保存到随机命名的.dart文件中。

## Dart版本

`dart_network_file_generator.dart` 文件包含完整的Dart实现：

- `fetchAndSaveData()` - 异步函数，获取网络数据并保存到随机命名的.dart文件
- `generateRandomFileName()` - 生成随机.dart文件名的辅助函数
- 使用了`http`包进行网络请求
- 使用`dart:io`进行文件操作

## JavaScript模拟版本

由于环境中没有安装Dart，我们提供了JavaScript/Node.js的模拟实现：

- `network_file_generator.js` - Node.js版本的实现
- 功能与Dart版本相同
- 使用原生Node.js模块进行网络请求和文件操作

## 运行示例

JavaScript版本已经成功运行，并创建了随机命名的.dart文件（如 `MO9Ncu1GYdsc.dart`），其中包含从JSONPlaceholder API获取的用户数据。

## 特性

1. **异步操作** - 使用async/await模式处理网络请求
2. **随机文件名生成** - 生成8-12个字符的随机文件名
3. **错误处理** - 包含完整的错误处理机制
4. **灵活目录** - 可选择指定保存目录
5. **状态报告** - 提供操作进度和结果的详细信息

## 使用方法

对于Dart版本：
```bash
dart pub get
dart dart_network_file_generator.dart
```

对于JavaScript版本：
```bash
node network_file_generator.js
```