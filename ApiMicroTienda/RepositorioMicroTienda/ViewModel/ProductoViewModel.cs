using System;
using BaseRepositorio;
using BaseRepositorio.ViewModel;
using RepositorioMicroTienda.Model;

namespace RepositorioMicroTienda.ViewModel
{
    public class ProductoViewModel:IViewModel<Producto>
    {

        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }
        public decimal precio { get; set; }
        public Nullable<decimal> precioDescuento { get; set; }
        public int idCategoria { get; set; }


        public Producto ToBaseDatos()
        {
            return new Producto()
            {
                id = id,
                nombre=nombre,
                descripcion = descripcion,
                precio=precio,
                precioDescuento = precioDescuento,
                idCategoria = idCategoria
            };
        }

        public void FromBaseDatos(Producto modelo)
        {
            id = modelo.id;
            nombre = modelo.nombre;
            descripcion = modelo.descripcion;
            precio = modelo.precio;
            precioDescuento = modelo.precioDescuento;
            idCategoria = modelo.idCategoria;
        }

        public void UpdateBaseDatos(Producto modelo)
        {
            modelo.id = id;
            modelo.nombre = nombre;
            modelo.descripcion = descripcion;
            modelo.precio = precio;
            modelo.precioDescuento = precioDescuento;
            modelo.idCategoria = idCategoria;
        }

        public object[] GetKeys()
        {
            return new object[] {id};
        }
    }
}