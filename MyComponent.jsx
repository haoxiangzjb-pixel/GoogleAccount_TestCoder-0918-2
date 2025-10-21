import React from 'react';

const MyComponent = ({ name, children }) => {
  return (
    <div>
      <h1>Hello, {name}!</h1>
      {children && <div>{children}</div>}
    </div>
  );
};

export default MyComponent;