/*******************************************************
Adding monitoring alert policy for Project - Sent_bytes_count (Storage)
********************************************************/
module "mon-storage-alert-policy" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"

  display_name          = "SCIO|${var.env_alert}|storage|GCS|Sent_bytes_count|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
    "GCS Bucket - Sent bytes" = {
      condition_threshold = {
        filter                          = "metric.type=\"storage.googleapis.com/network/sent_bytes_count\" AND resource.type=\"gcs_bucket\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "46000"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "300s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "storage_sent_bytes_count" }
}

/*******************************************************
Adding monitoring alert policy for Project - Topic byte cost (pub/sub)
********************************************************/
module "mon-pub-sub-alert-policy" {
  source = "git::https://github.com/yarraradha/alert-mon-module.git"

  display_name          = "SCIO|${var.env_alert}|pubsub|topic|Topic_bytes_cost|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
    "Topic_byte_cost" = {
      condition_threshold = {
        filter                          = "metric.type=\"pubsub.googleapis.com/topic/byte_cost\" AND resource.type=\"pubsub_topic\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "518000"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "60s"
        aggregations_per_series_aligner = "ALIGN_MEAN"
        trigger_enabled                 = "true"
        trigger_count                   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "pubsub_topic_byte_cost" }
}

/*******************************************************
Adding monitoring alert policy for Project -  Publish requests (Pub/Sub)
********************************************************/

module "mon-pubsub-topic-alert-policy" {
  source                = "git::https://github.com/yarraradha/alert-mon-module.git"
  display_name          = "SCIO|${var.env_alert}|pubsub|topic|Publish_requests|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
    "Cloud Pub/Sub Topic - Publish message size" = {
      condition_threshold = {
        filter                          = "metric.type=\"pubsub.googleapis.com/topic/send_request_count\" AND resource.type=\"pubsub_topic\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "10"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "60s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "publish_requests" }
}

/*******************************************************
Adding monitoring alert policy for Project - Disk read bytes (Instance)
********************************************************/

module "mon-instance-alert-policy" {
  source = "git::https://github.com/yarraradha/alert-mon-module.git"
  display_name          = "SCIO|${var.env_alert}|gce|Instance|Disk_read_bytes|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
    "VM Instance-Disk read bytes" = {
      condition_threshold = {
        filter                          = "metric.type=\"compute.googleapis.com/instance/disk/read_bytes_count\" AND resource.type=\"gce_instance\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "1500000"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "300s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "instance_disk_read_bytes" }
}

/*******************************************************
Adding monitoring alert policy for Project - Disk write bytes (Instance)
********************************************************/

module "mon-vm-instance-alert-policy" {
  source                = "git::https://github.com/yarraradha/alert-mon-module.git"
  display_name          = "SCIO|${var.env_alert}|gce|Instance|Disk_write_bytes|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
    "VM Instance-Disk write bytes" = {
      condition_threshold = {
        filter                          = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\" AND resource.type=\"gce_instance\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "1500000"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "300s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "instance_disk_write_bytes" }
}

/*******************************************************
Adding monitoring alert policy for Project - Disk write byte counts (subnet)
********************************************************/

module "mon-subnet-alert-policy" {
  source                = "git::https://github.com/yarraradha/alert-mon-module.git"
  display_name          = "SCIO|${var.env_alert}|gce|subnet|Disk_write_bytes|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
    "Subnetwork - Predicted Max VPC Flow Logs Count" = {
      condition_threshold = {
        filter                          = "metric.type=\"networking.googleapis.com/vpc_flow/predicted_max_vpc_flow_logs_count\" AND resource.type=\"gce_subnetwork\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "200"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "60s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "subnet_disk_write_bytes_count" }

}

/*******************************************************
Adding monitoring alert policy for Project - Dropped packets (Firewall)
********************************************************/

module "mon-firewall-alert-policy" {
  source = "git::https://github.com/yarraradha/alert-mon-module.git"
  display_name          = "SCIO|${var.env_alert}|gce|Firewall|Dropped_packets|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
    "VM Instance - Dropped packets" = {
      condition_threshold = {
        filter                          = "metric.type=\"compute.googleapis.com/firewall/dropped_packets_count\" AND resource.type=\"gce_instance\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "100"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "300s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "firewall_dropped_packets" }
}

/*******************************************************
Adding monitoring alert policy for Project -  Failed operations (Cloud Dataproc Cluster)
********************************************************/

module "mon-dataproc-alert-policy" {
  source = "git::https://github.com/yarraradha/alert-mon-module.git"
  display_name          = "SCIO|${var.env_alert}|dataproc|cluster|Failed_operations|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
    "Cloud Dataproc Cluster - Failed operations" = {
      condition_threshold = {
        filter                          = "metric.type=\"dataproc.googleapis.com/cluster/operation/failed_count\" AND resource.type=\"cloud_dataproc_cluster\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "10"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "300s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "dataproc_failed_operations" }
}


/*******************************************************
Adding monitoring alert policy for Project -  Object count (storage) 
********************************************************/
module "mon-storage-object-count-alert-policy" {
source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name              = "SCIO|${var.env_alert}|storage|GCS|Object_count|warn|metric"
  combiner                  = "OR"
   project_id               = var.mon_project_id
   notification_channels = []
   conditions = {
      "GCS Bucket - Object count"          = {
      condition_threshold                  = {
      duration                             = "60s"
      filter                               = "metric.type=\"storage.googleapis.com/storage/total_byte_seconds\" AND resource.type=\"gcs_bucket\""
      comparison                           = "COMPARISON_GT"
      threshold_value                      = "10"
      aggregations_enabled                 = "true"
      aggregations_alignment_period       = "300s"
      aggregations_per_series_aligner     = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
    }
   }
  }
  user_labels = { env = "${var.env}", purpose = "storage_object_count" }
}

/*******************************************************
Adding monitoring alert policy for Project - Request_count  (Storage)
********************************************************/
module "mon-storage-request-count-alert-policy" {
source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name            = "SCIO|${var.env_alert}|storage|GCS|Request_count|warn|metric"
  combiner                = "OR"
  project_id             = var.mon_project_id
  notification_channels = []
  conditions = {
     "GCS Bucket - Request count"        = {
      condition_threshold                = {
      filter                             = "metric.type=\"storage.googleapis.com/api/request_count\" AND resource.type=\"gcs_bucket\""
      duration                           = "60s"
      comparison                         = "COMPARISON_GT"
      threshold_value                    = "10"
      aggregations_enabled               = "true"
       aggregations_alignment_period     = "300s"
       aggregations_per_series_aligner   = "ALIGN_MEAN"
       trigger_enabled = "true"
       trigger_count   = "1"
     }
   }
  }
  user_labels = { env = "${var.env}", purpose = "storage_request_count" }
}

/*******************************************************
Adding monitoring alert policy for Project - Received bytes (Storage)
********************************************************/
module "mon-storage-received-bytes-alert-policy" {
source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name            = "SCIO|${var.env_alert}|storage|GCS|Received_bytes|warn|metric"
  combiner                = "OR"
   project_id             = var.mon_project_id
  notification_channels   = []
  conditions = {
     "GCS Bucket - Received bytes" = {
      condition_threshold = {
      filter                                  = "metric.type=\"storage.googleapis.com/network/received_bytes_count\" AND resource.type=\"gcs_bucket\""
      duration                                = "60s"
      comparison                              = "COMPARISON_GT"
      threshold_value                         = "46000"
      aggregations_enabled                    = "true"
       aggregations_alignment_period          = "300s"
       aggregations_per_series_aligner        = "ALIGN_MEAN"
       trigger_enabled                        = "true"
       trigger_count                          = "1"
    }
   }
  }
  user_labels = { env = "${var.env}", purpose = "storage_received_bytes" }
}

/*******************************************************
Adding monitoring alert policy for Project - HDFS DataNodes(DataProc)
********************************************************/
module "mon-dataproc-hdfs-datanodes-alert-policy" {
source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name                    = "SCIO|${var.env_alert}|Dataproc|Cluster|HDFS_DataNodes|warn|metric"
  combiner                        = "OR"
   project_id                     = var.mon_project_id
  notification_channels           = []
  conditions  = {
     "Cloud Dataproc Cluster - HDFS DataNodes" = {
      condition_threshold = {
      filter                              = "metric.type=\"dataproc.googleapis.com/cluster/hdfs/datanodes\" AND resource.type=\"cloud_dataproc_cluster\""
      duration                            = "60s"
      comparison                          = "COMPARISON_GT"
      threshold_value                     = "2"
      aggregations_enabled                = "true"
      aggregations_alignment_period       = "300s"
      aggregations_per_series_aligner     = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
    }
   }
  }
  user_labels = { env = "${var.env}", purpose = "dataproc_cluster_hdfs_datanodes" }
}

/*******************************************************
Adding monitoring alert policy for Project - HDFS storage utilization(DataProc)
********************************************************/
module "mon-dataproc-hdfs-storage-alert-policy" {
source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name                  = "SCIO|${var.env_alert}|Dataproc|Cluster|HDFS_storage_utilization|warn|metric"
  combiner                      = "OR"
   project_id                   = var.mon_project_id
  notification_channels         = []
  conditions = {
     "Cloud Dataproc Cluster - HDFS storage utilization" = {
      condition_threshold = {
      filter                              = "metric.type=\"dataproc.googleapis.com/cluster/hdfs/storage_utilization\" AND resource.type=\"cloud_dataproc_cluster\""
      duration                            = "60s"
      comparison                          = "COMPARISON_GT"
      threshold_value                     = "80"
      aggregations_enabled                = "true"
      aggregations_alignment_period      = "300s"
      aggregations_per_series_aligner    = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
    }
   }
  }
  user_labels = { env = "${var.env}", purpose = "dataproc_cluster_hdfs_storage_utilization" }
}

/*******************************************************
Adding monitoring alert policy for Project - HDFS capacity(DataProc)
********************************************************/
module "mon-dataproc-hdfs-capacity-alert-policy" {
source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name          = "SCIO|${var.env_alert}|Dataproc|Cluster|HDFS_capacity|warn|metric"
  combiner              = "OR"
   project_id           = var.mon_project_id
  notification_channels = []
  conditions = {
     "Cloud Dataproc Cluster - HDFS capacity" = {
      condition_threshold = {
      filter                             = "metric.type=\"dataproc.googleapis.com/cluster/hdfs/storage_capacity\" AND resource.type=\"cloud_dataproc_cluster\""
      duration                           = "60s"
      comparison                         = "COMPARISON_GT"
      threshold_value                    = "80"
      aggregations_enabled               = "true"
       aggregations_alignment_period     = "300s"
       aggregations_per_series_aligner   = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
   }
   }
  }
  user_labels = { env = "${var.env}", purpose = "dataproc_cluster_hdfs_capacity" }
}

/*******************************************************
Adding monitoring alert policy for Project - Backend Request Count (Load Balancer )
********************************************************/
module "mon-https-lb-alert-policy" {
  source = "git::https://github.com/yarraradha/alert-mon-module.git"

  display_name          = "SCIO|${var.env_alert}|load_Balancer|Https_LB|Backend_Request_Count|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
     "Google Cloud HTTP/S Load Balancing Rule - Backend Request Count" = {
      condition_threshold = {
        filter                          = "metric.type=\"loadbalancing.googleapis.com/https/backend_request_bytes_count\" AND resource.type=\"https_lb_rule\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "10"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "300s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "loadbalancer_backend_request_count" }
}

/*******************************************************
Adding monitoring alert policy for Project - Request count (Load Balancer )
********************************************************/
module "mon-loadbalancer-alert-policy" {
  source = "git::https://github.com/yarraradha/alert-mon-module.git"

  display_name          = "SCIO|${var.env_alert}|load_Balancer|Https_LB|Request_count|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
     "Google Cloud HTTP/S Load Balancing Rule - Request count" = {
      condition_threshold = {
        filter                          = "metric.type=\"loadbalancing.googleapis.com/https/request_count\" AND resource.type=\"https_lb_rule\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "10"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "300s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "loadbalancer_request_count" }
}

/*******************************************************
Adding monitoring alert policy for Project - VM Firewall Hit Count(VM)
********************************************************/
module "mon-vm-alert-policy" {
  source = "git::https://github.com/yarraradha/alert-mon-module.git"
  display_name          = "SCIO|${var.env_alert}|VM|VM_Firewall|VM_Firewall_Hit Count|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
     "VM Instance - VM Firewall Hit Counts" = {
      condition_threshold = {
        filter                          = "metric.type=\"firewallinsights.googleapis.com/vm/firewall_hit_count\" AND resource.type=\"gce_instance\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "2"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "300s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "vm_firewall_hit_count" }
}

/*******************************************************
Adding monitoring alert policy for Project - Topic updates(PubSub)
********************************************************/
module "mon-pubsub-topic-update-alert-policy" {
  source = "git::https://github.com/yarraradha/alert-mon-module.git"

  display_name          = "SCIO|${var.env_alert}|pubsub|topic|topic_updates|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
     "Cloud Pub/Sub Topic - Topic updates" = {
      condition_threshold = {
        filter                          = "metric.type=\"pubsub.googleapis.com/topic/config_updates_count\" AND resource.type=\"pubsub_topic\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "10"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "300s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "pubsub_topic_updates" }
}

/*******************************************************
Adding monitoring alert policy for Project - unacked messages by region (pubsub)
********************************************************/
module "mon-pubsub-unacked-messages-alert-policy" {
  source = "git::https://github.com/yarraradha/alert-mon-module.git"

  display_name          = "SCIO|${var.env_alert}|pubsub|topic|unacked_messages_by_region|warn|metric"
  combiner              = "OR"
  project_id            = var.mon_project_id
  notification_channels = []
  conditions = {
     "Cloud Pub/Sub Topic - Unacked messages by region"  = {
      condition_threshold = {
        filter                          = "metric.type=\"pubsub.googleapis.com/topic/num_unacked_messages_by_region\" AND resource.type=\"pubsub_topic\""
        duration                        = "60s"
        comparison                      = "COMPARISON_GT"
        threshold_value                 = "5"
        aggregations_enabled            = "true"
        aggregations_alignment_period   = "300s"
        aggregations_per_series_aligner = "ALIGN_MEAN"

        trigger_enabled = "true"
        trigger_count   = "1"
      }
    }
  }
  user_labels = { env = "${var.env}", purpose = "pubsub_unacked_messages_by_region" }
}

/*******************************************************
Adding monitoring alert policy for Project - Connected Clients (Firestore)
********************************************************/

 module "mon-firestore-connected-clients" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name                 = "SCIO|${var.env_alert}|firestore|network|connected_clients|warn|metric"
  combiner                     = "OR"
  project_id                   = var.mon_project_id
  notification_channels        = []
  conditions = {
    "Firestore Instance - Connected Clients" = {
    condition_threshold = {
      filter                           = "metric.type=\"firestore.googleapis.com/network/active_connections\" AND resource.type=\"firestore_instance\""
      duration                         = "60s"
      comparison                       = "COMPARISON_GT"
      threshold_value                  = "5"
      aggregations_enabled             = "true"
      aggregations_alignment_period    = "300s"
      aggregations_per_series_aligner  = "ALIGN_MEAN"

       trigger_enabled                 = "true"
       trigger_count                   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "firestore_connected_clients" }
}

/*******************************************************
Adding monitoring alert policy for Project - Snapshot Listeners (Firestore) 
********************************************************/

 module "mon-firestore-snapshot_listeners" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"

  display_name                = "SCIO|${var.env_alert}|firestore|network|snapshot_listeners|warn|metric"
  combiner                    = "OR"
  project_id                  = var.mon_project_id
  notification_channels       = []
  conditions = {
    "Firestore Instance - Snapshot Listeners" = {
    condition_threshold = {
      filter                            = "metric.type=\"firestore.googleapis.com/network/snapshot_listeners\" AND resource.type=\"firestore_instance\""
      duration                          = "60s"
      comparison                        = "COMPARISON_GT"
      threshold_value                   = "50"
      aggregations_enabled              = "true"
      aggregations_alignment_period     = "300s"
      aggregations_per_series_aligner   = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "firestore_snapshot_listeners" }
}


/*******************************************************
Adding monitoring alert policy for Project - Document-Deletes (Firestore) 
********************************************************/

 module "mon-firestore-document-deletes" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name               = "SCIO|${var.env_alert}|firestore|document|document_deletes|warn|metric"
  combiner                   = "OR"
  project_id                 = var.mon_project_id
  notification_channels      = []
  conditions     = {
    "Firestore Instance - Document Deletes" = {
     condition_threshold = {
      filter                               = "metric.type=\"firestore.googleapis.com/document/delete_count\" AND resource.type=\"firestore_instance\""
      duration                             = "60s"
      comparison                           = "COMPARISON_GT"
      threshold_value                      = "10"
      aggregations_enabled                 = "true"
      aggregations_alignment_period        = "300s"
      aggregations_per_series_aligner      = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "firestore_document_deletes" }
}

/*******************************************************
Adding monitoring alert policy for Project - Document-Reads (Firestore) 
********************************************************/

module "mon-firestore-document-reads" {
source = "git::https://github.com/yarraradha/alert-mon-module.git"
  display_name                   = "SCIO|${var.env_alert}|firestore|document|document_reads|warn|metric"
  combiner                       = "OR"
  project_id                     = var.mon_project_id
  notification_channels          = []
  conditions = {
    "Firestore Instance - Document Reads" = {
    condition_threshold = {
      filter                           = "metric.type=\"firestore.googleapis.com/document/read_count\" AND resource.type=\"firestore_instance\""
      duration                         = "60s"
      comparison                       = "COMPARISON_GT"
      threshold_value                  = "25"
      aggregations_enabled             = "true"
      aggregations_alignment_period    = "300s"
      aggregations_per_series_aligner  = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "firestore_document_reads" }
}

/*******************************************************
Adding monitoring alert policy for Project - Document-Writes (Firestore)   
********************************************************/

 module "mon-firestore-document-writes" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name                 = "SCIO|${var.env_alert}|firestore|document|document_writes|warn|metric"
  combiner                     = "OR"
  project_id                   = var.mon_project_id
  notification_channels = []
  conditions = {
    "Firestore Instance - Document Writes" = {
    condition_threshold = {
      filter                            = "metric.type=\"firestore.googleapis.com/document/write_count\" AND resource.type=\"firestore_instance\""
      duration                          = "60s"
      comparison                        = "COMPARISON_GT"
      threshold_value                   = "25"
      aggregations_enabled              = "true"
      aggregations_alignment_period     = "300s"
      aggregations_per_series_aligner   = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "firestore_document_writes" }
}

/******************************************************
Adding monitoring alert policy for Project - TTL-deletioncount (Firestore) -  
********************************************************/

 module "mon-firestore-ttl-deletion-count" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name                 = "SCIO|${var.env_alert}|firestore|document|ttl_deletion_count|warn|metric"
  combiner                     = "OR"
  project_id                   = var.mon_project_id
  notification_channels = []
  conditions = {
    "Firestore Instance - TTL deletion count" = {
    condition_threshold = {
      filter                             = "metric.type=\"firestore.googleapis.com/document/ttl_deletion_count\" AND resource.type=\"firestore_instance\""
      duration                           = "60s"
      comparison                         = "COMPARISON_GT"
      threshold_value                    = "10"
      aggregations_enabled               = "true"
      aggregations_alignment_period      = "300s"
      aggregations_per_series_aligner    = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "firestore_ttl_deletion_count" }
}

/*******************************************************
Adding monitoring alert policy for Project - closed-connections-count (Cloud NAT)  
********************************************************/

 module "mon-cloudnat-closed-connections-count" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name                 = "SCIO|${var.env_alert}|cloudnat|nat|closed_connections_count|warn|metric"
  combiner                     = "OR"
  project_id                   = var.mon_project_id
  notification_channels = []
  conditions = {
    "Cloud NAT Gateway - Closed connections count" = {
    condition_threshold = {
      filter                             = "metric.type=\"router.googleapis.com/nat/closed_connections_count\" AND resource.type=\"nat_gateway\""
      duration                           = "60s"
      comparison                         = "COMPARISON_GT"
      threshold_value                    = "5"
      aggregations_enabled               = "true"
      aggregations_alignment_period      = "300s"
      aggregations_per_series_aligner    = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "cloudnat_closed_connections_count" }
  
 }
 
/*******************************************************
Adding monitoring alert policy for Project - new-connections-count (Cloud NAT)  
********************************************************/

 module "mon-cloudnat-new-connections-count" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"
  display_name                 = "SCIO|${var.env_alert}|cloudnat|nat|new_connections_count|warn|metric"
  combiner                     = "OR"
  project_id                   = var.mon_project_id
  notification_channels = []
  conditions = {
    "Cloud NAT Gateway - New connections count" = {
    condition_threshold = {
      filter                             = "metric.type=\"router.googleapis.com/nat/new_connections_count\" AND resource.type=\"nat_gateway\""
      duration                           = "60s"
      comparison                         = "COMPARISON_GT"
      threshold_value                    = "10"
      aggregations_enabled               = "true"
      aggregations_alignment_period      = "300s"
      aggregations_per_series_aligner    = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "cloudnat_new_connections_count" }
  
 }
 
 
/*******************************************************
Adding monitoring alert policy for Project - open-connections (Cloud NAT)  
********************************************************/

 module "mon-cloudnat-open-connections" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name                 = "SCIO|${var.env_alert}|cloudnat|nat|open_connections|warn|metric"
  combiner                     = "OR"
  project_id                   = var.mon_project_id
  notification_channels = []
  conditions = {
     "Cloud NAT Gateway - Open connections" = {
    condition_threshold = {
      filter                             = "metric.type=\"router.googleapis.com/nat/open_connections\" AND resource.type=\"nat_gateway\""
      duration                           = "60s"
      comparison                         = "COMPARISON_GT"
      threshold_value                    = "10"
      aggregations_enabled               = "true"
      aggregations_alignment_period      = "300s"
      aggregations_per_series_aligner    = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "cloudnat_open_connections" }
  
 }
 
/*******************************************************
Adding monitoring alert policy for Project - port-usage (Cloud NAT)  
********************************************************/

 module "mon-cloudnat-port-usage" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"
  display_name                 = "SCIO|${var.env_alert}|cloudnat|nat|port_usage|warn|metric"
  combiner                     = "OR"
  project_id                   = var.mon_project_id
  notification_channels = []
  conditions = {
     "Cloud NAT Gateway - Port usage" = {
    condition_threshold = {
      filter                             = "metric.type=\"router.googleapis.com/nat/port_usage\" AND resource.type=\"nat_gateway\""
      duration                           = "60s"
      comparison                         = "COMPARISON_GT"
      threshold_value                    = "70"
      aggregations_enabled               = "true"
      aggregations_alignment_period      = "300s"
      aggregations_per_series_aligner    = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "cloudnat_port_usage" }
  
 }
 
/*******************************************************
Adding monitoring alert policy for Project - sent-routes-count (Cloud Router)  
********************************************************/

 module "mon-cloudrouter-sent-routes-count" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name                 = "SCIO|${var.env_alert}|gce_router|router|sent_routes_count|warn|metric"
  combiner                     = "OR"
  project_id                   = var.mon_project_id
  notification_channels = []
  conditions = {
     "Cloud Router - Sent routes count" = {
    condition_threshold = {
      filter                             = "metric.type=\"router.googleapis.com/sent_routes_count\" AND resource.type=\"gce_router\""
      duration                           = "60s"
      comparison                         = "COMPARISON_GT"
      threshold_value                    = "10"
      aggregations_enabled               = "true"
      aggregations_alignment_period      = "300s"
      aggregations_per_series_aligner    = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "cloudrouter_sent_routes_count" }
  
 }
 
/*******************************************************
Adding monitoring alert policy for Project - received-routes-count (Cloud Router)  
********************************************************/

 module "mon-cloudrouter-received-routes-count" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"

  display_name                 = "SCIO|${var.env_alert}|gce_router|router|received_routes_count|warn|metric"
  combiner                     = "OR"
  project_id                   = var.mon_project_id
  notification_channels = []
  conditions = {
     "Cloud Router - Received routes count" = {
    condition_threshold = {
      filter                             = "metric.type=\"router.googleapis.com/best_received_routes_count\" AND resource.type=\"gce_router\""
      duration                           = "60s"
      comparison                         = "COMPARISON_GT"
      threshold_value                    = "20"
      aggregations_enabled               = "true"
      aggregations_alignment_period      = "300s"
      aggregations_per_series_aligner    = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "cloudrouter_received_routes_count" }
  
 }
 
/*******************************************************
Adding monitoring alert policy for Project - request-count (Cloud Armor)  
********************************************************/

 module "mon-cloudarmor-request-count" {
 source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name                 = "SCIO|${var.env_alert}|cloud_armor|https|request_count|warn|metric"
  combiner                     = "OR"
  project_id                   = var.mon_project_id
  notification_channels = []
  conditions = {
     "Network Security Policy - Request count" = {
    condition_threshold = {
      filter                             = "metric.type=\"networksecurity.googleapis.com/https/request_count\" AND resource.type=\"network_security_policy\""
      duration                           = "60s"
      comparison                         = "COMPARISON_GT"
      threshold_value                    = "50"
      aggregations_enabled               = "true"
      aggregations_alignment_period      = "300s"
      aggregations_per_series_aligner    = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "cloudarmor_request_count" }
  
 }
 
 /**************************************************************************
Adding monitoring alert policy for Project - VM Instance - CPU utilization (Instance) 
**************************************************************************/
module "monitoring-cpu-utilization" {
source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name     = "SCIO|${var.env_alert}|gce|instance|cpu_utilization|warn|metric"
  combiner         = "OR"
  project_id       = var.mon_project_id
  notification_channels = []
  conditions = {
    "VM Instance - CPU utilization" = {
    condition_threshold = {
      filter                           = "metric.type=\"compute.googleapis.com/instance/cpu/utilization\" AND resource.type=\"gce_instance\""
      duration                         = "60s"
      comparison                       = "COMPARISON_GT"
      threshold_value                  = "70"
      aggregations_enabled             = "true"
       aggregations_alignment_period   = "300s"
       aggregations_per_series_aligner = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "instance_cpu_utilization" }
  
}


/**************************************************************************
Adding monitoring alert policy for Project - VM Instance - Memory-Usage (Instance) 
**************************************************************************/
module "monitoring-memory-usage" {
source = "git::https://github.com/yarraradha/alert-mon-module.git"
  
  display_name     = "SCIO|${var.env_alert}|gce|instance|memory_usage|warn|metric"
  combiner         = "OR"
  project_id       = var.mon_project_id
  notification_channels = []
  conditions = {
    "VM Instance - VM Memory Used" = {
    condition_threshold = {
      filter                           = "metric.type=\"compute.googleapis.com/instance/memory/balloon/ram_used\" AND resource.type=\"gce_instance\""
      duration                         = "60s"
      comparison                       = "COMPARISON_GT"
      threshold_value                  = "15000000000" /**15GB**/
      aggregations_enabled             = "true"
       aggregations_alignment_period   = "300s"
       aggregations_per_series_aligner = "ALIGN_MEAN"

       trigger_enabled = "true"
       trigger_count   = "1"
      }
    }
  }

  user_labels = { env = "${var.env}", purpose = "instance_memory_usage" }
  
}
 
 

 


