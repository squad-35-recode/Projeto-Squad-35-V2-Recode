function confirmarDeletar(id) {
    var confirmacao = confirm("Tem certeza que deseja excluir este curso?");
    if (confirmacao) {
        window.location.href = '/Empreenda-Mais/ExluirCurso?idCurso=' + id;
    }
}