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
    public class VaccinesController : ApiController
    {
        private AnimalSocialDbEntities db = new AnimalSocialDbEntities();

        // GET: api/Vaccines
        public IQueryable<Vaccine> GetVaccine()
        {
            return db.Vaccine;
        }

        // GET: api/Vaccines/5
        [ResponseType(typeof(Vaccine))]
        public IHttpActionResult GetVaccine(int id)
        {
            Vaccine vaccine = db.Vaccine.Find(id);
            if (vaccine == null)
            {
                return NotFound();
            }

            return Ok(vaccine);
        }

        // PUT: api/Vaccines/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutVaccine(int id, Vaccine vaccine)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != vaccine.Id)
            {
                return BadRequest();
            }

            db.Entry(vaccine).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!VaccineExists(id))
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

        // POST: api/Vaccines
        [ResponseType(typeof(Vaccine))]
        public IHttpActionResult PostVaccine(Vaccine vaccine)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Vaccine.Add(vaccine);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = vaccine.Id }, vaccine);
        }

        // DELETE: api/Vaccines/5
        [ResponseType(typeof(Vaccine))]
        public IHttpActionResult DeleteVaccine(int id)
        {
            Vaccine vaccine = db.Vaccine.Find(id);
            if (vaccine == null)
            {
                return NotFound();
            }

            db.Vaccine.Remove(vaccine);
            db.SaveChanges();

            return Ok(vaccine);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool VaccineExists(int id)
        {
            return db.Vaccine.Count(e => e.Id == id) > 0;
        }
    }
}