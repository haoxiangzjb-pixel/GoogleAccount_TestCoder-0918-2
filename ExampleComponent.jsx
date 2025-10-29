import React from 'react';

const ExampleComponent = ({ title, description }) => {
  return (
    <div className="example-component">
      <h1>{title}</h1>
      <p>{description}</p>
    </div>
  );
};

export default ExampleComponent;