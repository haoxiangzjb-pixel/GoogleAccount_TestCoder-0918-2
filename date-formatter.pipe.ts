import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormatter'
})
export class DateFormatterPipe implements PipeTransform {
  transform(value: any, format: string = 'mediumDate'): string {
    if (!value) {
      return '';
    }

    // 创建日期对象
    const date = new Date(value);
    
    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    // 根据格式参数格式化日期
    switch (format) {
      case 'short':
        return date.toLocaleDateString();
      case 'medium':
        return date.toLocaleDateString('en-US', {
          year: 'numeric',
          month: 'short',
          day: 'numeric'
        });
      case 'long':
        return date.toLocaleDateString('en-US', {
          year: 'numeric',
          month: 'long',
          day: 'numeric'
        });
      case 'full':
        return date.toLocaleDateString('en-US', {
          weekday: 'long',
          year: 'numeric',
          month: 'long',
          day: 'numeric'
        });
      case 'time':
        return date.toLocaleTimeString();
      case 'datetime':
        return date.toLocaleString();
      case 'iso':
        return date.toISOString();
      case 'yyyy-mm-dd':
        return date.toISOString().split('T')[0];
      case 'dd/mm/yyyy':
        return date.toLocaleDateString('en-GB');
      case 'mm/dd/yyyy':
        return date.toLocaleDateString('en-US');
      default:
        return date.toLocaleDateString();
    }
  }
}