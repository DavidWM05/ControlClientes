package mx.com.luvid.data;

import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import mx.com.luvid.domain.Cliente;

public class ClienteDAO {

    private static final String SQL_SELECT = "SELECT id_cliente, nombre, apellido, email, telefono, saldo "
            + "FROM cliente";
    private static final String SQL_SELECT_BY_ID = "SELECT id_cliente, nombre, apellido, email, telefono, saldo "
            + "FROM cliente WHERE id_cliente = ?";
    private static final String SQL_INSERT = "INSERT INTO cliente(nombre, apellido, email, telefono, saldo) "
            + "VALUES(?,?,?,?,?)";
    private static final String SQL_UPDATE = "UPDATE cliente SET nombre=?, apellido=?, email=?, telefono=?, saldo=?"
            + "WHERE id_cliente=?";
    private static final String SQL_DELETE = "DELETE FROM cliente where id_cliente=?";

    //  XXXXXXXXXX| Metodos |XXXXXXXXXX
    public List<Cliente> findAll() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        //Cliente cliente = null;
        List<Cliente> clientes = new ArrayList<>();

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT);
            rs = stmt.executeQuery();

            while (rs.next()) {
                int idCliente = rs.getInt("id_cliente");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String email = rs.getString("email");
                String telefono = rs.getString("telefono");
                Double saldo = rs.getDouble("saldo");

                //cliente = new Cliente(idCliente, nombre, apellido, email, telefono, saldo);
                clientes.add(new Cliente(idCliente, nombre, apellido, email, telefono, saldo));
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            ConnectionDB.close(conn);
            ConnectionDB.close(stmt);
            ConnectionDB.close(rs);
        }

        return clientes;
    }
    public Cliente findById(Cliente cliente) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            stmt.setInt(1, cliente.getIdCliente());
            rs = stmt.executeQuery();
            rs.absolute(1);
            
            String nombre = rs.getString("nombre");
            String apellido = rs.getString("apellido");
            String email = rs.getString("email");
            String telefono = rs.getString("telefono");
            Double saldo = rs.getDouble("saldo");
            
            cliente.setNombre(nombre);
            cliente.setApellido(apellido);
            cliente.setEmail(email);
            cliente.setTelefono(telefono);
            cliente.setSaldo(saldo);            
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            ConnectionDB.close(conn);
            ConnectionDB.close(stmt);
            ConnectionDB.close(rs);
        }

        return cliente;
    }
    public int insert(Cliente cliente){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            stmt.setString(1, cliente.getNombre());
            stmt.setString(2, cliente.getApellido());
            stmt.setString(3, cliente.getEmail());
            stmt.setString(4, cliente.getTelefono());
            stmt.setDouble(5, cliente.getSaldo());
            
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            ConnectionDB.close(conn);
            ConnectionDB.close(stmt);
        }
        return rows;
    }
    public int update(Cliente cliente){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement(SQL_UPDATE);
            stmt.setString(1, cliente.getNombre());
            stmt.setString(2, cliente.getApellido());
            stmt.setString(3, cliente.getEmail());
            stmt.setString(4, cliente.getTelefono());
            stmt.setDouble(5, cliente.getSaldo());
            stmt.setInt(6, cliente.getIdCliente());
            
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            ConnectionDB.close(conn);
            ConnectionDB.close(stmt);
        }
        return rows;
    }
    public int delete(Cliente cliente){
        Connection conn = null;
        PreparedStatement stmt = null;
        int rows = 0;

        try {
            conn = ConnectionDB.getConnection();
            stmt = conn.prepareStatement(SQL_DELETE);
            
            stmt.setInt(1, cliente.getIdCliente());
            
            rows = stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            ConnectionDB.close(conn);
            ConnectionDB.close(stmt);
        }
        return rows;
    }
}
