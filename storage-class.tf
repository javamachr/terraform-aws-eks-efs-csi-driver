resource "kubernetes_storage_class" "storage_class" {
  count = (var.enabled && var.create_storage_class) ? 1 : 0
  metadata {
    name = var.storage_class_name
  }
  storage_provisioner = "efs.csi.aws.com"
  parameters = {
    provisioningMode = "efs-ap" # Access point
    directoryPerms   = "700"
  }
  depends_on          = [helm_release.kubernetes_efs_csi_driver]
}
