import { render, screen, fireEvent } from '@testing-library/react';
import MyButton from './MyButton';

describe('MyButton Component', () => {
  test('renders the button with the correct label', () => {
    const label = 'Click Me';
    render(<MyButton label={label} />);
    expect(screen.getByText(label)).toBeInTheDocument();
  });

  test('calls the onClick handler when clicked', () => {
    const mockOnClick = jest.fn();
    const label = 'Submit';
    render(<MyButton label={label} onClick={mockOnClick} />);
    
    const button = screen.getByRole('button', { name: label });
    fireEvent.click(button);
    
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });
});