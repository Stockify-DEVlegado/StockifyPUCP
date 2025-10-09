/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.inf30.stockify.model.almacen;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author DEVlegado
 */
public class Movimiento {
    private int idMovimiento;
    private TipoMovimiento tipoMovimiento;
    private Date fecha;
    private String descripcion;
    private List<Existencias> existencias;

    public Movimiento() {
        this.fecha = new Date();
        this.existencias = new ArrayList<>();
    }

    public Movimiento(int idMovimiento, TipoMovimiento tipoMovimiento, 
            Date fecha, String descripcion) {
        this.idMovimiento = idMovimiento;
        this.tipoMovimiento = tipoMovimiento;
        this.fecha = fecha;
        this.descripcion = descripcion;
        this.existencias = new ArrayList<>();
    }

    public int getIdMovimiento() {
        return idMovimiento;
    }

    public void setIdMovimiento(int idMovimiento) {
        this.idMovimiento = idMovimiento;
    }

    public TipoMovimiento getTipoMovimiento() {
        return tipoMovimiento;
    }

    public void setTipoMovimiento(TipoMovimiento tipoMovimiento) {
        this.tipoMovimiento = tipoMovimiento;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public List<Existencias> getExistencias() {
        return existencias;
    }

    public void setExistencias(List<Existencias> existencias) {
        this.existencias = existencias;
    }
    
}
