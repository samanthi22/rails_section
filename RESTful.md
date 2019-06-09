photos_url

new_photo_url # photos/new

photo_url(@photo) # photos/#{@photo.id}

edit_photo_url(@photo) # photos/#{@pho.id}/edit_photo_ur


HTML button that will delete photo:
```
<form action="<%= photo_url(@photo) %>" method="POST">
  <input type="hidden" value="delete" name="_method" />
  <input type="submit" value="Delete photo" />
</form>
<%= button_to "Delete photo", photo_url(@photo), method: :delete %> <!-- equivalent to the above -->
```

embed query-string options into url helpers

```
photos_url(recent: true) == http://www.example-site.com/photos?recent=true
```

rails routes