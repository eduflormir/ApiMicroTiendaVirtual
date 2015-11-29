using BaseRepositorio.ViewModel;
using RepositorioMicroTienda.Model;

namespace RepositorioMicroTienda.ViewModel
{
    public class VentaViewModel:IViewModel<Venta>
    {

        public int id { get; set; }
        public int idCliente { get; set; }
        public System.DateTime fecha { get; set; }
        public decimal total { get; set; }

        public Venta ToBaseDatos()
        {
            return new Venta()
            {
                id=id,
                idCliente = idCliente,
                fecha=fecha,
                total=total
            };
        }

        public void FromBaseDatos(Venta modelo)
        {
            id = modelo.id;
            idCliente = modelo.idCliente;
            fecha = modelo.fecha;
            total = modelo.total;
        }

        public void UpdateBaseDatos(Venta modelo)
        {
            modelo.id = id;
            modelo.idCliente = idCliente;
            modelo.fecha = fecha;
            modelo.total = total;
        }

        public object[] GetKeys()
        {
            return new object[] {id};
        }
    }
}