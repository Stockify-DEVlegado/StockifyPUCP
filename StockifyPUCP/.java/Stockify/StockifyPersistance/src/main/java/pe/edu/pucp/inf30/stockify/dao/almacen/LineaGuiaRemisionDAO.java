/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.inf30.stockify.dao.almacen;

import java.sql.Connection;
import java.util.List;
import pe.edu.pucp.inf30.stockify.dao.PersistibleTransaccional;
import pe.edu.pucp.inf30.stockify.model.almacen.LineaGuiaRemision;

/**
 *
 * @author DEVlegado
 */

public interface LineaGuiaRemisionDAO extends PersistibleTransaccional<LineaGuiaRemision, Integer>{
    
    List<LineaGuiaRemision> leerTodosPorOrden(int idOrden);
    List<LineaGuiaRemision> leerTodosPorOrden(int idOrden,Connection conn);
}
