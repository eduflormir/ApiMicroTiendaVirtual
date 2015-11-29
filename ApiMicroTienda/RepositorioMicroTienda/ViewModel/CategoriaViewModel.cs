using BaseRepositorio.ViewModel;
using RepositorioMicroTienda.Model;

namespace RepositorioMicroTienda.ViewModel
{
    public class CategoriaViewModel:IViewModel<Categoria>
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public string descripcion { get; set; }

        public Categoria ToBaseDatos()
        {
            return new Categoria()
            {
                id = id,
                nombre=nombre,
                descripcion = descripcion
            };
        }

        public void FromBaseDatos(Categoria modelo)
        {
            id = modelo.id;
            nombre = modelo.nombre;
            descripcion = modelo.descripcion;
        }

        public void UpdateBaseDatos(Categoria modelo)
        {
            modelo.id = id;
            modelo.nombre = nombre;
            modelo.descripcion = descripcion;
        }

        public object[] GetKeys()
        {
            return new object[] {id};
        }
    }
}