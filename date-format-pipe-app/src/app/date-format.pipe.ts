import { Pipe, PipeTransform } from '@angular/core';

/**
 * A pipe to format a date string or Date object into a more readable format.
 * It uses the built-in `Date.prototype.toLocaleDateString()` method.
 * Example usage in a template:
 * {{ dateString | dateFormat }}
 * {{ dateObject | dateFormat:'en-US':'long' }}
 */
@Pipe({
  name: 'dateFormat',
  standalone: true // Marking it as standalone makes it more modular
})
export class DateFormatPipe implements PipeTransform {

  /**
   * Transforms the input value into a formatted date string.
   * @param value The input date, can be a string or a Date object.
   * @param locale The locale to use for formatting (e.g., 'en-US', 'de-DE'). Defaults to 'en-US'.
   * @param options The date format options (e.g., 'short', 'long'). Defaults to 'medium'.
   * @returns A formatted date string or 'Invalid Date' if the input is not a valid date.
   */
  transform(value: string | Date | null | undefined, locale: string = 'en-US', options: 'short' | 'medium' | 'long' | 'full' = 'medium'): string {
    if (value === null || value === undefined) {
      return '';
    }

    const date = new Date(value);
    if (isNaN(date.getTime())) {
      return 'Invalid Date';
    }

    const dateOptions: Intl.DateTimeFormatOptions = {
      dateStyle: options,
    };

    try {
      return date.toLocaleDateString(locale, dateOptions);
    } catch (e) {
      console.error('Error formatting date:', e);
      // Fallback to a simple format if locale is invalid
      return date.toLocaleDateString();
    }
  }
}
