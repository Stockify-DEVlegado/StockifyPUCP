/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.inf30.stockify.daoimpl.almacen;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import pe.edu.pucp.inf30.stockify.dao.almacen.MovimientoDAO;
import pe.edu.pucp.inf30.stockify.daoimpl.BaseDAO;
import pe.edu.pucp.inf30.stockify.model.almacen.Movimiento;
import pe.edu.pucp.inf30.stockify.model.almacen.TipoMovimiento;

/**
 *
 * @author DEVlegado
 */

public class MovimientoDAOImpl extends BaseDAO<Movimiento> 
        implements MovimientoDAO {
    
    @Override
    protected PreparedStatement comandoCrear(Connection conn, Movimiento modelo) 
            throws SQLException {
        
        String sql = "{call insertarMovimiento(?, ?, ?, ?)}";
        CallableStatement cmd = conn.prepareCall(sql);
        cmd.setString("p_tipoMovimiento", String.valueOf(modelo.getTipoMovimiento()));
        cmd.setDate("p_fecha",new java.sql.Date(modelo.getFecha().getTime()));
        cmd.setString("p_descripcion", modelo.getDescripcion());
        cmd.registerOutParameter("p_id", Types.INTEGER);
        return cmd;
    }

    @Override
    protected PreparedStatement comandoActualizar(Connection conn, 
            Movimiento modelo) throws SQLException {
        
        String sql = "{call modificarMovimiento(?, ?, ?, ?)}";
        CallableStatement cmd = conn.prepareCall(sql);
        cmd.setString("p_tipoMovimiento", String.valueOf(modelo.getTipoMovimiento()));
        cmd.setDate("p_fecha",new java.sql.Date(modelo.getFecha().getTime()));
        cmd.setString("p_descripcion", modelo.getDescripcion());
        cmd.setInt("p_id", modelo.getIdMovimiento());
        return cmd;
    }

    @Override
    protected PreparedStatement comandoEliminar(Connection conn, Integer id) 
            throws SQLException {
        String sql = "{call eliminarMovimiento(?)}";
        CallableStatement cmd = conn.prepareCall(sql);
        cmd.setInt("p_id", id);
        return cmd;
    }

    @Override
    protected PreparedStatement comandoLeer(Connection conn, Integer id) 
            throws SQLException {
        String sql = "{call buscarMovimientoPorId(?)}";
        CallableStatement cmd = conn.prepareCall(sql);
        cmd.setInt("p_id", id);
        return cmd;
    }

    @Override
    protected PreparedStatement comandoLeerTodos(Connection conn) 
            throws SQLException {
        String sql = "{call listarMovimientos()}";
        CallableStatement cmd = conn.prepareCall(sql);
        return cmd;
    }

    @Override
    protected Movimiento mapearModelo(ResultSet rs) throws SQLException {
        Movimiento movimiento = new Movimiento();
        movimiento.setIdMovimiento(rs.getInt("idMovimiento"));
        movimiento.setDescripcion(rs.getString("descripcion"));
        movimiento.setTipoMovimiento(TipoMovimiento.valueOf(rs.getString("tipoMovimiento")));
        movimiento.setFecha(rs.getTimestamp("fecha"));
        return movimiento;
    }
}
