const uploadAttachment = (attachment) => {
  let file = attachment.file
  let form = new FormData;
  form.append("Content-Type", file.type);
  form.append("photo[url]", file);

  let xhr = new XMLHttpRequest;
  xhr.open("POST", "/photos.json", true);
  xhr.setRequestHeader("X-CRSF-Token", Rails.csrfToken());
  xhr.upload.onprogress = (event) => {
    let progress = event.loaded / event.total * 100;
    attachment.setUploadProgress(progress);
  };
  xhr.onload = () => {
    if(xhr.status === 201) {
      let data = JSON.parse(xhr.responseText);
      attachment.setAttributes({
        url: data.url,
        href: data.url
      });
    }
  };

  return xhr.send(form);
};

document.addEventListener('trix-attachment-add', (event) => {
  let attachment = event.attachment;
  if (attachment.file) {
    return uploadAttachment(attachment);
  }
});
