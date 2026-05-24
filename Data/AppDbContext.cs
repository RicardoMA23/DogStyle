using Microsoft.EntityFrameworkCore;
using PIASISTINFO.Models;

namespace PIASISTINFO.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<Duenio> Duenios { get; set; } = default!;
        public DbSet<Mascota> Mascotas { get; set; } = default!;
        public DbSet<Estancia> Estancias { get; set; } = default!;
        public DbSet<Cuidado> Cuidados { get; set; } = default!;
    }
}
