<%@ Page Title="" Language="C#" MasterPageFile="~/Stockify.Master" AutoEventWireup="true" CodeBehind="Inventario.aspx.cs" Inherits="StockifyWeb.Inventario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        :root {
            --bg: #0b0c0f;
            --card: #21252d;
            --card2: #2a2f39;
            --stroke: #323844;
            --text: #e7eaf0;
            --muted: #a9b3c7;
            --accent: #8aa2ff;
            --accent2: #f0b75d;
            --radius: 16px;
            --shadow: 0 10px 24px rgba(0,0,0,.35);
        }

        .products-container {
            background: var(--bg);
            padding: 22px 28px;
            border-radius: var(--radius);
            color: var(--text);
        }
        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 16px;
        }
        .search-box {
            flex: 1;
            min-width: 300px;
            position: relative;
        }
        .search-box input {
            width: 100%;
            padding: 10px 40px 10px 15px;
            background: #121419;
            border: 1px solid var(--stroke);
            border-radius: 40px;
            font-size: 14px;
            color: var(--text);
        }
        .search-box input::placeholder {
            color: var(--muted);
        }
        .search-box input:focus {
            outline: none;
            border-color: var(--accent);
        }
        .search-box i {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--muted);
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        .btn-filter {
            background: var(--card2);
            color: var(--text);
            border: 1px solid var(--stroke);
            padding: 10px 20px;
            border-radius: var(--radius);
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s;
        }
        .btn-add {
            background: var(--card);
            color: var(--accent);
            border: 1px solid var(--accent);
            padding: 10px 20px;
            border-radius: var(--radius);
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: all 0.3s;
        }
        .btn-filter:hover {
            background: var(--stroke);
            border-color: var(--muted);
        }
        .btn-add:hover {
            background: var(--accent);
            color: var(--bg);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: var(--card);
            border-radius: var(--radius);
            overflow: hidden;
            box-shadow: var(--shadow);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid var(--stroke);
            color: var(--text);
        }
        th {
            background: var(--card2);
            color: var(--text);
            font-weight: 600;
            border-bottom: 2px solid var(--stroke);
        }
        tbody tr {
            transition: background-color 0.3s;
        }
        tbody tr:hover {
            background: var(--card2);
        }
        .pagination {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 16px 0;
        }
        .pagination-left {
            flex: 1;
            text-align: left;
        }
        .pagination-center {
            flex: 1;
            text-align: center;
            color: var(--muted);
        }
        .pagination-right {
            flex: 1;
            text-align: right;
        }
        .btn-pagination {
            background: var(--card2);
            color: var(--text);
            border: 1px solid var(--stroke);
            padding: 8px 16px;
            border-radius: var(--radius);
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn-pagination:hover:not(.button-disabled) {
            background: var(--accent);
            color: var(--bg);
            border-color: var(--accent);
        }
        .button-disabled {
            background: var(--bg);
            color: var(--muted);
            cursor: not-allowed;
            border: 1px solid var(--stroke);
            opacity: 0.6;
        }
        .in-stock { color: #68d391; font-weight: bold; }
        .out-of-stock { color: #fc8181; font-weight: bold; }
        .low-stock { color: var(--accent2); font-weight: bold; }
        .availability { color: var(--accent); font-weight: bold; }
        
        h1 {
            color: var(--text);
            margin: 0 0 20px 0;
            font-size: 24px;
            font-weight: 600;
        }
        
        @media (max-width: 768px) {
            .header-actions {
                flex-direction: column;
                align-items: stretch;
            }
            .search-box {
                min-width: 100%;
            }
            .action-buttons {
                justify-content: space-between;
            }
            .pagination {
                flex-direction: column;
                gap: 10px;
            }
            .pagination-left, .pagination-center, .pagination-right {
                text-align: center;
                width: 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cph_Contenido" runat="server">
    <div class="products-container">
        <!-- Header con buscador y botones -->
        <div class="header-actions">
            <div class="search-box">
                <input type="text" placeholder="Buscar productos..." id="txtBuscar">
                <i class="fas fa-search"></i>
            </div>
            <div class="action-buttons">
                <button class="btn-filter">
                    <i class="fas fa-filter"></i> Filters
                </button>
                <button class="btn-add">
                    <i class="fas fa-plus"></i> Add Product
                </button>
            </div>
        </div>

        <h1>Productos</h1>
        
        <table>
            <thead>
                <tr>
                    <th>Producto</th>
                    <th>Precio Unitario</th>
                    <th>Descripción</th>
                    <th>Marca</th>
                    <th>Categoría</th>
                    <th>Disponibilidad</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Maggi</td>
                    <td>₹430</td>
                    <td>---</td>
                    <td>---</td>
                    <td>---</td>
                    <td class="availability">Disponibilidad</td>
                </tr>
                <tr>
                    <td>Bru</td>
                    <td>₹257</td>
                    <td>---</td>
                    <td>---</td>
                    <td>---</td>
                    <td class="in-stock">En stock</td>
                </tr>
                <tr>
                    <td>Red Bull</td>
                    <td>₹405</td>
                    <td>---</td>
                    <td>---</td>
                    <td>---</td>
                    <td class="out-of-stock">Agotado</td>
                </tr>
                <tr>
                    <td>Bourn Vita</td>
                    <td>₹502</td>
                    <td>---</td>
                    <td>---</td>
                    <td>---</td>
                    <td class="in-stock">En stock</td>
                </tr>
                <tr>
                    <td>Horlicks</td>
                    <td>₹530</td>
                    <td>---</td>
                    <td>---</td>
                    <td>---</td>
                    <td class="in-stock">En stock</td>
                </tr>
                <tr>
                    <td>Harpie</td>
                    <td>₹605</td>
                    <td>---</td>
                    <td>---</td>
                    <td>---</td>
                    <td class="in-stock">En stock</td>
                </tr>
                <tr>
                    <td>Ariel</td>
                    <td>₹408</td>
                    <td>---</td>
                    <td>---</td>
                    <td>---</td>
                    <td class="out-of-stock">Agotado</td>
                </tr>
                <tr>
                    <td>Scotch Brita</td>
                    <td>₹359</td>
                    <td>---</td>
                    <td>---</td>
                    <td>---</td>
                    <td class="in-stock">En stock</td>
                </tr>
                <tr>
                    <td>Coca cola</td>
                    <td>₹205</td>
                    <td>---</td>
                    <td>---</td>
                    <td>---</td>
                    <td class="low-stock">Stock bajo</td>
                </tr>
            </tbody>
        </table>
        
        <!-- Paginación reorganizada -->
        <div class="pagination">
            <div class="pagination-left">
                <button class="btn-pagination button-disabled">Anterior</button>
            </div>
            <div class="pagination-center">
                <span>Página 1 de 10</span>
            </div>
            <div class="pagination-right">
                <button class="btn-pagination">Siguiente</button>
            </div>
        </div>
    </div>

    <script>
        // Funcionalidad básica de búsqueda
        document.getElementById('txtBuscar').addEventListener('keyup', function () {
            var filter = this.value.toLowerCase();
            var rows = document.querySelectorAll('table tbody tr');

            rows.forEach(function (row) {
                var productName = row.cells[0].textContent.toLowerCase();
                if (productName.indexOf(filter) > -1) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });

        // Funcionalidad de los botones
        document.querySelector('.btn-filter').addEventListener('click', function () {
            alert('Funcionalidad de filtros próximamente...');
        });

        document.querySelector('.btn-add').addEventListener('click', function () {
            alert('Funcionalidad de agregar producto próximamente...');
        });

        // Funcionalidad del botón siguiente
        document.querySelector('.pagination-right .btn-pagination').addEventListener('click', function () {
            alert('Navegando a la siguiente página...');
        });
    </script>
</asp:Content>