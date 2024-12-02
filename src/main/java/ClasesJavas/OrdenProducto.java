package ClasesJavas;

public class OrdenProducto {
    private int ordenProductoId;
    private int ordenId;
    private int productoId;
    private int cantidad;
    private double precioUnitario;
    private String nombreProducto;
    private String imagenProducto;


    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getImagenProducto() {
        return imagenProducto;
    }

    public void setImagenProducto(String imagenProducto) {
        this.imagenProducto = imagenProducto;
    }


    public OrdenProducto() {
    }

    // Constructor
    public OrdenProducto(int ordenId, int productoId, int cantidad) {
        this.ordenId = ordenId;
        this.productoId = productoId;
        this.cantidad = cantidad;
    }

    // Getters y Setters
    public int getOrdenProductoId() {
        return ordenProductoId;
    }

    public void setOrdenProductoId(int ordenProductoId) {
        this.ordenProductoId = ordenProductoId;
    }

    public int getOrdenId() {
        return ordenId;
    }

    public void setOrdenId(int ordenId) {
        this.ordenId = ordenId;
    }

    public int getProductoId() {
        return productoId;
    }

    public void setProductoId(int productoId) {
        this.productoId = productoId;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPrecioUnitario() {
        return precioUnitario;
    }

    public void setPrecioUnitario(double precioUnitario) {
        this.precioUnitario = precioUnitario;
    }

    // Método para calcular el total (precio * cantidad)
    public double getTotal() {
        return precioUnitario * cantidad;
    }
}
