import React from 'react';
import { render, screen } from '@testing-library/react';
import SampleComponent from './SampleComponent';

describe('SampleComponent', () => {
  test('renders title and description correctly', () => {
    const title = 'Test Title';
    const description = 'Test Description';
    
    render(<SampleComponent title={title} description={description} />);
    
    expect(screen.getByText(title)).toBeInTheDocument();
    expect(screen.getByText(description)).toBeInTheDocument();
  });

  test('renders with empty props', () => {
    render(<SampleComponent title="" description="" />);
    
    expect(screen.getByText('')).toBeInTheDocument();
  });

  test('has correct class name', () => {
    render(<SampleComponent title="Title" description="Description" />);
    
    const component = screen.getByRole('generic', { hidden: true }); // Gets the outer div
    expect(component).toHaveClass('sample-component');
  });
});