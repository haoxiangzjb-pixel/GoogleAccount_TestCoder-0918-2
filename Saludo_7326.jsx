import React from 'react';

/**
 * Componente SaludoPersonalizado
 * Muestra un saludo personalizado basado en las props recibidas.
 * 
 * @param {Object} props - Las propiedades del componente
 * @param {string} props.nombre - El nombre de la persona a saludar (requerido)
 * @param {string} [props.mensaje='Hola'] - El mensaje de saludo (opcional, por defecto 'Hola')
 */
const SaludoPersonalizado = ({ nombre, mensaje = 'Hola' }) => {
  if (!nombre) {
    return <p style={{ color: 'red' }}>Por favor, proporciona un nombre.</p>;
  }

  const estiloContenedor = {
    padding: '20px',
    border: '1px solid #ccc',
    borderRadius: '8px',
    backgroundColor: '#f9f9f9',
    fontFamily: 'Arial, sans-serif',
    maxWidth: '400px',
    margin: '20px auto',
    textAlign: 'center'
  };

  const estiloNombre = {
    color: '#007bff',
    fontWeight: 'bold',
    fontSize: '1.5em'
  };

  return (
    <div style={estiloContenedor}>
      <h2>{mensaje}, <span style={estiloNombre}>{nombre}</span>!</h2>
      <p>Bienvenido/a a nuestra aplicación.</p>
    </div>
  );
};

export default SaludoPersonalizado;
