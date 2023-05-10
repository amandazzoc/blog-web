<?php
include("conexao.php")
    ?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog</title>
    <link ref="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
</head>

<body>
    <div class="container mt-5 pt-3 ps-3 pb-3 pe-3 rounded-4 shadow-lg">

        <table class="table table-bordered table-striped " width="800">
            <?php
            $query = mysqli_query($conexao, "SELECT * FROM blog INNER JOIN bloginfo ON blog_bloginfo_codigo = bloginfo_codigo INNER JOIN blogimgs ON blog_blogimgs_codigo = blogimgs_codigo INNER JOIN usuario ON blog_usuario_codigo = usuario_codigo");
            while ($exibe = mysqli_fetch_array($query)) {
                ?>
                <tr>
                    <td><img src="imgs/<?php echo $exibe[9] ?>" width="200px"></td>
                    <td><a href="page.php?idb=<?php echo $exibe[0]?>">

                            <h3>
                                <?php echo $exibe[5] ?>
                            </h3>
                            Criada por <b>
                                <?php echo $exibe[11] ?>
                            </b> em
                            <?php echo $exibe[7] ?>
                            <hr>
                            <?php echo substr($exibe[6], 0, 150) . "..." ?>

                        </a></td>
                </tr>
            <?php } ?>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
    <style>
        a {
            color: inherit;
        }
    </style>
</body>

</html>