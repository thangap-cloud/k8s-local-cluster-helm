resource "helm_release" "mysql" {
  name       = "mysql"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mysql"
  namespace  = "mysql"
  create_namespace = true

  set {
    name  = "initdbScripts"
    value = <<EOF
          createdb.sql: |-
            CREATE DATABASE IF NOT EXISTS mydb;
            USE mydb;
            CREATE TABLE Persons (PersonID int);
          EOF
  }

  set {
    name  = "auth.rootPassword"
    value = "pass123"
  }

  set {

    name  = "auth.username"
    value = "user123"
  }

  set {
    name  = "auth.password"
    value = "pass123"
  }

}


resource "helm_release" "loki" {
  name       = "loki"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "loki-stack"
  namespace  = "loki"
  create_namespace = true

  set {
    name  = "grafana.enabled"
    value = "true"
  }

  set {
    name  = "prometheus.enabled"
    value = "true"
  }
  set {
    name  = "prometheus.alertmanager.persistentVolume.enabled"
    value = "false"
  }

  set {
    name  = "prometheus.server.persistentVolume.enabled"
    value = "false"
  }

  set {
    name  = "grafana.sidecar.dashboards.enabled"
    value = "true"
  }

  set {
    name  = "loki.persistence.enabled"
    value = "false"
  }

  set {
    name  = "prometheus-node-exporter.hostRootFsMount"
    value = "false"
  }

  set {
    name  = "grafana.adminPassword"
    value = "pass123"
  }

}


resource "helm_release" "counter" {
  name       = "counter"
  repository = path.module
  chart      = "counter"
  namespace  = "counter"
  create_namespace = true
}


