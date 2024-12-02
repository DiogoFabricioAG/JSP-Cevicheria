/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasesJavas;

import java.sql.Timestamp;


public class Orden {
    private int ordenId;
    private int usuarioId;
    private Timestamp ordenFechaCreacion;

    // Constructor

    public Orden(int ordenId, int usuarioId) {
        this.ordenId = ordenId;
        this.usuarioId = usuarioId;
    }
    
    
    public Orden(int usuarioId) {
        this.usuarioId = usuarioId;
        this.ordenFechaCreacion = new Timestamp(System.currentTimeMillis());
    }

    // Getters y Setters
    public int getOrdenId() {
        return ordenId;
    }

    public void setOrdenId(int ordenId) {
        this.ordenId = ordenId;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public Timestamp getOrdenFechaCreacion() {
        return ordenFechaCreacion;
    }

    public void setOrdenFechaCreacion(Timestamp ordenFechaCreacion) {
        this.ordenFechaCreacion = ordenFechaCreacion;
    }
}
