import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import '@testing-library/jest-dom';
import Button from './Button';

describe('Button', () => {
  test('renders with the correct text', () => {
    render(<Button onClick={() => {}} text="Click me" />);
    const buttonElement = screen.getByText(/Click me/i);
    expect(buttonElement).toBeInTheDocument();
  });

  test('calls onClick when clicked', () => {
    const handleClick = jest.fn();
    render(<Button onClick={handleClick} text="Click me" />);
    const buttonElement = screen.getByText(/Click me/i);
    fireEvent.click(buttonElement);
    expect(handleClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when disabled prop is true', () => {
    render(<Button onClick={() => {}} text="Click me" disabled />);
    const buttonElement = screen.getByText(/Click me/i);
    expect(buttonElement).toBeDisabled();
  });

  test('has the correct custom className', () => {
    render(<Button onClick={() => {}} text="Click me" className="btn-primary" />);
    const buttonElement = screen.getByText(/Click me/i);
    expect(buttonElement).toHaveClass('btn-primary');
  });
});
