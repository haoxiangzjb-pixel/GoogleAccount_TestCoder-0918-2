import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {
  transform(value: any, format: string = 'yyyy-MM-dd'): string {
    if (!value) {
      return '';
    }

    // 尝试将输入值转换为Date对象
    let date: Date;
    if (typeof value === 'string') {
      date = new Date(value);
    } else if (value instanceof Date) {
      date = value;
    } else {
      // 如果是时间戳
      date = new Date(value);
    }

    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    // 根据格式参数格式化日期
    const year = date.getFullYear();
    const month = date.getMonth() + 1; // 月份从0开始，需要+1
    const day = date.getDate();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    // 替换格式字符串中的占位符
    let formatted = format
      .replace('yyyy', year.toString())
      .replace('MM', month.toString().padStart(2, '0'))
      .replace('dd', day.toString().padStart(2, '0'))
      .replace('HH', hours.toString().padStart(2, '0'))
      .replace('mm', minutes.toString().padStart(2, '0'))
      .replace('ss', seconds.toString().padStart(2, '0'));

    return formatted;
  }
}