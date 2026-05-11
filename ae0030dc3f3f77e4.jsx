import React from 'react';

/**
 * Componente de saludo personalizado
 * @param {Object} props - Propiedades del componente
 * @param {string} props.nombre - Nombre de la persona a saludar
 * @param {string} [props.mensaje='Hola'] - Mensaje personalizado opcional
 * @param {string} [props.color='#333'] - Color del texto opcional
 * @returns {JSX.Element} Elemento de saludo
 */
function SaludoPersonalizado({ nombre, mensaje = 'Hola', color = '#333' }) {
  if (!nombre) {
    return <p style={{ color: '#999' }}>Por favor, proporciona un nombre.</p>;
  }

  const estilos = {
    container: {
      padding: '20px',
      borderRadius: '8px',
      backgroundColor: '#f5f5f5',
      display: 'inline-block',
      marginTop: '20px',
    },
    texto: {
      fontSize: '24px',
      fontWeight: 'bold',
      color: color,
      margin: 0,
    },
  };

  return (
    <div style={estilos.container}>
      <p style={estilos.texto}>{mensaje}, {nombre}!</p>
    </div>
  );
}

export default SaludoPersonalizado;
