resource "aws_s3_bucket" "this" {
  bucket = random_pet.bucket.id

  tags = {
    Name        = "New Bucket for test"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "this" {
  bucket = aws_s3_bucket.this.id
  acl    = "private"
}

resource "aws_s3_object" "this" {

  bucket       = aws_s3_bucket.this.bucket
  key          = "${uuid()}.${local.file_ext}"
  source       = data.archive_file.json.output_path
  etag         = filemd5(data.archive_file.json.output_path)
  content_type = "application/zip"
}