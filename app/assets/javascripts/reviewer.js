$(function() {
    var reviewPeriod = $('#review-period');
    $('#reviewer_review_period').on("input", function() {
        reviewPeriod.text($(this).val());
    });
});
