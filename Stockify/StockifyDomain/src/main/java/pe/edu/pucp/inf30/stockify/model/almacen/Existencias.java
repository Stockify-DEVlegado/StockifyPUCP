/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pe.edu.pucp.inf30.stockify.model.almacen;

import java.util.Date;

/**
 *
 * @author DEVlegado
 */

public class Existencias {
    
    private int idExistencia;
    private int idUnico;
    private Date fecha;
    private Date hora;
    private Movimiento movimiento;
    private EstadoExistencias estado;
    
    public Existencias() {
        this.fecha=new Date();
        this.hora=new Date();
    }

    public Existencias(int idExistencia, int idUnico, EstadoExistencias estado) {
        this.idExistencia = idExistencia;
        this.idUnico = idUnico;
        this.fecha = new Date();
        this.hora = new Date();
        this.estado = estado;
    }

    public int getIdExistencia() {
        return idExistencia;
    }

    public void setIdExistencia(int idExistencia) {
        this.idExistencia = idExistencia;
    }

    public int getIdUnico() {
        return idUnico;
    }

    public void setIdUnico(int idUnico) {
        this.idUnico = idUnico;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public EstadoExistencias getEstado() {
        return estado;
    }

    public void setEstado(EstadoExistencias estado) {
        this.estado = estado;
    }

    public Movimiento getMovimiento() {
        return movimiento;
    }

    public void setMovimiento(Movimiento movimiento) {
        this.movimiento = movimiento;
    }
    
}
