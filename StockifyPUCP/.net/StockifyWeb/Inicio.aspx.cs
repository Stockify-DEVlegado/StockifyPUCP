using System;
using System.Collections.Generic;
using System.Web.UI;

namespace StockifyWeb
{
    public partial class Inicio : Page
    {
        // Clases auxiliares para representar los datos
        public class OrdenReciente
        {
            public string Tipo { get; set; }
            public DateTime Fecha { get; set; }
        }

        public class AlertaStock
        {
            public string NombreProducto { get; set; }
            public int StockActual { get; set; }
            public int StockMinimo { get; set; }
            public string Estado { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDashboard();
            }
        }

        private void CargarDashboard()
        {
            CargarKPIs();
            CargarOrdenesRecientes();
            CargarAlertasStock();
        }

        private void CargarKPIs()
        {
            lblTotalProductos.Text = ObtenerTotalProductos().ToString();
            lblEnStock.Text = ObtenerStockTotal().ToString();
            lblPorRecibir.Text = ObtenerProductosPorRecibir().ToString();
            lblEntradas.Text = ObtenerEntradasSemana().ToString();
            lblSalidas.Text = ObtenerSalidasSemana().ToString();
            lblNumProveedores.Text = ObtenerNumeroProveedores().ToString();
            lblNumCategorias.Text = ObtenerNumeroCategorias().ToString();
        }

        private void CargarOrdenesRecientes()
        {
            List<OrdenReciente> ordenes = ObtenerOrdenesRecientes();
            rptOrdenesRecientes.DataSource = ordenes;
            rptOrdenesRecientes.DataBind();
        }

        private void CargarAlertasStock()
        {
            List<AlertaStock> alertas = ObtenerAlertasStock();
            rptAlertasStock.DataSource = alertas;
            rptAlertasStock.DataBind();
        }

        #region Métodos de acceso a datos

        // IMPORTANTE: Estos métodos deberían conectarse a tu base de datos real
        // Aquí solo muestro la estructura que deberías seguir

        private int ObtenerTotalProductos()
        {
            // TODO: Implementar consulta a base de datos
            // Ejemplo: return new ProductoBL().ObtenerTotal();
            return 50;
        }

        private int ObtenerStockTotal()
        {
            // TODO: Implementar consulta a base de datos
            return 50;
        }

        private int ObtenerProductosPorRecibir()
        {
            // TODO: Implementar consulta a base de datos
            return 14;
        }

        private int ObtenerEntradasSemana()
        {
            // TODO: Implementar consulta a base de datos
            return 5;
        }

        private int ObtenerSalidasSemana()
        {
            // TODO: Implementar consulta a base de datos
            return 21;
        }

        private int ObtenerNumeroProveedores()
        {
            // TODO: Implementar consulta a base de datos
            return 31;
        }

        private int ObtenerNumeroCategorias()
        {
            // TODO: Implementar consulta a base de datos
            return 21;
        }

        private List<OrdenReciente> ObtenerOrdenesRecientes()
        {
            // TODO: Implementar consulta a base de datos
            // Por ahora retorno datos de ejemplo
            return new List<OrdenReciente>
            {
                new OrdenReciente { Tipo = "Compra", Fecha = new DateTime(2025, 7, 21) },
                new OrdenReciente { Tipo = "Venta", Fecha = new DateTime(2025, 7, 30) },
                new OrdenReciente { Tipo = "Venta", Fecha = new DateTime(2025, 8, 15) },
                new OrdenReciente { Tipo = "Compra", Fecha = new DateTime(2025, 8, 15) }
            };
        }

        private List<AlertaStock> ObtenerAlertasStock()
        {
            // TODO: Implementar consulta a base de datos
            return new List<AlertaStock>
            {
                new AlertaStock
                {
                    NombreProducto = "Teclado en ruso",
                    StockActual = 2,
                    StockMinimo = 5,
                    Estado = "Low"
                },
                new AlertaStock
                {
                    NombreProducto = "Monitor ShangChun",
                    StockActual = 2,
                    StockMinimo = 5,
                    Estado = "Low"
                }
            };
        }

        #endregion
    }
}