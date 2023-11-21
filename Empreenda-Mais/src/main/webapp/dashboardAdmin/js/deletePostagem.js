function confirmarDeletar(id) {
    var confirmacao = confirm("Tem certeza que deseja excluir esta postagem?");
    if (confirmacao) {
        window.location.href = '/Empreenda-Mais/DeletarPostagemAdmin?idPostagem=' + id;
    }
}