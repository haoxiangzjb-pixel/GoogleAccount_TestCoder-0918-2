import React from 'react';

export function MyComponent(props: { name: string; onClick: () => void }) {
  return (
    <div>
      <h1>Hello, {props.name}!</h1>
      <button onClick={props.onClick}>Click me</button>
    </div>
  )
}

export default MyComponent;
