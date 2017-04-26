using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using AnimalSocialWebApi.DAL;

namespace AnimalSocialWebApi.Controllers
{
    [Authorize]
    public class VaccineHealtyCertificatesController : ApiController
    {
        private AnimalSocialDbEntities db = new AnimalSocialDbEntities();

        // GET: api/VaccineHealtyCertificates
        public IQueryable<VaccineHealtyCertificate> GetVaccineHealtyCertificate()
        {
            return db.VaccineHealtyCertificate;
        }

        // GET: api/VaccineHealtyCertificates/5
        [ResponseType(typeof(VaccineHealtyCertificate))]
        public IHttpActionResult GetVaccineHealtyCertificate(int id)
        {
            VaccineHealtyCertificate vaccineHealtyCertificate = db.VaccineHealtyCertificate.Find(id);
            if (vaccineHealtyCertificate == null)
            {
                return NotFound();
            }

            return Ok(vaccineHealtyCertificate);
        }

        // PUT: api/VaccineHealtyCertificates/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutVaccineHealtyCertificate(int id, VaccineHealtyCertificate vaccineHealtyCertificate)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != vaccineHealtyCertificate.Id)
            {
                return BadRequest();
            }

            db.Entry(vaccineHealtyCertificate).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VaccineHealtyCertificateExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/VaccineHealtyCertificates
        [ResponseType(typeof(VaccineHealtyCertificate))]
        public IHttpActionResult PostVaccineHealtyCertificate(VaccineHealtyCertificate vaccineHealtyCertificate)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.VaccineHealtyCertificate.Add(vaccineHealtyCertificate);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = vaccineHealtyCertificate.Id }, vaccineHealtyCertificate);
        }

        // DELETE: api/VaccineHealtyCertificates/5
        [ResponseType(typeof(VaccineHealtyCertificate))]
        public IHttpActionResult DeleteVaccineHealtyCertificate(int id)
        {
            VaccineHealtyCertificate vaccineHealtyCertificate = db.VaccineHealtyCertificate.Find(id);
            if (vaccineHealtyCertificate == null)
            {
                return NotFound();
            }

            db.VaccineHealtyCertificate.Remove(vaccineHealtyCertificate);
            db.SaveChanges();

            return Ok(vaccineHealtyCertificate);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool VaccineHealtyCertificateExists(int id)
        {
            return db.VaccineHealtyCertificate.Count(e => e.Id == id) > 0;
        }
    }
}