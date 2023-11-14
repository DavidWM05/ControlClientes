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

        <!-- Buttons -->
        <section id="actions">
            <div class="container py-4 mb-4 bg-light">
                <div class="row">
                    <div class="col-md-3">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#agregarClienteModal">
                            <i class="bi bi-person-fill-add"></i> Agregar Cliente
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Listado Clientes -->
        <jsp:include page="/WEB-INF/clientes/listadoClientes.jsp"/>

        <!-- Footer -->
        <jsp:include page="/WEB-INF/templates/footer.jsp"/>

        <!-- Scripts -->
        <jsp:include page="/WEB-INF/templates/scripts.jsp"/>
    </body>
</html>