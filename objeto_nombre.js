const objetoNombre = {
  _nombre: '',

  getNombre: function() {
    return this._nombre;
  },

  setNombre: function(nombre) {
    this._nombre = nombre;
  }
};

// Ejemplo de uso:
// objetoNombre.setNombre('Juan');
// console.log(objetoNombre.getNombre()); // Imprime: Juan

module.exports = objetoNombre;