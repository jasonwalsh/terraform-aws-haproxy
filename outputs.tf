output "message" {
  value = "${data.template_file.file.rendered}"
}
