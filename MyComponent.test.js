// This is a generated test file for MyComponent.jsx
import React from 'react';
import { render, screen } from '@testing-library/react';
import MyComponent from './MyComponent';

describe('MyComponent', () => {
  test('renders the name prop', () => {
    render(<MyComponent name="Test User" />);
    expect(screen.getByText(/Hello, Test User!/i)).toBeInTheDocument();
  });

  test('renders a list of items', () => {
    const items = ['Apple', 'Banana', 'Cherry'];
    render(<MyComponent name="List Test" items={items} />);
    items.forEach(item => {
      expect(screen.getByText(item)).toBeInTheDocument();
    });
  });

  test('renders an empty list if no items are provided', () => {
    render(<MyComponent name="Empty Test" />);
    // Assuming the <ul> element exists but is empty
    const listElement = screen.getByRole('list'); // This assumes the <ul> has a role="list" or similar, or just check for its existence
    expect(listElement).toBeInTheDocument();
    // A more robust check might be to count child nodes, but for this example, we assume the list is present but empty if no items prop is given.
    expect(listElement.children.length).toBe(0); // This assertion might fail if the JSX always renders <li> elements. A better check is needed.
    // A better check for an empty list might be to check for the absence of <li> tags:
    expect(screen.queryByRole('listitem')).not.toBeInTheDocument(); // This checks for the absence of list items.
  });
});