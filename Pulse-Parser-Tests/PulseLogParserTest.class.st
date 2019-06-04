Class {
	#name : #PulseLogParserTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Pulse-Parser-Tests'
}

{ #category : #initialization }
PulseLogParserTest >> data [

	^ '[{
	"timestamp": "2018-06-08 13:45:01:120",
	"type": "published",
	"node": "rabbit@cf39ec4fb77b",
	"connection": "172.17.0.1:35008 -> 172.17.0.2:5672",
	"vhost": "/",
	"user": "guest",
	"channel": 1,
	"exchange": "pubsub.blauthTenant.blAuthCredentials.publish",
	"queue": "none",
	"routed_queues": ["pubsub.blauthTenant.blAuthCredentials.bl-console-saas.subscribe"],
	"routing_keys": ["message"],
	"properties": {
		"app_id": "bl-auth",
		"timestamp": 1528457211,
		"message_id": "7fd640c6-c767-45e9-95f5-90990eb5c677",
		"delivery_mode": 2,
		"headers": {
			"X-ExchangeFormatId": "AVRO",
			"X-TenantId": "default",
			"X-ClientId": "bl-console-saas",
			"X-TopicId": "consoleSaasUserAccess",
			"X-ExchangeFormatSchema": "{\"type\":\"record\",\"name\":\"UserAccessEvent\",\"namespace\":\"com.bl.consolesaas.message.user\",\"fields\":[{\"name\":\"eventType\",\"type\":{\"type\":\"enum\",\"name\":\"UserAccessEventType\",\"symbols\":[\"USER_CREATED\",\"USER_UPDATED\",\"USER_DELETED\",\"PROFILE_CREATED\",\"PROFILE_UPDATED\",\"PROFILE_DELETED\"]}},{\"name\":\"header\",\"type\":{\"type\":\"record\",\"name\":\"EventHeader\",\"namespace\":\"com.bl.consolesaas.message.common\",\"fields\":[{\"name\":\"id\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"64\"},{\"name\":\"version\",\"type\":\"long\"},{\"name\":\"timestamp\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"date_format\":\"yyyy-MM-dd''T''HH:mm:ss.SSS''Z''\",\"max_length\":\"24\"}]}},{\"name\":\"userAccess\",\"type\":{\"type\":\"record\",\"name\":\"UserAccessConsoleSaas\",\"namespace\":\"com.bl.consolesaas.message.user.misc\",\"fields\":[{\"name\":\"user\",\"type\":{\"type\":\"record\",\"name\":\"UserConsoleSaas\",\"fields\":[{\"name\":\"id\",\"type\":\"long\"},{\"name\":\"username\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"oldUsername\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"},{\"name\":\"title\",\"type\":{\"type\":\"enum\",\"name\":\"TitleConsoleSaas\",\"symbols\":[\"MR\",\"MME\",\"MELLE\"]}},{\"name\":\"lastName\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"firstName\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"email\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"password\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"100\"},{\"name\":\"passwordAlgorithm\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"50\"},{\"name\":\"oldEmail\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"},{\"name\":\"phoneNumber\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"30\"},{\"name\":\"type\",\"type\":{\"type\":\"enum\",\"name\":\"UserTypeConsoleSaas\",\"symbols\":[\"STANDARD\",\"TECHNICAL\"]},\"default\":\"USER_STANDARD\"},{\"name\":\"cristalId\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"30\"},{\"name\":\"creationDate\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"date_format\":\"yyyy-MM-dd''T''HH:mm:ss.SSS''Z''\",\"max_length\":\"24\"},{\"name\":\"isValidated\",\"type\":\"boolean\"}]}},{\"name\":\"clients\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"UserClientConsoleSaas\",\"fields\":[{\"name\":\"code\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"designation\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"}]}}},{\"name\":\"profiles\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"ProfileConsoleSaas\",\"fields\":[{\"name\":\"roleCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"100\"},{\"name\":\"applicationCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"clientCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"isValid\",\"type\":\"boolean\"}]}}],\"default\":null}]}}]}"
		}
	},
	"payload": "CEg1ZTEwZTM0YS0xMDgzLTQwNzUtYjkyYS1kNDNjNmZmNzJhODEaMDIwMTgtMDYtMDhUMTE6MjY6NTEuMTM3WgpEYW50aG9ueS5sYWdyZWRlQGJlcmdlci1sZXZyYXVsdC5mcgAADmxhZ3JlZGUOYW50aG9ueTxhZG1pbi50ZXN0QGJlcmdlci1sZXZyYXVsdC5jb20AAAACAAIAMDIwMTgtMDMtMTJUMDk6MTA6MDAuMDAwWgAELkNBSVNTRVNfRUNPTEVTX1RPVUxPVVNFACBNQUlSSUVfREVfTEFCRUdFAAACAhRST0xFX0FETUlOBlBGQSBNQUlSSUVfREVfTEFCRUdFAQA="
}, {
	"timestamp": "2018-06-08 13:45:01:125",
	"type": "received",
	"node": "rabbit@cf39ec4fb77b",
	"connection": "172.17.0.1:35010 -> 172.17.0.2:5672",
	"vhost": "/",
	"user": "guest",
	"channel": 1,
	"exchange": "pubsub.blauthTenant.blAuthCredentials.publish",
	"queue": "pubsub.blauthTenant.blAuthCredentials.bl-console-saas.subscribe",
	"routed_queues": "none",
	"routing_keys": ["message"],
	"properties": {
		"app_id": "bl-auth",
		"timestamp": 1528457211,
		"message_id": "7fd640c6-c767-45e9-95f5-90990eb5c677",
		"delivery_mode": 2,
		"headers": {
			"X-ExchangeFormatId": "AVRO",
			"X-TenantId": "default",
			"X-ClientId": "bl-console-saas",
			"X-TopicId": "consoleSaasUserAccess",
			"X-ExchangeFormatSchema": "{\"type\":\"record\",\"name\":\"UserAccessEvent\",\"namespace\":\"com.bl.consolesaas.message.user\",\"fields\":[{\"name\":\"eventType\",\"type\":{\"type\":\"enum\",\"name\":\"UserAccessEventType\",\"symbols\":[\"USER_CREATED\",\"USER_UPDATED\",\"USER_DELETED\",\"PROFILE_CREATED\",\"PROFILE_UPDATED\",\"PROFILE_DELETED\"]}},{\"name\":\"header\",\"type\":{\"type\":\"record\",\"name\":\"EventHeader\",\"namespace\":\"com.bl.consolesaas.message.common\",\"fields\":[{\"name\":\"id\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"64\"},{\"name\":\"version\",\"type\":\"long\"},{\"name\":\"timestamp\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"date_format\":\"yyyy-MM-dd''T''HH:mm:ss.SSS''Z''\",\"max_length\":\"24\"}]}},{\"name\":\"userAccess\",\"type\":{\"type\":\"record\",\"name\":\"UserAccessConsoleSaas\",\"namespace\":\"com.bl.consolesaas.message.user.misc\",\"fields\":[{\"name\":\"user\",\"type\":{\"type\":\"record\",\"name\":\"UserConsoleSaas\",\"fields\":[{\"name\":\"id\",\"type\":\"long\"},{\"name\":\"username\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"oldUsername\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"},{\"name\":\"title\",\"type\":{\"type\":\"enum\",\"name\":\"TitleConsoleSaas\",\"symbols\":[\"MR\",\"MME\",\"MELLE\"]}},{\"name\":\"lastName\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"firstName\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"email\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"password\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"100\"},{\"name\":\"passwordAlgorithm\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"50\"},{\"name\":\"oldEmail\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"},{\"name\":\"phoneNumber\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"30\"},{\"name\":\"type\",\"type\":{\"type\":\"enum\",\"name\":\"UserTypeConsoleSaas\",\"symbols\":[\"STANDARD\",\"TECHNICAL\"]},\"default\":\"USER_STANDARD\"},{\"name\":\"cristalId\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"30\"},{\"name\":\"creationDate\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"date_format\":\"yyyy-MM-dd''T''HH:mm:ss.SSS''Z''\",\"max_length\":\"24\"},{\"name\":\"isValidated\",\"type\":\"boolean\"}]}},{\"name\":\"clients\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"UserClientConsoleSaas\",\"fields\":[{\"name\":\"code\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"designation\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"}]}}},{\"name\":\"profiles\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"ProfileConsoleSaas\",\"fields\":[{\"name\":\"roleCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"100\"},{\"name\":\"applicationCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"clientCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"isValid\",\"type\":\"boolean\"}]}}],\"default\":null}]}}]}"
		}
	},
	"payload": "CEg1ZTEwZTM0YS0xMDgzLTQwNzUtYjkyYS1kNDNjNmZmNzJhODEaMDIwMTgtMDYtMDhUMTE6MjY6NTEuMTM3WgpEYW50aG9ueS5sYWdyZWRlQGJlcmdlci1sZXZyYXVsdC5mcgAADmxhZ3JlZGUOYW50aG9ueTxhZG1pbi50ZXN0QGJlcmdlci1sZXZyYXVsdC5jb20AAAACAAIAMDIwMTgtMDMtMTJUMDk6MTA6MDAuMDAwWgAELkNBSVNTRVNfRUNPTEVTX1RPVUxPVVNFACBNQUlSSUVfREVfTEFCRUdFAAACAhRST0xFX0FETUlOBlBGQSBNQUlSSUVfREVfTEFCRUdFAQA="
}, {
	"timestamp": "2018-06-08 11:26:51:219",
	"type": "published",
	"node": "rabbit@cf39ec4fb77b",
	"connection": "172.17.0.1:35008 -> 172.17.0.2:5672",
	"vhost": "/",
	"user": "guest",
	"channel": 1,
	"exchange": "pubsub.consoleTenant.consoleSaasUserAccess.publish",
	"queue": "none",
	"routed_queues": ["pubsub.consoleTenant.consoleSaasUserAccess.bl-socle.subscribe", "pubsub.consoleTenant.consoleSaasUserAccess.logger.subscribe", "pubsub.consoleTenant.consoleSaasUserAccess.bl-auth.subscribe"],
	"routing_keys": ["message"],
	"properties": {
		"app_id": "bl-console-saas",
		"timestamp": 1528457211,
		"message_id": "7fd640c6-c767-45e9-95f5-90990eb5c677",
		"delivery_mode": 2,
		"headers": {
			"X-ExchangeFormatId": "AVRO",
			"X-TenantId": "default",
			"X-ClientId": "bl-console-saas",
			"X-TopicId": "consoleSaasUserAccess",
			"X-ExchangeFormatSchema": "{\"type\":\"record\",\"name\":\"UserAccessEvent\",\"namespace\":\"com.bl.consolesaas.message.user\",\"fields\":[{\"name\":\"eventType\",\"type\":{\"type\":\"enum\",\"name\":\"UserAccessEventType\",\"symbols\":[\"USER_CREATED\",\"USER_UPDATED\",\"USER_DELETED\",\"PROFILE_CREATED\",\"PROFILE_UPDATED\",\"PROFILE_DELETED\"]}},{\"name\":\"header\",\"type\":{\"type\":\"record\",\"name\":\"EventHeader\",\"namespace\":\"com.bl.consolesaas.message.common\",\"fields\":[{\"name\":\"id\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"64\"},{\"name\":\"version\",\"type\":\"long\"},{\"name\":\"timestamp\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"date_format\":\"yyyy-MM-dd''T''HH:mm:ss.SSS''Z''\",\"max_length\":\"24\"}]}},{\"name\":\"userAccess\",\"type\":{\"type\":\"record\",\"name\":\"UserAccessConsoleSaas\",\"namespace\":\"com.bl.consolesaas.message.user.misc\",\"fields\":[{\"name\":\"user\",\"type\":{\"type\":\"record\",\"name\":\"UserConsoleSaas\",\"fields\":[{\"name\":\"id\",\"type\":\"long\"},{\"name\":\"username\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"oldUsername\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"},{\"name\":\"title\",\"type\":{\"type\":\"enum\",\"name\":\"TitleConsoleSaas\",\"symbols\":[\"MR\",\"MME\",\"MELLE\"]}},{\"name\":\"lastName\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"firstName\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"email\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"password\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"100\"},{\"name\":\"passwordAlgorithm\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"50\"},{\"name\":\"oldEmail\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"},{\"name\":\"phoneNumber\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"30\"},{\"name\":\"type\",\"type\":{\"type\":\"enum\",\"name\":\"UserTypeConsoleSaas\",\"symbols\":[\"STANDARD\",\"TECHNICAL\"]},\"default\":\"USER_STANDARD\"},{\"name\":\"cristalId\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"30\"},{\"name\":\"creationDate\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"date_format\":\"yyyy-MM-dd''T''HH:mm:ss.SSS''Z''\",\"max_length\":\"24\"},{\"name\":\"isValidated\",\"type\":\"boolean\"}]}},{\"name\":\"clients\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"UserClientConsoleSaas\",\"fields\":[{\"name\":\"code\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"designation\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"}]}}},{\"name\":\"profiles\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"ProfileConsoleSaas\",\"fields\":[{\"name\":\"roleCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"100\"},{\"name\":\"applicationCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"clientCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"isValid\",\"type\":\"boolean\"}]}}],\"default\":null}]}}]}"
		}
	},
	"payload": "CEg1ZTEwZTM0YS0xMDgzLTQwNzUtYjkyYS1kNDNjNmZmNzJhODEaMDIwMTgtMDYtMDhUMTE6MjY6NTEuMTM3WgpEYW50aG9ueS5sYWdyZWRlQGJlcmdlci1sZXZyYXVsdC5mcgAADmxhZ3JlZGUOYW50aG9ueTxhZG1pbi50ZXN0QGJlcmdlci1sZXZyYXVsdC5jb20AAAACAAIAMDIwMTgtMDMtMTJUMDk6MTA6MDAuMDAwWgAELkNBSVNTRVNfRUNPTEVTX1RPVUxPVVNFACBNQUlSSUVfREVfTEFCRUdFAAACAhRST0xFX0FETUlOBlBGQSBNQUlSSUVfREVfTEFCRUdFAQA="
} ,{
	"timestamp": "2018-06-08 11:26:51:220",
	"type": "received",
	"node": "rabbit@cf39ec4fb77b",
	"connection": "172.17.0.1:35010 -> 172.17.0.2:5672",
	"vhost": "/",
	"user": "guest",
	"channel": 1,
	"exchange": "pubsub.consoleTenant.consoleSaasUserAccess.publish",
	"queue": "pubsub.consoleTenant.consoleSaasUserAccess.bl-socle.subscribe",
	"routed_queues": "none",
	"routing_keys": ["message"],
	"properties": {
		"app_id": "bl-console-saas",
		"timestamp": 1528457211,
		"message_id": "7fd640c6-c767-45e9-95f5-90990eb5c677",
		"delivery_mode": 2,
		"headers": {
			"X-ExchangeFormatId": "AVRO",
			"X-TenantId": "default",
			"X-ClientId": "bl-console-saas",
			"X-TopicId": "consoleSaasUserAccess",
			"X-ExchangeFormatSchema": "{\"type\":\"record\",\"name\":\"UserAccessEvent\",\"namespace\":\"com.bl.consolesaas.message.user\",\"fields\":[{\"name\":\"eventType\",\"type\":{\"type\":\"enum\",\"name\":\"UserAccessEventType\",\"symbols\":[\"USER_CREATED\",\"USER_UPDATED\",\"USER_DELETED\",\"PROFILE_CREATED\",\"PROFILE_UPDATED\",\"PROFILE_DELETED\"]}},{\"name\":\"header\",\"type\":{\"type\":\"record\",\"name\":\"EventHeader\",\"namespace\":\"com.bl.consolesaas.message.common\",\"fields\":[{\"name\":\"id\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"64\"},{\"name\":\"version\",\"type\":\"long\"},{\"name\":\"timestamp\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"date_format\":\"yyyy-MM-dd''T''HH:mm:ss.SSS''Z''\",\"max_length\":\"24\"}]}},{\"name\":\"userAccess\",\"type\":{\"type\":\"record\",\"name\":\"UserAccessConsoleSaas\",\"namespace\":\"com.bl.consolesaas.message.user.misc\",\"fields\":[{\"name\":\"user\",\"type\":{\"type\":\"record\",\"name\":\"UserConsoleSaas\",\"fields\":[{\"name\":\"id\",\"type\":\"long\"},{\"name\":\"username\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"oldUsername\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"},{\"name\":\"title\",\"type\":{\"type\":\"enum\",\"name\":\"TitleConsoleSaas\",\"symbols\":[\"MR\",\"MME\",\"MELLE\"]}},{\"name\":\"lastName\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"firstName\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"email\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"password\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"100\"},{\"name\":\"passwordAlgorithm\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"50\"},{\"name\":\"oldEmail\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"},{\"name\":\"phoneNumber\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"30\"},{\"name\":\"type\",\"type\":{\"type\":\"enum\",\"name\":\"UserTypeConsoleSaas\",\"symbols\":[\"STANDARD\",\"TECHNICAL\"]},\"default\":\"USER_STANDARD\"},{\"name\":\"cristalId\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"30\"},{\"name\":\"creationDate\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"date_format\":\"yyyy-MM-dd''T''HH:mm:ss.SSS''Z''\",\"max_length\":\"24\"},{\"name\":\"isValidated\",\"type\":\"boolean\"}]}},{\"name\":\"clients\",\"type\":{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"UserClientConsoleSaas\",\"fields\":[{\"name\":\"code\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"designation\",\"type\":[\"null\",{\"type\":\"string\",\"avro.java.string\":\"String\"}],\"default\":null,\"max_length\":\"80\"}]}}},{\"name\":\"profiles\",\"type\":[\"null\",{\"type\":\"array\",\"items\":{\"type\":\"record\",\"name\":\"ProfileConsoleSaas\",\"fields\":[{\"name\":\"roleCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"100\"},{\"name\":\"applicationCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"clientCode\",\"type\":{\"type\":\"string\",\"avro.java.string\":\"String\"},\"max_length\":\"80\"},{\"name\":\"isValid\",\"type\":\"boolean\"}]}}],\"default\":null}]}}]}"
		}
	},
	"payload": "CEg1ZTEwZTM0YS0xMDgzLTQwNzUtYjkyYS1kNDNjNmZmNzJhODEaMDIwMTgtMDYtMDhUMTE6MjY6NTEuMTM3WgpEYW50aG9ueS5sYWdyZWRlQGJlcmdlci1sZXZyYXVsdC5mcgAADmxhZ3JlZGUOYW50aG9ueTxhZG1pbi50ZXN0QGJlcmdlci1sZXZyYXVsdC5jb20AAAACAAIAMDIwMTgtMDMtMTJUMDk6MTA6MDAuMDAwWgAELkNBSVNTRVNfRUNPTEVTX1RPVUxPVVNFACBNQUlSSUVfREVfTEFCRUdFAAACAhRST0xFX0FETUlOBlBGQSBNQUlSSUVfREVfTEFCRUdFAQA="
}]'
]

{ #category : #initialization }
PulseLogParserTest >> setUp [

	| logP |
	model := PulseModel new.
	model name: 'test'.
	logP := PulseLogParser newOn: 'test'.
	logP populate: model withJson: self data.
	
	
]

{ #category : #initialization }
PulseLogParserTest >> testPopulate [

	^self assert: false.
]
