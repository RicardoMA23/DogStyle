using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace PIASISTINFO.Migrations
{
    /// <inheritdoc />
    public partial class CambiosDB : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "CuidadosEspecificos",
                table: "Mascotas",
                type: "nvarchar(500)",
                maxLength: 500,
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CuidadosEspecificos",
                table: "Mascotas");
        }
    }
}
