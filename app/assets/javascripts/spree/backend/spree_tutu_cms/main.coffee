sendFile = (file, callback) ->
  data = new FormData()
  data.append("image[upload]", file)
  $.ajax {
    url: '/admin/cms/images',
    data: data,
    cache: false,
    contentType: false,
    processData: false,
    type: 'POST',
    success: (data) ->
      callback(data)
  }

$ ->
  $('[data-provider="summernote"]').each ->
    $(this).summernote
      height: 350
      toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'italic', 'underline', 'clear']],
#        ['fontname', ['fontname']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['height', ['height']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'hr']],
        ['view', ['fullscreen', 'codeview']],
        ['help', ['help']]
      ]
      insertTableMaxSize:
        col: 20
        row: 20
      onImageUpload: (files) ->
        $summernote = $(this)
        for file in files
          sendFile file, (imgUrl) ->
            $imgNode = $('<img>').attr('src', imgUrl)
            $summernote.summernote('insertNode', $imgNode[0])
