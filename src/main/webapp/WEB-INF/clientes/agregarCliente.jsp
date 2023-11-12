<div class="modal fade" id="agregarClienteModal" tabindex="-1" aria-labelledby="tituloAgregar" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h1 class="modal-title fs-5" id="tituloAgregar">Agregar Cliente</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>        
            <form class="was-validated" action="${pageContext.request.contextPath}/ServletController?accion=insertar" method="post">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombre">Nombre:</label>
                        <input type="text" class="form-control" name="nombre" required>
                    </div>

                    <div class="form-group">
                        <label for="apellido">Apellido:</label>
                        <input type="text" class="form-control" name="apellido" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" name="email" required>
                    </div>

                    <div class="form-group">
                        <label for="telefono">Telefono:</label>
                        <input type="tel" class="form-control" name="telefono" required>
                    </div>

                    <div class="form-group">
                        <label for="saldo">Saldo:</label>
                        <input type="number" class="form-control" name="saldo" required>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>