<!DOCTYPE html>
<html>
    <head>
        <!-- head <-> meta -->
        <jsp:include page="/WEB-INF/templates/head.jsp"/>

        <title>Agenda Adeudos</title>
    </head>
    <body>

        <!-- Header -->
        <jsp:include page="/WEB-INF/templates/header.jsp"/>

        <!-- Formulario Editar Cliente -->
        <section id="actions-edit">
            <form class="was-validated" action="${pageContext.request.contextPath}/ServletController?accion=modificar&idCliente=${cliente.idCliente}" method="post">
                <!-- Buttoms -->
                <section id="botones-editar">
                    <div class="container py-4 mb-4 bg-light">
                        <div class="row">
                            <div class="col-md-3">
                                <a class="btn btn-ligth btn-block" href="index.jsp">
                                    <i class="bi bi-arrow-return-left"></i> Regresar
                                </a>
                            </div>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-success btn-block">
                                    <i class="bi bi-floppy-fill"></i> Guardar
                                </button>
                            </div>
                            <div class="col-md-3">
                                <a  class="btn btn-danger btn-block" href="${pageContext.request.contextPath}/ServletController?accion=eliminar&idCliente=${cliente.idCliente}">
                                    <i class="bi bi-trash3-fill"></i> Eliminar
                                </a>
                            </div>
                        </div>
                    </div>
                </section>

                <!<!-- Detalles -->
                <section id="detalles">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="card">
                                    <div class="card-header">
                                        <h4>Editar Cliente</h4>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label for="nombre">Nombre:</label>
                                            <input type="text" class="form-control" name="nombre" required value="${cliente.nombre}">
                                        </div>

                                        <div class="form-group">
                                            <label for="apellido">Apellido:</label>
                                            <input type="text" class="form-control" name="apellido" required value="${cliente.apellido}">
                                        </div>

                                        <div class="form-group">
                                            <label for="email">Email:</label>
                                            <input type="email" class="form-control" name="email" required value="${cliente.email}">
                                        </div>

                                        <div class="form-group">
                                            <label for="telefono">Telefono:</label>
                                            <input type="tel" class="form-control" name="telefono" required value="${cliente.telefono}">
                                        </div>

                                        <div class="form-group">
                                            <label for="saldo">Saldo:</label>
                                            <input type="number" class="form-control" name="saldo" required value="${cliente.saldo}"  step="any">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </form>
        </section>

        <!-- Footer -->
        <jsp:include page="/WEB-INF/templates/footer.jsp"/>

        <!-- Scripts -->
        <jsp:include page="/WEB-INF/templates/scripts.jsp"/>
    </body>
</html>