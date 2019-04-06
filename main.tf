data "template_file" "file" {
  template = "Hello, $${name}!"

  vars {
    name = "${var.name}"
  }
}
