import React from 'react';

/**
 * Componente de saludo personalizado
 * @param {Object} props - Las propiedades del componente
 * @param {string} props.nombre - El nombre de la persona a saludar
 * @param {string} [props.mensaje='Hola'] - El mensaje de saludo personalizado
 */
function SaludoPersonalizado({ nombre, mensaje = 'Hola' }) {
  return (
    <div style={{ padding: '20px', fontFamily: 'Arial, sans-serif' }}>
      <h1>{mensaje}, {nombre}!</h1>
      <p>Bienvenido/a a nuestra aplicación.</p>
    </div>
  );
}

export default SaludoPersonalizado;
