##### SG MASTER RULES #####
resource "scaleway_security_group" "master_security_group" {
  name        = "sg.master.${terraform.workspace}"
  description = "Master security group"
}

resource "scaleway_security_group_rule" "smtp_master_drop" {
  security_group = "${scaleway_security_group.master_security_group.id}"

  action    = "drop"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 25
}

resource "scaleway_security_group_rule" "ssh_master_accept" {
  count          = "${length(var.ip_admin)}"
  security_group = "${scaleway_security_group.master_security_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ip_admin, count.index)}"
  protocol  = "TCP"
  port      = 22
}

resource "scaleway_security_group_rule" "https_master_dashboard_accept" {
  security_group = "${scaleway_security_group.master_security_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ip_admin, count.index)}"
  protocol  = "TCP"
  port      = 8888
}

resource "scaleway_security_group_rule" "https_master_management_accept" {
  security_group = "${scaleway_security_group.master_security_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ip_admin, count.index)}"
  protocol  = "TCP"
  port      = 6443
}

resource "scaleway_security_group_rule" "http_master_podinfo_accept" {
  security_group = "${scaleway_security_group.master_security_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ip_admin, count.index)}"
  protocol  = "TCP"
  port      = 31190
}

resource "scaleway_security_group_rule" "icmp_master_drop" {
  security_group = "${scaleway_security_group.master_security_group.id}"

  action    = "drop"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "ICMP"
}

##### SG WORKER RULES #####
resource "scaleway_security_group" "worker_security_group" {
  name        = "sg.worker.${terraform.workspace}"
  description = "Worker security group"
}

resource "scaleway_security_group_rule" "ssh_worker_accept" {
  security_group = "${scaleway_security_group.worker_security_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "${element(var.ip_admin, count.index)}"
  protocol  = "TCP"
  port      = 22
}

resource "scaleway_security_group_rule" "icmp_worker_drop" {
  security_group = "${scaleway_security_group.worker_security_group.id}"

  action    = "drop"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "ICMP"
}
