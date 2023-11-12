package mx.com.luvid.web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.util.List;
import mx.com.luvid.data.ClienteDAO;
import mx.com.luvid.domain.Cliente;

/**
 *
 * @author luisd
 */
@WebServlet("/ServletController")
public class ServletController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.accionDefault(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        
        if(accion != null){
            switch (accion) {
                case "insertar":                    
                    this.insertarCliente(request, response);
                    break;
                default:
                    this.accionDefault(request, response);
            }
        }else{
            this.accionDefault(request, response);
        }        
    }
    
    private void accionDefault(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Cliente> clientes = new ClienteDAO().findAll();
        HttpSession sesion = request.getSession();
        sesion.setAttribute("clientes", clientes);
        sesion.setAttribute("totalClientes", clientes.size());
        sesion.setAttribute("saldoTotal", calcularSaldoTotal(clientes));
        //request.getRequestDispatcher("clientes.jsp").forward(request, response);
        response.sendRedirect("clientes.jsp");
    }
    
    private void insertarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //  Recuperar los valores del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono= request.getParameter("telefono");
        
        double saldo = 0;
        String saldoString = request.getParameter("saldo");
        if(saldoString != null && !"".equals(saldoString)){
            saldo = Double.parseDouble(saldoString);
        }
        
        Cliente cliente = new Cliente(nombre, apellido, email, telefono, saldo);
        
        int registrosModificados = new ClienteDAO().insert(cliente);        
        System.out.println("Registros modificados = "+ registrosModificados);
        
        this.accionDefault(request, response);
    }

    private double calcularSaldoTotal(List<Cliente> clientes) {
        double total = 0;
        for (Cliente cliente : clientes) {
            total += cliente.getSaldo();
        }

        return total;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
