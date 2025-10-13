import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

test('renders MyComponent with default name', () => {
  render(<MyComponent />);
  const headingElement = screen.getByText(/hello, world!/i);
  expect(headingElement).toBeInTheDocument();
});

test('renders MyComponent with custom name', () => {
  render(<MyComponent name="Alice" />);
  const headingElement = screen.getByText(/hello, alice!/i);
  expect(headingElement).toBeInTheDocument();
});