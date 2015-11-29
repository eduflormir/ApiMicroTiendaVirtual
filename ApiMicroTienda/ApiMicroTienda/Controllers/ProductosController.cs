using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using System.Web.Mvc;
using BaseRepositorio.Repositorio;
using Microsoft.Practices.Unity;
using RepositorioMicroTienda.Model;
using RepositorioMicroTienda.ViewModel;

namespace ApiMicroTienda.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class ProductosController : ApiController
    {

        [Dependency] // va a UNITY y pide que inyecte esta dependencia
        public IRepositorio<Producto, ProductoViewModel> Repositorio { get; set; }

        public ICollection<ProductoViewModel> Get()
        {
            return Repositorio.Get();
        }

        [ResponseType(typeof(ProductoViewModel))] // devuelvo un objeto concreto
        public IHttpActionResult Get(int id)
        {
            var data = Repositorio.Get(id);

            if (data == null)
                return NotFound();
            
        return Ok(data);
        }
        
        
    }
}