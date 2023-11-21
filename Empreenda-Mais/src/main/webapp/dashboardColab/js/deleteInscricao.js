function confirmarDeletar(id) {
    var confirmacao = confirm("Tem certeza que deseja excluir?");
    if (confirmacao) {
        window.location.href = '/Empreenda-Mais/ExcluirInscricaoColab?idInscricao=' + id;
    }
}