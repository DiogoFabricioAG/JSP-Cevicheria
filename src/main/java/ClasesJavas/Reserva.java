package ClasesJavas;

import java.sql.Timestamp;

public class Reserva {
    private int reservasId;
    private int reservasUsuarioId;
    private int reservasNumeroPersonas;
    private String reservasDia;
    private int reservasNumero;
    private String reservasPeticionesEspeciales;
    private Timestamp reservasFechaCreacion;
    private int ordenId;
    private int reservasFechaReservaId;
    private int reservasMesaId;

    public Reserva(int reservasUsuarioId, int reservasNumeroPersonas, String reservasDia, int reservasNumero, String reservasPeticionesEspeciales, int ordenId, int reservasFechaReservaId, int reservasMesaId) {
        this.reservasUsuarioId = reservasUsuarioId;
        this.reservasNumeroPersonas = reservasNumeroPersonas;
        this.reservasDia = reservasDia;
        this.reservasNumero = reservasNumero;
        this.reservasPeticionesEspeciales = reservasPeticionesEspeciales;
        this.ordenId = ordenId;
        this.reservasFechaReservaId = reservasFechaReservaId;
        this.reservasMesaId = reservasMesaId;
    }

    public int getReservasId() {
        return reservasId;
    }

    public void setReservasId(int reservasId) {
        this.reservasId = reservasId;
    }

    public int getReservasUsuarioId() {
        return reservasUsuarioId;
    }

    public void setReservasUsuarioId(int reservasUsuarioId) {
        this.reservasUsuarioId = reservasUsuarioId;
    }

    public int getReservasNumeroPersonas() {
        return reservasNumeroPersonas;
    }

    public void setReservasNumeroPersonas(int reservasNumeroPersonas) {
        this.reservasNumeroPersonas = reservasNumeroPersonas;
    }

    public String getReservasDia() {
        return reservasDia;
    }

    public void setReservasDia(String reservasDia) {
        this.reservasDia = reservasDia;
    }

    public int getReservasNumero() {
        return reservasNumero;
    }

    public void setReservasNumero(int reservasNumero) {
        this.reservasNumero = reservasNumero;
    }

    public String getReservasPeticionesEspeciales() {
        return reservasPeticionesEspeciales;
    }

    public void setReservasPeticionesEspeciales(String reservasPeticionesEspeciales) {
        this.reservasPeticionesEspeciales = reservasPeticionesEspeciales;
    }

    public Timestamp getReservasFechaCreacion() {
        return reservasFechaCreacion;
    }

    public void setReservasFechaCreacion(Timestamp reservasFechaCreacion) {
        this.reservasFechaCreacion = reservasFechaCreacion;
    }

    public int getOrdenId() {
        return ordenId;
    }

    public void setOrdenId(int ordenId) {
        this.ordenId = ordenId;
    }

    public int getReservasFechaReservaId() {
        return reservasFechaReservaId;
    }

    public void setReservasFechaReservaId(int reservasFechaReservaId) {
        this.reservasFechaReservaId = reservasFechaReservaId;
    }

    public int getReservasMesaId() {
        return reservasMesaId;
    }

    public void setReservasMesaId(int reservasMesaId) {
        this.reservasMesaId = reservasMesaId;
    }
}
