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
    public class HealtyCertificatesController : ApiController
    {
        private AnimalSocialDbEntities db = new AnimalSocialDbEntities();

        // GET: api/HealtyCertificates
        public IQueryable<HealtyCertificate> GetHealtyCertificate()
        {
            return db.HealtyCertificate;
        }

        // GET: api/HealtyCertificates/5
        [ResponseType(typeof(HealtyCertificate))]
        public IHttpActionResult GetHealtyCertificate(string id)
        {
            HealtyCertificate healtyCertificate = db.HealtyCertificate.Find(id);
            if (healtyCertificate == null)
            {
                return NotFound();
            }

            return Ok(healtyCertificate);
        }

        // PUT: api/HealtyCertificates/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHealtyCertificate(string id, HealtyCertificate healtyCertificate)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != healtyCertificate.Id)
            {
                return BadRequest();
            }

            db.Entry(healtyCertificate).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HealtyCertificateExists(id))
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

        // POST: api/HealtyCertificates
        [ResponseType(typeof(HealtyCertificate))]
        public IHttpActionResult PostHealtyCertificate(HealtyCertificate healtyCertificate)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HealtyCertificate.Add(healtyCertificate);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (HealtyCertificateExists(healtyCertificate.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = healtyCertificate.Id }, healtyCertificate);
        }

        // DELETE: api/HealtyCertificates/5
        [ResponseType(typeof(HealtyCertificate))]
        public IHttpActionResult DeleteHealtyCertificate(string id)
        {
            HealtyCertificate healtyCertificate = db.HealtyCertificate.Find(id);
            if (healtyCertificate == null)
            {
                return NotFound();
            }

            db.HealtyCertificate.Remove(healtyCertificate);
            db.SaveChanges();

            return Ok(healtyCertificate);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HealtyCertificateExists(string id)
        {
            return db.HealtyCertificate.Count(e => e.Id == id) > 0;
        }
    }
}