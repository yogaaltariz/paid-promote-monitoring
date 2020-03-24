<div class="container my-3">
    <form action="<?= base_url('hashtags') ?>" method="POST">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="# hashtag" name="hashtag">
        </div>

        <button type="submit" class="btn btn-primary">Tambah hashtag</button>
    </form>
    <hr>
    <div class="row">
        <?php
            foreach ($hashtags as $hashtag) {
                ?>
        <div class="col my-1">
            <div class="card">
                <div class="card-body">
                    <strong><?= $hashtag->text ?></strong>
                </div>
            </div>
        </div>
        <?php
            }
        ?>
    </div>
</div>