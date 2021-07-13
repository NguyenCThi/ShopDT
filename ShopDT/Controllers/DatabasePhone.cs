using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace ShopDT.Controllers
{
    public partial class DatabasePhone : DbContext
    {
        public DatabasePhone()
            : base("name=DatabasePhone")
        {
        }

        public virtual DbSet<user> users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
