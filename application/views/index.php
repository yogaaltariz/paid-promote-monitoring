<style>
    .select2-container .select2-selection--single .select2-selection__rendered {
        text-overflow: inherit;
    }
</style>
<div class="container">

    <div class="my-3 card ">

        <div class="card-body">

            <form action="<?= base_url('monitor/doMonitoring/') ?>" id="monitor-form">

                <div class="form-group" >
                    <select class="hashtag" name="hashtag" style="width: 100%">
                        <option value="">pilih hashtag</option>
                        <?php 
                        
                        foreach ($hashtags as $hashtag) {
                            ?>
                        <option value="<?= $hashtag->text ?>"><?= $hashtag->text ?></option>
                        <?php
                        }
                        ?>
                    </select>
                </div>

                <div class="form-group">
                    <select class="targets " name="target" style="width: 100%">
                        <option value="">pilih target</option>
                        <?php 
                        
                        foreach ($groups as $group) {
                            ?>
                        <option value="<?= $group->id_group ?>"><?= $group->group_name ?></option>
                        <?php
                        }
                        ?>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary float-right" id="submitBtn">monitor</button>
            </form>
        </div>
    </div>

    <div id="monitoring-result">
        

    </div>
</div>