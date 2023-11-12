<!DOCTYPE html>
<html>
    <head>
        <!-- head <-> meta -->
        <jsp:include page="WEB-INF/clientes/listadoClientes.jsp"/>

        <title>Agenda Adeudos</title>
    </head>
    <body>

        <!-- Header -->
        <jsp:include page="WEB-INF/templates/header.jsp"/>

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
        <jsp:include page="WEB-INF/clientes/listadoClientes.jsp"/>

        <!-- Footer -->
        <section id="footer">
            <<footer class="bg-secondary text-white mt-5 p-5">
                <div class="row">
                    <p class="lead text-center">
                        Copyright &copy; Luvid 2023
                    </p>                    
                </div>
            </footer>            
        </section>

        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    </body>
</html>
