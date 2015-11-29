using BaseRepositorio.ViewModel;
using RepositorioMicroTienda.Model;

namespace RepositorioMicroTienda.ViewModel
{
    public class VentaProductoViewModel:IViewModel<VentaProducto>
    {
        public int idVenta { get; set; }
        public int idProducto { get; set; }
        public int unidades { get; set; }

        public VentaProducto ToBaseDatos()
        {
            return new VentaProducto()
            {
                idVenta = idVenta,
                idProducto = idProducto,
                unidades=unidades

            };
        }

        public void FromBaseDatos(VentaProducto modelo)
        {
            idVenta = modelo.idVenta;
            idProducto = modelo.idProducto;
            unidades = modelo.unidades;
        }

        public void UpdateBaseDatos(VentaProducto modelo)
        {
            modelo.idVenta = idVenta;
            modelo.idProducto = idProducto;
            modelo.unidades = unidades;
        }

        public object[] GetKeys()
        {
            return new object[] {idVenta,idProducto};
        }
    }
}