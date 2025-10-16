import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  transform(value: any, format: string = 'YYYY-MM-DD'): any {
    if (!value) {
      return '';
    }

    // 尝试将输入值转换为Date对象
    const date = new Date(value);
    
    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    // 定义格式化选项
    const options: Intl.DateTimeFormatOptions = {};
    
    // 根据格式字符串设置选项
    if (format.includes('YYYY')) {
      options.year = 'numeric';
    }
    if (format.includes('MM')) {
      options.month = format.includes('MMMM') ? 'long' : '2-digit';
    }
    if (format.includes('DD')) {
      options.day = '2-digit';
    }
    if (format.includes('HH')) {
      options.hour = '2-digit';
      options.hour12 = false;
    }
    if (format.includes('mm')) {
      options.minute = '2-digit';
    }
    if (format.includes('ss')) {
      options.second = '2-digit';
    }

    // 如果格式是预定义的常用格式之一，使用本地化格式
    switch (format) {
      case 'short':
        return date.toLocaleDateString();
      case 'long':
        return date.toLocaleDateString('en-US', { 
          year: 'numeric', 
          month: 'long', 
          day: 'numeric' 
        });
      case 'time':
        return date.toLocaleTimeString();
      case 'datetime':
        return date.toLocaleString();
      default:
        // 使用Intl.DateTimeFormat进行格式化
        return new Intl.DateTimeFormat('en-US', options).format(date);
    }
  }
}