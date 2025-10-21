import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders the name prop', () => {
    render(<MyComponent name="John" />);
    expect(screen.getByText(/Hello, John!/i)).toBeInTheDocument();
  });

  test('does not render children when not provided', () => {
    render(<MyComponent name="Jane" />);
    const childDiv = screen.queryByTestId('child-div');
    expect(childDiv).not.toBeInTheDocument();
  });

  test('renders children when provided', () => {
    render(
      <MyComponent name="Bob">
        <span data-testid="child-content">Child content</span>
      </MyComponent>
    );
    expect(screen.getByTestId('child-content')).toBeInTheDocument();
  });
});