$(function() {
    var reviewPeriod = $('#review-period');
    $('#user_review_period').on("input", function() {
        reviewPeriod.text($(this).val());
    });
});
