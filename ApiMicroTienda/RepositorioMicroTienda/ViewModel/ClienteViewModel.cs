using BaseRepositorio.ViewModel;
using RepositorioMicroTienda.Model;

namespace RepositorioMicroTienda.ViewModel
{
    public class ClienteViewModel:IViewModel<Cliente>
    {

        public int id { get; set; }
        public string nombre { get; set; }
        public string apellidos { get; set; }
        public string dni { get; set; }
        public string domicilio { get; set; }
        public string numTarjeta { get; set; }
        public string login { get; set; }
        public string password { get; set; }
        public string email { get; set; }

        public Cliente ToBaseDatos()
        {
            return new Cliente()
            {
                id=id,
                nombre=nombre,
                apellidos = apellidos,
                dni=dni,
                domicilio = domicilio,
                numTarjeta = numTarjeta,
                login = login,
                password = password,
                email=email

            };
        }

        public void FromBaseDatos(Cliente modelo)
        {
            id = modelo.id;
            nombre = modelo.nombre;
            apellidos = modelo.apellidos;
            dni = modelo.dni;
            domicilio = modelo.domicilio;
            numTarjeta = modelo.numTarjeta;
            login = modelo.login;
            password = modelo.password;
            email = modelo.email;
        }

        public void UpdateBaseDatos(Cliente modelo)
        {
            modelo.id = id;
            modelo.nombre = nombre;
            modelo.apellidos = apellidos;
            modelo.dni = dni;
            modelo.domicilio = domicilio;
            modelo.numTarjeta = numTarjeta;
            modelo.login = login;
            modelo.password = password;
            modelo.email = email;
        }

        public object[] GetKeys()
        {
            return new object[] {id};
        }
    }
}