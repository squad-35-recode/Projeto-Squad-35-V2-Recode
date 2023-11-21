$(document).ready(function() {
    $(".detalhePostagem").click(function() {
        var postId = $(this).data("post-id"); 
        $.ajax({
            url: "DetalhePostagem?id=" + postId,
            type: "GET",
            dataType: "json",
            success: function(data) {
                $('#modalTitle').text(data.titulo);
                $('#nomeUsuarioAj').text(data.nomeUsuario);
                $('#linkPerfil').attr('href', 'VerPerfil?id=' + data.idUsuario);
                
                if (!data.fotoPerfil || data.fotoPerfil.trim() === '') {
                    $('#fotoPerfil').attr('src', 'https://i.postimg.cc/T3G5j2KW/user-standard.png');
                } else {
                    $('#fotoPerfil').attr('src', data.fotoPerfil);
                }
                
                var dataString = data.dataPost;
                var partesData = dataString.split('-');
    			var dataFormatadaFront = partesData[2] + '/' + partesData[1] + '/' + partesData[0];
			    $('#dataPost').text(dataFormatadaFront);
                $('#categoria').text(data.categoria);
                $('#corpo').html(data.corpo); 
                $('#media').attr('src', data.media);

                $('#exampleModal').modal('show'); 
            },
            error: function(xhr, status, error) {
                console.error(status + ": " + error);
            }
        });
    });
});
