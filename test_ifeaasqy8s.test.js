import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders component with correct name', () => {
    render(<MyComponent name="John" />);
    
    expect(screen.getByText(/Hello, John!/i)).toBeInTheDocument();
  });

  test('calls onClick function when button is clicked', () => {
    const mockOnClick = jest.fn();
    render(<MyComponent name="Jane" onClick={mockOnClick} />);
    
    const button = screen.getByText(/Click me/i);
    fireEvent.click(button);
    
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('renders different names correctly', () => {
    const { rerender } = render(<MyComponent name="Alice" />);
    
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
    
    rerender(<MyComponent name="Bob" />);
    
    expect(screen.getByText(/Hello, Bob!/i)).toBeInTheDocument();
  });
});