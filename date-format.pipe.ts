import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {
  transform(value: any, format: string = 'YYYY-MM-DD'): string {
    if (!value) {
      return '';
    }

    const date = new Date(value);
    
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    // Parse the format string and replace placeholders
    let formattedDate = format;
    
    // Replace year placeholders
    formattedDate = formattedDate.replace(/YYYY/g, date.getFullYear().toString());
    formattedDate = formattedDate.replace(/YY/g, date.getFullYear().toString().slice(-2));
    
    // Replace month placeholders (months are 0-indexed in JS)
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    formattedDate = formattedDate.replace(/MM/g, month);
    formattedDate = formattedDate.replace(/M/g, (date.getMonth() + 1).toString());
    
    // Replace day placeholders
    const day = date.getDate().toString().padStart(2, '0');
    formattedDate = formattedDate.replace(/DD/g, day);
    formattedDate = formattedDate.replace(/D/g, date.getDate().toString());
    
    // Replace hour placeholders
    const hours = date.getHours().toString().padStart(2, '0');
    formattedDate = formattedDate.replace(/HH/g, hours);
    formattedDate = formattedDate.replace(/H/g, date.getHours().toString());
    
    // Replace minute placeholders
    const minutes = date.getMinutes().toString().padStart(2, '0');
    formattedDate = formattedDate.replace(/mm/g, minutes);
    formattedDate = formattedDate.replace(/m/g, date.getMinutes().toString());
    
    // Replace second placeholders
    const seconds = date.getSeconds().toString().padStart(2, '0');
    formattedDate = formattedDate.replace(/ss/g, seconds);
    formattedDate = formattedDate.replace(/s/g, date.getSeconds().toString());
    
    return formattedDate;
  }
}