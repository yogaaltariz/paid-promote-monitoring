<div class="container my-2">

    <button class="btn btn-block btn-primary" data-toggle="modal" data-target="#addTargetModal">Tambah grup
        target</button>

    <div class="row mt-2">

        <?php 
        foreach ($group as $item) {
            ?>
        <div class="col-md-4 my-1">
            <div class="card">
                <div class="card-body">
                    <h4><?= $item->group_name ?></h4>
                    <p><?= $item->jumlah_target ?></p>
                    <a href="<?= base_url('monitor/group_detail/'.$item->id_group) ?>" class="btn btn-outline-primary">selengkapnya</a>
                </div>

            </div>
        </div>
        <?php
        }
       
       ?>

    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="addTargetModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <form action="<?= base_url('monitor/add_group') ?>" method="POST" id="add-group-form">
                    <div class="form-group">
                        <input type="text" class="form-control" name="group_name" placeholder="Masukkan nama grup">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                <button type="submit" form="add-group-form" class="btn btn-primary">Tambah</button>
            </div>
        </div>
    </div>
</div>