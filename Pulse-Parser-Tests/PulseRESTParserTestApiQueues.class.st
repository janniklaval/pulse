Class {
	#name : #PulseRESTParserTestApiQueues,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #accessing }
PulseRESTParserTestApiQueues >> data [
	^ '[{
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 65459,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 395,
			"ack_details": {
				"rate": 0
			},
			"ack": 0,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 395,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 0,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": true,
		"auto_delete": false,
		"durable": false,
		"vhost": "/",
		"name": "amq.gen-obbNfBG_5XX6cl6cQqcjqQ",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 0,
			"avg_ingress_rate": 0,
			"avg_egress_rate": 0,
			"avg_ack_ingress_rate": 0,
			"avg_ack_egress_rate": 0
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 6,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 1,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:53:03",
		"memory": 8800
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 1426,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 1426,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 2211027,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 1223,
			"ack_details": {
				"rate": 0
			},
			"ack": 0,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 1101,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 1145,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 78
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "eventsqueue",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 1426,
			"len": 1426,
			"target_ram_count": "infinity",
			"next_seq_id": 1426,
			"avg_ingress_rate": 7.826765014148542,
			"avg_egress_rate": 0,
			"avg_ack_ingress_rate": 0,
			"avg_ack_egress_rate": 0
		},
		"head_message_timestamp": 1542188284,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 1426,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 1426,
		"messages_ram": 1426,
		"garbage_collection": {
			"minor_gcs": 15,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:53:04",
		"memory": 1804928
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 10508,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 2,
			"ack_details": {
				"rate": 0
			},
			"ack": 2,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 2,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 2
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasApplicationRole.module-application-created.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 2,
			"avg_ingress_rate": 0.12610213935748144,
			"avg_egress_rate": 0.12610213935748144,
			"avg_ack_ingress_rate": 0.12610213935748144,
			"avg_ack_egress_rate": 0.12610213935748144
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 7,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:54",
		"memory": 12896
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 18365,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 7,
			"ack_details": {
				"rate": 0
			},
			"ack": 7,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 7,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 7
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasApplicationRole.module-application-deleted.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 7,
			"avg_ingress_rate": 0.5487441638291577,
			"avg_egress_rate": 0.5487441638291577,
			"avg_ack_ingress_rate": 0.5487441638291577,
			"avg_ack_egress_rate": 0.5487441638291577
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 6,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:55",
		"memory": 12864
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 14258,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 5,
			"ack_details": {
				"rate": 0
			},
			"ack": 5,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 5,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 5
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasApplicationRole.module-application-updated.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 5,
			"avg_ingress_rate": 0.46731016404568354,
			"avg_egress_rate": 0.46731016404568354,
			"avg_ack_ingress_rate": 0.46731016404568354,
			"avg_ack_egress_rate": 0.46731016404568354
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 11,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:54",
		"memory": 12896
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 16942,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 6,
			"ack_details": {
				"rate": 0
			},
			"ack": 6,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 6,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 6
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasClientContract.module-client-created.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 6,
			"avg_ingress_rate": 0.5270078053472855,
			"avg_egress_rate": 0.5270078053472855,
			"avg_ack_ingress_rate": 0.5270078053472855,
			"avg_ack_egress_rate": 0.5270078053472855
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 2,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:54",
		"memory": 12864
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 13979,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 4,
			"ack_details": {
				"rate": 0
			},
			"ack": 4,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 4,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 4
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasClientContract.module-client-deleted.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 4,
			"avg_ingress_rate": 0.38331669922680944,
			"avg_egress_rate": 0.38331669922680944,
			"avg_ack_ingress_rate": 0.38331669922680944,
			"avg_ack_egress_rate": 0.38331669922680944
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 2,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:54",
		"memory": 12832
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 15536,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 5,
			"ack_details": {
				"rate": 0
			},
			"ack": 5,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 5,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 5
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasClientContract.module-client-updated.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 5,
			"avg_ingress_rate": 0.45237787835937504,
			"avg_egress_rate": 0.45237787835937504,
			"avg_ack_ingress_rate": 0.45237787835937504,
			"avg_ack_egress_rate": 0.45237787835937504
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 2,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:54",
		"memory": 12880
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 11032,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 3,
			"ack_details": {
				"rate": 0
			},
			"ack": 3,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 3,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 3
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasClientContract.module-contract-created.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 3,
			"avg_ingress_rate": 0.3511027155594435,
			"avg_egress_rate": 0.3511027155594435,
			"avg_ack_ingress_rate": 0.3511027155594435,
			"avg_ack_egress_rate": 0.3511027155594435
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 9,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:54",
		"memory": 12864
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 9579,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 2,
			"ack_details": {
				"rate": 0
			},
			"ack": 2,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 2,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 2
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasClientContract.module-contract-deleted.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 2,
			"avg_ingress_rate": 0.24748625304457103,
			"avg_egress_rate": 0.24748625304457103,
			"avg_ack_ingress_rate": 0.24748625304457103,
			"avg_ack_egress_rate": 0.24748625304457103
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 6,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:55",
		"memory": 12864
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 8421,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 1,
			"ack_details": {
				"rate": 0
			},
			"ack": 1,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 1,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 1
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasClientContract.module-contract-updated.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 1,
			"avg_ingress_rate": 0.12584304381770478,
			"avg_egress_rate": 0.12584304381770478,
			"avg_ack_ingress_rate": 0.12584304381770478,
			"avg_ack_egress_rate": 0.12584304381770478
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 5,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:54",
		"memory": 12864
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 25475,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 16,
			"ack_details": {
				"rate": 0
			},
			"ack": 16,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 16,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 16
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasUserAccess.module-profile-created.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 16,
			"avg_ingress_rate": 0.5707002576648805,
			"avg_egress_rate": 0.5707002576648805,
			"avg_ack_ingress_rate": 0.5707002576648805,
			"avg_ack_egress_rate": 0.5707002576648805
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 3,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:56",
		"memory": 12864
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 35667,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 22,
			"ack_details": {
				"rate": 0
			},
			"ack": 22,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 22,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 22
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasUserAccess.module-profile-deleted.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 22,
			"avg_ingress_rate": 0.4953992024168752,
			"avg_egress_rate": 0.4953992024168752,
			"avg_ack_ingress_rate": 0.4953992024168752,
			"avg_ack_egress_rate": 0.4953992024168752
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 1,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:58",
		"memory": 12880
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 37506,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 23,
			"ack_details": {
				"rate": 0
			},
			"ack": 23,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 23,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 23
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasUserAccess.module-profile-updated.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 23,
			"avg_ingress_rate": 0.5838338863424696,
			"avg_egress_rate": 0.5838338863424696,
			"avg_ack_ingress_rate": 0.5838338863424696,
			"avg_ack_egress_rate": 0.5838338863424696
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 4,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:58",
		"memory": 12880
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 26438,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 17,
			"ack_details": {
				"rate": 0
			},
			"ack": 17,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 17,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 17
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasUserAccess.module-user-created.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 17,
			"avg_ingress_rate": 0.1903662947656001,
			"avg_egress_rate": 0.1903662947656001,
			"avg_ack_ingress_rate": 0.1903662947656001,
			"avg_ack_egress_rate": 0.1903662947656001
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 3,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:53:05",
		"memory": 12832
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 27231,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 18,
			"ack_details": {
				"rate": 0
			},
			"ack": 18,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 0,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 18,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 18
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "pubsub.default.consoleSaasUserAccess.module-user-updated.subscribe",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 18,
			"avg_ingress_rate": 0.5357126086899777,
			"avg_egress_rate": 0.5357126086899777,
			"avg_ack_ingress_rate": 0.5357126086899777,
			"avg_ack_egress_rate": 0.5357126086899777
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 4,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 13:52:56",
		"memory": 12864
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 1,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 1,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 74881,
		"message_stats": {
			"deliver_get_details": {
				"rate": 0
			},
			"deliver_get": 8,
			"ack_details": {
				"rate": 0
			},
			"ack": 0,
			"redeliver_details": {
				"rate": 0
			},
			"redeliver": 7,
			"deliver_no_ack_details": {
				"rate": 0
			},
			"deliver_no_ack": 0,
			"deliver_details": {
				"rate": 0
			},
			"deliver": 8,
			"get_no_ack_details": {
				"rate": 0
			},
			"get_no_ack": 0,
			"get_details": {
				"rate": 0
			},
			"get": 0,
			"publish_details": {
				"rate": 0
			},
			"publish": 1
		},
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "smalltalk",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 1,
			"len": 1,
			"target_ram_count": "infinity",
			"next_seq_id": 1,
			"avg_ingress_rate": 0.0036466847680032004,
			"avg_egress_rate": 7.371677006852973e-16,
			"avg_ack_ingress_rate": 7.371677006852973e-16,
			"avg_ack_egress_rate": 0
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 10,
		"message_bytes_ram": 10,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 10,
		"message_bytes": 10,
		"messages_persistent": 1,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 1,
		"messages_ram": 1,
		"garbage_collection": {
			"minor_gcs": 19,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 11:12:05",
		"memory": 15248
	}, {
		"messages_details": {
			"rate": 0
		},
		"messages": 0,
		"messages_unacknowledged_details": {
			"rate": 0
		},
		"messages_unacknowledged": 0,
		"messages_ready_details": {
			"rate": 0
		},
		"messages_ready": 0,
		"reductions_details": {
			"rate": 0
		},
		"reductions": 2992,
		"node": "rabbit@fceed0d94b94",
		"arguments": {},
		"exclusive": false,
		"auto_delete": false,
		"durable": true,
		"vhost": "/",
		"name": "testcreatequeue",
		"message_bytes_paged_out": 0,
		"messages_paged_out": 0,
		"backing_queue_status": {
			"mode": "default",
			"q1": 0,
			"q2": 0,
			"delta": [
				"delta",
				"undefined",
				0,
				0,
				"undefined"
			],
			"q3": 0,
			"q4": 0,
			"len": 0,
			"target_ram_count": "infinity",
			"next_seq_id": 0,
			"avg_ingress_rate": 0,
			"avg_egress_rate": 0,
			"avg_ack_ingress_rate": 0,
			"avg_ack_egress_rate": 0
		},
		"head_message_timestamp": null,
		"message_bytes_persistent": 0,
		"message_bytes_ram": 0,
		"message_bytes_unacknowledged": 0,
		"message_bytes_ready": 0,
		"message_bytes": 0,
		"messages_persistent": 0,
		"messages_unacknowledged_ram": 0,
		"messages_ready_ram": 0,
		"messages_ram": 0,
		"garbage_collection": {
			"minor_gcs": 3,
			"fullsweep_after": 65535,
			"min_heap_size": 233,
			"min_bin_vheap_size": 46422,
			"max_heap_size": 0
		},
		"state": "running",
		"recoverable_slaves": null,
		"consumers": 0,
		"exclusive_consumer_tag": null,
		"policy": null,
		"consumer_utilisation": null,
		"idle_since": "2018-11-15 11:12:05",
		"memory": 10528
	}
]'.
]

{ #category : #initialization }
PulseRESTParserTestApiQueues >> setUp [
	| logP |
	model := PulseModel new.
	model name: 'test'.
	logP := PulseRESTParserApiQueues newOn: 'test'.
	logP populate: model withJson: self data.

	
	
]

{ #category : #'testing-double-insert' }
PulseRESTParserTestApiQueues >> testExistingPopulate [

	| t1 t2 vh node logP |
	self assert: model size = 21.
	self assert: model allPulseQueues size = 18.
	self assert: (model allPulseQueues anySatisfy: [:e | e name = 'smalltalk']).
	self assert: (model allPulseQueues anySatisfy: [:e | e name = 'amq.gen-obbNfBG_5XX6cl6cQqcjqQ']).
	
	t1 := model allPulseQueues detect: [:e | e name = 'smalltalk'].
	t2 := model allPulseQueues detect: [:e | e name = 'amq.gen-obbNfBG_5XX6cl6cQqcjqQ'].

	self assert: t1 autoDelete = false.
	self assert: t2 autoDelete = false.
	
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (t1 vhost = vh).
	self assert: (t2 vhost = vh).
	self assert: (vh queues anySatisfy: [ :e | e =t1 ]).
	self assert: (vh queues anySatisfy: [ :e | e =t2 ]).
	self assert: (vh queues size = 18).	
		
	node := (model allPulseNodes detect: [:e | e name = 'rabbit@fceed0d94b94']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
		
	self assert: t1 durability = true.
	self assert: t2 durability = false.
	
	
	self assert: t2 pulseState name = 'running'.
	self assert: (t2 pulseState queues anySatisfy: [:e | e = t2 ]).
	self assert: t2 exclusive = true.
	self assert: t2 idleSince = '2018-11-15 13:53:03'.
	
	self assert: t1 pulseState name = 'running'.
	self assert: (t2 pulseState queues anySatisfy: [:e | e = t2 ]).
	self assert: t1 exclusive = false.
	self assert: t1 idleSince = '2018-11-15 11:12:05'.
	
	
	self assert: model size = 21.
	
	logP := PulseRESTParserApiQueues new.
	logP sourceName: 'test2'.
	logP populate: model withJson: self data.
	
	self assert: model size = 21.
	self assert: model allPulseQueues size = 18.
	self assert: (model allPulseQueues anySatisfy: [:e | e name = 'smalltalk']).
	self assert: (model allPulseQueues anySatisfy: [:e | e name = 'amq.gen-obbNfBG_5XX6cl6cQqcjqQ']).
	
	t1 := model allPulseQueues detect: [:e | e name = 'smalltalk'].
	t2 := model allPulseQueues detect: [:e | e name = 'amq.gen-obbNfBG_5XX6cl6cQqcjqQ'].

	self assert: t1 autoDelete = false.
	self assert: t2 autoDelete = false.
	
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (t1 vhost = vh).
	self assert: (t2 vhost = vh).
	self assert: (vh queues anySatisfy: [ :e | e =t1 ]).
	self assert: (vh queues anySatisfy: [ :e | e =t2 ]).
	self assert: (vh queues size = 18).	
		
	node := (model allPulseNodes detect: [:e | e name = 'rabbit@fceed0d94b94']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
		
	self assert: t1 durability = true.
	self assert: t2 durability = false.
	
	
	self assert: t2 pulseState name = 'running'.
	self assert: (t2 pulseState queues anySatisfy: [:e | e = t2 ]).
	self assert: t2 exclusive = true.
	self assert: t2 idleSince = '2018-11-15 13:53:03'.
	
	self assert: t1 pulseState name = 'running'.
	self assert: (t2 pulseState queues anySatisfy: [:e | e = t2 ]).
	self assert: t1 exclusive = false.
	self assert: t1 idleSince = '2018-11-15 11:12:05'.
	
]

{ #category : #'testing - simple' }
PulseRESTParserTestApiQueues >> testPopulate [

	| t1 t2 vh node |
	self assert: model allPulseQueues size = 18.
	self assert: (model allPulseQueues anySatisfy: [:e | e name = 'smalltalk']).
	self assert: (model allPulseQueues anySatisfy: [:e | e name = 'amq.gen-obbNfBG_5XX6cl6cQqcjqQ']).
	
	t1 := model allPulseQueues detect: [:e | e name = 'smalltalk'].
	t2 := model allPulseQueues detect: [:e | e name = 'amq.gen-obbNfBG_5XX6cl6cQqcjqQ'].

	self assert: t1 autoDelete = false.
	self assert: t2 autoDelete = false.
	
	vh := (model allPulseVHosts detect: [:e | e name = '/']).
	self assert: (t1 vhost = vh).
	self assert: (t2 vhost = vh).
	self assert: (vh queues anySatisfy: [ :e | e =t1 ]).
	self assert: (vh queues anySatisfy: [ :e | e =t2 ]).
	self assert: (vh queues size = 18).	
		
	node := (model allPulseNodes detect: [:e | e name = 'rabbit@fceed0d94b94']).
	self assert: (vh node = node).
	self assert: (node vhosts anySatisfy: [ :e | e =vh ]).
	self assert: node vhosts size = 1.
		
	self assert: t1 durability = true.
	self assert: t2 durability = false.
	
	
	self assert: t2 pulseState pulseState = 'running'.
	self assert: (t2 pulseState queues anySatisfy: [:e | e = t2 ]).
	self assert: t2 exclusive = true.
	self assert: t2 idleSince = '2018-11-15 13:53:03'.
	
	self assert: t1 pulseState pulseState = 'running'.
	self assert: (t2 pulseState queues anySatisfy: [:e | e = t2 ]).
	self assert: t1 exclusive = false.
	self assert: t1 idleSince = '2018-11-15 11:12:05'.
]
