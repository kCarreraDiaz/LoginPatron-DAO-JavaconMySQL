package datos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

//MANTENIMIENTO

public class UsuarioDatos {
	
	public Connection conn;
	String driver = "com.mysql.jdbc.Driver";
	String cadena = "jdbc:mysql://localhost/Ventas";
	String usuario = "root";
	String password = "";
	
	PreparedStatement registrarUsu,loginUsu;
	
	public UsuarioDatos() //
	{
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(cadena,usuario,password);
			
			registrarUsu = conn.prepareStatement("insert into usuarios "
					+ "(codigo,apellidos,nombres,usuario,passw) values(?,?,?,?,?)");
										
			loginUsu = conn.prepareStatement("select * from usuarios where usuario=? and passw=?");
			
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, "Error ...");
		}
	}
	
	//Metodo registrar
	public void registrarUsuario(Usuarios usu) {
		try {
			registrarUsu.setInt(1,usu.getCodigo());
			registrarUsu.setString(2,usu.getApellidos());
			registrarUsu.setString(3,usu.getNombres());
			registrarUsu.setString(4,usu.getUsuario());
			registrarUsu.setString(5,usu.getPassword());
			registrarUsu.executeUpdate();
			
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null,"Error de registro");
		}
	}
	
	
	//LOGIN USUARIO (traigo los datos de la BD)
	public boolean loginUsu(Usuarios usu) {
		boolean usuario=false;
		int c=0;
		
			try {
				loginUsu.setString(1,usu.getUsuario());//campos de los parametro de la consulta
				loginUsu.setString(2,usu.getPassword());
				ResultSet rs = loginUsu.executeQuery();
				while(rs.next()) {
					c++;
				}
				if(c==1) {
					usuario=true;
				}
				
			}catch(Exception e) {
				JOptionPane.showMessageDialog(null,"Error en lectura de usuario");
				}
			return usuario;
	}	

}
