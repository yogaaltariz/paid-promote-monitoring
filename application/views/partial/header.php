<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INFEST - Paid promote app</title>

    <!-- Bootstrap core CSS -->
    <link href="<?= base_url('assets/global/bootstrap/css/bootstrap.min.css') ?>" rel="stylesheet">


    <!-- page level css -->
    <?php asset_css(); ?>
    <script>

        const base_url = "<?= base_url() ?>"
    </script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">INFEST</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-item nav-link active" href="<?= base_url() ?>">Monitoring <span class="sr-only">(current)</span></a>
                <a class="nav-item nav-link" href="<?= base_url('hashtags') ?>">Hashtag</a>
                <a class="nav-item nav-link" href="<?= base_url('target') ?>">Target</a>
                <a class="nav-item nav-link" href="<?= base_url('auth/logout') ?>">Logout</a>
            </div>
        </div>
    </nav>