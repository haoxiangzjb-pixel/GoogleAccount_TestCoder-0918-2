#!/usr/bin/perl
use strict;
use warnings;

# 脚本功能：解析日志文件并统计各种级别日志的数量

# 检查命令行参数
my $filename = $ARGV[0] or die "用法: $0 <日志文件名>\n";

# 打开文件
open(my $fh, '<', $filename) or die "无法打开文件 '$filename': $!\n";

# 初始化计数器
my %counts = (
    'INFO'    => 0,
    'WARNING' => 0,
    'ERROR'   => 0,
);

# 逐行读取文件
while (my $line = <$fh>) {
    chomp $line;
    # 匹配日志级别并增加计数器
    if ($line =~ /\b(INFO|WARNING|ERROR)\b/) {
        $counts{$1}++;
    }
}

# 关闭文件
close $fh;

# 输出结果
print "日志文件 '$filename' 的统计结果:\n";
print "INFO:    $counts{'INFO'}\n";
print "WARNING: $counts{'WARNING'}\n";
print "ERROR:   $counts{'ERROR'}\n";