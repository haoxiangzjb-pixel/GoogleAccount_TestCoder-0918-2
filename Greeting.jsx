import React from 'react';

const Greeting = ({ name, greeting = 'Hello' }) => {
  return (
    <div>
      <h1>{greeting}, {name}!</h1>
    </div>
  );
};

export default Greeting;