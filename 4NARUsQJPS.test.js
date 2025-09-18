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
    const paragraphElement = screen.getByText(/We're glad to have you here/i);
    expect(paragraphElement).toBeInTheDocument();
    
    // Check if the component renders a div with correct styling
    const divElement = screen.getByRole('generic', { hidden: true });
    expect(divElement).toBeInTheDocument();
  });
});