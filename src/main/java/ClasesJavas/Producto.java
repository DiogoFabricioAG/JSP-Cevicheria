/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClasesJavas;

import java.math.BigDecimal;


public class Producto {
    private int productoId;
    private String productoNombre;
    private BigDecimal productoPrecio;
    private String productoImagen;
    private String productoCategoria;

    // Constructor
    public Producto(int productoId, String productoNombre, BigDecimal productoPrecio, String productoImagen, String productoCategoria) {
        this.productoId = productoId;
        this.productoNombre = productoNombre;
        this.productoPrecio = productoPrecio;
        this.productoImagen = productoImagen;
        this.productoCategoria = productoCategoria;
    }

    // Getters y Setters
    public int getProductoId() {
        return productoId;
    }

    public void setProductoId(int productoId) {
        this.productoId = productoId;
    }

    public String getProductoNombre() {
        return productoNombre;
    }

    public void setProductoNombre(String productoNombre) {
        this.productoNombre = productoNombre;
    }

    public BigDecimal getProductoPrecio() {
        return productoPrecio;
    }

    public void setProductoPrecio(BigDecimal productoPrecio) {
        this.productoPrecio = productoPrecio;
    }

    public String getProductoImagen() {
        return productoImagen;
    }

    public void setProductoImagen(String productoImagen) {
        this.productoImagen = productoImagen;
    }

    public String getProductoCategoria() {
        return productoCategoria;
    }

    public void setProductoCategoria(String productoCategoria) {
        this.productoCategoria = productoCategoria;
    }
}
