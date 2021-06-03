function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}

$(document).ready(function() {
    
    $('.btn-update-user').click(function() {
        const id = $(this).attr('data');
        $.ajax({
            url: `/api/user/${id}`,
            type: 'GET',
            contentType: 'application/json',
            dataType: 'json',
            success: function(result) {
                if (result !== null) {
                    $("#roleId").val(result.roleId);
                    $("#userId").val(result.userId);

                    $("#dob").val(formatDate(result.dob));
					
                    $("#gender").val(result.gender === true ? 1 : 0);
                    $("#address").val(result.address);
                    $("#phoneNumber").val(result.phoneNumber);
                    $("#email").val(result.email);
                    $("#note").val(result.note);   
                }
            }
        });
    });

	$('.btn-delete-user').click(function() {
		if(!confirm("Bạn có chắc chắn muốn xoá? ")) {
			return;
		}
        const this2 = $(this);
        const id = $(this).attr('data');
        $.ajax({
            url: `/api/user/${id}`,
            type: 'DELETE',
            contentType: 'application/json',
            dataType: 'json',
            success: function(result) {
                if (result) {
                    this2.closest('tr').remove();
                }
            }
        });
    });

});