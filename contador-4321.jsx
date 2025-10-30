import React, { useState } from 'react';

const Contador = () => {
  const [count, setCount] = useState(0);

  const incrementar = () => {
    setCount(count + 1);
  };

  const decrementar = () => {
    setCount(count - 1);
  };

  const zerar = () => {
    setCount(0);
  };

  return (
    <div>
      <h2>Contador</h2>
      <p>Valor atual: {count}</p>
      <button onClick={incrementar}>Incrementar</button>
      <button onClick={decrementar} style={{ marginLeft: '10px' }}>Decrementar</button>
      <button onClick={zerar} style={{ marginLeft: '10px' }}>Zerar</button>
    </div>
  );
};

export default Contador;