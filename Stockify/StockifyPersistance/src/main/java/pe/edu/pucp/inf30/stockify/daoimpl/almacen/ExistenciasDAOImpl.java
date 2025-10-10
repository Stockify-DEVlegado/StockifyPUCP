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
import pe.edu.pucp.inf30.stockify.dao.almacen.ExistenciasDAO;
import pe.edu.pucp.inf30.stockify.daoimpl.BaseDAO;
import pe.edu.pucp.inf30.stockify.model.almacen.EstadoExistencias;
import pe.edu.pucp.inf30.stockify.model.almacen.Existencias;

/**
 *
 * @author DEVlegado
 */

public class ExistenciasDAOImpl extends BaseDAO<Existencias> 
        implements ExistenciasDAO {
    
    @Override
    protected PreparedStatement comandoCrear(Connection conn, Existencias modelo) 
            throws SQLException {
        
        String sql = "{call insertarExistencias(?, ?, ?, ?, ?, ?)}";
        CallableStatement cmd = conn.prepareCall(sql);
        cmd.setInt("p_idUnico", modelo.getIdUnico());
        cmd.setDate("p_fecha",new java.sql.Date(modelo.getFecha().getTime()));
        cmd.setDate("p_hora",new java.sql.Date(modelo.getHora().getTime()));        
        cmd.setString("p_tipoMovimiento", String.valueOf(modelo.getEstado()));
        if (modelo.getMovimiento()!= null) {
            cmd.setInt("p_idMovimiento", modelo.getMovimiento().getIdMovimiento());
        } else {
            cmd.setNull("p_idMovimiento", Types.INTEGER);
        }
        cmd.registerOutParameter("p_id", Types.INTEGER);
        return cmd;
    }

    @Override
    protected PreparedStatement comandoActualizar(Connection conn, 
            Existencias modelo) throws SQLException {
        
        String sql = "{call modificarExistencias(?, ?, ?, ?, ?, ?)}";
        CallableStatement cmd = conn.prepareCall(sql);
        cmd.setInt("p_idUnico", modelo.getIdUnico());
        cmd.setDate("p_fecha",new java.sql.Date(modelo.getFecha().getTime()));
        cmd.setDate("p_hora",new java.sql.Date(modelo.getHora().getTime()));        
        cmd.setString("p_tipoMovimiento", String.valueOf(modelo.getEstado()));
        if (modelo.getMovimiento()!= null) {
            cmd.setInt("p_idMovimiento", modelo.getMovimiento().getIdMovimiento());
        } else {
            cmd.setNull("p_idMovimiento", Types.INTEGER);
        }
        cmd.setInt("p_id", modelo.getIdExistencia());
        return cmd;
    }

    @Override
    protected PreparedStatement comandoEliminar(Connection conn, Integer id) 
            throws SQLException {
        String sql = "{call eliminarExistencias(?)}";
        CallableStatement cmd = conn.prepareCall(sql);
        cmd.setInt("p_id", id);
        return cmd;
    }

    @Override
    protected PreparedStatement comandoLeer(Connection conn, Integer id) 
            throws SQLException {
        String sql = "{call buscarExistenciasPorId(?)}";
        CallableStatement cmd = conn.prepareCall(sql);
        cmd.setInt("p_id", id);
        return cmd;
    }

    @Override
    protected PreparedStatement comandoLeerTodos(Connection conn) 
            throws SQLException {
        String sql = "{call listarExistencias()}";
        CallableStatement cmd = conn.prepareCall(sql);
        return cmd;
    }

    @Override
    protected Existencias mapearModelo(ResultSet rs) throws SQLException {
        Existencias existencias = new Existencias();
        existencias.setIdExistencia(rs.getInt("idExistencia"));
        existencias.setIdUnico(rs.getInt("idUnico"));
        existencias.setFecha(rs.getTimestamp("fecha"));
        existencias.setHora(rs.getTimestamp("hora"));
        existencias.setEstado(EstadoExistencias.valueOf(rs.getString("estado")));
        int idMovimiento = rs.getInt("idMovimiento");
        if (!rs.wasNull()) {
            existencias.setMovimiento(new MovimientoDAOImpl().leer(idMovimiento));
        }
        return existencias;
    }
}
