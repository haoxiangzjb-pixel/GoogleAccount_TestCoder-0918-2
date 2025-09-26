"use strict";
// /**
//  * A pipe that formats a date value using the standard JavaScript `Date.toLocaleDateString()` method.
//  * It accepts an optional locale string (e.g., 'en-US', 'de-DE') and an optional options object
//  * to customize the formatting.
//  */
// @Pipe({
//   name: 'customDate'
// })
// export class CustomDatePipe implements PipeTransform {
Object.defineProperty(exports, "__esModule", { value: true });
/**
 * Transforms the input value into a formatted date string.
 * @param value The input value, expected to be a Date object, a timestamp number, or an ISO string.
 * @param locale Optional locale string (e.g., 'en-US'). Defaults to 'en-US'.
 * @param options Optional object with date formatting options (e.g., { year: 'numeric', month: 'long', day: 'numeric' }).
 * @returns A formatted date string, or the original value if it cannot be converted to a valid date.
 */
transform(
// The types Date | string | number are used for demonstration.
// In a real Angular context, these would be properly typed against @angular/core.
value, any, locale, string = 'en-US', options ?  : any);
string;
{
    // Default options for date formatting if none are provided
    const defaultOptions = {
        year: 'numeric',
        month: 'short',
        day: 'numeric',
    };
    // Use provided options or fall back to defaults
    const formattingOptions = options || defaultOptions;
    // Attempt to create a Date object from the input value
    const date = new Date(value);
    // Check if the created Date object is valid
    if (isNaN(date.getTime())) {
        // If the date is invalid, return the original value as a string
        console.warn('CustomDatePipe: Invalid date value passed:', value);
        return String(value);
    }
    // Format and return the valid date using the specified locale and options
    return date.toLocaleDateString(locale, formattingOptions);
}
// }
//# sourceMappingURL=custom-date.pipe.js.map