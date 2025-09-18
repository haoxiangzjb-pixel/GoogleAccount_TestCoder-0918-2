import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormatter'
})
export class DateFormatterPipe implements PipeTransform {

  transform(value: any, format?: string): string {
    if (!value) return '';

    const date = new Date(value);

    if (isNaN(date.getTime())) {
      // 如果日期无效，返回原始值或空字符串
      return '';
    }

    // 默认格式化选项
    const defaultOptions: Intl.DateTimeFormatOptions = {
      year: 'numeric',
      month: '2-digit',
      day: '2-digit',
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hour12: false
    };

    // 如果提供了自定义格式，可以在这里添加逻辑来处理
    // 目前我们只使用 toLocaleString 进行基本格式化
    // 更复杂的格式化可以使用库如 date-fns 或自定义逻辑
    const options = format ? this.parseFormat(format) : defaultOptions;

    try {
      // 使用 toLocaleString 进行格式化
      // 注意：toLocaleString 的 options 支持度和行为可能因环境而异
      return date.toLocaleString('zh-CN', options);
    } catch (error) {
      console.error('日期格式化错误:', error);
      return date.toLocaleString(); // 回退到默认格式
    }
  }

  /**
   * 一个简单的格式解析函数示例
   * 将自定义格式字符串转换为 Intl.DateTimeFormatOptions
   * 当前支持 'yyyy-MM-dd' 和 'yyyy/MM/dd HH:mm:ss'
   * @param format 自定义格式字符串
   */
  private parseFormat(format: string): Intl.DateTimeFormatOptions {
    switch (format) {
      case 'yyyy-MM-dd':
        return { year: 'numeric', month: '2-digit', day: '2-digit' };
      case 'yyyy/MM/dd HH:mm:ss':
        return { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false };
      default:
        // 如果格式不匹配，返回默认选项
        return { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: false };
    }
  }
}