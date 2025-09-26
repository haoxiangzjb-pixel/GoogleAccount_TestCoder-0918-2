import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'customDateFormat'
})
export class CustomDateFormatPipe implements PipeTransform {

  transform(value: Date | string | number, format: string = 'yyyy-MM-dd'): string {
    const date = new Date(value);
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    const map: { [key: string]: string } = {
      'yyyy': date.getFullYear().toString(),
      'MM': (date.getMonth() + 1).toString().padStart(2, '0'),
      'dd': date.getDate().toString().padStart(2, '0'),
      'HH': date.getHours().toString().padStart(2, '0'),
      'mm': date.getMinutes().toString().padStart(2, '0'),
      'ss': date.getSeconds().toString().padStart(2, '0'),
    };

    let formattedDate = format;
    Object.keys(map).forEach(key => {
      formattedDate = formattedDate.replace(new RegExp(key, 'g'), map[key]);
    });

    return formattedDate;
  }
}