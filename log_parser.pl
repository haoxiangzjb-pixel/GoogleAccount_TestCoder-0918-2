#!/usr/bin/perl
use strict;
use warnings;

# 检查命令行参数
if (@ARGV < 1) {
    print "用法: $0 <日志文件路径> [错误模式]\n";
    print "示例: $0 /var/log/system.log\n";
    print "      $0 /var/log/system.log ERROR\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $error_pattern = $ARGV[1] || 'error|Error|ERROR|failed|Failed|FAILED|critical|Critical|CRITICAL';

# 检查日志文件是否存在
if (!-e $log_file) {
    print "错误: 日志文件 '$log_file' 不存在\n";
    exit 1;
}

# 打开日志文件
open(my $fh, '<', $log_file) or die "无法打开日志文件 '$log_file': $!";

# 统计错误
my %error_count = ();
my $total_errors = 0;
my $line_number = 0;

while (my $line = <$fh>) {
    chomp $line;
    $line_number++;
    
    # 检查行中是否包含错误模式
    if ($line =~ /($error_pattern)/gi) {
        my $error_type = $1;
        $error_count{$error_type}++;
        $total_errors++;
    }
}

close($fh);

# 输出统计结果
print "日志文件: $log_file\n";
print "总错误数: $total_errors\n";
print "错误类型统计:\n";
print "-" x 30 . "\n";

foreach my $error_type (sort keys %error_count) {
    print sprintf("%-20s: %d\n", $error_type, $error_count{$error_type});
}

# 生成随机文件名
my $random_name = "log_stats_" . int(rand(10000)) . "_" . time() . ".pl";

# 写入统计结果到新的Perl脚本文件
open(my $out_fh, '>', $random_name) or die "无法创建输出文件 '$random_name': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# 此脚本由 log_parser.pl 生成\n";
print $out_fh "# 生成时间: " . localtime() . "\n";
print $out_fh "# 源日志文件: $log_file\n";
print $out_fh "# 总错误数: $total_errors\n";
print $out_fh "\n";
print $out_fh "# 错误统计数据\n";
print $out_fh "my \%generated_error_stats = (\n";

foreach my $error_type (sort keys %error_count) {
    print $out_fh "    '$error_type' => $error_count{$error_type},\n";
}

print $out_fh ");\n";
print $out_fh "\n";
print $out_fh "# 打印统计结果\n";
print $out_fh "foreach my \$error_type (sort keys \%generated_error_stats) {\n";
print $out_fh "    print \"\$error_type: \$generated_error_stats{\$error_type}\\n\";\n";
print $out_fh "}\n";

close($out_fh);

print "\n统计结果已保存到: $random_name\n";