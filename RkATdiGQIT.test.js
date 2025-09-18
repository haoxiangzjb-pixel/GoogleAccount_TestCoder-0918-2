import React from 'react';
import { render, screen } from '@testing-library/react';
import WelcomeComponent from './WelcomeComponent';

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
    
    // Check if the container has the correct styling
    const containerElement = screen.getByRole('generic', { selector: 'div' });
    expect(containerElement).toHaveStyle('text-align: center');
    expect(containerElement).toHaveStyle('padding: 20px');
    expect(containerElement).toHaveStyle('font-family: Arial, sans-serif');
  });
});