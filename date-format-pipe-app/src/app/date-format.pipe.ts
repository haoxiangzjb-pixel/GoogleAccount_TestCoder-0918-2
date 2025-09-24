import { Pipe, PipeTransform } from '@angular/core';

/**
 * 自定义管道，用于格式化日期。
 * 使用 JavaScript 的 toLocaleDateString 方法进行格式化。
 */
@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  /**
   * 转换输入值为日期格式字符串。
   * @param value 输入的日期值，可以是 Date 对象、时间戳或日期字符串。
   * @param locale 本地化格式，默认为 'zh-CN'。
   * @returns 格式化后的日期字符串，如果输入无效则返回 'Invalid Date'。
   */
  transform(value: Date | string | number, locale: string = 'zh-CN'): string {
    // 尝试将输入值转换为 Date 对象
    const date = new Date(value);

    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    try {
      // 使用 toLocaleDateString 进行本地化格式化
      return date.toLocaleDateString(locale);
    } catch (e) {
      // 如果本地化失败，返回 ISO 字符串作为备选
      console.error('Date formatting error:', e);
      return date.toISOString().split('T')[0];
    }
  }
}