import React from 'react';
import { render, screen } from '@testing-library/react';
import { MyComponent } from './MyComponent';

describe('MyComponent', () => {
  it('renders the name prop', () => {
    render(<MyComponent name="World" onClick={jest.fn()} />);
    expect(screen.getByText(/Hello, World!/i)).toBeInTheDocument();
  });

  it('calls onClick when the button is clicked', () => {
    const mockOnClick = jest.fn();
    render(<MyComponent name="Test" onClick={mockOnClick} />);
    const button = screen.getByRole('button', { name: /click me/i });
    button.click();
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });
});