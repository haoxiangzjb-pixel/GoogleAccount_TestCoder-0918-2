#!/usr/bin/perl
use strict;
use warnings;
use File::Basename;

# 生成随机文件名的子程序
sub generate_random_name {
    my $length = 8;
    my @chars = ('a'..'z', 'A'..'Z', '0'..'9');
    my $random_name = '';
    for (1..$length) {
        $random_name .= $chars[rand @chars];
    }
    return $random_name . '.pl';
}

# 检查命令行参数
if (@ARGV < 1) {
    print "用法: $0 <日志文件路径> [错误模式]\n";
    print "例如: $0 /var/log/app.log\n";
    print "      $0 /var/log/app.log ERROR\n";
    exit 1;
}

my $log_file = $ARGV[0];
my $error_pattern = defined $ARGV[1] ? $ARGV[1] : 'error|Error|ERROR|failed|Failed|FAILED';

# 检查日志文件是否存在
unless (-e $log_file) {
    print "错误: 日志文件 '$log_file' 不存在\n";
    exit 1;
}

# 打开日志文件
open(my $fh, '<', $log_file) or die "无法打开文件 '$log_file': $!";

my $error_count = 0;
my @error_lines = ();

# 逐行读取并统计错误
while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /$error_pattern/i) {
        $error_count++;
        push @error_lines, $line;
    }
}

close($fh);

# 输出统计结果
print "日志文件: $log_file\n";
print "错误模式: $error_pattern\n";
print "错误总数: $error_count\n";

if (@error_lines) {
    print "\n检测到的错误行:\n";
    for my $i (0..$#error_lines) {
        print(($i+1) . ": $error_lines[$i]\n");
    }
}

# 生成随机命名的脚本文件
my $random_script_name = generate_random_name();
my $output_path = "/workspace/$random_script_name";

# 创建包含统计结果的Perl脚本
open(my $out_fh, '>', $output_path) or die "无法创建输出文件 '$output_path': $!";
print $out_fh "#!/usr/bin/perl\n";
print $out_fh "use strict;\n";
print $out_fh "use warnings;\n\n";
print $out_fh "# 日志分析结果\n";
print $out_fh "# 源日志文件: $log_file\n";
print $out_fh "# 错误模式: $error_pattern\n";
print $out_fh "# 错误总数: $error_count\n\n";
print $out_fh "# 这个脚本是根据日志分析结果自动生成的\n";
print $out_fh "print \\\"日志分析结果:\\\\n\\\";\n";
print $out_fh "print \\\"源日志文件: $log_file\\\\n\\\";\n";
print $out_fh "print \\\"错误模式: $error_pattern\\\\n\\\";\n";
print $out_fh "print \\\"错误总数: $error_count\\\\n\\\";\n";
print $out_fh "print \\\"\\\\n\\\";\n";

close($out_fh);

print "\n分析结果已保存到: $output_path\n";

# 如果用户希望保存详细的错误行到另一个文件
if (@error_lines) {
    my $details_file = "/workspace/" . basename($log_file, ".log") . "_error_details.txt";
    open(my $details_fh, '>', $details_file) or die "无法创建详细信息文件 '$details_file': $!";
    print $details_fh "日志文件: $log_file\n";
    print $details_fh "错误模式: $error_pattern\n";
    print $details_fh "错误总数: $error_count\n\n";
    print $details_fh "错误详情:\n";
    for my $i (0..$#error_lines) {
        print $details_fh (($i+1) . ": $error_lines[$i]\n");
    }
    close($details_fh);
    print "错误详情已保存到: $details_file\n";
}