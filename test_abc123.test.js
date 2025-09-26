import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

test('renders hello message with name', () => {
  render(<MyComponent name="Alice" />);
  const element = screen.getByText(/Hello, Alice!/i);
  expect(element).toBeInTheDocument();
});