resource "kubectl_manifest" "k8s-dashboard" {
  yaml_body = <<YAML

apiVersion: v1
kind: ConfigMap
metadata:
  labels:
    grafana_dashboard: kubernetes-cluster-component
  name: kubernetes-cluster-component
  namespace: loki
data:
  k8s_clsuter_component.json: |
    {
    "annotations": {
      "list": [
        {
          "builtIn": 1,
          "datasource": "-- Grafana --",
          "enable": true,
          "hide": true,
          "iconColor": "rgba(0, 211, 255, 1)",
          "name": "Annotations & Alerts",
          "type": "dashboard"
        }
      ]
    },
    "description": "Summary metrics about containers running on Kubernetes nodes.\r\n\r\nDashboard was taken from here.  This version does not reqiure you to\r\nsetup the Kubernetes-app plugin. (https://github.com/grafana/kubernetes-app)\r\n\r\nUse this Helm chart to launch Grafana into a Kubernetes cluster.  It will include this dashboard and many more dashboards to give you visibility into the Kubernetes Cluster. (https://github.com/sekka1/cloud-public/tree/master/kubernetes/pods/grafana-helm)",
    "editable": true,
    "gnetId": 6417,
    "graphTooltip": 1,
    "id": 3,
    "iteration": 1611047228802,
    "links": [
      {
        "asDropdown": true,
        "icon": "external link",
        "includeVars": true,
        "keepTime": false,
        "tags": [
          "kubernetes-app"
        ],
        "title": "Dashboards",
        "type": "dashboards"
      }
    ],
    "panels": [
      {
        "collapsed": false,
        "datasource": null,
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 0
        },
        "id": 2,
        "panels": [],
        "title": "Cluster Health",
        "type": "row"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "percentunit",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": true,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 4,
          "w": 6,
          "x": 0,
          "y": 1
        },
        "id": 4,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": false
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_info{node=~\"$node\"}) / sum(kube_node_status_allocatable_pods{node=~\".*\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "80,90",
        "title": "Cluster Pod Usage",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "percentunit",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": true,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 4,
          "w": 6,
          "x": 6,
          "y": 1
        },
        "id": 5,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": false
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_container_resource_requests_cpu_cores{node=~\"$node\"}) / sum(kube_node_status_allocatable_cpu_cores{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "80,90",
        "title": "Cluster CPU Usage",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "percentunit",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": true,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 4,
          "w": 6,
          "x": 12,
          "y": 1
        },
        "id": 6,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": false
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_container_resource_requests_memory_bytes{node=~\"$node\"}) / sum(kube_node_status_allocatable_memory_bytes{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "80,90",
        "title": "Cluster Memory Usage",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "percentunit",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": true,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 4,
          "w": 6,
          "x": 18,
          "y": 1
        },
        "id": 7,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": false
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "(sum (node_filesystem_size{nodename=~\"$node\"}) - sum (node_filesystem_free{nodename=~\"$node\"})) / sum (node_filesystem_size{nodename=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "80,90",
        "title": "Cluster Disk Usage",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "Prometheus",
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 0,
          "y": 5
        },
        "hiddenSeries": false,
        "id": 9,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "options": {
          "dataLinks": []
        },
        "percentage": false,
        "pointradius": 5,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "expr": "sum(kube_node_status_allocatable_pods{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "allocatable",
            "refId": "A"
          },
          {
            "expr": "sum(kube_node_status_capacity_pods{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "capacity",
            "refId": "B"
          },
          {
            "expr": "sum(kube_pod_info{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "requested",
            "refId": "C"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeRegions": [],
        "timeShift": null,
        "title": "Cluster Pod Capacity",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "short",
            "label": "pods",
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "Prometheus",
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 6,
          "y": 5
        },
        "hiddenSeries": false,
        "id": 10,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "options": {
          "dataLinks": []
        },
        "percentage": false,
        "pointradius": 5,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "expr": "sum(kube_node_status_capacity_cpu_cores{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "allocatable",
            "refId": "A"
          },
          {
            "expr": "sum(kube_node_status_allocatable_cpu_cores{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "capacity",
            "refId": "B"
          },
          {
            "expr": "sum(kube_pod_container_resource_requests_cpu_cores{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "requested",
            "refId": "C"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeRegions": [],
        "timeShift": null,
        "title": "Cluster CPU Capacity",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "decimals": null,
            "format": "none",
            "label": "cores",
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "Prometheus",
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 12,
          "y": 5
        },
        "hiddenSeries": false,
        "id": 11,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "options": {
          "dataLinks": []
        },
        "percentage": false,
        "pointradius": 5,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "expr": "sum(kube_node_status_allocatable_memory_bytes{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "allocatable",
            "refId": "A"
          },
          {
            "expr": "sum(kube_node_status_capacity_memory_bytes{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "capacity",
            "refId": "B"
          },
          {
            "expr": "sum(kube_pod_container_resource_requests_memory_bytes{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "requested",
            "refId": "C"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeRegions": [],
        "timeShift": null,
        "title": "Cluster Mem Capacity",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "decbytes",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
      {
        "aliasColors": {},
        "bars": false,
        "dashLength": 10,
        "dashes": false,
        "datasource": "Prometheus",
        "fill": 1,
        "fillGradient": 0,
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 18,
          "y": 5
        },
        "hiddenSeries": false,
        "id": 12,
        "legend": {
          "avg": false,
          "current": false,
          "max": false,
          "min": false,
          "show": true,
          "total": false,
          "values": false
        },
        "lines": true,
        "linewidth": 1,
        "links": [],
        "nullPointMode": "null",
        "options": {
          "dataLinks": []
        },
        "percentage": false,
        "pointradius": 5,
        "points": false,
        "renderer": "flot",
        "seriesOverrides": [],
        "spaceLength": 10,
        "stack": false,
        "steppedLine": false,
        "targets": [
          {
            "expr": "sum(node_filesystem_size{nodename=~\"$node\"}) - sum(node_filesystem_free{nodename=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "usage",
            "refId": "A"
          },
          {
            "expr": "sum(node_filesystem_size{nodename=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "legendFormat": "limit",
            "refId": "B"
          }
        ],
        "thresholds": [],
        "timeFrom": null,
        "timeRegions": [],
        "timeShift": null,
        "title": "Cluster Disk Capacity",
        "tooltip": {
          "shared": true,
          "sort": 0,
          "value_type": "individual"
        },
        "type": "graph",
        "xaxis": {
          "buckets": null,
          "mode": "time",
          "name": null,
          "show": true,
          "values": []
        },
        "yaxes": [
          {
            "format": "decbytes",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          },
          {
            "format": "short",
            "label": null,
            "logBase": 1,
            "max": null,
            "min": null,
            "show": true
          }
        ],
        "yaxis": {
          "align": false,
          "alignLevel": null
        }
      },
      {
        "collapsed": false,
        "datasource": null,
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 10
        },
        "id": 14,
        "panels": [],
        "title": "Deployments",
        "type": "row"
      },
      {
        "columns": [
          {
            "text": "Current",
            "value": "current"
          }
        ],
        "datasource": "Prometheus",
        "fontSize": "100%",
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 0,
          "y": 11
        },
        "id": 16,
        "links": [],
        "pageSize": null,
        "scroll": true,
        "showHeader": true,
        "sort": {
          "col": 1,
          "desc": true
        },
        "styles": [
          {
            "alias": "Time",
            "align": "auto",
            "dateFormat": "YYYY-MM-DD HH:mm:ss",
            "pattern": "Time",
            "type": "date"
          },
          {
            "alias": "",
            "align": "auto",
            "colorMode": "row",
            "colors": [
              "rgba(245, 54, 54, 0.9)",
              "rgba(237, 129, 40, 0.89)",
              "rgba(50, 172, 45, 0.97)"
            ],
            "decimals": 0,
            "pattern": "Metric",
            "thresholds": [
              "0",
              "0",
              ".9"
            ],
            "type": "string",
            "unit": "none"
          },
          {
            "alias": "",
            "align": "auto",
            "colorMode": "row",
            "colors": [
              "rgba(245, 54, 54, 0.9)",
              "rgba(237, 129, 40, 0.89)",
              "rgba(50, 172, 45, 0.97)"
            ],
            "dateFormat": "YYYY-MM-DD HH:mm:ss",
            "decimals": 0,
            "link": false,
            "pattern": "Value",
            "thresholds": [
              "0",
              "1"
            ],
            "type": "number",
            "unit": "none"
          }
        ],
        "targets": [
          {
            "expr": "kube_deployment_status_replicas{namespace=~\"$namespace\"}",
            "format": "time_series",
            "instant": true,
            "interval": "",
            "intervalFactor": 1,
            "legendFormat": "{{ deployment }}",
            "refId": "A"
          }
        ],
        "title": "Deployment Replicas - Up To Date",
        "transform": "timeseries_to_rows",
        "type": "table"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 6,
          "y": 11
        },
        "id": 18,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": false
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_deployment_status_replicas{namespace=~\"$namespace\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Deployment Replicas",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "avg"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 12,
          "y": 11
        },
        "id": 19,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": false
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_deployment_status_replicas_updated{namespace=~\"$namespace\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Deployment Replicas - Updated",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "avg"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 5,
          "w": 6,
          "x": 18,
          "y": 11
        },
        "id": 20,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": false
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_deployment_status_replicas_unavailable{namespace=~\"$namespace\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Deployment Replicas - Unavailable",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "avg"
      },
      {
        "collapsed": false,
        "datasource": null,
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 16
        },
        "id": 22,
        "panels": [],
        "title": "Node",
        "type": "row"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 0,
          "y": 17
        },
        "id": 24,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": false
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_node_info{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Number Of Nodes",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "avg"
      },
      {
        "cacheTimeout": null,
        "colorBackground": true,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 8,
          "y": 17
        },
        "id": 25,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": false
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_node_status_condition{condition=\"OutOfDisk\", node=~\"$node\", status=\"true\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "1",
        "title": "Nodes Out of Disk",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": true,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 16,
          "y": 17
        },
        "id": 26,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": false
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_node_spec_unschedulable{node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "1",
        "title": "Nodes Unavailable",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "collapsed": false,
        "datasource": null,
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 20
        },
        "id": 28,
        "panels": [],
        "title": "Pods",
        "type": "row"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 12,
          "x": 0,
          "y": 21
        },
        "id": 30,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(78, 203, 42, 0.28)",
          "full": false,
          "lineColor": "#629e51",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_status_phase{namespace=~\"$namespace\", phase=\"Running\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Pods Running",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 12,
          "x": 12,
          "y": 21
        },
        "id": 31,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(78, 203, 42, 0.28)",
          "full": false,
          "lineColor": "#629e51",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_status_phase{namespace=~\"$namespace\", phase=\"Pending\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Pods Pending",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 0,
          "y": 24
        },
        "id": 32,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(78, 203, 42, 0.28)",
          "full": false,
          "lineColor": "#629e51",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_status_phase{namespace=~\"$namespace\", phase=\"Failed\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Pods Failed",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 8,
          "y": 24
        },
        "id": 33,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(78, 203, 42, 0.28)",
          "full": false,
          "lineColor": "#629e51",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_status_phase{namespace=~\"$namespace\", phase=\"Succeeded\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Pods Succeeded",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 16,
          "y": 24
        },
        "id": 34,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(78, 203, 42, 0.28)",
          "full": false,
          "lineColor": "#629e51",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_status_phase{namespace=~\"$namespace\", phase=\"Unknown\"})",
            "format": "time_series",
            "interval": "",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Pods Unknown",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "collapsed": false,
        "datasource": null,
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 27
        },
        "id": 36,
        "panels": [],
        "title": "Containers",
        "type": "row"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 0,
          "y": 28
        },
        "id": 38,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_container_status_running{namespace=~\"$namespace\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Containers Running",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 6,
          "y": 28
        },
        "id": 39,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_container_status_waiting{namespace=~\"$namespace\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Containers Waiting",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 12,
          "y": 28
        },
        "id": 40,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_container_status_terminated{namespace=~\"$namespace\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Containers Terminated",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 6,
          "x": 18,
          "y": 28
        },
        "id": 41,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(delta(kube_pod_container_status_restarts{namespace=\"kube-system\"}[30m]))",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Containers Restarts (Last 30 Minutes)",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 12,
          "x": 0,
          "y": 31
        },
        "id": 43,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_container_resource_requests_cpu_cores{namespace=~\"$namespace\", node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "CPU Cores Requested by Containers",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "decbytes",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 12,
          "x": 12,
          "y": 31
        },
        "id": 42,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_pod_container_resource_requests_memory_bytes{namespace=~\"$namespace\", node=~\"$node\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Memory Requested By Containers",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "collapsed": false,
        "datasource": null,
        "gridPos": {
          "h": 1,
          "w": 24,
          "x": 0,
          "y": 34
        },
        "id": 45,
        "panels": [],
        "title": "Jobs",
        "type": "row"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 0,
          "y": 35
        },
        "id": 47,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_job_status_succeeded{namespace=~\"$namespace\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Jobs Succeeded",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 8,
          "y": 35
        },
        "id": 48,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_job_status_active{namespace=~\"$namespace\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Jobs Succeeded",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      },
      {
        "cacheTimeout": null,
        "colorBackground": false,
        "colorValue": false,
        "colors": [
          "#299c46",
          "rgba(237, 129, 40, 0.89)",
          "#d44a3a"
        ],
        "datasource": "Prometheus",
        "format": "none",
        "gauge": {
          "maxValue": 100,
          "minValue": 0,
          "show": false,
          "thresholdLabels": false,
          "thresholdMarkers": true
        },
        "gridPos": {
          "h": 3,
          "w": 8,
          "x": 16,
          "y": 35
        },
        "id": 49,
        "interval": null,
        "links": [],
        "mappingType": 1,
        "mappingTypes": [
          {
            "name": "value to text",
            "value": 1
          },
          {
            "name": "range to text",
            "value": 2
          }
        ],
        "maxDataPoints": 100,
        "nullPointMode": "connected",
        "nullText": null,
        "postfix": "",
        "postfixFontSize": "50%",
        "prefix": "",
        "prefixFontSize": "50%",
        "rangeMaps": [
          {
            "from": "null",
            "text": "N/A",
            "to": "null"
          }
        ],
        "sparkline": {
          "fillColor": "rgba(31, 118, 189, 0.18)",
          "full": false,
          "lineColor": "rgb(31, 120, 193)",
          "show": true
        },
        "tableColumn": "",
        "targets": [
          {
            "expr": "sum(kube_job_status_failed{namespace=~\"$namespace\"})",
            "format": "time_series",
            "intervalFactor": 1,
            "refId": "A"
          }
        ],
        "thresholds": "",
        "title": "Jobs Failed",
        "type": "singlestat",
        "valueFontSize": "80%",
        "valueMaps": [
          {
            "op": "=",
            "text": "N/A",
            "value": "null"
          }
        ],
        "valueName": "current"
      }
    ],
    "schemaVersion": 22,
    "style": "dark",
    "tags": [
      "kubernetes",
      "kubernetes-app"
    ],
    "templating": {
      "list": [
        {
          "current": {
            "selected": false,
            "text": "No data sources found",
            "value": ""
          },
          "hide": 2,
          "includeAll": false,
          "label": "",
          "multi": false,
          "name": "datasource",
          "options": [],
          "query": "prometheus",
          "refresh": 1,
          "regex": "/$ds/",
          "skipUrlSync": false,
          "type": "datasource"
        },
        {
          "current": {
            "text": ".*",
            "value": ".*"
          },
          "hide": 0,
          "label": null,
          "name": "node",
          "options": [
            {
              "selected": true,
              "text": ".*",
              "value": ".*"
            }
          ],
          "query": ".*",
          "skipUrlSync": false,
          "type": "constant"
        },
        {
          "current": {
            "text": ".*",
            "value": ".*"
          },
          "hide": 0,
          "label": null,
          "name": "namespace",
          "options": [
            {
              "selected": true,
              "text": ".*",
              "value": ".*"
            }
          ],
          "query": ".*",
          "skipUrlSync": false,
          "type": "constant"
        }
      ]
    },
    "time": {
      "from": "now-30m",
      "to": "now"
    },
    "timepicker": {
      "refresh_intervals": [
        "5s",
        "10s",
        "30s",
        "1m",
        "5m",
        "15m",
        "30m",
        "1h",
        "2h",
        "1d"
      ],
      "time_options": [
        "5m",
        "15m",
        "1h",
        "6h",
        "12h",
        "24h",
        "2d",
        "7d",
        "30d"
      ]
    },
    "timezone": "browser",
    "title": "Kubernetes Cluster",
    "uid": "4XuMd2Ii",
    "variables": {
      "list": []
    },
    "version": 1
    }

YAML

  depends_on = [helm_release.loki]
}