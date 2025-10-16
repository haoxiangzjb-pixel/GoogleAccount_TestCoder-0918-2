#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# 生成随机文件名
sub generate_random_filename {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_name = '';
    for (1..$length) {
        $random_name .= $chars[rand @chars];
    }
    return $random_name . '.pl';
}

# 主程序
print "日志文件解析器\n";
print "请输入要解析的日志文件路径（或按Enter使用示例日志）: ";
chomp(my $log_file = <STDIN>);

# 如果用户没有输入文件路径，创建一个示例日志文件
if ($log_file eq '') {
    $log_file = 'sample.log';
    open(my $fh, '>', $log_file) or die "无法创建示例日志文件: $!";
    print $fh "2023-01-01 10:00:01 INFO Application started\n";
    print $fh "2023-01-01 10:01:22 ERROR Database connection failed\n";
    print $fh "2023-01-01 10:02:15 INFO User login successful\n";
    print $fh "2023-01-01 10:03:05 ERROR Invalid user credentials\n";
    print $fh "2023-01-01 10:04:10 WARN Disk space low\n";
    print $fh "2023-01-01 10:05:20 ERROR File not found\n";
    print $fh "2023-01-01 10:06:30 INFO User logout\n";
    close($fh);
    print "已创建示例日志文件: $log_file\n";
}

# 检查日志文件是否存在
unless (-e $log_file) {
    die "错误: 日志文件 '$log_file' 不存在!\n";
}

# 打开并读取日志文件
open(my $fh, '<', $log_file) or die "无法打开日志文件 '$log_file': $!";

my $error_count = 0;
my @error_lines = ();

# 解析日志文件，统计错误
while (my $line = <$fh>) {
    chomp $line;
    # 查找包含ERROR的行
    if ($line =~ /ERROR/i) {
        $error_count++;
        push @error_lines, $line;
    }
}

close($fh);

print "\n解析完成！\n";
print "在文件 '$log_file' 中找到 $error_count 个错误。\n";

# 显示找到的错误行
if (@error_lines) {
    print "\n错误详情:\n";
    for my $error_line (@error_lines) {
        print "  $error_line\n";
    }
} else {
    print "没有找到错误。\n";
}

# 生成随机命名的Perl脚本文件
my $output_file = generate_random_filename();
print "\n将结果保存到随机命名的Perl脚本: $output_file\n";

# 创建包含解析结果的Perl脚本
open(my $out_fh, '>', $output_file) or die "无法创建输出文件 '$output_file': $!";

print $out_fh "#!/usr/bin/perl\n";
print $out_fh "# 日志解析结果\n";
print $out_fh "# 源文件: $log_file\n";
print $out_fh "# 错误数量: $error_count\n\n";
print $out_fh "my \$log_file = '$log_file';\n";
print $out_fh "my \$error_count = $error_count;\n";
print $out_fh "my \@error_messages = (\n";

foreach my $error (@error_lines) {
    print $out_fh "    '$error',\n";
}
print $out_fh ");\n\n";
print $out_fh "# 打印结果\n";
print $out_fh "print \"日志文件: \$log_file\\n\";\n";
print $out_fh "print \"错误总数: \$error_count\\n\";\n";
print $out_fh "print \"错误详情:\\n\";\n";
print $out_fh "foreach my \$error (\@error_messages) {\n";
print $out_fh "    print \"  \$error\\n\";\n";
print $out_fh "}\n";

close($out_fh);

print "\n结果已保存到: $output_file\n";
print "您可以使用 'perl $output_file' 命令来运行生成的脚本。\n";