<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Stockify.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="StockifyWeb.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cph_Contenido" runat="server">
  <style>
    /* ---- Estilos scoped para evitar conflictos ---- */
    .dbx{ --bg:#0b0c0f; --card:#21252d; --card2:#2a2f39; --stroke:#323844; --text:#e7eaf0; --muted:#a9b3c7; --accent:#8aa2ff; --accent2:#f0b75d; --radius:16px; --shadow:0 10px 24px rgba(0,0,0,.35); }
    .dbx{color:var(--text); background:var(--bg); padding:22px 28px; border-radius:12px}
    .dbx .topbar{display:flex; gap:16px; align-items:center}
    .dbx .search{flex:1; display:flex; gap:10px; align-items:center; background:#121419; border:1px solid var(--stroke); border-radius:40px; padding:10px 16px}
    .dbx .search input{flex:1; background:transparent; border:0; outline:none; color:var(--text)}
    .dbx .kpis{display:grid; grid-template-columns:repeat(5,minmax(160px,1fr)); gap:16px; margin-top:18px}
    .dbx .card{background:var(--card); border:1px solid var(--stroke); border-radius:var(--radius); padding:16px; box-shadow:var(--shadow)}
    .dbx .kpi .title{color:var(--muted); font-size:12px; margin-bottom:6px}
    .dbx .kpi .value{font-size:34px; font-weight:800}
    .dbx .kpi .hint{color:#a0a9bb; font-size:12px}
    .dbx .content{display:grid; grid-template-columns:1fr 360px; gap:20px; margin-top:16px}
    .dbx h2{margin:0 0 8px 0; font-size:18px}
    .dbx .chart{height:320px; position:relative}
    .dbx .legend{position:absolute; bottom:14px; left:14px; display:flex; gap:14px; align-items:center}
    .dbx .dot{width:10px; height:10px; border-radius:50%}
    .dbx .dot.orange{background:var(--accent2)}
    .dbx .dot.blue{background:var(--accent)}
    .dbx .two-col{display:grid; grid-template-columns:1fr 1fr; gap:10px}
    .dbx .mini{background:var(--card2); border:1px solid var(--stroke); border-radius:12px; padding:14px; text-align:center}
    .dbx .mini .big{font-weight:800; font-size:20px}
    .dbx .alerts .item{display:flex; align-items:center; justify-content:space-between; background:var(--card2); border:1px solid var(--stroke); border-radius:12px; padding:12px 14px; margin-top:10px}
    .dbx .alerts .name{font-weight:600}
    .dbx .badge{background:#331b1b; border:1px solid #5a2a2a; color:#ffb0b0; padding:4px 10px; border-radius:999px; font-size:12px}
    .dbx .orders{display:flex; gap:16px; margin-top:10px}
    .dbx .pill{flex:1; min-width:180px; padding:16px; background:var(--card); border:1px solid var(--stroke); border-radius:14px}
    .dbx .pill .type{font-weight:700}
    .dbx .pill .date{color:var(--muted); font-size:12px}
    @media (max-width:1200px){ .dbx .kpis{grid-template-columns:repeat(3,minmax(160px,1fr))} .dbx .content{grid-template-columns:1fr} }
    @media (max-width:760px){ .dbx{padding:16px} .dbx .kpis{grid-template-columns:repeat(2,minmax(140px,1fr))} .dbx .orders{flex-direction:column} }
  </style>

  <section class="dbx">
    <!-- Topbar (sin ícono de usuario para simplificar) -->
    <div class="topbar">
      <div class="search" role="search">
        <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="7"/><path d="M21 21l-3.4-3.4"/></svg>
        <input type="text" placeholder="Search product, supplier, order" aria-label="Buscar" />
      </div>
    </div>

    <!-- KPI cards -->
    <section class="kpis">
      <article class="card kpi"><div class="title">Total Productos</div><div class="value">50</div><div class="hint">Registrados</div></article>
      <article class="card kpi"><div class="title">En Stock</div><div class="value">50</div><div class="hint">Unidades</div></article>
      <article class="card kpi"><div class="title">Por recibir</div><div class="value">14</div><div class="hint">Unidades</div></article>
      <article class="card kpi"><div class="title">Entradas (7d)</div><div class="value">5</div><div class="hint">Movimientos de entrada</div></article>
      <article class="card kpi"><div class="title">Salidas (7d)</div><div class="value">21</div><div class="hint">Movimientos de salida</div></article>
    </section>

    <!-- Grid principal -->
    <section class="content">
      <div>
        <article class="card chart" aria-label="Resúmenes de movimientos">
          <h2>Resúmenes de movimientos</h2>
          <svg viewBox="0 0 800 220" preserveAspectRatio="xMidYMid meet" style="width:100%;height:200px;margin-top:10px;border-radius:12px;background:#171a20;border:1px solid var(--stroke)">
            <g stroke="#2b3140" stroke-width="1">
              <path d="M0 40 H800"/><path d="M0 80 H800"/><path d="M0 120 H800"/><path d="M0 160 H800"/>
            </g>
            <path d="M0 70 C120 40, 160 120, 240 130 S360 140, 440 170 560 200, 640 150 720 120, 800 110" fill="none" stroke="var(--accent2)" stroke-width="3"/>
            <path d="M0 130 C120 160, 220 120, 300 90 S420 110, 520 80 640 150, 740 120 800 70" fill="none" stroke="var(--accent)" stroke-width="3"/>
          </svg>
          <div class="legend">
            <span class="dot orange"></span><span style="color:var(--muted)">Compras</span>
            <span class="dot blue" style="margin-left:16px"></span><span style="color:var(--muted)">Ventas</span>
          </div>
        </article>

        <section style="margin-top:18px">
          <h2>Órdenes recientes</h2>
          <div class="orders">
            <div class="pill"><div class="type">Compra</div><div class="date">Fecha: 21/07/2025</div></div>
            <div class="pill"><div class="type">Venta</div><div class="date">Fecha: 30/07/2025</div></div>
            <div class="pill"><div class="type">Venta</div><div class="date">Fecha: 15/08/2025</div></div>
            <div class="pill"><div class="type">Compra</div><div class="date">Fecha: 15/08/2025</div></div>
          </div>
        </section>
      </div>

      <div>
        <article class="card">
          <h2>Resumen productos</h2>
          <div class="two-col" style="margin-top:10px">
            <div class="mini"><div style="opacity:.8">Número de Proveedores</div><div class="big">31</div></div>
            <div class="mini"><div style="opacity:.8">Número de categorías</div><div class="big">21</div></div>
          </div>
        </article>
        <article class="card alerts" style="margin-top:18px">
          <h2>Alertas de Stock</h2>
          <div class="item"><div><div class="name">Teclado en ruso</div><div style="color:var(--muted);font-size:12px">Stock actual: 2 | Mínimo: 5</div></div><span class="badge">Low</span></div>
          <div class="item"><div><div class="name">Monitor ShangChun</div><div style="color:var(--muted);font-size:12px">Stock actual: 2 | Mínimo: 5</div></div><span class="badge">Low</span></div>
        </article>
      </div>
    </section>
  </section>
</asp:Content>
