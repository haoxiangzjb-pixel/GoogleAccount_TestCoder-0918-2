import { Pipe, PipeTransform } from '@angular/core';

/**
 * 自定义管道，用于格式化日期。
 * 使用示例: {{ someDate | dateFormatter:'yyyy-MM-dd HH:mm:ss' }}
 */
@Pipe({
  name: 'dateFormatter'
})
export class DateFormatterPipe implements PipeTransform {
  /**
   * 转换日期对象为指定格式的字符串。
   * @param value 输入的日期，可以是 Date 对象、时间戳或 ISO 字符串。
   * @param format 日期格式字符串，例如 'yyyy-MM-dd' 或 'MM/dd/yyyy HH:mm:ss'。
   * @returns 格式化后的日期字符串。
   */
  transform(value: Date | string | number, format: string = 'yyyy-MM-dd'): string {
    if (!value) {
      return '';
    }

    let date = new Date(value);
    if (isNaN(date.getTime())) {
      console.error('Invalid date passed to DateFormatterPipe:', value);
      return '';
    }

    // 简单的格式映射，实际项目中可能需要更复杂的逻辑或使用第三方库如 date-fns
    const map: { [key: string]: string } = {
      'yyyy': date.getFullYear().toString(),
      'MM': String(date.getMonth() + 1).padStart(2, '0'),
      'dd': String(date.getDate()).padStart(2, '0'),
      'HH': String(date.getHours()).padStart(2, '0'),
      'mm': String(date.getMinutes()).padStart(2, '0'),
      'ss': String(date.getSeconds()).padStart(2, '0'),
    };

    let formattedDate = format;
    Object.keys(map).forEach(key => {
      formattedDate = formattedDate.replace(new RegExp(key, 'g'), map[key]);
    });

    return formattedDate;
  }
}