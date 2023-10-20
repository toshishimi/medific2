const $ = require("jquery");

document.addEventListener("DOMContentLoaded", function() { 
  $(document).on('change', '#image-upload-field', function() {
    const formData = new FormData();
    formData.append("image", $('#image-upload-field')[0].files[0]);

    $.ajax({
      type: 'POST',
      url: '/date_hospitals/upload',
      data: formData,
      dataType: 'json',
      beforeSend: function(xhr) {
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
      },
      processData: false,
      contentType: false,
      success: function(data) {
        // JSONデータから値を取得
        const date = data.date;
        const hospitalName = data.hospital_name;

        // フォームのフィールドに値を設定
        $('#date_input').val(date);
        $('#hospital_name_input').val(hospitalName);

        alert('画像の読み込みに成功しました!');
      },
      error: function() {
        alert('画像の読み込みに失敗しました');
      }
    });
  });
});