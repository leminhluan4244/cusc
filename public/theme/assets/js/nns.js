function nss_formatDate(stringDate) {
    var date = new Date(stringDate);
    var day = date.getDate().toString();
    day = day.length > 1 ? day : '0' + day;
    var month = (1 + date.getMonth()).toString();
    month = month.length > 1 ? month : '0' + month;
    var year = date.getFullYear();

    return day +'-'+ month +'-'+ year;
}