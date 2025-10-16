#!/usr/bin/perl
# 日志解析结果
# 源文件: /workspace/test.log
# 错误数量: 5

my $log_file = '/workspace/test.log';
my $error_count = 5;
my @error_messages = (
    '2023-01-01 10:01:22 ERROR Database connection failed',
    '2023-01-01 10:03:05 ERROR Invalid user credentials',
    '2023-01-01 10:05:20 ERROR File not found',
    '2023-01-01 10:07:45 ERROR Timeout occurred',
    '2023-01-01 10:09:33 ERROR Permission denied',
);

# 打印结果
print "日志文件: $log_file\n";
print "错误总数: $error_count\n";
print "错误详情:\n";
foreach my $error (@error_messages) {
    print "  $error\n";
}
