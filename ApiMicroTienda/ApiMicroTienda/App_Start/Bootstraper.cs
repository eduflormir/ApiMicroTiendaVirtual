using System.Data.Entity;
using BaseRepositorio.Repositorio;
using Microsoft.Practices.Unity;
using RepositorioMicroTienda.Model;
using RepositorioMicroTienda.ViewModel;

namespace ApiMicroTienda
{
    public class Bootstraper
    {
        public static void Init(UnityContainer container)
        {
            // recibe UNITY Container
            // Aqui se puede incluir toda la configuración de inicio

            // Contexto
            container.RegisterType<DbContext, MicroTiendaVirtualEntities>();

            // Entidad Producto, ProductoViewModel
            container.RegisterType<IRepositorio<Producto, ProductoViewModel>,
            RepositorioEntity<Producto, ProductoViewModel>>();

            // Entidad Cliente, ClienteViewModel
            container.RegisterType<IRepositorio<Cliente, ClienteViewModel>,
            RepositorioEntity<Cliente, ClienteViewModel>>();

            // Entidad Categoria, CategoriaViewModel
            container.RegisterType<IRepositorio<Categoria, CategoriaViewModel>,
            RepositorioEntity<Categoria, CategoriaViewModel>>();

            // Entidad Venta, VentaViewModel
            container.RegisterType<IRepositorio<Venta, VentaViewModel>,
            RepositorioEntity<Venta, VentaViewModel>>();

            // Entidad VentaProducto, VentaProductoViewModel
            container.RegisterType<IRepositorio<VentaProducto, VentaProductoViewModel>,
            RepositorioEntity<VentaProducto, VentaProductoViewModel>>();


        }
    }
}