<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>INFEST - PAID PROMOTE MONITOR</title>


    <!-- Bootstrap core CSS -->
    <link href="<?= base_url('assets/global/bootstrap/css/bootstrap.min.css') ?>" rel="stylesheet"
        >

    <!-- Favicons -->
    <!-- <link rel="apple-touch-icon" href="/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/4.4/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c"> -->
    <link rel="icon" href="/docs/4.4/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#563d7c">


    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: -ms-flexbox;
            display: flex;
            -ms-flex-align: center;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            width: 100%;
            max-width: 330px;
            padding: 15px;
            margin: auto;
        }

        .form-signin .checkbox {
            font-weight: 400;
        }

        .form-signin .form-control {
            position: relative;
            box-sizing: border-box;
            height: auto;
            padding: 10px;
            font-size: 16px;
        }

        .form-signin .form-control:focus {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
</head>

<body class="text-center">
    <?php 
                $attributes_login = array('class'=>'form-signin','action' => base_url('auth/login'));
                echo form_open('auth/login',$attributes_login);
            ?>
    <div class="alert alert-danger d-none"></div>
    <div class="alert alert-success d-none"></div>

    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
    <label for="inputEmail" class="sr-only">username</label>
    <input type="text" id="inputEmail" name="username" class="form-control" placeholder="Username" required autofocus>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>

    <button class="btn btn-lg btn-primary btn-block submit-btn" type="submit">Sign in</button>
    <p class="mt-5 mb-3 text-muted">&copy; Infest 2020</p>
    </form>


    <script>
        document.querySelector('.form-signin').addEventListener('submit', e => {
            const submitBtn = document.querySelector('.submit-btn');
            submitBtn.toggleAttribute('disabled');
            e.preventDefault();
            const actionUrl = e.target.action;

            const data = new URLSearchParams();
            for (const pair of new FormData(e.target)) {
                data.append(pair[0], pair[1]);
            }
            fetch(actionUrl,{
                method : "POST",
                body : data

            })
            .then((response) => response.json())
            .then((data) => {
                // console.log('Success:', data);
                if(data.status){
                    document.querySelector('.alert-success').innerHTML = data.message;
                    document.querySelector('.alert-danger').classList.toggle('d-none',true);

                    document.querySelector('.alert-success').classList.toggle('d-none',false);
                    window.location.replace(data.next);

                } else {
                    document.querySelector('.alert-danger').innerHTML = data.message;
                    document.querySelector('.alert-success').classList.toggle('d-none',true);

                    document.querySelector('.alert-danger').classList.toggle('d-none',false);
                }

                document.getElementsByName(data.csrfName)[0].value = data.csrfHash
                submitBtn.toggleAttribute('disabled');

            })
            // $.post(target, function (response) {
            //     if (response.status) {
            //         // toast success
            //         toastr.success(response.message, 'Sukses');

            //     } else {
            //         // toast err
            //         response.errors.forEach((error) => {
            //             toastr.error(error, 'Kesalahan');
            //         })
            //     }
            //     $(`input:hidden[name=${response.csrfName}]`).val(response.csrfHash);
            // });
        })
    </script>
</body>

</html>