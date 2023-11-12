<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="es_MX" />

<section id="clientes">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Listado Clientes</h4>
                    </div>
                </div>
                <table class="table table-striped table-warning">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Deuda</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>                        
                        <c:forEach var="cliente" items="${clientes}" varStatus="status">
                            <tr>
                                <td>${status.count}</td>
                                <td>${cliente.nombre} ${cliente.apellido}</td>
                                <td> <fmt:formatNumber value="${cliente.saldo}" type="currency" /> </td>
                                <td>
                                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletController?accion=editar&idCliente=${cliente.idCliente}">
                                        <i class="bi bi-pencil-square"></i> Editar
                                    </a>
                                </td>
                            </tr>                           
                        </c:forEach>
                    </tbody>
                </table>                
            </div>

            <div class="col-md-3">
                <div class="card text-center bg-danger text-white mb-3">
                    <div class="card-body">
                        <h3>Deuda Total</h3>
                        <h4 class="display-4">
                            <fmt:formatNumber value="${saldoTotal}" type="currency" />
                        </h4>
                    </div>
                </div>
                <div class="card text-center bg-success text-white mb-3">
                    <div class="card-body">
                        <h3>Total Clientes</h3>
                        <h4 class="display-4">
                            <i class="bi bi-people-fill"></i> ${totalClientes}
                        </h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
                        
<!-- Agregar cliente Modal -->
<jsp:include page="/WEB-INF/clientes/agregarCliente.jsp"/>