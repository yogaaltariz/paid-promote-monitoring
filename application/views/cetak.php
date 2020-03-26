<!DOCTYPE html>
<html lang="en">

<head>
    <title>Document</title>
    <style type="text/css">
        body {
            font-family: sans-serif;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
        }

        table th,
        table td {
            border: 1px solid #3c3c3c;
            padding: 3px 8px;

        }
    </style>
</head>

<body>
    <?php

    header("Content-type: application/vnd-ms-excel");
    header("Content-Disposition: attachment; filename=Monitor_PP.xls");
    ?>

    <table>
        <thead>
            <tr>
                <th>Username</th>
                <th>Name</th>
                <th>USERUID</th>
                <th>Total Absent</th>
                <th>Pay</th>
                <th>Public</th>
            </tr>
        </thead>
        <tbody>
            <?php
            foreach ($all_target as $target) {
                # code...
            ?>
                <tr>
                    <td><?= $target->username ?></td>
                    <td><?= $target->name ?></td>
                    <td><?= $target->useruid ?></td>
                    <td><?= $target->total_absence ?></td>
                    <td><?= $target->total_absence * 50000 ?></td>
                    <td>
                        <?php
                        if ($target->is_public == 1) {
                        ?>
                            <label for="">Public</label>
                        <?php
                        } else {
                        ?>
                            <label for="">Private</label>
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
</body>

</html>