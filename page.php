<?php
include("conexao.php")
    ?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

</head>

<body>
    <div class="container mt-3 pt-3 ps-3 pb-3 pe-3">
        <table class="table table-bordered" width="1000px">
            <?php
                $query = mysqli_query($conexao, "SELECT * FROM blog INNER JOIN bloginfo ON blog_bloginfo_codigo = bloginfo_codigo INNER JOIN blogimgs ON blog_blogimgs_codigo = blogimgs_codigo INNER JOIN usuario ON blog_usuario_codigo = usuario_codigo WHERE blog_codigo=".$_GET["idb"]);
                while ($exibe = mysqli_fetch_array($query)) {
            ?>
            <tr>
                <td><img src="imgs/<?php echo $exibe[9] ?>" width="200px"></td>
                <td>
                <h3><?php echo $exibe[5] ?></h3>
                            Criada por <b> <?php echo $exibe[11] ?> </b> em <?php echo $exibe[7] ?>
                            <hr>
                            <?php echo $exibe[6]?>
                </td>
            </tr>
            <?php } ?>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

</body>

</html>