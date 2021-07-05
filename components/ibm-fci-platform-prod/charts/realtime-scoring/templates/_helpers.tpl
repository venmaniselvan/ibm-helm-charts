{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "realtime-scoring.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "realtime-scoring.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "realtime-scoring.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Calculate the pvcName as a function to make consistency easy.
*/}}
{{- define "realtime-scoring.pvcname" -}}
{{-     if .Values.pvcName -}}
{{-        .Values.pvcName -}}
{{-     else -}}
{{-         template "realtime-scoring.fullname" . -}}-es
{{-     end -}}
{{- end -}}

{{/*
Get the release name for core services.
*/}}
{{- define "realtime-scoring.core-release-name" -}}
{{-     if .Values.global.coreReleaseName -}}
{{-        .Values.global.coreReleaseName -}}
{{-     else -}}
{{-         .Release.Name -}}
{{-     end -}}
{{- end -}}

