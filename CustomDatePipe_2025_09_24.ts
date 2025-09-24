import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format a date using the standard `Date.prototype.toLocaleDateString` method.
 * It accepts a date value (string, number, Date) and optional locale and options.
 * Example usage: {{ someDate | customDate:'en-US':{year:'numeric',month:'long',day:'numeric'} }}
 */
@Pipe({
  name: 'customDate'
})
export class CustomDatePipe implements PipeTransform {
  transform(value: string | number | Date, locale?: string, options?: Intl.DateTimeFormatOptions): string {
    // Handle null, undefined, or empty string inputs
    if (!value) {
      return '';
    }

    // Create a Date object from the input value
    const date = new Date(value);

    // Check if the date is valid
    if (isNaN(date.getTime())) {
      console.error('Invalid date passed to CustomDatePipe:', value);
      return ''; // or return the original value, or a specific error message
    }

    // Use default options if none are provided
    const defaultOptions: Intl.DateTimeFormatOptions = {
      year: 'numeric',
      month: 'short',
      day: 'numeric',
    };

    // Format the date using the provided or default locale and options
    return date.toLocaleDateString(locale || 'en-US', options || defaultOptions);
  }
}
