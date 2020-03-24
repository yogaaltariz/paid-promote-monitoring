<table class="table table-sm" id="monitor-table">

    <thead class="thead-dark">
        <tr>
            <th class="d-none d-lg-table-cell">INSTAGRAM UID</th>
            <th>USERNAME</th>
            <th>STATUS</th>
            <th class="d-none d-lg-table-cell">WAKTU POSTING</th>
            <th class="d-none d-lg-table-cell">LINK</th>
        </tr>
    </thead>

    <tbody>
        <?php 
    foreach ($monitorStatus as $postData) {
        ?>

        <tr>
            <td class="d-none d-lg-table-cell">
                <?= $postData['useruid'] ?>
            </td>
            <td>
                <a href="https://www.instagram.com/<?= $postData['username'] ?>" target="_blank">
                    <?= $postData['username'] ?>
                </a>
            </td>
            <td>
                <?php 
            if($postData['posted']){
                ?>
                <label for="" class="badge badge-success">posting</label>
                <?php
            }else {
                ?>
                <label for="" class="badge badge-warning">tidak posting</label>

                <?php
            }
        
        ?>
            </td>
            <td class="d-none d-lg-table-cell">
                <?= $postData['postTime'] ?>
            </td>
            <td class="d-none d-lg-table-cell">
                <?php 
            if(!empty($postData['shortcode'])){
                ?>
                <a href="https://www.instagram.com/p/<?= $postData['shortcode'] ?>" target="_blank">post
                    link</a>

                <?php
            }
        
        ?>
            </td>
        </tr>
        <?php
    }

?>


    </tbody>
</table>

<script>
    

</script>

