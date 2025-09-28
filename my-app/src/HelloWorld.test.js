import { render, screen } from '@testing-library/react';
import HelloWorld from './HelloWorld';

describe('HelloWorld Component', () => {
  test('renders default greeting', () => {
    render(<HelloWorld />);
    expect(screen.getByText(/Hello, World!/i)).toBeInTheDocument();
  });

  test('renders custom greeting', () => {
    render(<HelloWorld name="Alice" />);
    expect(screen.getByText(/Hello, Alice!/i)).toBeInTheDocument();
  });
});