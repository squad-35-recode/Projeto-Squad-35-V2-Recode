function confirmarDeletar(idUsuario) {
    var confirmacao = confirm("Tem certeza que deseja excluir este usuário?");
    if (confirmacao) {
        window.location.href = '/Empreenda-Mais/DeletarUsuario?idUsuario=' + idUsuario;
    }
}