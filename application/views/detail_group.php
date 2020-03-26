<?php

$id_group = $this->uri->segment(3, 0);


?>

<div class="container my-3">

    <div class="card ">
        <div class="card-header">

            <div class="btn-group">
                <button class="btn btn-outline-primary mt-1 btn-sm mx-1" data-toggle="modal" data-target="#add-user-target">Tambah
                    user
                    target</button>
                <a class="btn btn-outline-primary mt-1 btn-sm mx-1" href="<?= base_url('monitor/export_excel/' . $id_group) ?>">Export</a>
                <button class="btn btn-primary scrap mt-1 btn-sm mx-1" data-id="<?= $id_group ?>">Scrap Account</button>
            </div>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-sm" id="table-targets">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th class="d-none d-lg-table-cell">Name</th>
                        <th>USERUID</th>
                        <th>Total Absent</th>
                        <th>Pay</th>
                        <th>Public</th>
                        <th class="d-none d-lg-table-cell">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    foreach ($all_target as $target) {
                        # code...
                    ?>
                        <tr>
                            <td><?= $target->username ?></td>
                            <td class="d-none d-lg-table-cell"><?= $target->name ?></td>
                            <td><?= $target->useruid ?></td>
                            <td><?= $target->total_absence ?></td>
                            <td><?= $target->total_absence * 50000 ?></td>
                            <td>
                                <?php
                                if ($target->is_public == 1) {
                                ?>
                                    <label for="" class="badge badge-success">YES</label>
                                <?php
                                } else {
                                ?>
                                    <label for="" class="badge badge-danger">NO</label>
                                <?php
                                }
                                ?>
                            </td>
                            <td class="d-none d-lg-table-cell">
                                <button class="btn btn-danger delete btn-sm" data-id="<?= $target->id_target ?>">hapus</button>

                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>
        </div>


    </div>

</div>


<!-- Modal -->
<div class="modal fade" id="add-user-target" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <form action="<?= base_url('monitor/add_user_target') ?>" method="POST" id="add-group-form">
                    <div class="form-group">
                        <textarea id="" cols="30" name="targets" rows="10" class="form-control" placeholder="username dipisahkan dengan ',' "></textarea>
                        <input type="hidden" name="id_group" value="<?= $id_group ?>">
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

<div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
    <div class="toast" style="position: absolute; top: 0; right: 0;">
        <div class="toast-header">
            <strong class="mr-auto">Sukses</strong>
            <small>Sekarang</small>
            <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="toast-body">
            Berhasil menghapus user target
        </div>
    </div>
</div>