import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import MyButton from './MyButton';

describe('MyButton Component', () => {
  test('renders correctly with label', () => {
    const label = 'Click me';
    render(<MyButton label={label} />);
    expect(screen.getByText(label)).toBeInTheDocument();
  });

  test('calls onClick when clicked', () => {
    const mockOnClick = jest.fn();
    const label = 'Click me';
    render(<MyButton onClick={mockOnClick} label={label} />);
    fireEvent.click(screen.getByText(label));
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });
});