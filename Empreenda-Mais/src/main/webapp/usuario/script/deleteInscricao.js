function confirmarDeletar(id) {
    var confirmacao = confirm("Tem certeza que deseja cancelar seus estudos?");
    if (confirmacao) {
        window.location.href = '/Empreenda-Mais/ExcluirInscricao?idInscricao=' + id;
    }
}