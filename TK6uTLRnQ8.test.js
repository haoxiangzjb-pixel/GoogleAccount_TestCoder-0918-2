import React from 'react';
import { render, screen } from '@testing-library/react';
import WelcomeComponent from './WelcomeComponent';

// Mocking React to avoid unnecessary warnings in tests
jest.mock('react', () => ({
  ...jest.requireActual('react'),
  useTransition: () => [false, jest.fn()],
}));

describe('WelcomeComponent', () => {
  test('renders welcome message correctly', () => {
    render(<WelcomeComponent />);
    
    // Check if the main heading is in the document
    const headingElement = screen.getByText(/Welcome to Our Application!/i);
    expect(headingElement).toBeInTheDocument();
    
    // Check if the paragraph text is in the document
    const paragraphElement = screen.getByText(/We're glad to have you here. Enjoy your stay!/i);
    expect(paragraphElement).toBeInTheDocument();
  });
  
  test('renders with correct styling', () => {
    render(<WelcomeComponent />);
    
    // Check if the div has the correct styling
    const divElement = screen.getByRole('generic', { selector: 'div' });
    expect(divElement).toHaveStyle('text-align: center');
    expect(divElement).toHaveStyle('padding: 20px');
    expect(divElement).toHaveStyle('font-family: Arial, sans-serif');
  });
});