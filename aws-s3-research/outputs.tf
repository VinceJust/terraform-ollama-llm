output "bucket_arn" {
  description = "ARN des erstellten S3 Buckets"
  value       = aws_s3_bucket.my_research_bucket.arn
}

output "bucket_domain" {
  description = "Regionaler Domainname des Buckets"
  value       = aws_s3_bucket.my_research_bucket.bucket_regional_domain_name
}

