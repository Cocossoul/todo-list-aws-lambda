resource "aws_s3_bucket" "todo_list" {
  bucket = "todo-list-www-bucket"
}

resource "aws_s3_bucket_policy" "todo_list" {
  bucket = aws_s3_bucket.todo_list.id
  policy = templatefile("./www/policy.json", {
    bucket_name = aws_s3_bucket.todo_list.bucket
  })
}

output "website_address" {
  value = aws_s3_bucket_website_configuration.todo_list.website_endpoint
}

resource "aws_s3_bucket_acl" "todo_list" {
  bucket = aws_s3_bucket.todo_list.id
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "todo_list" {
  bucket = aws_s3_bucket.todo_list.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "todo_list_index" {
  bucket = aws_s3_bucket.todo_list.bucket
  key     = "index.html"
  source = "./www/index.html"
  etag = filemd5("./www/index.html")
  content_type = "text/html"
}

resource "aws_s3_object" "todo_list_script" {
  bucket = aws_s3_bucket.todo_list.bucket
  key     = "script.js"
  source = "./www/script.js"
  etag = filemd5("./www/script.js")
}

