#!/usr/bin/perl
# 此脚本由 log_parser.pl 生成
# 生成时间: Tue Oct 21 14:49:16 2025
# 源日志文件: /workspace/test.log
# 总错误数: 5

# 错误统计数据
my %generated_error_stats = (
    'CRITICAL' => 1,
    'ERROR' => 4,
);

# 打印统计结果
foreach my $error_type (sort keys %generated_error_stats) {
    print "$error_type: $generated_error_stats{$error_type}\n";
}
