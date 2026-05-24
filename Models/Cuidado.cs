using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System;

namespace PIASISTINFO.Models
{
    public class Cuidado
    {
        [Key]
        public int Id { get; set; }

        public int EstanciaId { get; set; }
        public Estancia Estancia { get; set; } = default!;

        public string Descripcion { get; set; } = string.Empty;

        public DateTime? Hora { get; set; }
    }
}
