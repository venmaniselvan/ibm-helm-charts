{{- define "ibm-ea-dr-coordinator-service.sizeData" -}}
hpa:
  size0:
    enabled: false
  size1:
    enabled: false
eacoordinator:
  size0:
    resources:
      limits:
        memory: 2000Mi
        cpu: 1000m
      requests:
        memory: 500Mi
        cpu: 500m
  size1:
    resources:
      limits:
        memory: 4000Mi
        cpu: 1000m
      requests:
        memory: 1000Mi
        cpu: 1000m
{{- end -}}

{{- define "ibm-ea-dr-coordinator-service.comp.size.data" -}}
  {{- $root := (index . 0) -}}
  {{- $resName := (index . 1) -}}
  {{- $keyName := (index . 2) -}}
  {{- $sizeData := fromYaml (include "ibm-ea-dr-coordinator-service.sizeData" .) -}}
  {{- $resData := index $sizeData $resName -}}
  {{- $resSizeData := index $resData $root.Values.global.environmentSize -}}
  {{- $result := index $resSizeData $keyName -}}

  {{- toYaml $result | trimSuffix "\n" -}}
{{- end -}}
