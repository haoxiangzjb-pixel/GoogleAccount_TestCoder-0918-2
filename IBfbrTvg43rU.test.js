import React from 'react';
import { render, screen } from '@testing-library/react';
import '@testing-library/jest-dom';
import WelcomeComponent from './welcome_9j2k4';

test('renders welcome message', () => {
  render(<WelcomeComponent />);
  const headingElement = screen.getByRole('heading', { name: /welcome to our application!/i });
  const paragraphElement = screen.getByText(/we are glad you are here./i);

  expect(headingElement).toBeInTheDocument();
  expect(paragraphElement).toBeInTheDocument();
});