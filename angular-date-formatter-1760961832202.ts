import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {
  transform(value: any, format: string = 'YYYY-MM-DD'): string {
    if (!value) {
      return '';
    }

    // 创建日期对象
    const date = new Date(value);
    
    // 检查日期是否有效
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    // 定义格式化函数
    const pad = (num: number): string => num.toString().padStart(2, '0');
    const padYear = (num: number): string => num.toString().padStart(4, '0');
    
    // 获取日期组件
    const year = date.getFullYear();
    const month = date.getMonth() + 1; // 月份从0开始，需要+1
    const day = date.getDate();
    const hours = date.getHours();
    const minutes = date.getMinutes();
    const seconds = date.getSeconds();

    // 替换格式字符串
    let formattedDate = format
      .replace('YYYY', padYear(year))
      .replace('MM', pad(month))
      .replace('DD', pad(day))
      .replace('HH', pad(hours))
      .replace('mm', pad(minutes))
      .replace('ss', pad(seconds));

    return formattedDate;
  }
}