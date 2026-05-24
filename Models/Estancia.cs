using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace PIASISTINFO.Models
{
    public class Estancia
    {
        [Key]
        public int Id { get; set; }

        public int MascotaId { get; set; }
        public Mascota Mascota { get; set; } = default!;

        public DateTime FechaIngreso { get; set; }
        public DateTime? FechaEgreso { get; set; }

        public string Observaciones { get; set; } = string.Empty;

        public List<Cuidado> Cuidados { get; set; } = new();
    }
}
