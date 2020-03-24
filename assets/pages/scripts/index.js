$('.hashtag').select2({
    placeholder: "# Hashtag"
});

$('.targets').select2({
    placeholder: "Pilih group target"
});


$('#monitor-form').submit(function (e) {
    e.preventDefault();
    submitBtn = document.getElementById('submitBtn');
    submitBtn.toggleAttribute('disabled');
    var form = $(this);
    var url = form.attr('action');
    $.ajax({
        type: "GET",
        url: url,
        data: form.serialize(), // serializes the form's elements.
        success: function (data) {
            document.querySelector('#monitoring-result').innerHTML = data;
            submitBtn.toggleAttribute('disabled');
            $('#monitor-table').DataTable();
        }
    });
})
