package datos;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

public class ProductoDatos {

	public Connection conn;
	String driver = "com.mysql.jdbc.Driver";
	String cadena = "jdbc:mysql://localhost/Ventas";
	String usuario = "root";
	String password = "";


	PreparedStatement registroProducto,mostrarProducto,filtroProducto;
	
	public ProductoDatos() 
	{
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(cadena,usuario,password);
			
			registroProducto = conn.prepareStatement("insert into producto (codigo,nombre,precio,stock) "
					+ "values(?,?,?,?)");
			mostrarProducto = conn.prepareStatement("select * from producto");
			filtroProducto= conn.prepareStatement("select  * from producto where nombre=?");
		}catch(Exception e){
			JOptionPane.showMessageDialog(null,"Error...");
		}
	}
	
	//Metodo Insertar
	public void registrarProducto(Productos prod) {
		try {
			registroProducto.setInt(1,prod.getCodigo());
			registroProducto.setString(2,prod.getNombre());
			registroProducto.setDouble(3,prod.getPrecio());
			registroProducto.setInt(4,prod.getStock());
			registroProducto.executeUpdate();
			
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null,"Error de registro");
		}
	}
	
	//mostrar productos
	public List recuperarDatos() {
	
		List listaProductos = new ArrayList();
		try {
			ResultSet rs = mostrarProducto.executeQuery();//ejecuto select
			while(rs.next()) {
				Productos prod = new Productos();//intancio mi modelo
				prod.setCodigo(rs.getInt(1));
				prod.setNombre(rs.getString(2));
				prod.setPrecio(rs.getDouble(3));
				prod.setStock(rs.getInt(4));
				listaProductos.add(prod);//cargo mi vector(LISTA)
			}
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null,"Error en lectura de productos");
			}
		return listaProductos;
	}
	
	//Metodo busqueda
	public List buscarDatos(String p) {
		
		List listaProductos = new ArrayList();
		try {
			//filtroProducto.setString(1,p.getNombre());//campos del parametro de la consulta(1)
			filtroProducto.setString(1,p);
			ResultSet rs = filtroProducto.executeQuery();//ejecuto select
			
			while(rs.next()) {
				Productos prod = new Productos();//intancio mi modelo
				prod.setCodigo(rs.getInt(1));
				prod.setNombre(rs.getString(2));
				prod.setPrecio(rs.getDouble(3));
				prod.setStock(rs.getInt(4));
				listaProductos.add(prod);//cargo mi vector(LISTA)
			}
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null,"Error en el filtro de productos");
			}
		return listaProductos;
	}
	
	
}
