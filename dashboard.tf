 /*resource "google_monitoring_dashboard" "dashboard" {
project = "poc-ciscld-apigx-766888"
  dashboard_json = <<EOF
{
  "displayName": "test-dashboard",
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "vm_disk_read_bytes_count",
        "xyChart": {
            "chartOptions": {
            "mode": "COLOR"
           },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"compute.googleapis.com/instance/disk/read_bytes_count\" AND resource.type=\"gce_instance\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "LINE"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      
      {
        "title": "vm_disk_write_bytes_count",
        "xyChart": {
            "chartOptions": {
            "mode": "COLOR"
           },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "Firestore_read_count",
        "xyChart": {
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"firestore.googleapis.com/document/read_count\" AND resource.type=\"firestore_instance\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
     },
      {
        "title": "SCIO|NPD|storage|GCS|Sent_bytes_count|warn|metric",
        "xyChart": {
       "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"storage.googleapis.com/network/sent_bytes_count\" AND resource.type=\"gcs_bucket\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "LINE"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },

       {
        "title": "SCIO|NPD|pubsub|topic|Topic_bytes_cost|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"pubsub.googleapis.com/topic/byte_cost\" AND resource.type=\"pubsub_topic\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_BAR"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
         {
        "title": "SCIO|NPD|pubsub|topic|Publish_requests|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"pubsub.googleapis.com/topic/send_request_count\" AND resource.type=\"pubsub_topic\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_BAR"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
          {
        "title": "SCIO|NPD|gce|Instance|Disk_read_bytes|warn|metric",
        "xyChart": {
		"chartOptions": {
              "mode": "COLOR"
            },
    	"dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"compute.googleapis.com/instance/disk/read_bytes_count\" AND resource.type=\"gce_instance\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_BAR"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
{
        "title": "SCIO|NPD|gce|Instance|Disk_write_bytes|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_BAR"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },

       
       {
        "title": "SCIO|NPD|gce|subnet|Disk_write_bytes|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"networking.googleapis.com/vpc_flow/predicted_max_vpc_flow_logs_count\" AND resource.type=\"gce_subnetwork\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_BAR"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },

       {
        "title": "SCIO|NPD|gce|Firewall|Dropped_packets|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"compute.googleapis.com/firewall/dropped_packets_count\" AND resource.type=\"gce_instance\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_BAR"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|dataproc|cluster|Failed_operations|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"dataproc.googleapis.com/cluster/operation/failed_count\" AND resource.type=\"cloud_dataproc_cluster\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|storage|GCS|Object_count|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"storage.googleapis.com/api/request_count\" AND resource.type=\"gcs_bucket\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|storage|GCS|Received_bytes|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"storage.googleapis.com/network/received_bytes_count\" AND resource.type=\"gcs_bucket\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|Dataproc|Cluster|HDFS_storage_utilization|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"dataproc.googleapis.com/cluster/hdfs/storage_utilization\" AND resource.type=\"cloud_dataproc_cluster\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
       
      {
        "title": "SCIO|NPD|Dataproc|Cluster|HDFS_capacity|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"dataproc.googleapis.com/cluster/hdfs/storage_capacity\" AND resource.type=\"cloud_dataproc_cluster\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|load_Balancer|Https_LB|Backend_Request_Count|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"loadbalancing.googleapis.com/https/backend_request_bytes_count\" AND resource.type=\"https_lb_rule\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|load_Balancer|Https_LB|Request_count|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"loadbalancing.googleapis.com/https/request_count\" AND resource.type=\"https_lb_rule\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|VM|VM_Firewall|VM_Firewall_Hit Count|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"firewallinsights.googleapis.com/vm/firewall_hit_count\" AND resource.type=\"gce_instance\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|firestore|network|connected_clients|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"firestore.googleapis.com/network/active_connections\" AND resource.type=\"firestore_instance\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|cloud_armor|https|request_count|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"networksecurity.googleapis.com/https/request_count\" AND resource.type=\"network_security_policy\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|cloudnat|nat|closed_connections_count|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"router.googleapis.com/nat/closed_connections_count\" AND resource.type=\"nat_gateway\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
    {
        "title": "SCIO|NPD|gce_router|router|sent_routes_count|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter":  "metric.type=\"router.googleapis.com/sent_routes_count\" AND resource.type=\"gce_router\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      }
                        
    
    
    
    ]
  }
}

EOF
}*/



#----------------Dashboard-testing with recommened alerts in CN----------#


/*resource "google_monitoring_dashboard" "dashboard" {
 project  = var.mon_project_id
  dashboard_json = <<EOF
{
  "displayName": "SCIO-GCP-Platform",
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "SCIO|${var.env_alert}|storage|GCS|Object_count|warn|metric",
        "xyChart": {
            "chartOptions": {
            "mode": "COLOR"
           },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"storage.googleapis.com/storage/total_byte_seconds\" AND resource.type=\"gcs_bucket\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "LINE"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      
      {
        "title": "SCIO|${var.env_alert}|storage|GCS|Sent_bytes_count|warn|metric",
        "xyChart": {
            "chartOptions": {
            "mode": "COLOR"
           },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"storage.googleapis.com/network/sent_bytes_count\" AND resource.type=\"gcs_bucket\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
      {
        "title": "SCIO|${var.env_alert}|pubsub|topic|Publish_requests|warn|metric",
        "xyChart": {
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"pubsub.googleapis.com/topic/send_request_count\" AND resource.type=\"pubsub_topic\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_AREA"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
     },
      {
        "title": "SCIO|${var.env_alert}|dataproc|cluster|Failed_operations|warn|metric",
        "xyChart": {
       "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"dataproc.googleapis.com/cluster/operation/failed_count\" AND resource.type=\"cloud_dataproc_cluster\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "LINE"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },

       {
        "title": "SCIO|${var.env_alert}|Dataproc|Cluster|HDFS_DataNodes|warn|metric",
        "xyChart": {
    "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"dataproc.googleapis.com/cluster/hdfs/datanodes\" AND resource.type=\"cloud_dataproc_cluster\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_MEAN"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "LINE"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
         {
        "title": "SCIO|${var.env_alert}|Dataproc|Cluster|HDFS_storage_utilization|warn|metric",
        "xyChart": {
        "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"dataproc.googleapis.com/cluster/hdfs/storage_utilization\" AND resource.type=\"cloud_dataproc_cluster\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_MEAN"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "LINE"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
    
         {
        "title": "SCIO|${var.env_alert}|load_Balancer|Https_LB|Request_count|warn|metric",
        "xyChart": {
		"chartOptions": {
              "mode": "COLOR"
            },
    	"dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"loadbalancing.googleapis.com/https/request_count\" AND resource.type=\"https_lb_rule\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_BAR"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
        {
        "title": "SCIO|${var.env_alert}|cloud_armor|https|request_count|warn|metric",
        "xyChart": {
       "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"networksecurity.googleapis.com/https/request_count\" AND resource.type=\"network_security_policy\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "LINE"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
	  
	  {
        "title": "SCIO|${var.env_alert}|gce|instance|cpu_utilization|warn|metric",
        "xyChart": {
         "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_MEAN"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "LINE"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      },
	  
	  {
        "title": "SCIO|${var.env_alert}|gce|instance|disk_read_bytes|warn|metric",
        "xyChart": {
        "chartOptions": {
              "mode": "COLOR"
            },
          "dataSets": [{
            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"compute.googleapis.com/instance/memory/balloon/ram_used\" AND resource.type=\"gce_instance\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_MAX"
                }
              },
              "unitOverride": "1"
            },
            "plotType": "STACKED_BAR"
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      }
      
       
    ]
  }
}

EOF
}*/




#---------Dashboard Code------------------#
resource "google_monitoring_dashboard" "dashboard" {
 project  = var.mon_project_id
  dashboard_json = <<EOF
{
  "displayName": "SCIO-GCP-Platform",
  "gridLayout": {
    "columns": "2",
    "widgets": [
      {
        "title": "SCIO|${var.env_alert}|storage|GCS|Request_count|warn|metric",
        "xyChart": {
            "chartOptions": {
            "mode": "COLOR"
           },
          "dataSets": [{
              "minAlignmentPeriod": "60s",
                "plotType": "LINE",
                "targetAxis": "Y1",

            "timeSeriesQuery": {
              "timeSeriesFilter": {
                "filter": "metric.type=\"storage.googleapis.com/api/request_count\" AND resource.type=\"gcs_bucket\"",
                "aggregation": {
                  "perSeriesAligner": "ALIGN_RATE"
                }
              },
              "unitOverride": "1"
            }
           
           
            
          }],
          "timeshiftDuration": "0s",
          "yAxis": {
            "label": "y1Axis",
            "scale": "LINEAR"
          }
        }
      }
    ]
  }
}

EOF
} 


