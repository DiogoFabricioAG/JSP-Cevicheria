package ClasesJavas;

public class Mesa {
    private int mesasId;
    private String mesasCodigo;
    private int tipoMesaId;

    public Mesa() {}

    public Mesa(int mesasId, String mesasCodigo, int tipoMesaId) {
        this.mesasId = mesasId;
        this.mesasCodigo = mesasCodigo;
        this.tipoMesaId = tipoMesaId;
    }

    public int getMesasId() {
        return mesasId;
    }

    public void setMesasId(int mesasId) {
        this.mesasId = mesasId;
    }

    public String getMesasCodigo() {
        return mesasCodigo;
    }

    public void setMesasCodigo(String mesasCodigo) {
        this.mesasCodigo = mesasCodigo;
    }

    public int getTipoMesaId() {
        return tipoMesaId;
    }

    public void setTipoMesaId(int tipoMesaId) {
        this.tipoMesaId = tipoMesaId;
    }

 }

