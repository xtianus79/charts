{{/* vim: set filetype=mustache: */}}

{{/*
 Create the name of the controller service account to use
 */}}
{{- define "metallb.controller.serviceAccountName" -}}
{{- if .Values.controller.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.controller.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.controller.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
 Create the name of the speaker service account to use
 */}}
{{- define "metallb.speaker.serviceAccountName" -}}
{{- if .Values.speaker.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.speaker.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.speaker.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the settings ConfigMap to use.
*/}}
{{- define "metallb.configMapName" -}}
{{ include "common.secrets.name" (dict "existingSecret" .Values.existingConfigMap "defaultNameSuffix" "config" "context" $) }}
{{- end -}}

{{/*
Create the name of the member Secret to use.
*/}}
{{- define "metallb.speaker.secretName" -}}
{{ include "common.secrets.name" (dict "existingSecret" .Values.speaker.secretName "defaultNameSuffix" "memberlist" "context" $) }}
{{- end -}}

{{/*
Create the key of the member Secret to use.
*/}}
{{- define "metallb.speaker.secretKey" -}}
{{ include "common.secrets.key" (dict "existingSecret" .Values.speaker.secretKey "key" "secretkey") }}
{{- end -}}

