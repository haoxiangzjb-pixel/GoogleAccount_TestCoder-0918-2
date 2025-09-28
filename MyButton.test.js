import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import MyButton from './MyButton'; // Adjust the import path as needed

describe('MyButton Component', () => {
  test('renders correctly with default props', () => {
    render(<MyButton label="Click Me" />);
    expect(screen.getByText(/click me/i)).toBeInTheDocument();
  });

  test('calls onClick handler when clicked', async () => {
    const user = userEvent.setup();
    const mockOnClick = jest.fn();
    render(<MyButton label="Test Button" onClick={mockOnClick} />);
    
    const button = screen.getByRole('button', { name: /test button/i });
    await user.click(button);
    
    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });

  test('is disabled when disabled prop is true', () => {
    render(<MyButton label="Disabled Button" disabled={true} />);
    const button = screen.getByRole('button', { name: /disabled button/i });
    expect(button).toBeDisabled();
  });
});