package ClasesJavas;

import java.sql.Timestamp;

public class Reserva {
    private int id;
    private int usuarioId;
    private Timestamp fechaReserva;
    private int numeroPersonas;
    private String peticionesEspeciales;
    private Timestamp fechaCreacion;
    private Timestamp horaReserva;
    private int mesaId;
    private String tiempoMaximo;

    public Reserva(int usuarioId, Timestamp fechaReserva, int numeroPersonas, 
                   String peticionesEspeciales, Timestamp horaReserva, int mesaId) {
        this.usuarioId = usuarioId;
        this.fechaReserva = fechaReserva;
        this.numeroPersonas = numeroPersonas;
        this.peticionesEspeciales = peticionesEspeciales;
        this.horaReserva = horaReserva;
        this.mesaId = mesaId;
    }

    // Getters y setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public int getUsuarioId() { return usuarioId; }
    public void setUsuarioId(int usuarioId) { this.usuarioId = usuarioId; }
    public Timestamp getFechaReserva() { return fechaReserva; }
    public void setFechaReserva(Timestamp fechaReserva) { this.fechaReserva = fechaReserva; }
    public int getNumeroPersonas() { return numeroPersonas; }
    public void setNumeroPersonas(int numeroPersonas) { this.numeroPersonas = numeroPersonas; }
    public String getPeticionesEspeciales() { return peticionesEspeciales; }
    public void setPeticionesEspeciales(String peticionesEspeciales) { this.peticionesEspeciales = peticionesEspeciales; }
    public Timestamp getFechaCreacion() { return fechaCreacion; }
    public void setFechaCreacion(Timestamp fechaCreacion) { this.fechaCreacion = fechaCreacion; }
    public Timestamp getHoraReserva() { return horaReserva; }
    public void setHoraReserva(Timestamp horaReserva) { this.horaReserva = horaReserva; }
    public int getMesaId() { return mesaId; }
    public void setMesaId(int mesaId) { this.mesaId = mesaId; }
    public String getTiempoMaximo() { return tiempoMaximo; }
    public void setTiempoMaximo(String tiempoMaximo) { this.tiempoMaximo = tiempoMaximo; }
}
