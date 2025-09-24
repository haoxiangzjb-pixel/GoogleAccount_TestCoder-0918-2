import { render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import MyButton from './MyButton';

describe('MyButton Component', () => {
  test('renders the button with the correct label', () => {
    const label = 'Click Me';
    render(<MyButton label={label} />);

    const button = screen.getByRole('button', { name: label });
    expect(button).toBeInTheDocument();
    expect(button).toHaveTextContent(label);
  });

  test('calls the onClick handler when clicked', async () => {
    const user = userEvent.setup();
    const mockOnClick = jest.fn();
    const label = 'Submit';

    render(<MyButton onClick={mockOnClick} label={label} />);

    const button = screen.getByRole('button', { name: label });
    await user.click(button);

    expect(mockOnClick).toHaveBeenCalledTimes(1);
  });
});