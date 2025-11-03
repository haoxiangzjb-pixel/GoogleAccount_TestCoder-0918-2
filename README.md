# 网络数据获取和保存工具

这个Dart程序包含一个异步函数，用于获取网络数据并将其保存到随机命名的.dart文件中。

## 功能

- `fetchAndSaveNetworkData(String url, {String? directory})` - 异步获取指定URL的数据并保存到随机命名的.dart文件中
- 自动创建随机文件名（10个字符的字母数字组合）
- 支持指定保存目录
- 错误处理机制

## 依赖

在使用此程序前，请确保在`pubspec.yaml`中添加了以下依赖：

```yaml
dependencies:
  http: ^0.13.5
```

## 使用方法

1. 安装Dart SDK
2. 运行 `dart pub get` 安装依赖
3. 运行程序：`dart network_data_fetcher.dart`

## 代码结构

- `fetchAndSaveNetworkData` - 主要的异步函数，用于获取网络数据并保存
- `_generateRandomFileName` - 生成随机文件名的辅助函数
- `main` - 示例用法

## 注意事项

- 需要互联网连接以获取网络数据
- 确保目标目录有写入权限
- 程序会验证HTTP响应状态码，只接受200状态码