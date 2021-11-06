resource "kubernetes_namespace" "namespace" {
  count = var.module_enabled ? 1 : 0

  metadata {
    name        = var.name
    annotations = var.annotations
    labels      = var.labels
  }

  depends_on = [var.module_depends_on]
}
