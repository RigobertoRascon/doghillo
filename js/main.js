$(document).ready(function () {
    $("#btn_write_review").click(function () {
        $("#review_modal").modal('show');
    });

    $("#btn_close_modal").click(function () {
        $("#review_modal").modal('hide');
    });
});

