resource "aws_route53_record" "mmnix" {
  zone_id = "${var.zone_id}"
  name    = "${var.dns_name}"
  type    = "A"
  ttl     = "300"
  records = [ "${aws_eip.bar.public_ip}" ]
}
