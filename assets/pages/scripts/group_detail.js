$('.toast').toast({
    animation: true,
    autohide: false,
    delay: 5000
});

document.querySelector('.scrap').addEventListener('click', e => {
    e.target.toggleAttribute('disabled');

    const id_group = e.target.dataset.id;
    const targetUrl = base_url + "monitor/scrap/" + id_group;

    $.ajax({
        url: targetUrl,
        method: "POST",
        success: function (data) {
            location.reload();
        }
    });

})

$('body').on('click', '.delete', function () {
    $(this).parent().parent().hide();

    const id_target = $(this).data('id');

    const targetUrl = base_url + "monitor/delete_user_target/" + id_target;

    $.post(targetUrl).done(function () {
        $('.toast').toast('show');
    });

})

$(document).ready(function () {
    $('#table-targets').DataTable();
});