import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format a date string using standard JavaScript Date methods.
 * It takes a date string and a format string as input.
 * Example usage in template: {{ dateValue | dateFormat:'fullDate' }}
 */
@Pipe({
  name: 'dateFormat'
})
export class DateFormatPipe implements PipeTransform {

  /**
   * Transforms the input date string according to the specified format.
   * @param value The input date string or Date object.
   * @param format The desired format ('shortDate', 'longDate', 'fullDate', 'time', 'dateTime').
   * @returns The formatted date string, or the original value if invalid.
   */
  transform(value: string | Date | null, format?: 'shortDate' | 'longDate' | 'fullDate' | 'time' | 'dateTime'): string {
    if (!value) {
      return '';
    }

    const date = new Date(value);
    if (isNaN(date.getTime())) {
      console.error('Invalid date passed to dateFormat pipe:', value);
      return String(value); // Return the original value if it's not a valid date
    }

    const options: Intl.DateTimeFormatOptions = {};

    switch (format) {
      case 'shortDate':
        options.dateStyle = 'short';
        break;
      case 'longDate':
        options.dateStyle = 'long';
        break;
      case 'fullDate':
        options.dateStyle = 'full';
        break;
      case 'time':
        options.timeStyle = 'short';
        break;
      case 'dateTime':
        options.dateStyle = 'medium';
        options.timeStyle = 'short';
        break;
      default:
        // Default to 'medium' date if no format is specified
        options.dateStyle = 'medium';
    }

    return new Intl.DateTimeFormat('en-US', options).format(date);
  }
}